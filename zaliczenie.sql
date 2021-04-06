DROP TABLE IF EXISTS Pojazdy;
DROP TABLE IF EXISTS Pracownicy;
DROP TABLE IF EXISTS Kompetencje_Kierowcy;
DROP TABLE IF EXISTS Zlecenia_Kierowcy;
DROP TABLE IF EXISTS Kompetencje;
DROP TABLE IF EXISTS Naczepy;
DROP TABLE IF EXISTS Kierowcy;
DROP TABLE IF EXISTS Zlecenia;
DROP TABLE IF EXISTS Stale_kursy;
DROP TABLE IF EXISTS Klienci;
DROP TABLE IF EXISTS Garaze;
DROP TABLE IF EXISTS Oddzialy;

-- Tabela: Klienci
CREATE TABLE Klienci (Nr_klienta SERIAL PRIMARY KEY NOT NULL , Imie VARCHAR (50) NOT NULL, Nazwisko VARCHAR (100) NOT NULL, NIP VARCHAR (10));
INSERT INTO Klienci ( Imie, Nazwisko, NIP) VALUES ( 'Wiktoria', 'Kalinowska', '9385244478');
INSERT INTO Klienci ( Imie, Nazwisko, NIP) VALUES ( 'Jakub', 'Urbański', '5644244271');
INSERT INTO Klienci ( Imie, Nazwisko, NIP) VALUES ( 'Alicja', 'Urbańska', '2411332727');
INSERT INTO Klienci ( Imie, Nazwisko, NIP) VALUES ( 'Oskar', 'Czarnecki', '5033698020');
INSERT INTO Klienci ( Imie, Nazwisko, NIP) VALUES ( 'Maja', 'Owczarek', NULL);

-- Tabela: Kompetencje
CREATE TABLE Kompetencje (Nazwa VARCHAR (200) PRIMARY KEY NOT NULL, Opis VARCHAR (200) NOT NULL);
INSERT INTO Kompetencje (Nazwa, Opis) VALUES ('Materiały wybuchowe', 'Materiały i przedmioty, ktore zagrazaja wybucem masowym');
INSERT INTO Kompetencje (Nazwa, Opis) VALUES ('Gazy', 'Gazy palne, niepalne, trujace i nietrujace');
INSERT INTO Kompetencje (Nazwa, Opis) VALUES ('Ciecze zapalne', 'Materiały ciekłe łatwopalne');
INSERT INTO Kompetencje (Nazwa, Opis) VALUES ('Materiały samozapalne', 'Materiały, ktore moga ulec samozapłonowi');
INSERT INTO Kompetencje (Nazwa, Opis) VALUES ('Radioaktywne', 'Stanowia zagrozenie promieniotworcze');

-- Tabela: Stale_kursy
CREATE TABLE Stale_kursy (Nr_trasy SERIAL PRIMARY KEY, Adres_zaladunku VARCHAR (200) NOT NULL, Adres_rozladunku VARCHAR (200) NOT NULL);
INSERT INTO Stale_kursy (Adres_zaladunku, Adres_rozladunku) VALUES ('Poznań', 'Berlin');
INSERT INTO Stale_kursy (Adres_zaladunku, Adres_rozladunku) VALUES ('Berlin', 'Dortmund');
INSERT INTO Stale_kursy (Adres_zaladunku, Adres_rozladunku) VALUES ('Poznań', 'Wrocław');
INSERT INTO Stale_kursy (Adres_zaladunku, Adres_rozladunku) VALUES ('Berlin', 'Wrocław');
INSERT INTO Stale_kursy (Adres_zaladunku, Adres_rozladunku) VALUES ('Berlin', 'Warszawa');

