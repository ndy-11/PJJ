const express = require("express");
const { authenticate, authorize } = require("../middleware/authMiddleware");
const { generateInvoice } = require("../controllers/pembayaranController");

const router = express.Router();

// Keuangan bisa generate invoice
router.post("/invoice", authenticate, authorize(["keuangan"]), generateInvoice);
router.get("/:siswa_id/details", authenticate, authorize(["siswa"]), getPaymentDetails);
router.post("/tambah-tagihan", authenticate, authorize(["keuangan"]), tambahTagihan);
router.put("/:id/edit-tagihan", authenticate, authorize(["keuangan"]), editTagihan);
router.delete("/:id/hapus-tagihan", authenticate, authorize(["keuangan"]), hapusTagihan);
router.put("/:id/update-status", authenticate, authorize(["keuangan"]), updateStatusPembayaran);
router.get("/:siswa_id/details", authenticate, authorize(["siswa", "keuangan"]), getPaymentDetails);
module.exports = router;
