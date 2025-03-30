const { v4: uuidv4 } = require("uuid");

module.exports = {
  up: async (queryInterface) => {
    await queryInterface.bulkInsert("Users", [
      { id: uuidv4(), nama: "Admin", email: "admin@example.com", password: "$2a$10$1234", role: "admin", createdAt: new Date(), updatedAt: new Date() },
      { id: uuidv4(), nama: "Siswa 1", email: "siswa1@example.com", password: "$2a$10$1234", role: "siswa", createdAt: new Date(), updatedAt: new Date() },
      { id: uuidv4(), nama: "Keuangan", email: "keuangan@example.com", password: "$2a$10$1234", role: "keuangan", createdAt: new Date(), updatedAt: new Date() },
    ]);
  },
  down: async (queryInterface) => {
    await queryInterface.bulkDelete("Users", null, {});
  },
};