-- Tabela: Naczepy
CREATE TABLE Naczepy (Nr_rejestracyjny_naczepy VARCHAR (7) NOT NULL PRIMARY KEY, Marka VARCHAR (50) NOT NULL);
INSERT INTO Naczepy (Nr_rejestracyjny_naczepy, Marka) VALUES ('LPU60HN', 'Langendorf');
INSERT INTO Naczepy (Nr_rejestracyjny_naczepy, Marka) VALUES ('WG63202', 'Krone');
INSERT INTO Naczepy (Nr_rejestracyjny_naczepy, Marka) VALUES ('ML9065', 'Benalu');
INSERT INTO Naczepy (Nr_rejestracyjny_naczepy, Marka) VALUES ('ERA81TL', 'ACTM');
INSERT INTO Naczepy (Nr_rejestracyjny_naczepy, Marka) VALUES ('ERA75TM', 'Krone');

-- Tabela: Oddzialy
CREATE TABLE Oddzialy (Nr_oddizalu VARCHAR(7) PRIMARY KEY NOT NULL, Miejscowosc VARCHAR (100) NOT NULL, Adres VARCHAR (100) NOT NULL, Kod_pocztowy VARCHAR (6) NOT NULL);
INSERT INTO Oddzialy (Nr_oddizalu, Miejscowosc, Adres, Kod_pocztowy) VALUES ('POZ0001', 'Poznań', 'Wiosny Ludow 21', '61-022');
INSERT INTO Oddzialy (Nr_oddizalu, Miejscowosc, Adres, Kod_pocztowy) VALUES ('BER100', 'Berlin', 'Lange Stasse 4B', '13-409');

-- Tabela: Pracownicy
CREATE TABLE Pracownicy (Pesel VARCHAR (11) PRIMARY KEY NOT NULL, Imie VARCHAR (50) NOT NULL, Nazwisko VARCHAR (50) NOT NULL, Stanowisko VARCHAR (50) NOT NULL, Data_urodzenia DATE NOT NULL, Data_zatrudnienia DATE NOT NULL, Mail VARCHAR (50) NOT NULL, Pensja NUMERIC (10, 2) NOT NULL, Oddzial VARCHAR(7) REFERENCES Oddzialy (Nr_oddizalu));
INSERT INTO Pracownicy (Pesel, Imie, Nazwisko, Stanowisko, Data_urodzenia, Data_zatrudnienia, Mail, Pensja, Oddzial) VALUES ('90100814663', 'Liliana', 'Michalak', 'Dyrektor', '1990-10-08', '2007-09-26', 'Liliana.Michalak@acl.com', 15000, 'POZ0001');
INSERT INTO Pracownicy (Pesel, Imie, Nazwisko, Stanowisko, Data_urodzenia, Data_zatrudnienia, Mail, Pensja, Oddzial) VALUES ('52102316697', 'Kamila', 'Lis', 'Ksiegowa', '1952-10-23', '2013-12-09', 'Kamila.Lis@acl.com', 4000, 'BER100');
INSERT INTO Pracownicy (Pesel, Imie, Nazwisko, Stanowisko, Data_urodzenia, Data_zatrudnienia, Mail, Pensja, Oddzial) VALUES ('68042721541', 'Stanisław', 'Kozłowski', 'Zastepca dyrektora', '1968-04-27', '2014-08-22', 'Stanisław.Kozłowski@acl.com', 10000, 'BER100');
INSERT INTO Pracownicy (Pesel, Imie, Nazwisko, Stanowisko, Data_urodzenia, Data_zatrudnienia, Mail, Pensja, Oddzial) VALUES ('66120982949', 'Hanna', 'Kurek', 'Ksiegowa', '1966-10-09', '2018-03-01', 'Hanna.Kurek@acl.com', 4000, 'POZ0001');
INSERT INTO Pracownicy (Pesel, Imie, Nazwisko, Stanowisko, Data_urodzenia, Data_zatrudnienia, Mail, Pensja, Oddzial) VALUES ('78050489456', 'Maciej', 'Zukowski', 'Logistyk', '1978-05-04', '2017-10-06', 'Maciej.Zukowski@acl.com', 7000, 'POZ0001');

