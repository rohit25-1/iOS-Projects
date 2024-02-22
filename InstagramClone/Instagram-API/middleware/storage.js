const multer = require("multer");
const path = require("path");
const fs = require("fs");
const user = require("../models/user");
const post = require("../models/post");

const storage = multer.diskStorage({
  destination: "public/assets/images",
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + path.extname(file.originalname);
    cb(null, file.fieldname + "-" + uniqueSuffix);
  },
});

const upload = multer({
  storage: storage,
  limits: {
    fileSize: 1024 * 1024 * 10, // 10 MB
  },
});

const createPost = async (req, res) => {
  try {
    const userId = req.user;
    const userDetails = await user.findById(userId);
    if (!userDetails) {
      return res.status(404).json({ message: "User not found" });
    }
    upload.single("image")(req, res, async function (err) {
      if (err) {
        console.error(err);
        return res.status(500).json({ message: "Error uploading file" });
      }

      const newPost = new post({
        user: userId,
        image: req.file ? req.file.filename : "",
        caption: req.body.caption,
      });

      const savedPost = await newPost.save();
      userDetails.posts.push(savedPost._id);
      await userDetails.save();
      res.status(201).json({ post: savedPost });
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
};

module.exports = {
  createPost,
};
