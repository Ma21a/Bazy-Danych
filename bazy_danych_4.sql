CREATE SCHEMA ksiegowosc;
DROP TABLE ksiegowosc.pracownicy
DROP TABLE ksiegowosc.godziny
DROP TABLE ksiegowosc.pensje
DROP TABLE ksiegowosc.premie
DROP TABLE ksiegowosc.wynagrodzenie
--------------------------------------------------
CREATE TABLE ksiegowosc.pracownicy(
id_pracownika INTEGER PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100)NOT NULL,
telefon	VARCHAR(20) NOT NULL
);
CREATE TABLE ksiegowosc.godziny(
id_godziny INTEGER PRIMARY KEY,
data DATE NOT NULL, 
liczba_godzin INTEGER NOT NULL,
id_pracownika INTEGER NOT NULL
);
CREATE TABLE ksiegowosc.pensje(
id_pensji INTEGER PRIMARY KEY,
stanowisko TEXT NOT NULL,
kwota MONEY NOT NULL
);
CREATE TABLE ksiegowosc.premie(
id_premii INTEGER PRIMARY KEY,
rodzaj TEXT NOT NULL, 
kwota MONEY
);
CREATE TABLE ksiegowosc.wynagrodzenie(
id_wynagrodzenia INTEGER PRIMARY KEY,
data DATE NOT NULL,
id_pracownika INTEGER NOT NULL,
id_godziny INTEGER NOT NULL,
id_pensji INTEGER NOT NULL,
id_premii INTEGER NOT NULL
);
-------------------------------------------------------------------------------------
ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_godziny)
REFERENCES ksiegowosc.godziny(id_godziny);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji)
REFERENCES ksiegowosc.pensje(id_pensji);

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii)
REFERENCES ksiegowosc.premie(id_premii);
	
ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES ksiegowosc.pracownicy(id_pracownika);	
--------------------------------------------------------------------------------------

INSERT INTO ksiegowosc.pracownicy (id_pracownika, imie, nazwisko, adres, telefon)
VALUES
(1, 'Jan', 'Kowalski', 'ul. Prosta 1, Warszawa', '123-456-789'),
(2, 'Anna', 'Nowak', 'ul. Kwiatowa 2, Kraków', '987-654-321'),
(3, 'Marek', 'Zieliński', 'ul. Słoneczna 3, Gdańsk', '111-222-333'),
(4, 'Alicja', 'Dąbrowska', 'ul. Wesoła 4, Poznań', '444-555-666'),
(5, 'Piotr', 'Wojciechowski', 'ul. Jasna 5, Łódź', '777-888-999'),
(6, 'Ewa', 'Kaczmarek', 'ul. Górna 6, Wrocław', '333-222-111'),
(7, 'Marcin', 'Lis', 'ul. Cicha 7, Katowice', '111-333-555'),
(8, 'Magdalena', 'Adamczyk', 'ul. Zielona 8, Lublin', '999-888-777'),
(9, 'Krzysztof', 'Szymański', 'ul. Nowa 9, Szczecin', '555-666-444'),
(10, 'Joanna', 'Kowalczyk', 'ul. Boczna 10, Gdynia', '222-111-333');

INSERT INTO ksiegowosc.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
(1, '2023-11-01', 8, 1),
(2, '2023-11-02', 7, 2),
(3, '2023-11-03', 8, 3),
(4, '2023-11-04', 6, 4),
(5, '2023-11-05', 7, 5),
(6, '2023-11-06', 8, 6),
(7, '2023-11-07', 7, 7),
(8, '2023-11-08', 8, 8),
(9, '2023-11-09', 6, 9),
(10, '2023-11-10', 7, 10);

INSERT INTO ksiegowosc.pensje (id_pensji, stanowisko, kwota)
VALUES
(1, 'Księgowy', 5000),
(2, 'Pracownik Finansowy', 3900),
(3, 'Pracownik Finansowy', 4200),
(4, 'Kierownik Finansów', 7000),
(5, 'Analityk Finansowy', 4500),
(6, 'Specjalista ds. Podatków', 4800),
(7, 'Księgowy', 5000),
(8, 'Dyrektor Finansowy', 8000),
(9, 'Pracownik Finansowy', 4700),
(10, 'Specjalista ds. Rachunkowości', 4200);

INSERT INTO ksiegowosc.premie (id_premii, rodzaj, kwota)
VALUES
(1, 'Premia za wyniki', 1000),
(2, 'Premia świąteczna', 500),
(3, 'Premia roczna', 1500),
(4, 'Premia za staż', NULL),
(5, 'Premia za nadgodziny', 800),
(6, 'Premia uznaniowa', NULL),
(7, 'Premia za osiągnięcie celów', 1200),
(8, 'Premia motywacyjna', NULL),
(9, 'Premia za specjalne projekty', 750),
(10, 'Premia za osiągnięcie budżetu', NULL);

INSERT INTO ksiegowosc.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
(1, '2023-11-01', 1, 1, 1, 1),
(2, '2023-11-02', 2, 2, 2, 2),
(3, '2023-11-03', 3, 3, 3, 3),
(4, '2023-11-04', 4, 4, 4, 4),
(5, '2023-11-05', 5, 5, 5, 5),
(6, '2023-11-06', 6, 6, 6, 6),
(7, '2023-11-07', 7, 7, 7, 7),
(8, '2023-11-08', 8, 8, 8, 8),
(9, '2023-11-09', 9, 9, 9, 9),
(10, '2023-11-10', 10, 10, 10, 10);
------------------------------------------------------------------------------------------------------
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Informacje o pracownikach';
COMMENT ON TABLE ksiegowosc.godziny IS 'Informacje o czasie pracy';
COMMENT ON TABLE ksiegowosc.pensje IS 'Informacje o pensji';
COMMENT ON TABLE ksiegowosc.premie IS 'Informacje o premiach';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Informacje dotyczące wynagrodzeń';

