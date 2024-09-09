"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const product_1 = require("./product");
const userSchema = new mongoose_1.default.Schema({
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
    cart: [
        {
            product: product_1.productSchema,
            quantity: {
                type: Number,
                required: true,
            },
        },
    ],
});
const User = mongoose_1.default.model("User", userSchema);
exports.default = User;
