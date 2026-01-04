CREATE DATABASE aracsatis_db_odev;
GO

USE aracsatis_db_odev;
GO

CREATE TABLE Marka (
  MarkaID int PRIMARY KEY IDENTITY(1,1),
  MarkaAdi varchar(50) not null,

);
GO
 
CREATE TABLE Model (
  ModelID int PRIMARY KEY IDENTITY(1,1),
  ModelAdi varchar(50) not null,

);
GO

CREATE TABLE Renk (
  RenkID int PRIMARY KEY IDENTITY(1,1),
  RenkAdi varchar(50) not null,

);
GO

CREATE TABLE StokDurumu (
  StokDurumID int PRIMARY KEY IDENTITY(1,1),
  StokDurum varchar(50) not null,

);
GO

CREATE TABLE HasarDurumu (
  HasarDurumID int PRIMARY KEY IDENTITY(1,1),
  HasarDurum varchar(50) not null,

);
GO

CREATE TABLE YakitTipi (
  YakitTipiID int PRIMARY KEY IDENTITY(1,1),
  YakitTipi varchar(50) not null,

);
GO

CREATE TABLE VitesTipi (
  VitesTipiID int PRIMARY KEY IDENTITY(1,1),
  VitesTipi varchar(50) not null,

);
GO

CREATE TABLE KasaTipi (
  KasaTipiID int  PRIMARY KEY IDENTITY(1,1),
  KasaTipi varchar(50) not null,

);
GO

CREATE TABLE SatisDurumu (
  SatisDurumuID int PRIMARY KEY IDENTITY(1,1),
  SatisDurumu varchar(50) not null,

);
GO

CREATE TABLE OdemeTipi (
  OdemeTipiID int PRIMARY KEY IDENTITY(1,1),
  OdemeTipi varchar(50) not null,

);
GO

CREATE TABLE Personel (
  PersonelID int PRIMARY KEY IDENTITY(1,1),
  Adi varchar(50) not null,
  Soyadi varchar(50) not null,
  Pozisyon varchar(30) not null,
  Telefon varchar(13) not null,
  Eposta varchar(50) not null,

);
GO

CREATE TABLE Il (
  IlID int PRIMARY KEY IDENTITY(1,1),
  IlAdi varchar(16) not null,

);
GO

CREATE TABLE Ilce (
  IlceID int PRIMARY KEY IDENTITY(1,1),
  IlceAdi varchar(50) not  null,
  IlID int not null,
  CONSTRAINT FK_Ilce_Il FOREIGN KEY (IlID) REFERENCES Il(IlID)

);
GO

CREATE TABLE Adres (
  AdresID int PRIMARY KEY IDENTITY(1,1),
  AdresBasligi varchar(20) not null,
  IlID int not null,
  IlceID int not null,
  Sokak varchar(50) not null,
  BinaNo varchar(10) not null,
  DaireNo int not null,
  CONSTRAINT FK_Adres_Il FOREIGN KEY (IlID) REFERENCES Il(IlID),
  CONSTRAINT FK_Adres_Ilce FOREIGN KEY(IlceID) REFERENCES Ilce(IlceID)

);
GO

CREATE TABLE Musteri (
  MusteriID int PRIMARY KEY IDENTITY(1,1),
  Adi varchar(50) not null,
  Soyadi varchar(50) not null,
  Telefon varchar(13) not null,
  Eposta varchar(50) not null,
  AdresID int not null,
  CONSTRAINT FK_Musteri_Adres FOREIGN KEY (AdresID) REFERENCES Adres(AdresID)

);
GO

CREATE TABLE AracBilgi (
  id int PRIMARY KEY IDENTITY(1,1),
  MarkaID int not null,
  ModelID int not null,
  RenkID int not null,
  Yil int not null,
  Fiyat decimal(18,2) not null,
  StokDurumID int not null,
  HasarDurumID int not null,
  YakitTipiID int not null,
  VitesTipiID int not null,
  KasaTipiID int not null,
  MusteriID int not null,
  PersonelID int not null,
  SatisDurumuID int not null,
  OdemeTipiID int not null,
  CONSTRAINT FK_AracBilgi_Marka FOREIGN KEY(MarkaID) REFERENCES Marka(MarkaID),
  CONSTRAINT FK_AracBilgi_Model FOREIGN KEY(ModelID) REFERENCES Model(ModelID),
  CONSTRAINT FK_AracBilgi_Renk FOREIGN KEY (RenkID) REFERENCES Renk(RenkID),
  CONSTRAINT FK_AracBilgi_StokDurum FOREIGN KEY (StokDurumID) REFERENCES StokDurumu(StokDurumID),
  CONSTRAINT FK_AracBilgi_HasarDurum FOREIGN KEY (HasarDurumID) REFERENCES HasarDurumu(HasarDurumID),
  CONSTRAINT FK_AracBilgi_YakitTipi FOREIGN KEY (YakitTipiID) REFERENCES YakitTipi(YakitTipiID),
  CONSTRAINT FK_AracBilgi_VitesTipi FOREIGN KEY (VitesTipiID) REFERENCES VitesTipi(VitesTipiID),
  CONSTRAINT FK_AracBilgi_KasaTipi FOREIGN KEY (KasaTipiID) REFERENCES KasaTipi(KasaTipiID),
  CONSTRAINT FK_AracBilgi_Musteri FOREIGN KEY (MusteriID) REFERENCES Musteri(MusteriID),
  CONSTRAINT FK_AracBilgi_Personel FOREIGN KEY (PersonelID) REFERENCES Personel(PersonelID),
  CONSTRAINT FK_AracBilgi_SatisDurum FOREIGN KEY (SatisDurumuID) REFERENCES SatisDurumu(SatisDurumuID),
  CONSTRAINT FK_AracBilgi_OdemeTipi FOREIGN KEY (OdemeTipiID) REFERENCES OdemeTipi(OdemeTipiID),

);
GO






