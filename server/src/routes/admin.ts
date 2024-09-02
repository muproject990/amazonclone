import express, { Request, Response } from "express";
import admin from "../middleware/admin";
import { AuthenticatedRequest } from "../middleware/auth"; // Adjust path based on where you define the interface
import Product from "../models/product";

const adminRouter = express.Router();

// Create a admin middleware

adminRouter.post(
  "/admin/add-books",
  admin,
  async (req: AuthenticatedRequest, res: Response) => {
    // Add product logic here
    try {
      const { name, description, quantity, images, category, price } = req.body;
      console.log("here");

      // Create a new product instance
      let product = new Product({
        name,
        description,
        quantity,
        images,
        category,
        price,
      });

      product = await product.save();
      res.json({ message: "Product added successfully", product });
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  }
);

adminRouter.get(
  "/admin/add-books",
  admin,
  async (req: AuthenticatedRequest, res: Response) => {
    try {
      const products = await Product.find({});//Give list of products
      res.json({ products });
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  }
);

export default adminRouter;
