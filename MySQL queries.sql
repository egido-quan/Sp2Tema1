-- TIENDA

SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.087 FROM producto;
SELECT nombre AS "Nombre producto", precio AS Euros, precio*1.087 as "Dólares norteamericanos" FROM producto;
SELECT UCASE(nombre) AS "Nombre en mayúsculas", precio FROM producto;
SELECT LCASE(nombre) AS "Nombre en minúsculas", precio FROM producto;
SELECT nombre, UCASE(left(nombre, 2)) AS Iniciales FROM fabricante;
SELECT nombre, ROUND(precio, 0) as "Precio redondeado" FROM producto;
SELECT nombre, TRUNCATE(precio, 0) as "Precio truncado" FROM producto;
SELECT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT DISTINCT f.codigo FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT p.nombre FROM producto p JOIN fabricante f WHERE f.codigo = 2;
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
SELECT p.nombre, precio, f.nombre FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante ORDER BY f.nombre;
SELECT p.codigo AS "Código producto", p.nombre AS "Nombre producto", f.codigo AS "Código fabricante", f.nombre AS "Nombre fabricante" FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante;
SELECT p.nombre AS "Nombre producto", precio, f.nombre AS "Nombre fabricante" FROM producto p JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE p.precio = (SELECT MIN(precio) FROM producto);
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

-- UNIVERSIDAD
SELECT apellido1 AS "Primer apellido", apellido2 AS "Segundo apellido", nombre AS Nombre FROM persona WHERE tipo = "alumno" ORDER BY apellido1, apellido2, nombre;
SELECT nombre AS Nombre, apellido1 AS "Primer apellido", apellido2 AS "Segundo apellido" FROM persona WHERE tipo = "alumno" AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = "profesor" AND RIGHT(nif, 1) = "K";
SELECT * from asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1 AS "Primer apellido", p.apellido2 AS "Segundo apellido", p.nombre AS Nombre, d.nombre AS "Departamento" FROM persona p JOIN profesor pr ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento ORDER by apellido1, nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura aa JOIN asignatura a ON aa.id_asignatura = a.id JOIN persona p ON p.id = aa.id_alumno JOIN curso_escolar ce ON aa.id_curso_escolar = ce.id WHERE p.nif = "26902806M";
SELECT d.nombre FROM departamento d JOIN profesor p ON p.id_departamento = d.id WHERE p.id_profesor IN (SELECT asignatura.id_profesor from asignatura JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = "Grado en Ingeniería Informática (Plan 2015)") GROUP BY departamento.nombre;
SELECT * FROM persona p JOIN alumno_se_matricula_asignatura aa ON aa.id_alumno = p.id JOIN curso_escolar ce ON ce.id = aa.id_curso_escolar WHERE ce.anyo_inicio = 2018 GROUP BY p.id;

-- LEFT JOIN, RIGHT JOIN
SELECT d.nombre AS Departamento, p.apellido1, p.apellido2, p.nombre FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id JOIN persona p ON pr.id_profesor = p.id ORDER BY Departamento, p.apellido1, p.apellido2, p.nombre;
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN profesor pr ON pr.id_profesor = p.id WHERE pr.id_departamento is NULL;
SELECT d.nombre AS "Departamentos sin Profe" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_profesor IS NULL;
SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2 FROM profesor pr LEFT JOIN asignatura a USING(id_profesor) JOIN persona p ON pr.id_profesor = p.id WHERE a.nombre IS NULL ORDER BY p.apellido1;
SELECT a.nombre "Asignaturas sin profesor" FROM asignatura a WHERE a.id_profesor IS NULL ORDER BY a.nombre;
SELECT DISTINCT d.nombre FROM profesor pr LEFT JOIN asignatura a USING(id_profesor) JOIN persona p ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento WHERE a.nombre IS NULL ORDER BY d.nombre;

-- CONSULTES RESUM
SELECT COUNT(p.nombre) AS "Total alumnos" FROM  persona p WHERE tipo = "alumno";
SELECT COUNT(p.nombre) AS "Total alumnos" FROM  persona p WHERE tipo = "alumno" AND YEAR(p.fecha_nacimiento) = 1999;
SELECT COUNT(pr.id_profesor) AS "Número de profesores", d.nombre AS Departamento FROM profesor pr JOIN departamento d ON d.id = pr.id_departamento group BY d.nombre ORDER by 1 DESC;
SELECT d.nombre AS Departamento, COUNT(pr.id_profesor) AS "Número de profesores" FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento GROUP BY d.nombre ORDER BY 2 DESC;
SELECT g.nombre AS Grado, COUNT(a.nombre) AS Asignturaas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY 2 DESC; 
SELECT g.nombre AS "Grados con más de 40 asignaturas", COUNT(a.nombre) AS Asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado  GROUP BY g.nombre HAVING COUNT(a.nombre) > 40;

