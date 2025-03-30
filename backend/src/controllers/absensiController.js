const QRCode = require("qrcode");
const { Absensi } = require("../models");

exports.generateQRCode = async (req, res) => {
  try {
    const qrData = `Siswa ID: ${req.user.id}`;
    const qrCode = await QRCode.toDataURL(qrData);
    res.json({ qrCode });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
