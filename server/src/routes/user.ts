// userRouter.ts
import express, { Request, Response, Router } from "express";
import Product from "../models/product";
import User from "../models/user";
import auth, { AuthenticatedRequest } from "../middleware/auth";
import { Types } from "mongoose";

const userRouter: Router = express.Router();

interface AddToCartRequest extends AuthenticatedRequest {
  body: {
    productId: Types.ObjectId;
  };
}

userRouter.post(
  "/add-to-cart",
  auth,
  async (req: AddToCartRequest, res: Response) => {
    try {
      const userId = req.userId;
      const productId = req.body.productId;
      console.log(productId);

      console.log("hi", userId);
      const product = await Product.findById(productId);

      if (!product) {
        return res.status(404).send("Product not found");
      }

      const user = await User.findById(userId);
      console.log("hqq", user);

      if (!user) {
        return res.status(404).send("User not found");
      }

      const cart = user.cart;
      const existingProductIndex = cart.findIndex(
        (item) => item.productId === productId
      );

      if (existingProductIndex !== -1) {
        // Product already in cart, increment quantity
        cart[existingProductIndex].quantity++;
      } else {
        // Add new product to cart
        cart.push({ productId, quantity: 1 });
      }

      await user.save();
      res.send(`Product added to cart successfully`);
    } catch (error) {
      res.send(error);
    }
  }
);

export default userRouter;