--6a
SELECT nazwisko
,id_pracownika
FROM ksiegowosc.pracownicy;

--6b
SELECT kw.id_pracownika
,kpen.kwota
,kprem.kwota
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowosc.premie kprem
	ON kprem.id_premii = kw.id_premii
WHERE  COALESCE(kprem.kwota,CAST(0 as money)) + COALESCE(kpen.kwota,CAST(0 as money)) > CAST(5000 as money);

--WHERE  kprem.kwota + kpen.kwota > CAST(5000 as money)
--OR kpen.kwota > CAST(5000 as money);

--6c
SELECT kw.id_pracownika
,kpen.kwota
,kprem.kwota
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowosc.premie kprem
	ON kprem.id_premii = kw.id_premii
WHERE kpen.kwota > CAST(4000 as MONEY)
AND kprem.kwota IS NULL;

--6d
SELECT * 
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';
--6e
SELECT * 
FROM ksiegowosc.pracownicy
WHERE nazwisko LIKE '%m%'
AND imie LIKE '%a';

--6f
SELECT kp.imie
,kp.nazwisko
,kp.id_pracownika
,SUM (kg.liczba_godzin) - 6 as nadgodziny
,DATE_PART('month', kg.data) 
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.godziny kg 
	ON kp.id_pracownika = kg.id_pracownika
GROUP BY kp.id_pracownika, DATE_PART('month', kg.data)
ORDER BY DATE_PART('month', kg.data) ASC;

--6g
SELECT kp.id_pracownika
,imie
,nazwisko
,adres
,telefon
,kwota 
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
WHERE kpen.kwota >= CAST(4500 as MONEY)
AND kpen.kwota <= CAST(6000 as MONEY);

--6h
SELECT kp.id_pracownika
,SUM (kg.liczba_godzin) - 6 as nadgodziny
,DATE_PART('month', kg.data)
,kprem.kwota
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.godziny kg 
	ON kp.id_pracownika = kg.id_pracownika
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.premie kprem
	ON kprem.id_premii = kw.id_premii
WHERE kg.liczba_godzin >6
AND kprem.kwota IS NULL
GROUP BY kp.id_pracownika, DATE_PART('month', kg.data), kprem.kwota;

--6i
SELECT kp.id_pracownika
,imie
,nazwisko
,adres
,telefon
,kwota 
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
ORDER BY kpen.kwota ASC;

--6j Uszereguj pracowników według pensji i premii malejąco
SELECT kp.id_pracownika
,imie
,nazwisko
,kpen.kwota
,kprem.kwota
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowosc.premie kprem
	ON kprem.id_premii = kw.id_premii
ORDER BY 
kpen.kwota DESC,
kprem.kwota DESC;

--6k
SELECT stanowisko,
	COUNT (stanowisko)
FROM
	ksiegowosc.pensje
GROUP BY
	stanowisko;

--6l
SELECT 
    stanowisko,
    AVG(CAST(kwota AS decimal(10, 2))) AS srednia_placa,
    MIN(CAST(kwota AS decimal(10, 2))) AS minimalna_placa,
    MAX(CAST(kwota AS decimal(10, 2))) AS maksymalna_placa
FROM ksiegowosc.pensje
WHERE stanowisko = 'Pracownik Finansowy'
GROUP BY stanowisko;

--6m  Policz sumę wszystkich wynagrodzeń
SELECT SUM (kprem.kwota) AS suma_premii
,SUM (kpen.kwota) AS suma_pensji
,SUM (COALESCE(kprem.kwota, CAST(0 AS MONEY)) + COALESCE(kpen.kwota, CAST(0 AS MONEY))) AS suma_pensji_premii
FROM ksiegowosc.wynagrodzenie kw 
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowosc.premie kprem
	ON kprem.id_premii = kw.id_premii

--6n  Policz sumę wynagrodzeń w ramach danego stanowiska
SELECT kpen.stanowisko
,SUM (COALESCE(kprem.kwota, CAST(0 AS MONEY)) + COALESCE(kpen.kwota, CAST(0 AS MONEY))) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie kw 
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowosc.premie kprem
	ON kprem.id_premii = kw.id_premii
GROUP BY stanowisko;

--6o Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska
SELECT COUNT (kprem.kwota)
,kpen.stanowisko
FROM ksiegowosc.wynagrodzenie kw 
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
INNER JOIN ksiegowosc.premie kprem
	ON kprem.id_premii = kw.id_premii
GROUP BY kpen.stanowisko;

--6p  Usuń wszystkich pracowników mających pensję mniejszą niż 4000 zł
DELETE FROM ksiegowosc.wynagrodzenie
WHERE id_pracownika IN (
SELECT kp.id_pracownika
FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen 
	ON kpen.id_pensji = kw.id_pensji
WHERE kpen.kwota < CAST(4000 as MONEY)
);
DELETE FROM ksiegowosc.pracownicy kp
WHERE id_pracownika IN (
    SELECT kp.id_pracownika
   FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
    WHERE kpen.kwota < CAST(4000 as MONEY)
);

SELECT * FROM ksiegowosc.pracownicy kp
INNER JOIN ksiegowosc.wynagrodzenie kw 
	ON kp.id_pracownika = kw.id_pracownika
INNER JOIN ksiegowosc.pensje kpen
	ON kpen.id_pensji = kw.id_pensji
