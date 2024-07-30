-- Listado de todas las compras del cliente Luis Soto
SELECT v.id AS "Código de venta", v.fecha AS Fecha, c.Nombre, c.Apellido1, g.Tipo_Montura, g.Precio, v.cantidad, g.precio*v.cantidad AS "Precio Total" FROM ventas v JOIN clientes c ON c.id = v.id_cliente JOIN gafas g ON g.id = v.id_gafas WHERE c.nombre = "Luis" and c.Apellido1 = "Soto" ORDER BY Fecha;

-- Lista de las gafas que ha vendido el vendedor Pedro en 2023
SELECT v.Fecha, g.Tipo_Montura, g.Color_Montura, m.Nombre AS Marca, p.Nombre AS Proveedor, g.Precio, v.Cantidad, g.precio*v.Cantidad AS "Total venta"  FROM Gafas g JOIN ventas v ON v.id_gafas = g.id JOIN Vendedores s ON s.id = v.id_vendedor JOIN Marcas m ON g.id_marca = m.id JOIN Proveedores p ON p.id = m.id_proveedor WHERE YEAR(v.Fecha) = "2023" and s.Nombre = "Pedro" ORDER BY v.Fecha;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT p.Nombre FROM Proveedores p LEFT JOIN Marcas m ON m.id_proveedor = p.id LEFT JOIN Gafas g ON g.id_marca = m.id LEFT JOIN ventas v ON v.id_gafas = g.id WHERE V.id IS NOT NULL ORDER BY p.Nombre;