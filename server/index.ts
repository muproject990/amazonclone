import express, { Request, Response } from "express";

const app = express();
const port = 3000;

app.use(express.json());

app.get("/api/", (req: Request, res: Response): void => {
  res.send("Hello, TypeScript with Express!");
});

app.listen(port, "0.0.0.0", () => {
  console.log(`Server is running on http://localhost:${port}`);
});
