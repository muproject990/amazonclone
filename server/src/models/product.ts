import mongoose from "mongoose";
import ratingSchema from "./rating";

const productSchema = new mongoose.Schema({
  name: { type: String, required: true, trim: true },
  description: { type: String, required: true, trim: true },
  quantity: { type: Number, required: true },
  images: [{ type: String, required: true }],
  category: { type: String },
  price: { type: Number, required: true },
  ratings: [ratingSchema],
  //   reviews: [{ type: mongoose.Schema.Types.ObjectId, ref: "Review" }],
});

const Product = mongoose.model("Product", productSchema);

export default Product;
