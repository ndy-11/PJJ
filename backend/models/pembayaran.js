module.exports = (sequelize, DataTypes) => {
  const Pembayaran = sequelize.define("Pembayaran", {
    id: {
      type: DataTypes.UUID,
      defaultValue: DataTypes.UUIDV4,
      primaryKey: true,
    },
    siswa_id: {
      type: DataTypes.UUID,
      allowNull: false,
    },
    total_tagihan: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    jumlah_bayar: {
      type: DataTypes.INTEGER,
      defaultValue: 0,
    },
    status: {
      type: DataTypes.STRING,
      defaultValue: "belum lunas",
    },
  });

  return Pembayaran;
};
