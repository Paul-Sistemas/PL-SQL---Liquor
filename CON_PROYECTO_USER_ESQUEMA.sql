SHOW USER
SHOW CON_NAME
-----------------------------------------------
--TABLA REPARTIDOR
CREATE TABLE Repartidor(
id_repartidor INT,
dni CHAR(8) NOT NULL,
nombres VARCHAR2(30) NOT NULL,
apellidos VARCHAR2(30) NOT NULL,
direccion VARCHAR2(30) NOT NULL,
telefono CHAR(9) NOT NULL,
fecha_nacimiento DATE NOT NULL,
genero CHAR(2) NOT NULL,
num_brevete VARCHAR2(10) NOT NULL, 
estado VARCHAR(20) DEFAULT 'disponible' NOT NULL
);

--Prymary Key
ALTER TABLE REPARTIDOR ADD CONSTRAINT PK_REPARTIDOR PRIMARY KEY(ID_REPARTIDOR);

--Restricciones
ALTER TABLE REPARTIDOR ADD CONSTRAINT u_brevete UNIQUE (NUM_BREVETE);
ALTER TABLE REPARTIDOR ADD CONSTRAINT u_dni UNIQUE (DNI);
ALTER TABLE REPARTIDOR ADD CONSTRAINT ck_estadoR CHECK (ESTADO='disponible' OR ESTADO='ocupado');
ALTER TABLE REPARTIDOR ADD CONSTRAINT ck_generoR CHECK (GENERO = 'M' OR GENERO='F');
-----------------------------------------------
--TABLA CLIENTE
CREATE TABLE Cliente(
id_cliente INT,
dni CHAR(8) NOT NULL,
nombres VARCHAR2(30) NOT NULL,
apellidos VARCHAR2(30) NOT NULL,
telefono CHAR(9) NOT NULL,
direccion VARCHAR2(50) NOT NULL
);

--PRYMARY KEY
ALTER TABLE CLIENTE ADD CONSTRAINT pk_cliente PRIMARY KEY(ID_CLIENTE);

--Restricciones
ALTER TABLE CLIENTE ADD CONSTRAINT u_telefono UNIQUE (TELEFONO);
-----------------------------------------------
--TABLE TIPO PRODUCTO
CREATE TABLE TIPO_PRODUCTO(
ID_TIPOPRODUCTO INT,
DESCRIPCION VARCHAR2(30) NOT NULL
);

--PRYMARY KEY
ALTER TABLE TIPO_PRODUCTO ADD CONSTRAINT pk_tproduc PRIMARY KEY(ID_TIPOPRODUCTO);

--Restricciones
ALTER TABLE TIPO_PRODUCTO ADD CONSTRAINT u_tp_descripcion UNIQUE(DESCRIPCION);
-----------------------------------------------
--TABLA PRODUCTO
CREATE TABLE PRODUCTO(
id_producto INT,
id_tipoproducto INTEGER NOT NULL,
nombre VARCHAR2(30) NOT NULL,
precio number(5,2) NOT NULL
);

--PRYMARY KEY
ALTER TABLE PRODUCTO ADD CONSTRAINT pk_producto PRIMARY KEY(ID_PRODUCTO);

--FOREING KEY
ALTER TABLE PRODUCTO ADD CONSTRAINT fk_producto FOREIGN KEY(ID_TIPOPRODUCTO) REFERENCES TIPO_PRODUCTO;

--Restricciones
ALTER TABLE PRODUCTO ADD CONSTRAINT ck_precio CHECK (PRECIO > 0);
ALTER TABLE PRODUCTO ADD CONSTRAINT u_nombreP UNIQUE (NOMBRE);
-----------------------------------------------
--TABLA PEDIDO
CREATE TABLE Pedido(
id_pedido INT,
id_repartidor INT,
id_cliente INT NOT NULL,
estado VARCHAR2(20) DEFAULT 'pendiente' NOT NULL,
fecha_pedido DATE DEFAULT SYSDATE NOT NULL,
fecha_entrega DATE
);


--PRYMARY KEY
ALTER TABLE PEDIDO ADD CONSTRAINT pk_pedido PRIMARY KEY(ID_PEDIDO);

--FOREING KEY
ALTER TABLE PEDIDO ADD CONSTRAINT fk_cl_p FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE;
ALTER TABLE PEDIDO ADD CONSTRAINT fk_rp_p FOREIGN KEY(ID_REPARTIDOR) REFERENCES REPARTIDOR;

--RESTRICCI�N
ALTER TABLE PEDIDO ADD CONSTRAINT ck_estado CHECK (ESTADO='pendiente' OR ESTADO='enviado' OR ESTADO='entregado');
-----------------------------------------------
--TABLA DETALLE_PEDIDO
CREATE TABLE Detalle_pedido(
id_pedido INT,
id_producto INT NOT NULL,
cantidad INT NOT NULL,
precio_unidad NUMBER(5,2) NOT NULL,
CONSTRAINT PK_PP PRIMARY KEY (id_pedido, id_producto)
);

--PRYMARY KEY
ALTER TABLE DETALLE_PEDIDO ADD CONSTRAINT fk_pp1 FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO;
ALTER TABLE DETALLE_PEDIDO ADD CONSTRAINT fk_pp2 FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO;

--RESTRICCIONES
ALTER TABLE DETALLE_PEDIDO ADD CONSTRAINT ck_precioU_pd CHECK (PRECIO_UNIDAD > 0);
ALTER TABLE DETALLE_PEDIDO ADD CONSTRAINT ck_cantidad_pd CHECK (cantidad > 0);

