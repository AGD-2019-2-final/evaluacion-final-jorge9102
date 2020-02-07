-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD '*.csv' USING PigStorage(',') AS 
(id:INT,
nombre:CHARARRAY,
apellido:CHARARRAY,
fecha:CHARARRAY,
color:CHARARRAY,
valor:INT);

y = foreach lines GENERATE apellido, SIZE(apellido);
u = ORDER y BY $1 DESC,$0 ASC;
z = LIMIT u 5;
STORE z INTO 'output' USING PigStorage(',');