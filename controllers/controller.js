const query = require("../db");

exports.createStudent = async (req, res) => {
  const { name, email, age } = req.body;

  const result = await query.query(
    "INSERT INTO students (name, email, age) VALUES ($1,$2,$3) RETURNING *",
    [name, email, age]
  );

  res.status(201).json(result.rows[0]);
};


exports.getAllStudents = async (req, res) => {
  const result = await query.query("SELECT * FROM students ORDER BY id");
  res.json(result.rows);
};

exports.getStudentById = async (req, res) => {
  const { id } = req.params;

  const result = await query.query(
    "SELECT * FROM students WHERE id=$1",
    [id]
  );

  if (result.rows.length === 0)
    return res.status(404).json({ message: "Student not found" });

  res.json(result.rows[0]);
};

exports.updateStudent = async (req, res) => {
  const { id } = req.params;
  const { name, email, age } = req.body;

  const result = await query.query(
    "UPDATE students SET name=$1,email=$2,age=$3 WHERE id=$4 RETURNING *",
    [name, email, age, id]
  );

  res.json(result.rows[0]);
};

exports.deleteStudent = async (req, res) => {
  const { id } = req.params;

  await query.query("DELETE FROM students WHERE id=$1", [id]);

  res.json({ message: "Student deleted successfully" });
};