---------------------------------------------------
--DATOS REPARTIDORES
INSERT INTO REPARTIDOR VALUES(1,'60580441','Miguel Angel','Gonzales Marquez','av.los jirasoles','984123655','10/09/1998','M','T156632548',DEFAULT);
INSERT INTO REPARTIDOR VALUES(2,'17576226','Javier Vergara','James Velazquez','Ram�n Castilla 685 CC Aurora','948216895','06/01/1990','M','T156678963',DEFAULT);
INSERT INTO REPARTIDOR VALUES(3,'64018550','Baltasar Soria','Patrick Barrett','av.angamos este 1560','978456811','05/05/1995','F','T666632548',DEFAULT);
INSERT INTO REPARTIDOR VALUES(4,'41036589','Candido Leon','Rodriguez Preston','av.lima 1556','956515556','05/08/1992','M','T154938548',DEFAULT);
INSERT INTO REPARTIDOR VALUES(5,'11845438','Anthony Ivan','Palacios Martel','av.maria parado bellido','940205924','15/08/1999','M','T555532548',DEFAULT);
INSERT INTO REPARTIDOR VALUES(6,'12883026','David Blazquez','Padilla Lopez','jr.ramon castillo','981237894','11/02/1995','M','T156632888',DEFAULT);
INSERT INTO REPARTIDOR VALUES(7,'87264713','Mayte Alessandra','Moran Salas','jr.gamara 1861','951356478','09/09/1995','F','T156444548',DEFAULT);
INSERT INTO REPARTIDOR VALUES(8,'46192396','Diego Chico','Moreno Brandt','av.miraflores norte cc','912567459','21/09/1989','M','T152232548',DEFAULT);
INSERT INTO REPARTIDOR VALUES(9,'74079725','Pedro Jose','Zavala Moran','jr.pilora 485','988156334','26/05/1999','M','T156631234',DEFAULT);
INSERT INTO REPARTIDOR VALUES(10,'89821736','Antonio Manuel','Herrera Juarez','av.venezuela','917712368','10/12/1997','M','T156541248',DEFAULT);
COMMIT;
SELECT *FROM REPARTIDOR;

--Datos Clientes
INSERT INTO CLIENTE VALUES(1,'08612345','Nayara Gallardo','Kelley Marquez','932104412','Av.Peru con Universitaria');
INSERT INTO CLIENTE VALUES(2,'00681684','Pascual Bola�os','James Sampson','898262265','Ovalo Jose Granda');
INSERT INTO CLIENTE VALUES(3,'20125515','Rayan Torralba','Becker Barrett','332285507', 'Av.Abancay, Cercado de Lima');
INSERT INTO CLIENTE VALUES(4,'02369845','Felipa Camacho','Rodriguez Gutierrez','446565898','Calle Santa Martina 384�EL CERCADO�Lima');
INSERT INTO CLIENTE VALUES(5,'01681684','Virgilio Tejedor','Ewing Villanueva','755854384','Jr.Jorge Ch�vez 1685 Bre�a');
INSERT INTO CLIENTE VALUES(6,'12354681','Amelia Alba','Levine Lopez','353530261','Jr.Cajamarca 371 R�mac');
INSERT INTO CLIENTE VALUES(7,'12368600','Lazaro Latorre','Moran Marquez','658947134','Av.La Paz Lt.30�Huachipa');
INSERT INTO CLIENTE VALUES(8,'12354952','Adam Cid','Vega Brandt','215423968', 'Calle Perusa 1480�Lima');
INSERT INTO CLIENTE VALUES(9,'00238515','Marcelina Gracia','Zavala Pacheco','486297235','Psje.Vicus L 56�La Castellana�Surco');
INSERT INTO CLIENTE VALUES(10,'13519645','Ruben Sales','Ayala Juarez','256217367','G.Varela 1878 � Bre�a');
COMMIT;
SELECT *FROM CLIENTE;

--Datos TIPO PRODUCTO
INSERT INTO TIPO_PRODUCTO VALUES(1,'Alcohol');
INSERT INTO TIPO_PRODUCTO VALUES(2,'Snack');
INSERT INTO TIPO_PRODUCTO VALUES(3,'Refrescos');
COMMIT;

SELECT *FROM TIPO_PRODUCTO;

--Datos PRODUCTO
--Alcohol
INSERT INTO PRODUCTO VALUES(1,1,'Pisco Queirolo Quebranta',32.90);
INSERT INTO PRODUCTO VALUES(2,1,'Whisky Black Label 750 ml',149.90);
INSERT INTO PRODUCTO VALUES(3,1,'Ron Cartavio 750 ml',189.90);
INSERT INTO PRODUCTO VALUES(4,1,'Cerveza Pilsen Six Pack',20.90);
INSERT INTO PRODUCTO VALUES(5,1,'Cerveza Corona Six Pack',35);
INSERT INTO PRODUCTO VALUES(6,1,'Vodka Absolut 750 ml',45.90);
INSERT INTO PRODUCTO VALUES(7,1,'Vino Santiago Queirolo 750 ml',17.90);
INSERT INTO PRODUCTO VALUES(8,1,'Jagermeister 700 ml',69.90);
INSERT INTO PRODUCTO VALUES(9,1,'Cerveza Budweiser Six Pack',12.90);
INSERT INTO PRODUCTO VALUES(10,1,'Tequila Jose Cuervo 375 ml',37.50);

--Snack
INSERT INTO PRODUCTO VALUES(11,2,'Camote Villa Natura x 150 g',5.40);
INSERT INTO PRODUCTO VALUES(12,2,'Chifles V.Natura Salados 150 g',4.90);
INSERT INTO PRODUCTO VALUES(13,2,'Piqueo Snax 280 Gr',12.90);
INSERT INTO PRODUCTO VALUES(14,2,'Snack Doritos Dippas 200 g',10.90);
INSERT INTO PRODUCTO VALUES(15,2,'Papas LAYS Cl�sicas 210 g',8.50);

--Refrescos
INSERT INTO PRODUCTO VALUES(16,3,'Coca Cola 3 Lt',12.50);
INSERT INTO PRODUCTO VALUES(17,3,'Inka Kola 3 Lt',12.50);
INSERT INTO PRODUCTO VALUES(18,3,'B.Evervess Carbonatada 1.5 Lt',6.90);
INSERT INTO PRODUCTO VALUES(19,3,'Agua San Carlos sin Gas 3 Lt',5);
INSERT INTO PRODUCTO VALUES(20,3,'Cifrut Citrus Punch 1.5 Lt',6.50);
INSERT INTO PRODUCTO VALUES(21,3,'Monster Energy 473 ml',7.50);
COMMIT;
SELECT *FROM PRODUCTO;

