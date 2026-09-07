const express = require("express");

const app = express();
const PORT = 80;

app.get("/", (req, res) => {
  res.send("Hello from color blue api");
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
