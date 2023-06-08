drop database if exists nodo;

create database nodo;

use nodo;

drop table if exists usuarios;
drop table if exists estudiantes;
drop table if exists cursos;
drop table if exists materiales_cursos;
drop table if exists tareas_cursos;
drop table if exists foro_cursos;
drop table if exists mensajes_foro;
drop table if exists profesores;
drop table if exists administradores;
drop table if exists paga;
drop table if exists consultar;
drop table if exists actividades;
drop table if exists matricula;
drop table if exists pertenece;
drop table if exists asigna;
drop table if exists dicta_interes;

create table usuarios(
	doc_identidad varchar(20) not null,
	nombre_usuario varchar(50),
	email_usuario varchar(50) not null primary key,
	genero varchar(20)
);

INSERT INTO usuarios (doc_identidad, nombre_usuario, email_usuario, genero) VALUES ('456789123', 'Maria Gomez', 'maria.gomez@example.com', 'F');
INSERT INTO usuarios (doc_identidad, nombre_usuario, email_usuario, genero) VALUES ('555777444', 'Pedro Perez', 'pedro.perez@example.com', 'M');
INSERT INTO usuarios (doc_identidad, nombre_usuario, email_usuario, genero) VALUES ('987654321', 'Luisa Jimenez', 'luisa.jimenez@example.com', 'F');
INSERT INTO usuarios (doc_identidad, nombre_usuario, email_usuario, genero) VALUES ('321654987', 'Carlos Sanchez', 'carlos.sanchez@example.com', 'M');
INSERT INTO usuarios (doc_identidad, nombre_usuario, email_usuario, genero) VALUES ('444555666', 'Laura Rodriguez', 'laura.rodriguez@example.com', 'F');
INSERT INTO usuarios (doc_identidad, nombre_usuario, email_usuario, genero) VALUES ('774526766', 'Mateo Arango', 'mateo.arango@example.com', 'M');

create table cursos(
	id_curso int not null primary key,
	nombre_curso varchar(50),
	url_ruta_acceso varchar(50),
	fecha_inicio date,
	fecha_final date,
	semestre int,
	precio int,
    categoria varchar(30)
);

INSERT INTO cursos(id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio, categoria) VALUES(72684, 'Matematicas', 'https://www.matematicas.com', '2023-01-28', '2023-02-11', 1, 1200000, "Ciencia Básica");
INSERT INTO cursos(id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio, categoria) VALUES(67392, 'Bases de datos', 'https://www.basesdedatos.com', '2023-02-11', '2023-02-25', 1, 1100000, "Pénsum");
INSERT INTO cursos(id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio, categoria) VALUES(84970, 'Datos y Algoritmos', 'https://www.algoritmos.com', '2023-02-25', '2023-03-07', 1, 1450000, "Pénsum");
INSERT INTO cursos(id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio, categoria) VALUES(16243, 'Algebra Lineal', 'https://www.algebra.com', '2023-03-07', '2023-03-21', 1, 2050000, "Ciencia Básica");
INSERT INTO cursos(id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio, categoria) VALUES(50718, 'Biologia', 'https://www.biologia.com', '2023-03-21', '2023-04-13', 1, 951300, "Ciencia Básica");
INSERT INTO cursos(id_curso, nombre_curso, url_ruta_acceso, fecha_inicio, fecha_final, semestre, precio, categoria) VALUES(34589, 'Cálculo Diferencial', 'https://www.calculo.com', '2023-04-13', '2023-04-27', 1, 1144532.25, "Ciencia Básica");