--Datos Pedido
INSERT INTO PEDIDO VALUES(1,1,1,'entregado',DEFAULT, TO_DATE('22/10/2022 13:12:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(2,2,2,'entregado',DEFAULT, TO_DATE('22/10/2022 14:12:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(3,null,3,DEFAULT,DEFAULT, null);
INSERT INTO PEDIDO VALUES(4,3,4,'entregado',DEFAULT, TO_DATE('22/10/2022 15:12:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(5,3,5,'entregado',DEFAULT, TO_DATE('23/10/2022 13:10:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(6,null,6,DEFAULT,DEFAULT, null);
INSERT INTO PEDIDO VALUES(7,5,7,'entregado',DEFAULT, TO_DATE('24/10/2022 15:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(8,null,8,DEFAULT,DEFAULT, null);
INSERT INTO PEDIDO VALUES(9,5,9,'entregado',DEFAULT, TO_DATE('22/10/2022 17:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(10,5,10,'entregado',DEFAULT, TO_DATE('26/10/2022 12:30:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(11,7,8,'entregado',DEFAULT,TO_DATE('22/10/2022 18:12:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(12,1,4,'entregado',TO_DATE('20/10/2022 15:00:00','DD/MM/YY HH24:MI:SS'),TO_DATE('20/10/2022 18:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(13,9,9,'entregado',TO_DATE('20/10/2022 16:00:00','DD/MM/YY HH24:MI:SS'),TO_DATE('20/10/2022 18:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(14,NULL,1,DEFAULT,DEFAULT,NULL);
INSERT INTO PEDIDO VALUES(15,9,2,'entregado',TO_DATE('21/10/2022 14:00:00','DD/MM/YY HH24:MI:SS'),TO_DATE('22/10/2022 16:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(16,4,8,'entregado',TO_DATE('22/10/2022 16:00:00','DD/MM/YY HH24:MI:SS'),TO_DATE('22/10/2022 17:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(17,NULL,7,DEFAULT,DEFAULT,NULL);
INSERT INTO PEDIDO VALUES(18,5,4,'entregado',TO_DATE('21/10/2022 16:00:00','DD/MM/YY HH24:MI:SS'),TO_DATE('21/10/2022 18:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(19,6,2,'entregado',TO_DATE('23/10/2022 16:00:00','DD/MM/YY HH24:MI:SS'),TO_DATE('23/10/2022 17:00:00','DD/MM/YY HH24:MI:SS'));
INSERT INTO PEDIDO VALUES(20,NULL,1,DEFAULT,DEFAULT,NULL);
COMMIT;


SELECT *FROM PEDIDO;

--DATOS DETALLE_PEDIDO
INSERT INTO DETALLE_PEDIDO VALUES(1,1,2,65.80);
INSERT INTO DETALLE_PEDIDO VALUES(1,11,3,16.20);
INSERT INTO DETALLE_PEDIDO VALUES(2,2,1,149.90);
INSERT INTO DETALLE_PEDIDO VALUES(2,12,2,9.80);
INSERT INTO DETALLE_PEDIDO VALUES(3,3,3,569.70);
INSERT INTO DETALLE_PEDIDO VALUES(3,13,4,51.60);
INSERT INTO DETALLE_PEDIDO VALUES(4,4,4,83.60);
INSERT INTO DETALLE_PEDIDO VALUES(4,14,2,21.80);
INSERT INTO DETALLE_PEDIDO VALUES(5,5,5,175);
INSERT INTO DETALLE_PEDIDO VALUES(5,15,1,8.50);
INSERT INTO DETALLE_PEDIDO VALUES(6,6,1,45.90);
INSERT INTO DETALLE_PEDIDO VALUES(6,16,3,37.50);
INSERT INTO DETALLE_PEDIDO VALUES(7,7,3,53.70);
INSERT INTO DETALLE_PEDIDO VALUES(7,17,2,25);
INSERT INTO DETALLE_PEDIDO VALUES(8,8,3,209.70);
INSERT INTO DETALLE_PEDIDO VALUES(8,18,1,6.90);
INSERT INTO DETALLE_PEDIDO VALUES(9,5,1,35);
INSERT INTO DETALLE_PEDIDO VALUES(9,17,1,12.50);
INSERT INTO DETALLE_PEDIDO VALUES(10,2,1,149.90);
INSERT INTO DETALLE_PEDIDO VALUES(10,14,4,43.60);
INSERT INTO DETALLE_PEDIDO VALUES(11,4,4,83.60);
INSERT INTO DETALLE_PEDIDO VALUES(11,12,5,24.50);
INSERT INTO DETALLE_PEDIDO VALUES(12,8,1,69.90);
INSERT INTO DETALLE_PEDIDO VALUES(12,16,2,25);
INSERT INTO DETALLE_PEDIDO VALUES(13,2,1,149.90);
INSERT INTO DETALLE_PEDIDO VALUES(13,17,1,12.50);
INSERT INTO DETALLE_PEDIDO VALUES(14,8,4,279.60);
INSERT INTO DETALLE_PEDIDO VALUES(14,19,3,15);
INSERT INTO DETALLE_PEDIDO VALUES(15,7,3,53.70);
INSERT INTO DETALLE_PEDIDO VALUES(15,16,3,37.50);
INSERT INTO DETALLE_PEDIDO VALUES(16,2,1,149.90);
INSERT INTO DETALLE_PEDIDO VALUES(16,20,3,19.50);
INSERT INTO DETALLE_PEDIDO VALUES(17,3,2,379.80);
INSERT INTO DETALLE_PEDIDO VALUES(17,18,3,20.70);
INSERT INTO DETALLE_PEDIDO VALUES(18,5,5,175);
INSERT INTO DETALLE_PEDIDO VALUES(18,12,2,9.80);
INSERT INTO DETALLE_PEDIDO VALUES(19,2,1,149.90);
INSERT INTO DETALLE_PEDIDO VALUES(19,19,3,15);
INSERT INTO DETALLE_PEDIDO VALUES(20,10,1,37.50);
INSERT INTO DETALLE_PEDIDO VALUES(20,20,1,6.50);
COMMIT;

SELECT *FROM DETALLE_PEDIDO;

-------------------------------------------------------------
--Funci�n Convertir Soles
CREATE OR REPLACE FUNCTION CONVERT_SOLES(F_MONEY NUMBER)
RETURN VARCHAR2
IS
BEGIN
    RETURN TO_CHAR(F_MONEY,'L999,999.99','nls_currency=S/');
END;

--Funci�n Formato Fecha
CREATE OR REPLACE FUNCTION FORM_FECHA(F_FECHA DATE)
RETURN VARCHAR2
IS
BEGIN
    RETURN TO_CHAR(F_FECHA,'DD/MM/YYYY "a las" HH24:MI');
END;

--Funci�n Nombre Mes
CREATE OR REPLACE FUNCTION NOMBRE_MES(P_NUMERO INT)
RETURN VARCHAR2
IS
BEGIN
    RETURN Rtrim(TO_CHAR(TO_DATE(P_NUMERO, 'MM'), 'MONTH'));
END;

--Funci�n Recibe Bono
CREATE OR REPLACE FUNCTION FU_recibebono(P_ID_REPARTIDOR
REPARTIDOR.ID_REPARTIDOR%TYPE,P_MONTH NUMBER)
RETURN VARCHAR2
IS
    V_RESPUESTA VARCHAR2(50);
    V_CANT_PEDIDO NUMBER:=0;
BEGIN
    SELECT COUNT(ID_REPARTIDOR)
    INTO V_CANT_PEDIDO
    FROM PEDIDO
    WHERE ID_REPARTIDOR=P_ID_REPARTIDOR AND EXTRACT(MONTH FROM
PEDIDO.FECHA_PEDIDO)=P_MONTH;
    IF V_CANT_PEDIDO >1 THEN
    V_RESPUESTA:='OBTTIENE BONO';
    ELSE
    V_RESPUESTA:='NO OBTTIENE BONO';
    END IF;
RETURN
    V_RESPUESTA;
END;

--FUNCION PRODUCTO VENTAS
CREATE OR REPLACE FUNCTION FU_PRODUCTO_VENTAS(P_ID INT, P_MONTH NUMBER, P_YEAR NUMBER) RETURN NUMBER
    IS
        V_CANT NUMBER:=0;
    BEGIN
        SELECT SUM(PP.CANTIDAD)
        INTO V_CANT
        FROM PEDIDO p
        INNER JOIN DETALLE_PEDIDO PP ON P.ID_PEDIDO=PP.ID_PEDIDO
        WHERE PP.ID_PRODUCTO=P_ID AND EXTRACT(MONTH FROM FECHA_ENTREGA)=P_MONTH AND EXTRACT(YEAR FROM FECHA_ENTREGA)=P_YEAR;

    RETURN
        V_CANT;
END;
-------------------------------------------------------------------------------
--VISTA RECIBE BONO
CREATE OR REPLACE VIEW VW_APROVACION_BONO
AS
SELECT REPARTIDOR.nombres || REPARTIDOR.apellidos AS NOMBRE_APELLIDO ,
FU_recibebono(ID_REPARTIDOR,EXTRACT(MONTH FROM SYSDATE)) AS RECIBE_BONO
FROM REPARTIDOR;
--PRUEBA
SELECT *FROM VW_APROVACION_BONO;

--Vista reporte de productos
CREATE OR REPLACE VIEW VW_PRODUCTOS_CATALOGO
AS
SELECT P.ID_PRODUCTO, TP.DESCRIPCION, P.NOMBRE, CONVERT_SOLES(P.PRECIO) AS
PRECIO
FROM PRODUCTO P
INNER JOIN TIPO_PRODUCTO TP ON P.ID_TIPOPRODUCTO=TP.ID_TIPOPRODUCTO
ORDER BY P.ID_PRODUCTO ASC;
--PRUEBA
SELECT *FROM VW_PRODUCTOS_CATALOGO;

-----------------------------
SET SERVEROUTPUT ON;
--Imprimir un determinado pedido
CREATE OR REPLACE PROCEDURE SP_IMPRIME_PEDIDO(V_ID_PEDIDO PEDIDO.ID_PEDIDO%TYPE)
IS
    CURSOR C_PEDIDO IS(
    SELECT PR.NOMBRE,TP.DESCRIPCION, PP.CANTIDAD, PP.PRECIO_UNIDAD
    FROM DETALLE_PEDIDO PP
    INNER JOIN PRODUCTO PR ON PP.ID_PRODUCTO=PR.ID_PRODUCTO
    INNER JOIN tipo_producto TP ON pr.id_tipoproducto= tp.id_tipoproducto
    INNER JOIN PEDIDO P ON PP.ID_PEDIDO=P.ID_PEDIDO
    WHERE P.ID_PEDIDO = V_ID_PEDIDO);
    V_NRO_PEDIDO PEDIDO.ID_PEDIDO%TYPE;
    V_NAME_CLIENTE VARCHAR(50);
    V_ID_REPARTIDOR repartidor.id_repartidor%TYPE:=0;
    V_NAME_REPARTIDOR VARCHAR(50);
    V_FECHA_PEDIDO VARCHAR2(40);
    V_ESTADO PEDIDO.ESTADO%TYPE;
    V_FECHA_ENTREGA VARCHAR2(40);
    V_SUBTOTAL NUMBER:=0;
    V_TOTALP NUMBER:=0;
BEGIN
    SELECT P.ID_PEDIDO,P.ESTADO, C.NOMBRES||' '||C.APELLIDOS,NVL(p.id_repartidor,0)
    ,FORM_FECHA(P.FECHA_PEDIDO),FORM_FECHA(P.FECHA_ENTREGA)
    INTO V_NRO_PEDIDO,V_ESTADO, V_NAME_CLIENTE, V_ID_REPARTIDOR,
    V_FECHA_PEDIDO,V_FECHA_ENTREGA
    FROM PEDIDO P
    INNER JOIN CLIENTE C ON P.ID_CLIENTE=C.ID_CLIENTE
    WHERE ID_PEDIDO = V_ID_PEDIDO;

    IF(V_ID_REPARTIDOR=0) THEN
    V_NAME_REPARTIDOR:=NULL;
    ELSE
    SELECT NOMBRES ||' ' || APELLIDOS
    INTO V_NAME_REPARTIDOR
    FROM REPARTIDOR
    WHERE id_repartidor= V_ID_REPARTIDOR;
    END IF;
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE(LPAD('"La casa del Liquor"',45,' '));
    DBMS_OUTPUT.PUT_LINE(LPAD('Av Jose Carlos Mariategui Mz E Lote 7',55,' '));

    DBMS_OUTPUT.PUT_LINE('=========================================================================');
    DBMS_OUTPUT.PUT_LINE(LPAD('NRO PEDIDO: ' ||V_ID_PEDIDO,71,' '));
    DBMS_OUTPUT.PUT_LINE('NOMBRE DE CLIENTE: '||V_NAME_CLIENTE);
    DBMS_OUTPUT.PUT_LINE(RPAD('FECHA PEDIDO: ' || V_FECHA_PEDIDO,56) || 'ESTADO: '||v_estado);
    DBMS_OUTPUT.PUT_LINE(RPAD('REPARTIDOR: ' || nvl(V_NAME_REPARTIDOR,'NO ASIGNADO'),45));
    DBMS_OUTPUT.PUT_LINE(RPAD('FECHA ENTREGA: ' || nvl(V_FECHA_ENTREGA,'NO ENTREGADO'),45));
    DBMS_OUTPUT.PUT_LINE('=========================================================================');
    DBMS_OUTPUT.PUT_LINE(LPAD('-------------------',40,' '));
    DBMS_OUTPUT.PUT_LINE(LPAD('DETALLES DEL PEDIDO',40,' '));
    DBMS_OUTPUT.PUT_LINE(LPAD('-------------------',40,' '));

    DBMS_OUTPUT.PUT_LINE(' '||'PRODUCTO                       CANTIDAD   TIPO     c/u     SUBTOTAL_P');
    DBMS_OUTPUT.PUT_LINE(' '||'------------------------       -------- -------- ------- --------------');
    FOR AUX_P IN C_PEDIDO LOOP
    V_SUBTOTAL:=AUX_P.CANTIDAD*AUX_P.PRECIO_UNIDAD;
    DBMS_OUTPUT.PUT_LINE(' '||RPAD(AUX_P.NOMBRE,35,' ') ||
    RPAD(AUX_P.CANTIDAD,6,' ')||RPAD(AUX_P.DESCRIPCION,10,' ')||
    LPAD(CONVERT_SOLES(AUX_P.PRECIO_UNIDAD),5,' ')||LPAD(CONVERT_SOLES(V_SUBTOTAL),13,' '));
    V_TOTALP:= V_TOTALP + V_SUBTOTAL;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('=========================================================================');
    DBMS_OUTPUT.PUT_LINE(LPAD('MONTO TOTAL: '||CONVERT_SOLES(V_TOTALP),73,' '));
    DBMS_OUTPUT.PUT_LINE('LIMA, '||FORM_FECHA(SYSDATE));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('PEDIDO NO ENCONTRADO');
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('OCURRIO UN ERROR '||SQLERRM);
END;
--PRUEBA
EXECUTE SP_IMPRIME_PEDIDO(18);

--Procedimiento de reporte de venta de un mes
CREATE OR REPLACE PROCEDURE PR_REPORTE_VENTA(P_MONTH NUMBER, P_YEAR NUMBER)
IS
    CURSOR C_VENTAS IS SELECT R.NOMBRES ||' '|| R.APELLIDOS AS NOMBRE_COMPLETO ,
    P.ID_PEDIDO, C.NOMBRES ||' '|| C.APELLIDOS AS NOMBRE_CLIENTE,
    SUM(PP.CANTIDAD*PP.PRECIO_UNIDAD) AS MONTO_TOTAL
    FROM REPARTIDOR R
    INNER JOIN PEDIDO P ON R.ID_REPARTIDOR=P.ID_REPARTIDOR
    INNER JOIN CLIENTE C ON P.ID_CLIENTE=C.ID_CLIENTE
    INNER JOIN DETALLE_PEDIDO PP ON P.ID_PEDIDO=PP.ID_PEDIDO
    WHERE EXTRACT(MONTH FROM P.FECHA_ENTREGA)=P_MONTH AND EXTRACT(YEAR FROM
    P.FECHA_ENTREGA)=P_YEAR
    GROUP BY R.NOMBRES||' '|| R.APELLIDOS, P.ID_PEDIDO, C.NOMBRES ||' '||
    C.APELLIDOS;
    V_SUMA NUMBER:=0;
BEGIN
    dbms_output.put_line('===================================REPORTE DE VENTAS===================================');
    dbms_output.put_line(LPAD('MES: '||NOMBRE_MES(P_MONTH),30,' ')||LPAD('A�O: '||P_YEAR,30,' '));
    dbms_output.put_line('=======================================================================================');
    dbms_output.put_line(RPAD('NOMBRE DE REAPRTIDOR',31,' ')||RPAD('NRO PEDIDO',15,' ')||RPAD('NOMBRE CLIENTE',35,' ')||'MONTO');
    dbms_output.put_line(RPAD('--------------------',31,' ')||RPAD('----------',15,' ')||RPAD('-----------------',35,' ')||'-----');
    FOR AUX IN C_VENTAS LOOP
    V_SUMA:=V_SUMA+AUX.MONTO_TOTAL;
    DBMS_OUTPUT.PUT_LINE(RPAD(AUX.NOMBRE_COMPLETO,35,' ') ||
    RPAD(AUX.ID_PEDIDO,11,' ') || RPAD(AUX.NOMBRE_CLIENTE,35,' ') ||
    CONVERT_SOLES(AUX.MONTO_TOTAL));
    END LOOP;

    dbms_output.put_line('=======================================================================================');
    dbms_output.put_line('MONTO GENERAL: '|| CONVERT_SOLES(V_SUMA));
    dbms_output.put_line('FECHA DE EJECUCI�N: '|| to_char(sysdate,'dd "de" Month"del" YYYY'));
exception
    when no_data_found then
    dbms_output.put_line('REGISTROS NO ENCONTRADOS');
END;
--PRUEBA
EXECUTE PR_REPORTE_VENTA(10,2022);

--PAQUETES
--Reporte de Productos
CREATE OR REPLACE PACKAGE PKG_REPORTE_PRODUCTOS
AS
    PROCEDURE SP_VENTAS_ALCOHOL(V_MONTH NUMBER, V_YEAR NUMBER);
    PROCEDURE SP_VENTAS_SNACK(V_MONTH NUMBER, V_YEAR NUMBER);
    PROCEDURE SP_VENTAS_REFRESCOS(V_MONTH NUMBER, V_YEAR NUMBER);
    PROCEDURE SP_PRODUCTOS_MAS_VENDIDOS(V_MONTH NUMBER, V_YEAR NUMBER);
    
END PKG_REPORTE_PRODUCTOS;

CREATE OR REPLACE PACKAGE BODY PKG_REPORTE_PRODUCTOS
AS
    FUNCTION FU_PRODUCTO_VENTA_MES(P_ID INT, P_MONTH NUMBER, P_YEAR NUMBER) RETURN 
NUMBER
IS
    V_CANT NUMBER:=0;
BEGIN
    SELECT SUM(PP.CANTIDAD)
    INTO V_CANT
    FROM PEDIDO P
    INNER JOIN DETALLE_PEDIDO PP ON P.ID_PEDIDO=PP.ID_PEDIDO
    WHERE PP.ID_PRODUCTO=P_ID AND EXTRACT(MONTH FROM FECHA_ENTREGA)=P_MONTH AND
    EXTRACT(YEAR FROM FECHA_ENTREGA)=P_YEAR;
RETURN
    V_CANT;
END;

--PROCEDIMIENTO VENTAS ALCOHOL
PROCEDURE SP_VENTAS_ALCOHOL(V_MONTH NUMBER, V_YEAR NUMBER)
IS
    CURSOR C_ALCOHOLS IS(
        SELECT ID_PRODUCTO, NOMBRE
        FROM PRODUCTO
        WHERE ID_TIPOPRODUCTO=1
    );
BEGIN
    DBMS_OUTPUT.PUT_LINE('REPORTE DE VENTAS(ALCOHOL) DEL MES '||NOMBRE_MES(V_MONTH)||' A�O '||V_YEAR);
    DBMS_OUTPUT.PUT_LINE('==============================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('ID',5,' ')||RPAD('NOMBRE PRODUCTO',28,' ')||'CANTIDAD');
    FOR PL IN C_ALCOHOLS LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(PL.ID_PRODUCTO,5,' ')||RPAD(PL.NOMBRE,32,' ')||NVL(FU_PRODUCTO_VENTA_MES(PL.ID_PRODUCTO,V_MONTH,V_YEAR),0));
    END LOOP;
END;

--PROCEDIMIENTO VENTAS SNACK
PROCEDURE SP_VENTAS_SNACK(V_MONTH NUMBER, V_YEAR NUMBER)
IS
    CURSOR C_SNACKS IS(
        SELECT ID_PRODUCTO, NOMBRE
        FROM PRODUCTO
        WHERE ID_TIPOPRODUCTO=2
    );
BEGIN
    DBMS_OUTPUT.PUT_LINE('REPORTE DE VENTAS(SNACK) DEL MES '||NOMBRE_MES(V_MONTH)||' A�O '||V_YEAR);
    DBMS_OUTPUT.PUT_LINE('==============================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('ID',5,' ')||RPAD('NOMBRE PRODUCTO',28,' ')||'CANTIDAD');
    FOR PL IN C_SNACKS LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(PL.ID_PRODUCTO,5,' ')||RPAD(PL.NOMBRE,32,' ')||NVL(FU_PRODUCTO_VENTA_MES(PL.ID_PRODUCTO,V_MONTH,V_YEAR),0));
    END LOOP;
END;

--PROCEDIMIENTO VENTAS REFRESCOS
PROCEDURE SP_VENTAS_REFRESCOS(V_MONTH NUMBER, V_YEAR NUMBER)
IS
    CURSOR C_REFRESCOS IS(
        SELECT ID_PRODUCTO, NOMBRE
        FROM PRODUCTO
        WHERE ID_TIPOPRODUCTO=3
    );
BEGIN
    DBMS_OUTPUT.PUT_LINE('REPORTE DE VENTAS(REFRESCOS) DEL MES '||NOMBRE_MES(V_MONTH)||' A�O '||V_YEAR);
    DBMS_OUTPUT.PUT_LINE('==============================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('ID',5,' ')||RPAD('NOMBRE PRODUCTO',28,' ')||'CANTIDAD');
    FOR PL IN C_REFRESCOS LOOP
    DBMS_OUTPUT.PUT_LINE(RPAD(PL.ID_PRODUCTO,5,' ')||RPAD(PL.NOMBRE,32,' ')||NVL(FU_PRODUCTO_VENTA_MES(PL.ID_PRODUCTO,V_MONTH,V_YEAR),0));
    END LOOP;
END;  

--LISTADO DE PRODUCTOS
PROCEDURE SP_PRODUCTOS_MAS_VENDIDOS(V_MONTH NUMBER, V_YEAR NUMBER)
IS
    CURSOR C_ALCOHOL IS
    SELECT ID_PRODUCTO,NOMBRE,PRECIO,NVL(FU_PRODUCTO_VENTAS(ID_PRODUCTO,V_MONTH,V_YEAR),0) AS CANTIDAD
    FROM PRODUCTO;

    CURSOR C_SNACK IS
    SELECT ID_PRODUCTO,NOMBRE,PRECIO,NVL(FU_PRODUCTO_VENTAS(ID_PRODUCTO,V_MONTH,V_YEAR),0) AS CANTIDAD
    FROM PRODUCTO;
    
    CURSOR C_REFRESCO IS
    SELECT ID_PRODUCTO,NOMBRE,PRECIO,NVL(FU_PRODUCTO_VENTAS(ID_PRODUCTO,V_MONTH,V_YEAR),0) AS CANTIDAD
    FROM PRODUCTO;
    
    T_ALCOHOL C_ALCOHOL%ROWTYPE;
    T_SNACK C_SNACK%ROWTYPE;
    T_REFRESCOS C_REFRESCO%ROWTYPE;
    
BEGIN
    SELECT ID_PRODUCTO, NOMBRE, PRECIO,NVL(FU_PRODUCTO_VENTAS(ID_PRODUCTO,V_MONTH,V_YEAR),0) AS CANTIDAD
    INTO T_ALCOHOL
    FROM PRODUCTO
    WHERE ID_TIPOPRODUCTO=1
    ORDER BY CANTIDAD DESC
    FETCH FIRST 1 ROWS ONLY;
    
    SELECT ID_PRODUCTO, NOMBRE, PRECIO,NVL(FU_PRODUCTO_VENTAS(ID_PRODUCTO,V_MONTH,V_YEAR),0) AS CANTIDAD
    INTO T_SNACK
    FROM PRODUCTO
    WHERE ID_TIPOPRODUCTO=2
    ORDER BY CANTIDAD DESC
    FETCH FIRST 1 ROWS ONLY;
    
    SELECT ID_PRODUCTO, NOMBRE, PRECIO,NVL(FU_PRODUCTO_VENTAS(ID_PRODUCTO,V_MONTH,V_YEAR),0) AS CANTIDAD
    INTO T_REFRESCOS
    FROM PRODUCTO
    WHERE ID_TIPOPRODUCTO=3
    ORDER BY CANTIDAD DESC
    FETCH FIRST 1 ROWS ONLY;
    
    DBMS_OUTPUT.PUT_LINE('PRODUCTOS MAS VENDIDOS');
    DBMS_OUTPUT.PUT_LINE('========================');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('CATEGORIA ALCOHOL');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    DBMS_OUTPUT.PUT_LINE('ID PRODUCTO: '||T_ALCOHOL.ID_PRODUCTO);
    DBMS_OUTPUT.PUT_LINE('NOMBRE: '||T_ALCOHOL.NOMBRE);
    DBMS_OUTPUT.PUT_LINE('PRECIO: '||CONVERT_SOLES(T_ALCOHOL.PRECIO));
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('CATEGORIA SNACK');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    DBMS_OUTPUT.PUT_LINE('ID PRODUCTO: '||T_SNACK.ID_PRODUCTO);
    DBMS_OUTPUT.PUT_LINE('NOMBRE: '||T_SNACK.NOMBRE);
    DBMS_OUTPUT.PUT_LINE('PRECIO: '||CONVERT_SOLES(T_SNACK.PRECIO));
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('CATEGORIA REFRESCOS');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    DBMS_OUTPUT.PUT_LINE('ID PRODUCTO: '||T_REFRESCOS.ID_PRODUCTO);
    DBMS_OUTPUT.PUT_LINE('NOMBRE: '||T_REFRESCOS.NOMBRE);
    DBMS_OUTPUT.PUT_LINE('PRECIO: '||CONVERT_SOLES(T_REFRESCOS.PRECIO));
    END;
END PKG_REPORTE_PRODUCTOS;

--ALCOHOL
BEGIN
    PKG_REPORTE_PRODUCTOS.SP_VENTAS_ALCOHOL(10,2022);
END;
--SNACK
BEGIN
    PKG_REPORTE_PRODUCTOS.SP_VENTAS_SNACK(10,2022);
END;
--REFRESCOS
BEGIN
    PKG_REPORTE_PRODUCTOS.SP_VENTAS_REFRESCOS(10,2022);
END;
--MAS VENDIDOS
BEGIN
    PKG_REPORTE_PRODUCTOS.SP_PRODUCTOS_MAS_VENDIDOS(10,2022);
END;

--TRIGGER
--Procedimiento Asignar repartidor a un pedido
CREATE OR REPLACE PROCEDURE SP_ASIGNAR_PEDIDO_REPARTIDOR(P_ID_REPARTIDOR INT,P_ID_PEDIDO INT,P_MENSAJE OUT VARCHAR2)
IS
    V_ESTADO_RE REPARTIDOR.ESTADO%TYPE;
    V_ESTADO_P VARCHAR2(10);
    V_EXC_DISPONIBILIDAD EXCEPTION;
    V_EXC_PE_ESTADO EXCEPTION;
BEGIN
    SELECT ESTADO
    INTO V_ESTADO_RE --OBTENER ESTADO DEL REPARTIDOR
    FROM REPARTIDOR
    WHERE ID_REPARTIDOR = P_ID_REPARTIDOR;

    SELECT ESTADO
    INTO V_ESTADO_P --VERIFICAR SI YA ESTA
    FROM PEDIDO
    WHERE ID_PEDIDO = P_ID_PEDIDO;

    IF V_ESTADO_P = 'enviado' OR V_ESTADO_P = 'entregado' THEN
        RAISE V_EXC_PE_ESTADO;
    ELSIF V_ESTADO_RE='ocupado' then
        RAISE V_EXC_DISPONIBILIDAD;
    ELSE
        UPDATE PEDIDO
        SET ID_REPARTIDOR = P_ID_REPARTIDOR
        WHERE ID_PEDIDO = P_ID_PEDIDO;
        COMMIT;
        P_MENSAJE:='SE ASIGNO EL REPARTIDOR AL PEDIDO ' ||P_ID_PEDIDO ;
    END IF;
EXCEPTION
    WHEN V_EXC_PE_ESTADO THEN
        P_MENSAJE:='PEDIDO YA DESPACHADO';
    WHEN V_EXC_DISPONIBILIDAD THEN
        P_MENSAJE:='REPARTIDOR NO DISPONIBLE';
    WHEN OTHERS THEN
        P_MENSAJE := 'ERROR ENCONTRADO: '||SQLCODE||' Mensaje: '||SQLERRM;
END;
--Procedimiento para confirmar entrega?
CREATE OR REPLACE PROCEDURE SP_CONFIRMAR_ENTREGA(P_ID_PEDIDO INT,P_MENSAJE OUT VARCHAR2)
IS
    V_ESTADO_R REPARTIDOR.ESTADO%TYPE;
    V_ESTADO_P PEDIDO.ESTADO%TYPE;
    V_EXC_NO_CONF EXCEPTION;
BEGIN
    SELECT R.ESTADO, P.ESTADO
    INTO V_ESTADO_R,V_ESTADO_P
    FROM PEDIDO P
    INNER JOIN REPARTIDOR R ON P.ID_REPARTIDOR=r.id_repartidor
    WHERE P.ID_PEDIDO=P_ID_PEDIDO;

    IF (V_ESTADO_R='ocupado' and V_ESTADO_P='enviado' ) then
        UPDATE PEDIDO
        SET FECHA_ENTREGA=SYSDATE
        WHERE ID_PEDIDO=P_ID_PEDIDO;
        COMMIT;
        P_MENSAJE:='CONFIRMADA ENTREGA';
    ELSE
        RAISE V_EXC_NO_CONF;
    END IF;
EXCEPTION
    WHEN V_EXC_NO_CONF THEN
        P_MENSAJE:='IMPOSIBLE CONFIRMACION';
    WHEN OTHERS THEN
        P_MENSAJE := 'ERROR ENCONTRADO: '||SQLCODE||' Mensaje: '||SQLERRM;
END;

--Disparador para cambiar estado del repartidor a ocupado y el estado del pedido a enviado
CREATE OR REPLACE TRIGGER TR_REPARTIDOR_PEDIDO
BEFORE UPDATE OF ID_REPARTIDOR ON PEDIDO
FOR EACH ROW
DECLARE
BEGIN
    :NEW.ESTADO:='enviado';
    UPDATE REPARTIDOR
    SET ESTADO='ocupado'
    where ID_REPARTIDOR =:NEW.ID_REPARTIDOR;
END;
--Disparador para cambiar estado del repartidor a disponible y el estado del pedido a entregado
CREATE OR REPLACE TRIGGER TR_ENTREGA_PEDIDO
BEFORE UPDATE OF FECHA_ENTREGA ON PEDIDO
FOR EACH ROW
BEGIN
    IF :OLD.ID_REPARTIDOR IS NUll THEN
        RAISE_APPLICATION_ERROR(-20000, 'ERROR...EL PEDIDO NO HA SIDO TOMADO POR UN REPARTIDOR');
    ELSE
        :NEW.ESTADO:='entregado';
        UPDATE REPARTIDOR
        SET ESTADO='disponible'
        where ID_REPARTIDOR =:NEW.ID_REPARTIDOR;
    END IF;
END;



--Auditorias
--auditoria sesiones fallidas
SELECT * FROM DBA_OBJ_AUDIT_OPTS;
SELECT * FROM DBA_AUDIT_OBJECT;

audit session BY USERLIQUOR WHENEVER SUCCESSFUL;
audit session BY USERLIQUOR WHENEVER NOT SUCCESSFUL;

AUDIT SESSION BY USERLIQUOR,ESQUEMALIQUOR,ADMINLIQUOR whenever not successful;

SELECT OS_USERNAME,USERNAME, USERHOST, EXTENDED_TIMESTAMP, ACTION_NAME,RETURNCODE FROM DBA_AUDIT_SESSION 
WHERE RETURNCODE <> 0;

--AUDITORIA DE SELECT FALLIDOS POR TODOS LOS USUARIOS
AUDIT SELECT ON ESQUEMALIQUOR.PRODUCTO WHENEVER NOT SUCCESSFUL;
AUDIT SELECT ON ESQUEMALIQUOR.PEDIDO WHENEVER NOT SUCCESSFUL;

SELECT ID_TIPO FROM ESQUEMALIQUOR.producto;

SELECT *FROM DBA_AUDIT_OBJECT;

--crear
CREATE AUDIT POLICY POL_DML_LIQUOR
ACTIONS
    DELETE ON ESQUEMALIQUOR.PEDIDO,
    INSERT ON ESQUEMALIQUOR.PEDIDO,
    UPDATE ON ESQUEMALIQUOR.PEDIDO,
    DELETE ON ESQUEMALIQUOR.CLIENTE,
    INSERT ON ESQUEMALIQUOR.CLIENTE,
    UPDATE ON ESQUEMALIQUOR.CLIENTE,
    DELETE ON ESQUEMALIQUOR.DETALLE_PEDIDO,
    INSERT ON ESQUEMALIQUOR.DETALLE_PEDIDO,
    UPDATE ON ESQUEMALIQUOR.DETALLE_PEDIDO,
    DELETE ON ESQUEMALIQUOR.PRODUCTO,
    INSERT ON ESQUEMALIQUOR.PRODUCTO,
    UPDATE ON ESQUEMALIQUOR.PRODUCTO,
    DELETE ON ESQUEMALIQUOR.REPARTIDOR,
    INSERT ON ESQUEMALIQUOR.REPARTIDOR,
    UPDATE ON ESQUEMALIQUOR.REPARTIDOR,
    DELETE ON ESQUEMALIQUOR.TIPO_PRODUCTO,
    INSERT ON ESQUEMALIQUOR.TIPO_PRODUCTO,
    UPDATE ON ESQUEMALIQUOR.TIPO_PRODUCTO;

AUDIT POLICY POL_DML_LIQUOR BY USERS WITH GRANTED ROLES DBA;

SELECT *FROM AUDIT_UNIFIED_POLICIES
WHERE POLICY_NAME = 'POL_DML_LIQUOR';

AUDIT POLICY POL_DML_LIQUOR WHENEVER SUCCESSFUL;

SELECT * FROM DBA_STMT_AUDIT_OPTS;
select role from dba_roles where role = 'rol_esquema';--BUSCAR ROL
select privilege from dba_sys_privs where grantee = 'ESQUEMALIQUOR';--PRIVILEGIOS DE UN ROL
select role, granted_role from role_role_privs WHERE ROLE='rol_esquema';--ROLES DENTROS DE OTROS

select grantee, granted_role from dba_role_privs where grantee = 'ESQUEMALIQUOR';

SELECT os_username,userhost,DBUSERNAME,client_program_name,event_timestamp, action_name,return_code,
object_schema,object_name,sql_text,unified_audit_policies FROM UNIFIED_AUDIT_TRAIL 
WHERE unified_audit_policies='POL_DML_LIQUOR' order by event_timestamp desc;

--politica
create audit policy POL_DLL_LIQUOR
ACTIONS
   CREATE PACKAGE, ALTER PACKAGE, DROP PACKAGE,
   CREATE PACKAGE BODY, ALTER PACKAGE BODY, DROP PACKAGE BODY,
   CREATE PROCEDURE, DROP PROCEDURE, ALTER PROCEDURE,
   CREATE FUNCTION, DROP FUNCTION, ALTER FUNCTION,
   CREATE TRIGGER, ALTER TRIGGER, DROP TRIGGER,
   CREATE TABLE, ALTER TABLE, DROP TABLE, TRUNCATE TABLE
;

AUDIT POLICY POL_DLL_LIQUOR BY ESQUEMALIQUOR;

SELECT os_username,userhost,DBUSERNAME,client_program_name,event_timestamp,
action_name,return_code,object_schema,object_name,sql_text,unified_audit_policies
FROM UNIFIED_AUDIT_TRAIL WHERE unified_audit_policies='POL_DLL_LIQUOR'
order by event_timestamp desc;



drop table CLIENTE cascade constraints;
drop table DETALLE_PEDIDO cascade constraints;
drop table PEDIDO cascade constraints;
drop table PRODUCTO cascade constraints;
drop table REPARTIDOR cascade constraints;
drop table TIPO_PRODUCTO cascade constraints;

