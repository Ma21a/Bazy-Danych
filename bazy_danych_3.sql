--DROP TABLE rozliczenia.pracownicy;
--DROP TABLE rozliczenia.pensje;
--DROP TABLE rozliczenia.premie;
--DROP TABLE rozliczenia.godziny;

CREATE TABLE rozliczenia.pracownicy(
id_pracownika INTEGER PRIMARY KEY,
imie VARCHAR(50) NOT NULL,
nazwisko VARCHAR(50) NOT NULL,
adres VARCHAR(100)NOT NULL,
telefon	VARCHAR(20) NOT NULL
);

CREATE TABLE rozliczenia.godziny(
id_godziny INTEGER PRIMARY KEY,
data DATE NOT NULL, 
liczba_godzin INTEGER NOT NULL,
id_pracownika INTEGER NOT NULL
);

CREATE TABLE rozliczenia.pensje(
id_pensji INTEGER PRIMARY KEY,
stanowisko TEXT NOT NULL,
kwota MONEY NOT NULL,
id_premii INTEGER NOT NULL
);

CREATE TABLE rozliczenia.premie(
id_premii INTEGER PRIMARY KEY,
rodzaj TEXT NOT NULL, 
kwota MONEY NOT NULL
);

ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES rozliczenia.pracownicy(id_pracownika)
ON DELETE SET NULL;

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii)
REFERENCES rozliczenia.premie(id_premii)
ON DELETE SET NULL;

INSERT INTO rozliczenia.pracownicy(id_pracownika, imie, nazwisko, adres, telefon) VALUES 
(1, 'Jan', 'Kowalski', 'ul. Kwiatowa 1, Warszawa', '555-123-456'),
(2, 'Anna', 'Nowak', 'ul. Leśna 5, Kraków', '555-789-012'),
(3, 'Marek', 'Nowicki', 'ul. Słoneczna 7, Wrocław', '555-234-567'),
(4, 'Ewa', 'Wójcik', 'ul. Polna 3, Gdańsk', '555-890-123'),
(5, 'Piotr', 'Lis', 'ul. Ogrodowa 2, Łódź', '555-345-678'),
(6, 'Magda', 'Kwiatkowska', 'ul. Miodowa 4, Poznań', '555-901-234'),
(7, 'Kamil', 'Jankowski', 'ul. Słowackiego 6, Lublin', '555-456-789'),
(8, 'Katarzyna', 'Zając', 'ul. Mickiewicza 8, Katowice', '555-012-345'),
(9, 'Grzegorz', 'Wilk', 'ul. Wesoła 10, Szczecin', '555-567-890'),
(10, 'Agnieszka', 'Kaczmarek', 'ul. Jagodowa 12, Gdynia', '555-123-456');

INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin , id_pracownika) VALUES
(1, '2023-11-01', 8, 1),
(2, '2023-11-02', 7, 2),
(3, '2023-11-03', 5, 3),
(4, '2023-11-04', 9, 4),
(5, '2023-11-05', 8, 5),
(6, '2023-11-06', 7, 6),
(7, '2023-11-07', 7, 7),
(8, '2023-11-08', 8, 8),
(9, '2023-11-09', 6, 9),
(10, '2023-11-10', 8, 10);


INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii) VALUES
(1, 'Kierownik', 8000, 1),
(2, 'Programista', 6000, 2),
(3, 'Specjalista ds. Marketingu', 5500, 3),
(4, 'Księgowy', 5000, 4),
(5, 'Administrator Sieci', 5500, 5),
(6, 'Handlowiec', 4500, 6),
(7, 'Asystentka Biura', 4000, 7),
(8, 'Pracownik Produkcji', 3800, 8),
(9, 'Specjalista ds. Zakupów', 4600, 9),
(10, 'Kucharz', 4200, 10);

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) VALUES
(1, 'Premia roczna', 1000),
(2, 'Premia kwartalna', 500),
(3, 'Premia wynikowa', 800),
(4, 'Premia świąteczna', 300),
(5, 'Premia specjalna', 1200),
(6, 'Premia za staż', 400),
(7, 'Premia za wyniki zespołu', 750),
(8, 'Premia za wyjątkowe osiągnięcia', 1500),
(9, 'Premia za zdobycie nowego klienta', 250),
(10, 'Premia za osiągnięcia sprzedażowe', 900);

--5
SELECT nazwisko, adres
FROM rozliczenia.pracownicy;
--6
SELECT 
	DATE_PART('dow', data ) AS DayOfWeek,
	DATE_PART('month', data) AS Month
FROM rozliczenia.godziny;
--7
ALTER TABLE rozliczenia.pensje
  RENAME COLUMN kwota TO kwota_brutto;

ALTER TABLE rozliczenia.pensje 
  ADD kwota_netto MONEY;
  
UPDATE rozliczenia.pensje
SET kwota_netto = (kwota_brutto * 0.85);

SELECT *
FROM rozliczenia.pensje
