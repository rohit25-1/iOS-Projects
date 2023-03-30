const mongoose = require("mongoose");

const notesSchema = new mongoose.Schema({
  title:{
    type: String,
    required: true,
  },
  notes: {
    type: String,
    required: true,
  },
});

const notes = new mongoose.model("Note", notesSchema);
module.exports = notes;
