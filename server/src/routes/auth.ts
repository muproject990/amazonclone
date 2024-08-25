import express, { Request, Response } from "express";
import User from "../models/user";
import auth from "../middleware/auth";
import { AuthenticatedRequest } from "../middleware/auth"; // Adjust path based on where you define the interface

var bcrypt = require("bcryptjs");
var jwt = require("jsonwebtoken");

const authRouter = express.Router();

// Example GET route
authRouter.get("/get", (req, res) => {
  res.send("Welcome");
});

// Signup Route
authRouter.post("/api/signup", async (req, res) => {
  const { name, email, password } = req.body;

  try {
    // Check if the user already exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "User already exists" });
    }

    // bcrypt to hashes password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user
    let newUser = new User({ name, email, password: hashedPassword });
    await newUser.save();

    const token = jwt.sign({ email, password }, "aavash");
    res.json({ message: "Login successful", token, newUser });

    res.status(201).json({ message: "User created successfully" });

    res.status(201).json({ message: "User created successfully" });
  } catch (error: any) {
    if (!res.headersSent) {
      // Only send a response if headers have not already been sent
      res.status(500).json({ message: error.message });
    }
  }
});

// Login Route
authRouter.post("/api/login", async (req, res) => {
  const { email, password } = req.body;

  try {
    // Find the user by email
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "Invalid email or password" });
    }

    // bcrtypt to compare hashed passwords
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ message: "Invald email or password" });
    }
    // decode bcrypted password

    // implement jwt authentication
    const token = jwt.sign({ id: user._id }, "aavash");
    res.json({ token });
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
});

// ! Token is valid

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("token");
    if (!token) return res.json(false);
    const varified = jwt.verify(token, "aavash");
    if (!varified) return res.json(false);

    const user = await User.findById(varified.id);

    if (!user) return res.json(false);

    res.json(true);
  } catch (error: any) {
    res.status(500).json({ message: error.message });
  }
});

// todo Middlleware implementation
// get user data

authRouter.get("/", auth, async (req: AuthenticatedRequest, res: Response) => {
  try {
    const user = await User.findById(req.userId);

    console.log(2, req.userId);

    // Convert the Mongoose document to a plain JavaScript object
    if (user != null) {
      const userObject = user.toObject();
      return res.json({ ...userObject, token: req.token });
    }

    return res.status(404).json({ message: "User not found" });
  } catch (error: any) {
    res.status(500).json({ message: error.message });
  }
});

export default authRouter;
