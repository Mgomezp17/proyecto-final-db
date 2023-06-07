const express = require("express");
const router = express.Router();

const productoModel = require("../models/curso");

// !Ver
router.get("/", function (req, res, next) {
  productoModel
    .obtener()
    .then((curso) => {
      res.render("cursos/ver", {
        cursos: curso,
      });
    })
    .catch((err) => {
      return res.status(500).send(err);
    });
});

// !Info
router.get("/info/:id", async (req, res, next) => {
  try {
    const cursos = productoModel.obtenerPorId(req.params.id);

    cursos.then((curso) => {
      res.render(`cursos/info`, {
        cursos: curso,
      });
    });
  } catch {
    return res.status(500);
  }

  // productoModel
  //   .obtenerPorId(req.params.id)
  //   .then((curso) => {
  //     res.render(`cursos/info`, {
  //       cursos: curso,
  //     });
  //   })
  //   .catch((err) => {
  //     return res.status(500).send(err);
  //   });

  // productoModel
  //   .obtenerEstudiantes(req.params.id)
  //   .then((estudiante) => {
  //     res.render(`cursos/info`, {
  //       estudiantes: estudiante,
  //     });
  //   })
  //   .catch((err) => {
  //     return res.status(500).send(err);
  //   });
});

// !Agregar
router.get("/agregar", function (req, res, next) {
  res.render("cursos/agregar");
});
router.post("/insertar", function (req, res, next) {
  const {
    id_curso,
    nombre_curso,
    url_ruta_acceso,
    fecha_inicio,
    fecha_final,
    semestre,
    precio,
    categoria,
  } = req.body;
  if (
    !id_curso ||
    !nombre_curso ||
    !url_ruta_acceso ||
    !fecha_inicio ||
    !fecha_final ||
    !semestre ||
    !precio ||
    !categoria
  ) {
    return res
      .status(500)
      .send(
        "No hay: id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio ó categoria"
      );
  }
  // Si todo va bien, seguimos
  productoModel
    .insertar(
      id_curso,
      nombre_curso,
      url_ruta_acceso,
      fecha_inicio,
      fecha_final,
      semestre,
      precio,
      categoria
    )
    .then((idProductoInsertado) => {
      res.redirect("/cursos");
    })
    .catch((err) => {
      return res.status(500).send("Error insertando producto");
    });
});

// !Eliminar
router.get("/eliminar/:id", function (req, res, next) {
  productoModel
    .eliminar(req.params.id)
    .then(() => {
      res.redirect("/cursos");
    })
    .catch((err) => {
      return res.status(500).send(err);
    });
});

// !Editar
router.get("/editar/:id", function (req, res, next) {
  productoModel
    .obtenerPorIdForActu(req.params.id)
    .then((curso) => {
      if (curso) {
        res.render("cursos/editar", {
          curso: curso,
        });
      } else {
        return res.status(500).send("No existe un curso con ese id");
      }
    })
    .catch((err) => {
      return res.status(500).send("Error obteniendo curso");
    });
});

// !Actualizar
router.post("/actualizar/", function (req, res, next) {
  const {
    id_curso,
    nombre_curso,
    url_ruta_acceso,
    fecha_inicio,
    fecha_final,
    semestre,
    precio,
    categoria,
  } = req.body;
  if (
    !id_curso ||
    !nombre_curso ||
    !url_ruta_acceso ||
    !fecha_inicio ||
    !fecha_final ||
    !semestre ||
    !precio ||
    !categoria
  ) {
    console.log("id " + id_curso);
    console.log("nombre " + nombre_curso);
    console.log("url " + url_ruta_acceso);
    console.log("ini " + fecha_inicio);
    console.log("fin " + fecha_final);
    console.log("sem " + semestre);
    console.log("price " + precio);
    console.log("cat " + categoria);
    return res.status(500).send("No hay suficientes datos");
  }
  // Si todo va bien, seguimos
  productoModel
    .actualizar(
      id_curso,
      nombre_curso,
      url_ruta_acceso,
      fecha_inicio,
      fecha_final,
      semestre,
      precio,
      categoria
    )
    .then(() => {
      res.redirect("/cursos");
    })
    .catch((err) => {
      return res.status(500).send("Error actualizando producto " + err);
    });
});

module.exports = router;
