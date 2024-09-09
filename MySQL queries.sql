-- TIENDA

SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SHOW COLUMNS FROM producto; -- CORREGIDO
SELECT nombre, precio, precio * 1.087 FROM producto;
SELECT nombre AS "Nombre producto", precio AS Euros, precio*1.087 as "Dólares norteamericanos" FROM producto;
SELECT UCASE(nombre) AS "Nombre en mayúsculas", precio FROM producto;
SELECT LCASE(nombre) AS "Nombre en minúsculas", precio FROM producto;
SELECT nombre, UCASE(left(nombre, 2)) AS Iniciales FROM fabricante;
SELECT nombre, ROUND(precio, 0) as "Precio redondeado" FROM producto;
SELECT nombre, TRUNCATE(precio, 0) as "Precio truncado" FROM producto;
SELECT codigo_fabricante FROM producto p WHERE p.codigo_fabricante IS NOT NULL; --CORREGIDO
SELECT DISTINCT codigo_fabricante FROM producto p WHERE p.codigo_fabricante IS NOT NULL; --CORREGIDO
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT p.nombre FROM producto p JOIN fabricante f WHERE f.codigo = 2;
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
SELECT p.nombre AS Producto, precio AS Precio, f.nombre AS Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY Fabricante; --CORREGIDO (Sólo aclarado el nombre de las columnas, no veo nada más)
SELECT p.codigo AS "Código producto", p.nombre AS "Nombre producto", f.codigo AS "Código fabricante", f.nombre AS "Nombre fabricante" FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
SELECT p.nombre AS "Producto", precio AS Precio, f.nombre AS "Fabricante" FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY Precio LIMIT 1; --CORREGIDO
SELECT p.nombre AS "Nombre producto", precio, f.nombre AS "Nombre fabricante" from producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY precio DESC LIMIT 1;
SELECT p.nombre AS Producto, precio AS Precio, f.nombre as Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "lenovo";
SELECT p.nombre AS Producto, precio AS Precio, f.nombre as Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "crucial" and p.precio > 200;
SELECT p.nombre AS Producto, precio AS Precio, f.nombre as Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate";
SELECT p.nombre AS Producto, precio AS Precio, f.nombre as Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ("Asus", "Hewlett-Packard", "Seagate");
SELECT p.nombre AS Producto, precio AS Precio FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE RIGHT(f.nombre, 1) = "e";
SELECT p.nombre AS Producto, precio AS Precio FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE LOCATE("w", f.nombre) != 0;
SELECT p.nombre AS Producto, precio AS Precio, f.nombre as Fabricante FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE precio >= 180 ORDER BY precio DESC, Producto;
SELECT f.codigo AS "Código fabricante", f.nombre AS Fabricante from fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.nombre AS Fabricante, p.nombre as Producto from fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.nombre AS Fabricante from fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NULL; --AÑADIDO
SELECT nombre AS "Producto Lenovo", precio AS Precio FROM producto p WHERE p.codigo_fabricante = 2; --AÑADIDO
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2); --AÑADIDO
SELECT p.nombre as Producto FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Lenovo" ORDER BY precio DESC LIMIT 1; --AÑADIDO
SELECT p.nombre as Producto FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Hewlett-Packard" ORDER BY precio LIMIT 1; --AÑADIDO
SELECT p.nombre AS Producto, precio AS Precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE precio >= (SELECT MAX(precio) FROM producto p JOIN fabricante f WHERE  f.nombre = "Lenovo"); --AÑADIDO
SELECT p.nombre AS Producto, p.precio AS Precio, f.nombre AS Fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus" AND p.precio > (SELECT AVG(precio) from producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = "Asus"); --AÑADIDO

-- UNIVERSIDAD
SELECT apellido1 AS "Primer apellido", apellido2 AS "Segundo apellido", nombre AS Nombre FROM persona WHERE tipo = "alumno" ORDER BY apellido1, apellido2, nombre;
SELECT nombre AS Nombre, apellido1 AS "Primer apellido", apellido2 AS "Segundo apellido" FROM persona WHERE tipo = "alumno" AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = "profesor" AND RIGHT(nif, 1) = "K";
SELECT * from asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1 AS "Primer apellido", p.apellido2 AS "Segundo apellido", p.nombre AS Nombre, d.nombre AS "Departamento" FROM persona p JOIN profesor pr ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento ORDER by apellido1, nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura aa JOIN asignatura a ON aa.id_asignatura = a.id JOIN persona p ON p.id = aa.id_alumno JOIN curso_escolar ce ON aa.id_curso_escolar = ce.id WHERE p.nif = "26902806M";
SELECT d.nombre FROM departamento d JOIN profesor p ON p.id_departamento = d.id WHERE p.id_profesor IN (SELECT a.id_profesor from asignatura a JOIN grado g ON a.id_grado = g.id WHERE g.nombre = "Grado en Ingeniería Informática (Plan 2015)") GROUP BY d.nombre; --CORREGIDO
SELECT * FROM persona p JOIN alumno_se_matricula_asignatura aa ON aa.id_alumno = p.id JOIN curso_escolar ce ON ce.id = aa.id_curso_escolar WHERE ce.anyo_inicio = 2018 GROUP BY p.id;

