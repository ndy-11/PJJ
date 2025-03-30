module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable("Absensi", {
      id: { type: Sequelize.UUID, primaryKey: true, defaultValue: Sequelize.literal("uuid_generate_v4()") },
      siswa_id: { type: Sequelize.UUID, allowNull: false, references: { model: "Users", key: "id" } },
      tanggal: { type: Sequelize.DATEONLY, allowNull: false },
      status: { type: Sequelize.STRING, allowNull: false },
      createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal("NOW()") },
      updatedAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal("NOW()") },
    });
  },
  down: async (queryInterface) => {
    await queryInterface.dropTable("Absensi");
  },
};
