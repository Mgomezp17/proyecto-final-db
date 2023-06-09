const conexion = require("../conexion");

module.exports = {
  // !Insertar
  insertar(nombre, precio) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `insert into productos (nombre, precio) values (?, ?)`,
        [nombre, precio],
        (err, resultados) => {
          if (err) reject(err);
          else resolve(resultados.insertId);
        }
      );
    });
  },

  // !Obtener
  obtener() {
    return new Promise((resolve, reject) => {
      // conexion.query(`select id, nombre, precio from productos`,
      conexion.query(`select * from profesores`, (err, resultados) => {
        if (err) reject(err);
        else resolve(resultados);
      });
    });
  },

  // !Obtener por ID
  obtenerPorId(id) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `select id, nombre, precio from productos where id = ?`,
        [id],
        (err, resultados) => {
          if (err) reject(err);
          else resolve(resultados[0]);
        }
      );
    });
  },

  // !Actualizar
  actualizar(id, nombre, precio) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `update productos
            set nombre = ?,
            precio = ?
            where id = ?`,
        [nombre, precio, id],
        (err) => {
          if (err) reject(err);
          else resolve();
        }
      );
    });
  },

  // !Eliminar
  eliminar(id) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `delete from productos
            where id = ?`,
        [id],
        (err) => {
          if (err) reject(err);
          else resolve();
        }
      );
    });
  },
};
