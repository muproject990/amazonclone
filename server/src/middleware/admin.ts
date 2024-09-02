const jwt = require("jsonwebtoken");
import express, { Request, Response, NextFunction } from "express";
import User from "../models/user";
// Extend the Request interface to include the user property
export interface AuthenticatedRequest extends Request {
  userId?: string;
  token?: string;
}

const admin = async (
  req: AuthenticatedRequest,
  res: Response,
  next: NextFunction
) => {
  try {
    const token = req.header("token");
    console.log(token);
    if (!token)
      return res
        .status(401)
        .json({ message: "No token, authorization denied" });

    const verified = jwt.verify(token, "aavash");
    console.log(verified);

    if (!verified)
      return res
        .status(401)
        .json({ message: "Token is not valid,authorization denied" });

    const user = await User.findById(verified.id);

    if (user?.type == "user" || user?.type != "admin") {
      return res
        .status(401)
        .json({ message: "You are not an admin,Unauthorized" });
    }

    req.userId = verified.id;
    req.token = token;

    next();
  } catch (err: any) {
    console.log("Catch Error:", err.message);
  }
};
export default admin;
