import mongoose from "mongoose";

const productSchema = new mongoose.Schema({
  name: { type: String, required: true, trim: true },
  description: { type: String, required: true, trim: true },
  quantity: { type: Number, required: true },
  images: [{ type: String, required: true }],
  category: { type: String },
  price: { type: Number, required: true },

  //   reviews: [{ type: mongoose.Schema.Types.ObjectId, ref: "Review" }],
});

const Product = mongoose.model("Product", productSchema);

export default Product;