-- Tabela: Garaze
CREATE TABLE Garaze (Nr_garazu NUMERIC (3) PRIMARY KEY NOT NULL, Liczba_miejsc NUMERIC (3) NOT NULL, Oddzial VARCHAR(7) REFERENCES Oddzialy (Nr_oddizalu) NOT NULL);
INSERT INTO Garaze (Nr_garazu, Liczba_miejsc, Oddzial) VALUES (2, 36, 'POZ0001');
INSERT INTO Garaze (Nr_garazu, Liczba_miejsc, Oddzial) VALUES (1, 20, 'POZ0001');

-- Tabela: Pojazdy
CREATE TABLE Pojazdy (Nr_rejestracji_pojazdu VARCHAR (9) PRIMARY KEY NOT NULL, Marka VARCHAR (50) NOT NULL, Model VARCHAR (50) NOT NULL, Status VARCHAR (10) NOT NULL , Nr_VIN VARCHAR (17) NOT NULL, Naczepa VARCHAR (7) REFERENCES Naczepy(Nr_rejestracyjny_naczepy), Garaz NUMERIC(3) REFERENCES Garaze(Nr_garazu));
INSERT INTO Pojazdy (Nr_rejestracji_pojazdu, Marka, Model, Status, Nr_VIN, Naczepa, Garaz) VALUES ('WSI13058', 'Renaut', 'Magnum', 'W trasie', '1FM5K8F8XEGC73033','ERA75TM',1 );
INSERT INTO Pojazdy (Nr_rejestracji_pojazdu, Marka, Model, Status, Nr_VIN, Garaz) VALUES ('WSI10092', 'Mercedes', 'Arocs', 'W garazu', '1D7HU18Z62J293793',2);
INSERT INTO Pojazdy (Nr_rejestracji_pojazdu, Marka, Model, Status, Nr_VIN, Naczepa, Garaz) VALUES ('GSP85MW', 'Daf', 'XF105', 'W trasie', 'WDDNG71X97A097974','LPU60HN',2);
INSERT INTO Pojazdy (Nr_rejestracji_pojazdu, Marka, Model, Status, Nr_VIN, Garaz) VALUES ('DD1354W', 'Volvo', 'FH13', 'Serwis', 'KMHDH4AE4FU255873',2);
INSERT INTO Pojazdy (Nr_rejestracji_pojazdu, Marka, Model, Status, Nr_VIN, Naczepa, Garaz) VALUES ('LO84P95', 'Scania', 'R420', 'W trasie', '1G2ZH158464174583','ERA81TL',1);

-- Tabela: Zlecenia
CREATE TABLE Zlecenia (Nr_zlecenia INTEGER PRIMARY KEY NOT NULL, Data_zaladunku DATE NOT NULL, Data_rozladunku DATE NOT NULL, Kosz_zlecenia NUMERIC (10, 2) NOT NULL, Rodzaj_ladunku VARCHAR (10) NOT NULL, Oddzial VARCHAR(7)  REFERENCES Oddzialy (Nr_oddizalu) NOT NULL, Klient INTEGER NOT NULL REFERENCES Klienci (Nr_klienta), Nr_kursu SERIAL REFERENCES Stale_kursy(Nr_trasy));
INSERT INTO Zlecenia (Nr_zlecenia, Data_zaladunku, Data_rozladunku, Kosz_zlecenia, Rodzaj_ladunku, Oddzial, Klient, Nr_kursu ) VALUES (1, '16.10.2012', '30.10.2012', 5500, 'Palety', 'POZ0001', 1, 2 );
INSERT INTO Zlecenia (Nr_zlecenia, Data_zaladunku, Data_rozladunku, Kosz_zlecenia, Rodzaj_ladunku, Oddzial, Klient, Nr_kursu ) VALUES (2, '20.03.2013', '07.04.2013', 7000, 'Koce', 'POZ0001', 4, 3 );
INSERT INTO Zlecenia (Nr_zlecenia, Data_zaladunku, Data_rozladunku, Kosz_zlecenia, Rodzaj_ladunku, Oddzial, Klient, Nr_kursu ) VALUES (3, '07.07.2014', '10.07.2014', 10000, 'Owoce', 'BER100', 3, 5);
INSERT INTO Zlecenia (Nr_zlecenia, Data_zaladunku, Data_rozladunku, Kosz_zlecenia, Rodzaj_ladunku, Oddzial, Klient, Nr_kursu ) VALUES (4, '09.12.2015', '12.12.2015', 15550, 'Monitory', 'BER100', 2, 1 );
INSERT INTO Zlecenia (Nr_zlecenia, Data_zaladunku, Data_rozladunku, Kosz_zlecenia, Rodzaj_ladunku, Oddzial, Klient, Nr_kursu ) VALUES (5, '13.10.2017', '16.10.2017', 30000, 'Tajne', 'POZ0001', 5,4 );

