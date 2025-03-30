exports.tambahTagihan = async (req, res) => {
  try {
    const { siswa_id, total_tagihan } = req.body;

    const pembayaran = await Pembayaran.create({
      siswa_id,
      total_tagihan,
      jumlah_bayar: 0,
      status: "belum lunas",
    });

    res.status(201).json({ message: "Total pembayaran berhasil ditambahkan", pembayaran });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.editTagihan = async (req, res) => {
  try {
    const { id } = req.params;
    const { total_tagihan } = req.body;

    const pembayaran = await Pembayaran.findByPk(id);
    if (!pembayaran) return res.status(404).json({ error: "Tagihan tidak ditemukan" });

    pembayaran.total_tagihan = total_tagihan;
    await pembayaran.save();

    res.json({ message: "Total pembayaran berhasil diperbarui", pembayaran });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.hapusTagihan = async (req, res) => {
  try {
    const { id } = req.params;

    const pembayaran = await Pembayaran.findByPk(id);
    if (!pembayaran) return res.status(404).json({ error: "Tagihan tidak ditemukan" });

    await pembayaran.destroy();
    res.json({ message: "Total pembayaran berhasil dihapus" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updateStatusPembayaran = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;

    const pembayaran = await Pembayaran.findByPk(id);
    if (!pembayaran) return res.status(404).json({ error: "Pembayaran tidak ditemukan" });

    pembayaran.status = status;
    await pembayaran.save();

    res.json({ message: "Status pembayaran berhasil diperbarui", pembayaran });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getPaymentDetails = async (req, res) => {
  try {
    const { siswa_id } = req.params;
    const pembayaran = await Pembayaran.findOne({ where: { siswa_id } });

    if (!pembayaran) return res.status(404).json({ error: "Data pembayaran tidak ditemukan" });

    const persenBayar = (pembayaran.jumlah_bayar / pembayaran.total_tagihan) * 100;

    res.json({
      total_tagihan: pembayaran.total_tagihan,
      jumlah_bayar: pembayaran.jumlah_bayar,
      sisa_bayar: pembayaran.total_tagihan - pembayaran.jumlah_bayar,
      persenBayar: persenBayar.toFixed(2),
      status: pembayaran.status,
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
