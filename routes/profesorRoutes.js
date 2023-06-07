const express = require("express");
const router = express.Router();

const productoModel = require("../models/profesor");

// !Ver
router.get("/", function (req, res, next) {
  productoModel
    .obtener()
    .then((profe) => {
      res.render("profesores/ver", {
        profesores: profe,
      });
    })
    .catch((err) => {
      return res.status(500).send(err);
    });
});

// !Agregar
router.get("/agregar", function (req, res, next) {
  res.render("cursos/agregar");
});
router.post("/insertar", function (req, res, next) {
  // Obtener el nombre y precio. Es lo mismo que
  // const nombre = req.body.nombre;
  // const precio = req.body.precio;
  const { nombre, precio } = req.body;
  if (!nombre || !precio) {
    return res.status(500).send("No hay nombre o precio");
  }
  // Si todo va bien, seguimos
  productoModel
    .insertar(nombre, precio)
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
      return res.status(500).send("Error eliminando");
    });
});

// !Editar
router.get("/editar/:id", function (req, res, next) {
  productoModel
    .obtenerPorId(req.params.id)
    .then((producto) => {
      if (producto) {
        res.render("cursos/editar", {
          producto: producto,
        });
      } else {
        return res.status(500).send("No existe producto con ese id");
      }
    })
    .catch((err) => {
      return res.status(500).send("Error obteniendo producto");
    });
});

// !Actualizar
router.post("/actualizar/", function (req, res, next) {
  // Obtener el nombre y precio. Es lo mismo que
  // const nombre = req.body.nombre;
  // const precio = req.body.precio;
  const { id, nombre, precio } = req.body;
  if (!nombre || !precio || !id) {
    return res.status(500).send("No hay suficientes datos");
  }
  // Si todo va bien, seguimos
  productoModel
    .actualizar(id, nombre, precio)
    .then(() => {
      res.redirect("/cursos");
    })
    .catch((err) => {
      return res.status(500).send("Error actualizando producto");
    });
});

module.exports = router;