-- Tabela: Kierowcy
CREATE TABLE Kierowcy (Pesel VARCHAR (11) NOT NULL PRIMARY KEY,Imie VARCHAR(50) NOT NULL, Nazwisko VARCHAR(50) NOT NULL, Nr_prawa_jazdy VARCHAR (13) NOT NULL);
INSERT INTO Kierowcy (Pesel,Imie, Nazwisko, Nr_prawa_jazdy) VALUES ('00212228652', 'Paweł' ,'Tomaszewski', '71100428449');
INSERT INTO Kierowcy (Pesel,Imie, Nazwisko, Nr_prawa_jazdy) VALUES ('90010963457', 'Julia ','Sowa', '2260972644');
INSERT INTO Kierowcy (Pesel,Imie, Nazwisko, Nr_prawa_jazdy) VALUES ('54042782314', 'Mateusz', 'Pawlik', '68091191348');
INSERT INTO Kierowcy (Pesel,Imie, Nazwisko, Nr_prawa_jazdy) VALUES ('81080589296', 'Igor', 'Jaworski', '56061133247');
INSERT INTO Kierowcy (Pesel,Imie, Nazwisko, Nr_prawa_jazdy) VALUES ('62090539314', 'Przemysław', 'Borkowski', '64040664185');

-- Tabela: Kompetencje_Kierowcy
CREATE TABLE Kompetencje_Kierowcy (Nazwa_Kompetencji  VARCHAR (200)  , Kierowca VARCHAR (11) ,FOREIGN KEY (Nazwa_Kompetencji)  REFERENCES Kompetencje (Nazwa), FOREIGN KEY (Kierowca) REFERENCES Kierowcy (Pesel) );
INSERT INTO Kompetencje_Kierowcy (Nazwa_Kompetencji, Kierowca) VALUES ('Materiały wybuchowe', '00212228652');
INSERT INTO Kompetencje_Kierowcy (Nazwa_Kompetencji, Kierowca) VALUES ('Gazy', '00212228652');
INSERT INTO Kompetencje_Kierowcy (Nazwa_Kompetencji, Kierowca) VALUES ('Ciecze zapalne', '62090539314');
INSERT INTO Kompetencje_Kierowcy (Nazwa_Kompetencji, Kierowca) VALUES ('Gazy', '54042782314');
INSERT INTO Kompetencje_Kierowcy (Nazwa_Kompetencji, Kierowca) VALUES ('Radioaktywne', '90010963457');

-- Tabela: Zlecenia_Kierowcy
CREATE TABLE  Zlecenia_Kierowcy ( Zlecenie  INTEGER, Kierowca VARCHAR (11) ,FOREIGN KEY (Zlecenie)  REFERENCES Zlecenia (Nr_zlecenia), FOREIGN KEY (Kierowca) REFERENCES Kierowcy (Pesel) );
INSERT INTO  Zlecenia_Kierowcy ( Zlecenie, Kierowca) VALUES (1, '00212228652');
INSERT INTO  Zlecenia_Kierowcy ( Zlecenie, Kierowca) VALUES (2, '00212228652');
INSERT INTO  Zlecenia_Kierowcy ( Zlecenie, Kierowca) VALUES (2, '62090539314');
INSERT INTO  Zlecenia_Kierowcy ( Zlecenie, Kierowca) VALUES (4, '54042782314');
INSERT INTO  Zlecenia_Kierowcy ( Zlecenie, Kierowca) VALUES (5, '90010963457');