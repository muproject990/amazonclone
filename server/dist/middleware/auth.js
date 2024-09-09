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
Object.defineProperty(exports, "__esModule", { value: true });
const jwt = require("jsonwebtoken");
const auth = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
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
        req.userId = verified.id; // Assign the user ID or other payload data to req.user
        // console.log("middleware", req.userId); //
        req.token = token;
        next();
    }
    catch (error) {
        res.status(500).json({ error: error.message });
    }
});
exports.default = auth;