-- LEFT JOIN, RIGHT JOIN
SELECT d.nombre AS Departamento, p.apellido1, p.apellido2, p.nombre FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id ORDER BY Departamento, p.apellido1, p.apellido2, p.nombre; --CORREGIDO, PERO NO HAY PROFESORES SIN DEPARTAMENTO
SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2 FROM profesor pr JOIN persona p ON pr.id_profesor = p.id WHERE pr.id_departamento IS NULL; --NO VEO EL ERROR, NO HAY PROFESORES SIN DEPARTAMENTO
SELECT d.nombre AS "Departamentos sin Profe" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;
SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2 FROM profesor pr LEFT JOIN asignatura a USING(id_profesor) JOIN persona p ON pr.id_profesor = p.id WHERE a.nombre IS NULL ORDER BY p.apellido1; --NO VEO EL ERROR, NO HAY PROFESORES SIN DEPARTAMENTO
SELECT a.nombre "Asignaturas sin profesor" FROM asignatura a WHERE a.id_profesor IS NULL ORDER BY a.nombre;
SELECT DISTINCT d.nombre FROM profesor pr LEFT JOIN asignatura a USING(id_profesor) JOIN persona p ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento WHERE a.id_profesor IS NULL ORDER BY d.nombre;

-- CONSULTES RESUM
SELECT COUNT(p.nombre) AS "Total alumnos" FROM  persona p WHERE tipo = "alumno";
SELECT COUNT(p.nombre) AS "Total alumnos" FROM  persona p WHERE tipo = "alumno" AND YEAR(p.fecha_nacimiento) = 1999;
SELECT COUNT(pr.id_profesor) AS "Número de profesores", d.nombre AS Departamento FROM profesor pr JOIN departamento d ON d.id = pr.id_departamento group BY d.nombre ORDER by 1 DESC;
SELECT d.nombre AS Departamento, COUNT(pr.id_profesor) AS "Número de profesores" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY 2 DESC;
SELECT g.nombre AS Grado, COUNT(a.nombre) AS Asignturaas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY 2 DESC; 
SELECT g.nombre AS "Grados con más de 40 asignaturas", COUNT(a.nombre) AS Asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado  GROUP BY g.nombre HAVING COUNT(a.nombre) > 40;
SELECT g.nombre AS Grado, a.tipo AS "Tipo de asignatura", SUM(a.creditos) AS "Suma de créditos" FROM asignatura a JOIN grado g ON a.id_grado = g.id GROUP BY a.tipo, g.nombre ORDER BY g.nombre; --AÑADIDA
SELECT c.anyo_inicio AS "Año inicio curso escolar", COUNT(DISTINCT a.id_alumno) AS "Número alumnos matriculados" FROM alumno_se_matricula_asignatura a JOIN curso_escolar c ON a.id_curso_escolar = c.id GROUP BY c.anyo_inicio; --AÑADIDA
SELECT p.id AS "ID del profesor", p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS "Número asignaturas" FROM persona p  LEFT JOIN asignatura a ON a.id_profesor = p.id GROUP BY p.id ORDER BY COUNT(a.id) DESC, p.apellido1, p.apellido2, p.nombre; --AÑADIDA
SELECT * FROM persona WHERE tipo = "alumno" AND fecha_nacimiento = (SELECT MAX(p.fecha_nacimiento) FROM persona p WHERE tipo = "alumno"): --AÑADIDO
SELECT p.id_profesor, per.nombre, per.apellido1, per.apellido2 FROM profesor p LEFT JOIN asignatura a USING (id_profesor) JOIN persona per ON p.id_profesor= per.id WHERE a.nombre IS NULL AND p.id_departamento IS NOT NULL; --AÑADIDO