CREATE SCHEMA ksiegowosc;
--DROP TABLE ksiegowosc.pracownicy
--DROP TABLE ksiegowosc.godziny
--DROP TABLE ksiegowosc.pensje
--DROP TABLE ksiegowosc.premie
--DROP TABLE ksiegowosc.wynagrodzenie
--------------------------------------------------
CREATE TABLE ksiegowosc.pracownicy(
id_pracownika INTEGER PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100)NOT NULL,
telefon	VARCHAR(50) NOT NULL
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
------------------------------------------------------------------------------------
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
(1, 'Jan', 'Kowalski', 'ul. Prosta 1, Warszawa', '123456789'),
(2, 'Anna', 'Nowak', 'ul. Kwiatowa 2, Kraków', '987654321'),
(3, 'Marek', 'Zieliński', 'ul. Słoneczna 3, Gdańsk', '111222333'),
(4, 'Alicja', 'Dąbrowska', 'ul. Wesoła 4, Poznań', '444555666'),
(5, 'Piotr', 'Wojciechowski', 'ul. Jasna 5, Łódź', '777888999'),
(6, 'Ewa', 'Kaczmarek', 'ul. Górna 6, Wrocław', '333222111'),
(7, 'Marcin', 'Lis', 'ul. Cicha 7, Katowice', '111333555'),
(8, 'Magdalena', 'Adamczyk', 'ul. Zielona 8, Lublin', '999888777'),
(9, 'Krzysztof', 'Szymański', 'ul. Nowa 9, Szczecin', '555666444'),
(10, 'Joanna', 'Kowalczyk', 'ul. Boczna 10, Gdynia', '222111333');

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
-------------------------------------------------------------------------------------

--a
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48) ', telefon)
WHERE telefon IS NOT NULL;

--b
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48) ', SUBSTRING(telefon, 7, 3), '-', SUBSTRING(telefon, 10, 3), '-', SUBSTRING(telefon, 13))
WHERE telefon LIKE '(+48) %%%%%%%';
SELECT * FROM ksiegowosc.pracownicy;

--c
SELECT upper(nazwisko)
FROM ksiegowosc.pracownicy
WHERE length(nazwisko) = (SELECT MAX(length(nazwisko)) FROM ksiegowosc.pracownicy)

--d 
SELECT 
    p.id_pracownika, 
    p.imie, 
    p.nazwisko, 
    MD5(CONCAT(p.imie, p.nazwisko, pe.kwota)) AS zakodowana_pensja
FROM ksiegowosc.pracownicy p
JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji

SELECT
    p.id_pracownika, 
    p.imie, 
    p.nazwisko, 
    pe.kwota AS pensja, 
    pr.kwota AS premia
FROM ksiegowosc.pracownicy p
LEFT JOIN ksiegowosc.wynagrodzenie w ON p.id_pracownika = w.id_pracownika
LEFT JOIN ksiegowosc.pensje pe ON w.id_pensji = pe.id_pensji
LEFT JOIN ksiegowosc.premie pr ON w.id_premii = pr.id_premii
