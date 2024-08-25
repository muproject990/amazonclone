import express, { Request, Response, NextFunction } from "express";

const jwt = require("jsonwebtoken");
import User from "../models/user";

// Extend the Request interface to include the user property
export interface AuthenticatedRequest extends Request {
  userId?: string; // You can define this type based on your JWT payload
  token?: string; // You can define this type based on your JWT payload
}

const auth = async (
  req: AuthenticatedRequest,
  res: Response,
  next: NextFunction
) => {
  try {
    const token = req.header("token");
    if (!token) {
      return res
        .status(401)
        .json({ message: "Access denied. No token provided." });
    }

    const verified = jwt.verify(token, "aavash");
    if (!verified) {
      return res.status(401).json({ message: "Unauthorized. Invalid token." });
    }

    req.userId = (verified as any).id; // Assign the user ID or other payload data to req.user

    req.token = token;
    next();
  } catch (error: any) {
    res.status(500).json({ error: error.message });
  }
};

export default auth;
