const express = require("express");
const app = express();
const path = require("path");

require("./db/connect");

app.use(express.json());

const notes = require("./models/notes");

app.get("/notes", async (req, res) => {
  try {
    const allNotes = await notes.find();
    res.send(allNotes).status(200);
  } catch (error) {
    console.log(error);
    res.status(501);
  }
});

app.post("/notes", async (req, res) => {
  try {
    console.log(req.body);
    const postNotes = new notes({
      title: req.body.title,
      notes: req.body.notes,
    });
    const saved = await postNotes.save();
    res.status(200).send(postNotes);
  } catch (err) {
    console.log(err);
    res.status(501);
  }
});

app.post("/update-notes", async (req, res) => {
  try {
    console.log(req.body);
    const updateNotes = await notes.updateOne(
      {
        title: req.body.title,
      },
      {
        notes: req.body.notes,
      }
    );
    console.log(updateNotes);
    res.send(updateNotes).status(200);
  } catch (error) {
    console.log(error);
  }
});

app.post("/delete-notes", async (req, res) => {
  try {
    const deleteNote = await notes.deleteOne({
      _id: req.body._id
    });
    console.log(deleteNote);
    res.send(deleteNote).status(200);
  } catch (error) {
    console.log(error);
  }
});

app.listen(3000);
