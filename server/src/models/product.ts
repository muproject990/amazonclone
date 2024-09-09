// models/product.ts
import mongoose, { Document, Schema } from "mongoose";
import ratingSchema from "./rating";

// Define Rating Interface
interface Rating {
  userId: string;
  rating: number;
}

// Define Product Interface extending mongoose.Document
interface Product extends Document {
  name: string;
  description: string;
  quantity: number;
  images: string[];
  category?: string;
  price: number;
  ratings: Rating[];
}

// Define Product Schema
const productSchema = new Schema<Product>({
  name: { type: String, required: true, trim: true },
  description: { type: String, required: true, trim: true },
  quantity: { type: Number, required: true },
  images: [{ type: String, required: true }],
  category: { type: String },
  price: { type: Number, required: true },
  ratings: [ratingSchema],
  // reviews: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Review' }],
});

// Define Product Model with TypeScript
const Product = mongoose.model<Product>("Product", productSchema);

export { productSchema, Product };
