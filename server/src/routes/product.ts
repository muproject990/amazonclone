import express, { Request, Response } from "express";
import admin from "../middleware/admin";
import auth, { AuthenticatedRequest } from "../middleware/auth"; // Adjust path based on where you define the interface
import Product from "../models/product";

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

export default productRouter;
