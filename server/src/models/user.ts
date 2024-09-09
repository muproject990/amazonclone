import mongoose, { Schema } from "mongoose";

const cartItemSchema = new Schema({
  productId: {
    type: Schema.Types.ObjectId,
    ref: "Product",
  },
  quantity: {
    type: Number,
    required: true,
    default: 1,
  },
});

const userSchema = new Schema({
  name: { type: String, required: true, trim: true },
  email: {
    type: String,
    required: true,
    unique: true,
    trim: true,
    validate: {
      validator: (v) => {
        const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return v.match(re);
      },
      message: "Invalid email address",
    },
  },
  password: { type: String, required: true },

  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    enum: ["user", "admin"],
    default: "user",
  },
  cart: [cartItemSchema],
});

const User = mongoose.model("User", userSchema);

export default User;
