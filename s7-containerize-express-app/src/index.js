const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;
const users = [];
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/users", (req, res) => {
  res.json({ users });
});

app.post("/users", (req, res) => {
  const newUserId = req.body.userId;
  console.log("Received userId:", newUserId);
  if (!newUserId) {
    return res.status(400).json({ error: "userId is required" });
  }

  if (users.includes(newUserId)) {
    return res.status(400).json({ error: "userId already exists" });
  }

  users.push(newUserId);
  res.status(201).json({ message: "User created successfully" });
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