create table estudiantes(
	id_curso int not null,
	email_usuario varchar(50) not null,
	ref_pago_futuro int,
    foreign key (id_curso) references cursos(id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
	foreign key (email_usuario) references usuarios(email_usuario),
    primary key (id_curso,email_usuario) 
);

INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (72684, 'maria.gomez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (72684, 'pedro.perez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (72684,'luisa.jimenez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (72684,'carlos.sanchez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (67392, 'maria.gomez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (67392, 'luisa.jimenez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (84970, 'laura.rodriguez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (84970, 'maria.gomez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (84970, 'carlos.sanchez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (84970, 'pedro.perez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (16243, 'pedro.perez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (16243, 'maria.gomez@example.com', 1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (16243, 'laura.rodriguez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (50718, 'laura.rodriguez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (50718, 'pedro.perez@example.com',1);
INSERT INTO estudiantes(id_curso, email_usuario, ref_pago_futuro) VALUES (50718, 'carlos.sanchez@example.com',1);

create table paga(
	matricula_curso varchar(50) not null primary key,
    contrasena varchar(50), 
    email_usuario varchar(50) not null,
    id_curso int not null,
    foreign key (email_usuario) references usuarios (email_usuario),
    foreign key (id_curso) references cursos (id_curso) ON UPDATE CASCADE ON DELETE CASCADE
	);

INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('492HVT1', 'Eafit2023.','maria.gomez@example.com', 72684);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('85LXWZ0', 'Eafit2023.','pedro.perez@example.com', 72684);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('613PQR5', 'Eafit2023.','luisa.jimenez@example.com', 72684);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('924JMK8', 'Eafit2023.','carlos.sanchez@example.com', 72684);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('385NBS9', 'Eafit2023.','maria.gomez@example.com', 67392);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('276QXC5', 'Eafit2023.','luisa.jimenez@example.com', 67392);

INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('895JRP2', 'Eafit2023.','laura.rodriguez@example.com', 84970);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('710KFD4', 'Eafit2023.','maria.gomez@example.com', 84970);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('362GTH6', 'Eafit2023.','carlos.sanchez@example.com', 84970);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('198LMN3', 'Eafit2023.','pedro.perez@example.com', 84970);

INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('453VWX9', 'Eafit2023.','pedro.perez@example.com', 16243 );
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('620YZB8', 'Eafit2023.','maria.gomez@example.com', 16243);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('587TSD1', 'Eafit2023.','laura.rodriguez@example.com', 16243);

INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('927FHE4', 'Eafit2023.','laura.rodriguez@example.com',50718 );
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('384NPU7', 'Eafit2023.','pedro.perez@example.com', 50718);
INSERT INTO paga(matricula_curso, contrasena, email_usuario, id_curso) VALUES ('745BDF2', 'Eafit2023.','carlos.sanchez@example.com', 50718);


create table consultar(
	id_consulta int not null primary key,
    id_curso int not null,
    email_usuario varchar(50) not null,
    foreign key (email_usuario) references usuarios (email_usuario),
    foreign key (id_curso) references cursos (id_curso) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO consultar(id_consulta,id_curso,email_usuario) VALUES (2345, 72684, 'maria.gomez@example.com');
INSERT INTO consultar(id_consulta,id_curso,email_usuario) VALUES (8912, 67392, 'maria.gomez@example.com');
INSERT INTO consultar(id_consulta,id_curso,email_usuario) VALUES (6754, 72684, 'pedro.perez@example.com');
INSERT INTO consultar(id_consulta,id_curso,email_usuario) VALUES (1208, 84970, 'carlos.sanchez@example.com');
INSERT INTO consultar(id_consulta,id_curso,email_usuario) VALUES (3987, 84970, 'maria.gomez@example.com');
INSERT INTO consultar(id_consulta,id_curso,email_usuario) VALUES (5067, 16243, 'luisa.jimenez@example.com');
INSERT INTO consultar(id_consulta,id_curso,email_usuario) VALUES (7843, 50718, 'laura.rodriguez@example.com');


create table administradores (
    id_administrador integer not null primary key,
    nombre_admin varchar(50),
    email_admin varchar(50)
);

INSERT INTO administradores(id_administrador, nombre_admin, email_admin) VALUES (4875962, 'Andres Valencia','andres.valencia@example.com');
INSERT INTO administradores(id_administrador, nombre_admin, email_admin) VALUES (7651398, 'Mateo pelaez','mateo.pelaez@example.com');
INSERT INTO administradores(id_administrador, nombre_admin, email_admin) VALUES (2548973, 'Sara Cano', 'sara.cano@example.com');

create table matricula(
	id_administrador int not null,
    email_usuario varchar(50) not null,
    foreign key (id_administrador) references administradores (id_administrador),
    foreign key (email_usuario) references usuarios (email_usuario),
    primary key (id_administrador, email_usuario)
);

INSERT INTO matricula(id_administrador, email_usuario) VALUES (4875962, 'maria.gomez@example.com');
INSERT INTO matricula(id_administrador, email_usuario) VALUES (4875962, 'pedro.perez@example.com');
INSERT INTO matricula(id_administrador, email_usuario) VALUES (7651398, 'luisa.jimenez@example.com');
INSERT INTO matricula(id_administrador, email_usuario) VALUES (7651398, 'carlos.sanchez@example.com');
INSERT INTO matricula(id_administrador, email_usuario) VALUES (2548973, 'laura.rodriguez@example.com');

create table profesores(
    id_profesor int not null primary key,
    nombre_completo varchar(50),
    email_profesor varchar(50),
    telefono int,
    area_principal_conocimiento longtext,
    area_alternativa_conocimiento longtext
);

INSERT INTO profesores (id_profesor, nombre_completo, email_profesor, telefono, area_principal_conocimiento, area_alternativa_conocimiento) VALUES (8743912 , 'Alberto Correa', 'alberto.correa@example.com', 31376416, 'Matematicas', 'Algebra Lineal');
INSERT INTO profesores (id_profesor, nombre_completo, email_profesor, telefono, area_principal_conocimiento, area_alternativa_conocimiento) VALUES (2065873 , 'Juan Pablo Cano', 'juan.pablo.cano@example.com', 31377711, 'Bases de datos', 'Matematicas');
INSERT INTO profesores (id_profesor, nombre_completo, email_profesor, telefono, area_principal_conocimiento, area_alternativa_conocimiento) VALUES (9567124 , 'Willian Cardona', 'william.cardona@example.com', 31275412, 'Datos y Algoritmos ', 'Bases de datos');
INSERT INTO profesores (id_profesor, nombre_completo, email_profesor, telefono, area_principal_conocimiento, area_alternativa_conocimiento) VALUES (3214567 , 'Jorge Yepes', 'jorge.yepes@example.com', 32154719, 'Biologia', 'Datos y Algoritmos');
INSERT INTO profesores (id_profesor, nombre_completo, email_profesor, telefono, area_principal_conocimiento, area_alternativa_conocimiento) VALUES (7896543 , 'Sandra Cano', 'sandra.cano@example.com', 31417228, 'Algebra Lineal', 'Bases de datos');
INSERT INTO profesores (id_profesor, nombre_completo, email_profesor, telefono, area_principal_conocimiento, area_alternativa_conocimiento) VALUES (2938473 , 'Juan Ignacio Salgado', 'jsalga.nacio@example.com', 31923934, 'Cálculo Diferencial', 'Matemáticas');

create table asigna(
	id_administrador int not null,
    id_curso int not null,
    id_profesor int not null,
    foreign key (id_administrador) references administradores (id_administrador),
    foreign key (id_curso) references cursos (id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (id_profesor) references profesores(id_profesor),
    primary key (id_administrador, id_curso, id_profesor)
);

INSERT INTO asigna(id_administrador,id_curso, id_profesor) VALUES (4875962, 72684, 8743912);
INSERT INTO asigna(id_administrador,id_curso, id_profesor) VALUES (4875962, 67392, 2065873);
INSERT INTO asigna(id_administrador,id_curso, id_profesor) VALUES (7651398, 84970, 9567124);
INSERT INTO asigna(id_administrador,id_curso, id_profesor) VALUES (7651398, 16243, 7896543);
INSERT INTO asigna(id_administrador,id_curso, id_profesor) VALUES (2548973, 50718, 3214567);

create table dicta_interes (
	id_curso int not null,
    id_profesor int not null,
    foreign key (id_curso) references cursos (id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (id_profesor) references profesores(id_profesor),
    primary key (id_curso, id_profesor)
);

INSERT INTO dicta_interes(id_curso,id_profesor) VALUES (72684,8743912);
INSERT INTO dicta_interes(id_curso,id_profesor) VALUES (67392,2065873);
INSERT INTO dicta_interes(id_curso,id_profesor) VALUES (84970,9567124);
INSERT INTO dicta_interes(id_curso,id_profesor) VALUES (16243,7896543);
INSERT INTO dicta_interes(id_curso,id_profesor) VALUES (50718,3214567);

create table materiales_cursos(
	id_materiales integer not null primary key,
	titulo_material varchar(50),
	descripcion_material text,
	archivos_material varchar(50)
);

INSERT INTO materiales_cursos(id_materiales, titulo_material, descripcion_material, archivos_material) VALUES (378956, 'Material Matematicas', 'Una actividad de matemáticas puede ser cualquier ejercicio o problema que involucre el uso de conceptos matemáticos para llegar a una solución. Estas actividades pueden ser muy variadas, desde la resolución de ecuaciones simples hasta la elaboración de modelos matemáticos complejos. En general, las actividades de matemáticas buscan desarrollar habilidades como el razonamiento lógico, la capacidad de análisis y síntesis, la resolución de problemas y el pensamiento crítico. Además, pueden ser adaptadas para diferentes niveles de dificultad y para diferentes edades, desde la educación básica hasta la educación superior.','Matematicas.pdf');
INSERT INTO materiales_cursos(id_materiales, titulo_material, descripcion_material, archivos_material) VALUES (582743, 'Material Bases de datos', '
Una actividad de bases de datos implica la manipulación y gestión de información en una base de datos. Las actividades de bases de datos pueden variar desde la creación y diseño de la estructura de una base de datos hasta la realización de consultas y la generación de informes. Estas actividades buscan desarrollar habilidades en la gestión de información y el uso de herramientas y tecnologías para su almacenamiento, organización y acceso. Además, las actividades de bases de datos pueden ser adaptadas a diferentes niveles de dificultad y pueden ser aplicadas en diferentes campos, como el comercio, la industria, la salud, entre otros.','BasesDatos.pdf');
INSERT INTO materiales_cursos(id_materiales, titulo_material, descripcion_material, archivos_material) VALUES (769812, 'Material Algoritmos','Una actividad de algoritmos implica la resolución de problemas utilizando un conjunto de pasos o instrucciones precisas y ordenadas que permiten alcanzar un resultado específico. Estas actividades pueden involucrar la identificación y diseño de algoritmos para resolver problemas específicos, así como la implementación y prueba de dichos algoritmos utilizando herramientas y lenguajes de programación. Las actividades de algoritmos buscan desarrollar habilidades en el razonamiento lógico, la creatividad y la capacidad de análisis y síntesis. Además, pueden ser adaptadas para diferentes niveles de dificultad y pueden ser aplicadas en diferentes campos, como la ingeniería, la informática, la estadística, entre otros.' ,'Algoritmos.pdf');
INSERT INTO materiales_cursos(id_materiales, titulo_material, descripcion_material, archivos_material) VALUES (215890, 'Material Algebra Lineal', '
Una actividad de álgebra implica la manipulación de variables y expresiones matemáticas para resolver ecuaciones y problemas. Las actividades de álgebra pueden variar desde la simplificación de expresiones algebraicas hasta la resolución de sistemas de ecuaciones lineales y la aplicación de fórmulas para resolver problemas prácticos. Estas actividades buscan desarrollar habilidades en la identificación de patrones y relaciones matemáticas, la resolución de problemas y la aplicación de conceptos algebraicos en situaciones prácticas. Además, las actividades de álgebra pueden ser adaptadas a diferentes niveles de dificultad y pueden ser aplicadas en diferentes campos, como la ingeniería, la física, la economía, entre otros.','Algebra.pdf');
INSERT INTO materiales_cursos(id_materiales, titulo_material, descripcion_material, archivos_material) VALUES (947136, 'Material Biologia', 'Una actividad de biología implica el estudio y análisis de los seres vivos y sus procesos biológicos. Las actividades de biología pueden variar desde la observación de células y organismos hasta la realización de experimentos y la interpretación de datos biológicos. Estas actividades buscan desarrollar habilidades en la observación, análisis y síntesis de información biológica, así como la aplicación de los conceptos y teorías biológicas para entender los procesos de la vida. Además, las actividades de biología pueden ser adaptadas a diferentes niveles de dificultad y pueden ser aplicadas en diferentes campos, como la medicina, la ecología, la genética, entre otros.','Biologia.pdf');

create table tareas_cursos(
	id_tareas integer not null primary key,
	titulo_tareas varchar(50),
	descripcion_tareas longtext,
	fecha_creacion date,
	fecha_entrega date,
	puntaje_tarea int,
	archivos_material varchar(50)
);

INSERT INTO tareas_cursos(id_tareas, titulo_tareas, descripcion_tareas, fecha_creacion, fecha_entrega, puntaje_tarea, archivos_material) VALUES (2837, "Primera entrea - Consulta", "Consultar sobre bases de datos relacionales y no relacionales, lo visto hoy en clase", "2023-05-11", "2023-05-18", 5, "Clase_1.pdf");
INSERT INTO tareas_cursos(id_tareas, titulo_tareas, descripcion_tareas, fecha_creacion, fecha_entrega, puntaje_tarea, archivos_material) VALUES (2838, "Segunda entrea - Investigación", "Investigar sobre la base de datos que utiliza waze para almacenar todos sus datos", "2023-05-19", "2023-05-25", 5, "Entregable_1.pdf");
INSERT INTO tareas_cursos(id_tareas, titulo_tareas, descripcion_tareas, fecha_creacion, fecha_entrega, puntaje_tarea, archivos_material) VALUES (2839, "Taller 1", "Consulte sobre porcentajes de varibales discretas", "2023-05-26", "2023-05-31", 10, "Variables_discretas.rmd");
INSERT INTO tareas_cursos(id_tareas, titulo_tareas, descripcion_tareas, fecha_creacion, fecha_entrega, puntaje_tarea, archivos_material) VALUES (2840, "Tercera entrea - Construcción", "Realizar la tercera entrega del proyecto de bases de datos", "2023-06-05", "2023-06-18", 15, "proyecto.pdf");
INSERT INTO tareas_cursos(id_tareas, titulo_tareas, descripcion_tareas, fecha_creacion, fecha_entrega, puntaje_tarea, archivos_material) VALUES (2841, "Taller 2", "El taller 2 está en interactiva, revisar", "2023-06-18", "2023-06-26", 20, "taller_2.pdf");
INSERT INTO tareas_cursos(id_tareas, titulo_tareas, descripcion_tareas, fecha_creacion, fecha_entrega, puntaje_tarea, archivos_material) VALUES (2842, "Taller 3", "El taller 3 está en interactiva, consultar", "2023-07-01", "2023-07-6", 15, "taller_3.pdf");
INSERT INTO tareas_cursos(id_tareas, titulo_tareas, descripcion_tareas, fecha_creacion, fecha_entrega, puntaje_tarea, archivos_material) VALUES (2843, "Taller 4", "El taller 4 está en interactiva, consultar", "2023-07-11", "2023-07-18", 30, "taller_4.pdf");

create table foro_cursos(
	id_foros integer not null primary key,
	nombre_foros varchar(50),
	descripcion_foro longtext,
	fecha_creacion date,
	fecha_terminacion date
);

INSERT INTO foro_cursos(id_foros, nombre_foros, descripcion_foro, fecha_creacion, fecha_terminacion) VALUES (01002843, "Debate angulos", "Debate sobre los ángulos polinomiales de el álgebra en multiples variables polaroides", "2023-02-15", "2023-03-14");
INSERT INTO foro_cursos(id_foros, nombre_foros, descripcion_foro, fecha_creacion, fecha_terminacion) VALUES (01002844, "Foro de JavaScript", "Es un foro donde se comparten conocimientos de JavaScript", "2023-01-10", "2023-01-20");
INSERT INTO foro_cursos(id_foros, nombre_foros, descripcion_foro, fecha_creacion, fecha_terminacion) VALUES (01002845, "Temas polemicos", "En este foro se discutiran temas polemicos de la sociedad actual", "2023-03-15", "2023-03-17");
INSERT INTO foro_cursos(id_foros, nombre_foros, descripcion_foro, fecha_creacion, fecha_terminacion) VALUES (01002846, "Calor o Frío", "Es un debate que se realizará con fines de experimentos sociales", "2023-03-20", "2023-03-25");
INSERT INTO foro_cursos(id_foros, nombre_foros, descripcion_foro, fecha_creacion, fecha_terminacion) VALUES (01002847, "Proyección", "Aquí podrás podrás descubrir que te mueve y que quieres para tu vida profesional", "2023-03-26", "2023-03-30");

create table mensajes_foros(
	id_mensajes integer not null primary key,
	nombre_mensajes varchar(50),
	descripcion_mensajes longtext,
	id_foros integer not null,
	id_remitente integer,
	id_destinatario integer,
    foreign key (id_foros) references foro_cursos (id_foros)
);

INSERT INTO mensajes_foros(id_mensajes, nombre_mensajes, descripcion_mensajes, id_foros, id_remitente, id_destinatario) VALUES (38214, "Team Frío", "Yo soy tema frío toda la vida", 01002843, 456789123, 987654321);
INSERT INTO mensajes_foros(id_mensajes, nombre_mensajes, descripcion_mensajes, id_foros, id_remitente, id_destinatario) VALUES (38215, "Debate ángulos", "Pa mi los angulos polinomiales son de coordenadas polaroides", 01002844, 987654321, 456789123);
INSERT INTO mensajes_foros(id_mensajes, nombre_mensajes, descripcion_mensajes, id_foros, id_remitente, id_destinatario) VALUES (38216, "Sistemas", "Yo pienso que estudiar ingeneria de sistemas es el futuro", 01002845, 444555666, 456789123);
INSERT INTO mensajes_foros(id_mensajes, nombre_mensajes, descripcion_mensajes, id_foros, id_remitente, id_destinatario) VALUES (38217, "JavaScript", "Los eventos asincronicos sirven para poner anuncios en paginas web", 01002846, 444555666, 555777444);
INSERT INTO mensajes_foros(id_mensajes, nombre_mensajes, descripcion_mensajes, id_foros, id_remitente, id_destinatario) VALUES (38218, "Tema polemico es la drogadiccion", "porque la drogas nos hacen ver cosas que en nustros cinco sentidos no vemos", 01002847, 444555666, 987654321);

create table actividades(
	id_materiales int not null,
    id_tareas int not null, 
    id_foros int not null,
    id_mensajes int not null,
    id_curso int not null,
    id_profesor int not null,
    foreign key (id_curso) references cursos (id_curso) ON UPDATE CASCADE ON DELETE CASCADE,
    foreign key (id_materiales) references materiales_cursos (id_materiales),
    foreign key (id_tareas) references tareas_cursos (id_tareas),
    foreign key (id_mensajes) references mensajes_foros (id_mensajes),
    foreign key (id_foros) references foro_cursos (id_foros),
    foreign key (id_profesor) references profesores (id_profesor),
    primary key (id_materiales,id_tareas,id_foros,id_mensajes,id_curso,id_profesor) 
);

INSERT INTO actividades(id_materiales, id_tareas, id_foros, id_mensajes, id_curso, id_profesor) VALUES (378956, 2837, 01002843, 38214, 72684, 8743912);
INSERT INTO actividades(id_materiales, id_tareas, id_foros, id_mensajes, id_curso, id_profesor) VALUES (582743, 2838, 01002844, 38215, 67392, 2065873);
INSERT INTO actividades(id_materiales, id_tareas, id_foros, id_mensajes, id_curso, id_profesor) VALUES (769812, 2839, 01002845, 38216, 16243, 9567124);
INSERT INTO actividades(id_materiales, id_tareas, id_foros, id_mensajes, id_curso, id_profesor) VALUES (215890, 2840, 01002846, 38217, 84970, 7896543);
INSERT INTO actividades(id_materiales, id_tareas, id_foros, id_mensajes, id_curso, id_profesor) VALUES (947136, 2841, 01002847, 38218, 50718, 3214567);

-- select * from cursos inner join asigna on cursos.id_curso = asigna.id_curso inner join estudiantes on cursos.id_curso = estudiantes.id_curso inner join actividades on cursos.id_curso = actividades.id_curso where cursos.id_curso = 72684;

-- select * from cursos as cur inner join estudiantes as est on cur.id_curso = est.id_curso inner join usuarios as usu on est.email_usuario = usu.email_usuario inner join profesores as pro on cur.nombre_curso = pro.area_principal_conocimiento inner join actividades as act on cur.id_curso = act.id_curso inner join tareas_cursos as tr on act.id_tareas = tr.id_tareas inner join foro_cursos as fr on act.id_foros = fr.id_foros inner join mensajes_foros as msg on act.id_mensajes = msg.id_mensajes where cur.id_curso = 16243;

-- select distinct nombre_usuario as nombre_estudiante, cur.nombre_curso as nombre_curso from usuarios user inner join estudiantes est on user.email_usuario = est.email_usuario inner join paga pg on user.email_usuario = pg.email_usuario inner join cursos cur on cur.id_curso = pg.id_curso where cur.id_curso = 67392;
-- 1. Listar todos los estudiantes (nombre completo, matrícula) de la base de 
-- datos ordenados alfabéticamente por nombre para un año y semestre 
-- concreto.
-- select distinct nombre_usuario as estudiante, pg.matricula_curso as id_matricula, cur.nombre_curso as curso from usuarios user inner join estudiantes est on user.email_usuario = est.email_usuario inner join paga pg on user.email_usuario = pg.email_usuario inner join cursos cur on cur.id_curso = pg.id_curso;

-- -- 2. Listar todos los estudiantes (nombre completo) de la base de datos de un 
-- -- curso determinado para un año y semestre concreto.
-- select distinct nombre_usuario as estudiante, cur.nombre_curso as curso from usuarios user inner join estudiantes est on user.email_usuario = est.email_usuario inner join paga pg on user.email_usuario = pg.email_usuario inner join cursos cur on cur.id_curso = pg.id_curso where cur.nombre_curso = "Algebra Lineal";

-- -- 3. Listar todos los cursos que un estudiante ha tenido entre un rango de 
-- -- fechas en la base de datos.
-- select distinct nombre_usuario as estudiante, cur.nombre_curso as curso from usuarios user inner join estudiantes est on user.email_usuario = est.email_usuario inner join paga pg on user.email_usuario = pg.email_usuario inner join cursos cur on cur.id_curso = pg.id_curso where (cur.fecha_inicio between '2023-01-29' and '2023-02-02') and (cur.fecha_final between '2023-05-30' and '2023-06-03');

-- -- 4. Listar los profesores (número de identificación, nombre completo) y 
-- -- los cursos que tiene asignados actualmente.
-- select distinct nombre_completo as nombre, prof.id_profesor as id_profesor, cur.nombre_curso as cursos_asignados from profesores prof inner join asigna asig on prof.id_profesor = asig.id_profesor inner join cursos cur on cur.id_curso = asig.id_curso;

-- -- 5. Listar todos los cursos ordenados por categoría. (nombre del curso, categoría).
-- select distinct nombre_curso, categoria from cursos;

-- -- 6. Listar los cursos con un rango de precio entre val_minimo y val_máximo 
-- -- (a modo de ejemplo del query coloque 100.000 y 500.000)
-- select nombre_curso from cursos where precio between 900000 and 1200000;

-- -- 7. Listar los usuarios que están registrados, pero no están matriculados en ningún 
-- -- curso para un año y semestre específico.
-- SELECT email_usuario FROM usuarios EXCEPT SELECT email_usuario FROM paga;

-- -- 8. Listar los cursos que se encuentran en una categoría 
-- -- (a modo de ejemplo: la categoría Computación.
-- select distinct nombre_curso, categoria 
-- from cursos
-- where categoria = 'Pensum';

-- -- 9. Listar las tareas que los estudiantes deben realizar en el curso dado con 
-- -- identificador x (a modo de ejemplo, curso id = 20)
-- SELECT DISTINCT 
-- 	titulo_tareas as titulo, 
-- 	ta_cur.id_tareas as id_tareas,
--     cur.nombre_curso as curso
-- FROM tareas_cursos ta_cur
-- inner join actividades act on ta_cur.id_tareas = act.id_tareas
-- inner join cursos cur on cur.id_curso = act.id_curso
-- where act.id_curso = 72684;

-- -- 10. Listar los materiales que el profesor ha publicado en un curso dado 
-- -- (a modo de ejemplo especifique id de curso, curso id = 20)
-- select mat.* from materiales_cursos mat inner join actividades act on mat.id_materiales = act.id_materiales inner join cursos cur on cur.id_curso = act.id_curso where cur.id_curso = 67392;


-- -- 11. Listar todos los mensajes de un foro en un curso, listando el id y nombre del 
-- -- que envió en mensaje (a modo de ejemplo especifique id de curso/foro o solo id de foro)
-- select distinct id_mensajes, usu.nombre_usuario, msj.nombre_mensajes from mensajes_foros msj inner join foro_cursos foro on foro.id_foros = msj.id_foros inner join usuarios usu on msj.id_remitente = usu.doc_identidad inner join estudiantes est on est.email_usuario = usu.email_usuario where msj.id_remitente = '456789123';

-- -- 12. Especifique una consulta que consideraría muy importante en este sistema, 
-- -- y la realiza.
-- select nombre_curso from cursos where precio between 1100000 and 2100000;