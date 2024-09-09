import express, { Request, Response } from "express";
import auth from "../middleware/auth";
import { Product } from "../models/product";
import User from "../models/user";
import mongoose from "mongoose";

const userRouter = express.Router();

interface AuthenticatedRequest extends Request {
  userId?: string;
}

userRouter.post(
  "/api/add-to-cart",
  auth,
  async (req: AuthenticatedRequest, res: Response) => {
    try {
      const { id } = req.body;
      const product = await Product.findById(id);
      if (!product) {
        return res.status(404).json({ error: "Product not found" });
      }

      let user = await User.findById(req.userId);
      if (!user) {
        return res.status(404).json({ error: "User not found" });
      }

      let productExists = false;

      if (user.cart.length > 0) {
        for (const item of user.cart) {
          if (item.product._id.equals(product._id)) {
            productExists = true;
            // Optionally update quantity here if needed
            // For example, you might want to increase the quantity by 1:
            item.quantity += 1;
            break;
          }
        }
      }

      if (!productExists) {
        user.cart.push({
          product,
          quantity: 1,
        });
      }

      await user.save(); // Save the updated user cart

      res
        .status(200)
        .json({ message: "Product added to cart", cart: user.cart });
    } catch (error: any) {
      res.status(500).json({ error: error.message });
    }
  }
);
