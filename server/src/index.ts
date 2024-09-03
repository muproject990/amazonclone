import express, { Request, Response } from "express";
import mongoose from "mongoose";
import authRouter from "./routes/auth";
import adminRouter from "./routes/admin";
import productRouter from "./routes/product";

const app = express();

const port = 3000;

app.use(express.json());

app.use(authRouter);
app.use(productRouter);
app.use(adminRouter);

mongoose
  .connect(
    "mongodb+srv://awashpaudel9:v99TrnwUjeyts9SZ@cluster0.rnxgz.mongodb.net/"
  )
  .then(() => {
    console.log("Connected");
  })
  .catch((e) => {
    console.log("Failed to connect", e.message);
  });

app.get("/", (req: Request, res: Response): void => {
  res.send("Hello, TypeScript with Get Lost!");
});
app.listen(port, "0.0.0.0", () => {
  console.log(`Server is running on http://localhost:${port}`);
});




// var listEndpoints = require("express-list-endpoints");

// var endpoints = listEndpoints(app);
// console.log(endpoints);
