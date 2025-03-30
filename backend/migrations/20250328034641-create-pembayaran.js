module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable("Pembayarans", {
      id: { type: Sequelize.UUID, primaryKey: true, defaultValue: Sequelize.literal("uuid_generate_v4()") },
      siswa_id: { type: Sequelize.UUID, allowNull: false, references: { model: "Users", key: "id" } },
      jumlah: { type: Sequelize.INTEGER, allowNull: false },
      status: { type: Sequelize.STRING, allowNull: false, defaultValue: "belum lunas" },
      bukti_pembayaran: { type: Sequelize.STRING },
      createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal("NOW()") },
      updatedAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal("NOW()") },
    });
  },
  down: async (queryInterface) => {
    await queryInterface.dropTable("Pembayarans");
  },
};
