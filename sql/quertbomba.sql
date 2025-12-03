---calcolo del numero infrazioni per
-- ogni targa, modello e marca

select count(*) as N_infrazioni,
       A.targa,
       modello,
       marca
from auto as A,
     infrazioni as I
where A.targa = I.targa
group by A.targa, modello, marca;


--estraete il massimo numero di infrazioni
--effettuate tra le diverse auto
select max(N_infrazioni)
from (select count(*) as N_infrazioni,
             A.targa,
             modello,
             marca
      from auto as A,
           infrazioni as I
      where A.targa = I.targa
      group by A.targa, modello, marca) as T;


--quali auto hanno ottenuto il massimo
--di numero di infrazioni???
SELECT targa,
       modello,
       marca
FROM (SELECT COUNT(*) AS NumInfrazioni,
             A.targa,
             modello,
             marca
      FROM auto AS A
      INNER JOIN infrazioni AS I
      ON A.targa = I.targa
      GROUP BY A.targa, modello, marca) AS T
WHERE NumInfrazioni = (select max(N_infrazioni)
                       from (select count(*) as N_infrazioni,
                                    A.targa,
                                    modello,
                                    marca
                             from auto as A,
                                  infrazioni as I
                             where A.targa = I.targa
                             group by A.targa, modello, marca) as M);
