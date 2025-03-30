const express = require("express");
const { authenticate, authorize } = require("../middleware/authMiddleware");
const { generateQRCode } = require("../controllers/absensiController");

const router = express.Router();

// Siswa bisa generate QR Code absensi
router.get("/qr", authenticate, authorize(["siswa"]), generateQRCode);

module.exports = router;
