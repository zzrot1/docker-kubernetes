const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const mongoose = require("mongoose");

app.get("/api/notes", (req, res) => {
  res.send("Hello from notes-backend-hello-world");
});

mongoose
  .connect(process.env.DB_URL)
  .then(() => {
    console.log("Connected to MongoDB");
    app.listen(process.env.PORT || 3000, () => {
      console.log("Server is running on port " + (process.env.PORT || 3000));
    });
  })
  .catch((err) => {
    !console.error("Error connecting to MongoDB:", err);
  });
