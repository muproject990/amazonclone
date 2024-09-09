import express, { Request, Response } from "express";
import admin from "../middleware/admin";
import auth, { AuthenticatedRequest } from "../middleware/auth"; // Adjust path based on where you define the interface
import { Product } from "../models/product";
import ratingSchema from "../models/rating";

const productRouter = express.Router();

productRouter.get(
  "/api/books",
  auth,
  async (req: AuthenticatedRequest, res: Response) => {
    try {
      console.log(req.query.category);

      const products = await Product.find({ category: req.query.category }); //Give list of products
      res.json(products);
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  }
);

productRouter.get(
  "/api/books/search/:name",
  auth,
  async (req: AuthenticatedRequest, res: Response) => {
    try {
      // console.log("/api/books/search/:name ->", req.params.name);

      const products = await Product.find({
        name: { $regex: req.params.name, $options: "i" },
      }); //Give list of products
      // console.log(products);

      res.json(products);
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  }
);

// post request route to rate the products

productRouter.post(
  "/api/rate-product",
  auth,
  async (req: AuthenticatedRequest, res: Response) => {
    try {
      const { id, rating } = req.body;
      let product = await Product.findById(id);
      console.log(product);

      if (product != null) {
        for (let i = 0; i < product.ratings.length; i++) {
          const element = product?.ratings[i];
          if (product.ratings[i].userId === req.userId) {
            product.ratings.splice(i, 1);
          }
        }
        const ratingSchema = {
          userId: req.userId,
          rating,
        };

        product.ratings.push(ratingSchema as any);
        product = await product.save();
        console.log(product);

        res.json(product);
      }
    } catch (error: any) {
      console.log("here", error);
      res.status(500).json({ error: error.message });
    }
  }
);

productRouter.get("/api/deal-of-day", auth, async (req, res) => {
  try {
    let products = await Product.find(); //Give list of products
    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }
      for (let i = 0; i < b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }

      return aSum < bSum ? 1 : -1;
    });

    res.json(products[0]);
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
});

export default productRouter;
