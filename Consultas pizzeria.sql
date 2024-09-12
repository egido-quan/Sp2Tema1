--Llista quants productes de tipus “Begudes” s'han venut en una determinada localitat.
SELECT t.localidad AS LOCALIDAD, t.nombre AS "NOMBRE TIENDA", SUM(c.cantidad) AS "TOTAL BEBIDAS" FROM tiendas t JOIN pedidos pe ON t.id = pe.id_tienda 	JOIN cantidades c ON c.id_pedido = pe.id JOIN productos pr ON pr.id = c.id_producto	WHERE ((pr.nombre = "Lolacola" or pr.nombre = "Limaloca") AND t.localidad = "Burriana") GROUP BY t.localidad;

--Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT e.nombre AS VENDEDOR, COUNT(p.id_vendedor) AS "CANTIDAD DE PEDIDOS" FROM pedidos p JOIN empleados e ON p.id_vendedor = e.id WHERE e.nombre = "Alberto" GROUP BY e.nombre;