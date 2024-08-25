"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const mongoose_1 = __importDefault(require("mongoose"));
const auth_1 = __importDefault(require("./routes/auth"));
const app = (0, express_1.default)();
const port = 3000;
app.use(express_1.default.json());
app.use(auth_1.default);
mongoose_1.default
    .connect("mongodb+srv://awashpaudel9:v99TrnwUjeyts9SZ@cluster0.rnxgz.mongodb.net/")
    .then(() => {
    console.log("Connected");
})
    .catch((e) => {
    console.log("Failed to connect", e.message);
});
app.get("/", (req, res) => {
    res.send("Hello, TypeScript with Get Lost!");
});
app.listen(port, "0.0.0.0", () => {
    console.log(`Server is running on http://localhost:${port}`);
});
