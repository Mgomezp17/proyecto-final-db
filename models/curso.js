const conexion = require("../conexion");

module.exports = {
  // !Insertar
  insertar(
    id_curso,
    nombre_curso,
    url_ruta_acceso,
    fecha_inicio,
    fecha_final,
    semestre,
    precio,
    categoria
  ) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `insert into cursos (id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio, categoria) values (?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          id_curso,
          nombre_curso,
          url_ruta_acceso,
          fecha_inicio,
          fecha_final,
          semestre,
          precio,
          categoria,
        ],
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
      conexion.query(`select * from cursos`, (err, resultados) => {
        if (err) reject(err);
        else resolve(resultados);
      });
    });
  },

  // !Obtener por ID
  obtenerPorId(id) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `select * from cursos as cur inner join estudiantes as est on cur.id_curso = est.id_curso inner join usuarios as usu on est.email_usuario = usu.email_usuario inner join profesores as pro on cur.nombre_curso = pro.area_principal_conocimiento inner join actividades as act on cur.id_curso = act.id_curso inner join tareas_cursos as tr on act.id_tareas = tr.id_tareas inner join foro_cursos as fr on act.id_foros = fr.id_foros inner join mensajes_foros as msg on act.id_mensajes = msg.id_mensajes where cur.id_curso = ?`,
        [id],
        (err, resultados) => {
          if (err) reject(err);
          else resolve(resultados);
        }
      );
    });
  },

  // !Obtener estudiantes
  obtenerEstudiantes(id) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `select distinct nombre_usuario as nombre_estudiante, cur.nombre_curso as nombre_curso from usuarios user inner join estudiantes est on user.email_usuario = est.email_usuario inner join paga pg on user.email_usuario = pg.email_usuario inner join cursos cur on cur.id_curso = pg.id_curso where cur.id_curso = ?`,
        [id],
        (err, resultados) => {
          if (err) reject(err);
          else resolve(resultados);
        }
      );
    });
  },

  // !Obtener ID for actu
  obtenerPorIdForActu(id) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `select * from cursos where id_curso = ?`,
        [id],
        (err, resultados) => {
          if (err) reject(err);
          else resolve(resultados);
        }
      );
    });
  },

  // !Actualizar
  actualizar(
    id_curso,
    nombre_curso,
    url_ruta_acceso,
    fecha_inicio,
    fecha_final,
    semestre,
    precio,
    categoria
  ) {
    return new Promise((resolve, reject) => {
      conexion.query(
        `update cursos
            set nombre_curso = ?,
            url_ruta_acceso = ?,
            fecha_inicio = ?,
            fecha_final = ?,
            semestre = ?,
            precio = ?,
            categoria = ?
            where id_curso = ?`,
        [
          nombre_curso,
          url_ruta_acceso,
          fecha_inicio,
          fecha_final,
          semestre,
          precio,
          categoria,
          id_curso,
        ],
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
      conexion.query(`delete from cursos where id_curso = ?`, [id], (err) => {
        if (err) reject(err);
        else resolve();
      });
    });
  },
};
