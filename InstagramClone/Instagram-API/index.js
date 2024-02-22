const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
require("./db/connect");

const user = require("./models/user");
const post = require("./models/post");
const authMiddleware = require("./middleware/auth");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//User Authentication

app.post("/api/register", async (req, res) => {
  try {
    const registerUser = await new user(req.body).save();
    res.status(200).json({ message: "User registered successfully" });
  } catch (error) {
    if (error.keyPattern.username == 1) {
      res.status(400).json({ message: "Username already taken" });
    } else if (error.keyPattern.email == 1) {
      res.status(400).json({ message: "Email already in use. try logging in" });
    }
  }
});

app.post("/api/login", async (req, res) => {
  const { username, email, password } = req.body;
  try {
    const findUser =
      (await user.findOne({ username, password })) ||
      (await user.findOne({ email, password }));
    if (findUser) {
      const token = jwt.sign(findUser.id, "SECRET");
      res.header("Authorization", token);
      res.status(200).json({ message: "OK" });
    } else {
      res.status(400).json({ error: "check username or password" });
    }
  } catch (error) {
    console.log(error);
  }
});



app.get("/api/users/:userId", authMiddleware, async (req, res) => {
  try {
    if (req.params.userId !== req.user) {
      return res
        .status(403)
        .json({ message: "Forbidden: You can only access your own details" });
    }

    const findUser = await user.findById(req.params.userId);

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    res.json({ findUser });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

// app.put("/api/users/:userId", authMiddleware, async (req, res) => {
//   try {

//   } catch (error) {
//     console.log(error);
//     res.status(500).json({ message: "Internal Server Error" });
//   }
// });

//End of user authentication

//Start of Post Management

const PostController = require("./middleware/storage");
app.post("/api/posts", authMiddleware, PostController.createPost);

app.get("/api/posts", authMiddleware, async (req, res) => {
  try {
    const findPosts = await user
      .findById(req.user)
      .populate("posts")
      .select("posts -_id");
    res.status(200).json(findPosts);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

app.get("/api/posts/:postId", authMiddleware, async (req, res) => {
  try {
    const findPosts = await post.findById(req.params.postId);
    res.status(200).json(findPosts);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

app.listen(3000);
