// rating.ts
import mongoose, { Schema } from 'mongoose';

// Define Rating Schema
const ratingSchema = new Schema({
  userId: { type: String, required: true },
  rating: { type: Number, required: true },
});

export default ratingSchema;
