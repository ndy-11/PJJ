const express = require("express");
const { authenticate, authorize } = require("../middleware/authMiddleware");
const { Tugas } = require("../models");
const upload = require("../middleware/uploadMiddleware");

const router = express.Router();

// Siswa bisa mengunggah tugas
router.post("/", authenticate, authorize(["siswa"]), upload.single("file"), async (req, res) => {
  try {
    const tugas = await Tugas.create({
      siswa_id: req.user.id,
      judul: req.body.judul,
      deskripsi: req.body.deskripsi,
      file: req.file.path,
    });
    res.status(201).json(tugas);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
