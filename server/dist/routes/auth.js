"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const user_1 = __importDefault(require("../models/user"));
const auth_1 = __importDefault(require("../middleware/auth"));
var bcrypt = require("bcryptjs");
var jwt = require("jsonwebtoken");
const authRouter = express_1.default.Router();
// Example GET route
authRouter.get("/get", (req, res) => {
    res.send("Welcome");
});
// Signup Route
authRouter.post("/api/signup", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { name, email, password } = req.body;
    try {
        // Check if the user already exists
        const existingUser = yield user_1.default.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ message: "User already exists" });
        }
        // bcrypt to hashes password
        const hashedPassword = yield bcrypt.hash(password, 10);
        // Create a new user
        let newUser = new user_1.default({ name, email, password: hashedPassword });
        yield newUser.save();
        const token = jwt.sign({ email, password }, "aavash");
        res.json({ message: "Login successful", token, newUser });
        res.status(201).json({ message: "User created successfully" });
        res.status(201).json({ message: "User created successfully" });
    }
    catch (error) {
        if (!res.headersSent) {
            // Only send a response if headers have not already been sent
            res.status(500).json({ message: error.message });
        }
    }
}));
// Login Route
authRouter.post("/api/login", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { email, password } = req.body;
    try {
        // Find the user by email
        const user = yield user_1.default.findOne({ email });
        if (!user) {
            return res.status(400).json({ message: "Invalid email or password" });
        }
        // bcrtypt to compare hashed passwords
        const isMatch = yield bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: "Invald email or password" });
        }
        // decode bcrypted password
        // implement jwt authentication
        const token = jwt.sign({ id: user._id }, "aavash");
        res.json({ token });
        // console.log(user);
    }
    catch (error) {
        res.status(500).json({ message: "Internal server error" });
    }
}));
// ! Token is valid
authRouter.post("/tokenIsValid", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const token = req.header("token");
        if (!token)
            return res.json(false);
        const varified = jwt.verify(token, "aavash");
        if (!varified)
            return res.json(false);
        const user = yield user_1.default.findById(varified.id);
        if (!user)
            return res.json(false);
        res.json(true);
    }
    catch (error) {
        res.status(500).json({ message: error.message });
    }
}));
// todo Middlleware implementation
// get user data
authRouter.get("/", auth_1.default, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const user = yield user_1.default.findById(req.userId);
        // console.log(2, req.userId);
        // Convert the Mongoose document to a plain JavaScript object
        if (user != null) {
            const userObject = user.toObject();
            return res.json(Object.assign(Object.assign({}, userObject), { token: req.token }));
        }
        return res.status(404).json({ message: "User not found" });
    }
    catch (error) {
        res.status(500).json({ message: error.message });
    }
}));
exports.default = authRouter;
