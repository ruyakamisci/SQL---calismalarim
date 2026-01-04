use SigortaSirketidb;

CREATE TABLE Bayi (
  BayiID int PRIMARY KEY IDENTITY(1,1),
  BayiAdi varchar(100) not null,
  Telefon varchar(13) not null,
  Eposta varchar(50) not null,
  SorumluKisi varchar(80) not null,
  KayitTarihi DATETIME DEFAULT GETDATE(),
  UNIQUE (Eposta)
);

CREATE TABLE BayiAdres (
  BayiAdresID int PRIMARY KEY IDENTITY(1,1),
  BayiID int not null,
  AdresDetay varchar(200) not null,
  Sehir varchar(25) not null,
  Ilce varchar(30) not null,
  FOREIGN KEY (BayiID) REFERENCES Bayi(BayiID)
);

CREATE TABLE Musteri (
  MusteriID int PRIMARY KEY IDENTITY(1,1),
  Ad varchar(50) not null, 
  Soyad varchar(50) not null,
  TCKN varchar(11) not null,
  Telefon varchar(13) not null,
  Eposta varchar(50),
  UNIQUE (TCKN),
  UNIQUE (Eposta)
);

CREATE TABLE MusteriAdres (
  MusteriAdresID int PRIMARY KEY IDENTITY(1,1),
  MusteriID int not null,
  AdresDetay varchar(200) not null,
  Sehir varchar(25) not null,
  Ilce varchar(30) not null,
  FOREIGN KEY(MusteriID) REFERENCES Musteri(MusteriID)
);

CREATE TABLE AracMarka (
  MarkaID int PRIMARY KEY IDENTITY(1,1),
  MarkaAdi varchar(50) not null
);

CREATE TABLE AracModel (
  ModelID int PRIMARY KEY IDENTITY(1,1),
  MarkaID int not null,
  ModelAdi varchar(50) not null,
  UNIQUE (ModelAdi),
  FOREIGN KEY (MarkaID) REFERENCES AracMarka(MarkaID)
);

CREATE TABLE AracTipi (
  TipID int PRIMARY KEY IDENTITY(1,1),
  TipAdi varchar(30) not null,
  UNIQUE (TipAdi)
);

CREATE TABLE AracRenk (
  RenkID int PRIMARY KEY IDENTITY(1,1),
  RenkAd varchar(50) not null,
  UNIQUE (RenkAd)
);

CREATE TABLE YakitTur (
  YakitID int PRIMARY KEY IDENTITY(1,1),
  YakitAd varchar(30) not null,
  UNIQUE (YakitAd)
);

CREATE TABLE VitesTurleri (
  VitesID int PRIMARY KEY IDENTITY(1,1),
  VitesAd varchar(30) not null,
  UNIQUE (VitesAd)
);

CREATE TABLE AracHasarDurumu (
  HasarDurumID int PRIMARY KEY IDENTITY(1,1),
  Durum varchar(50) not null,
  UNIQUE (Durum)
);

CREATE TABLE Arac (
  AracID int PRIMARY KEY IDENTITY(1,1),
  MusteriID int not null,
  Plaka varchar(15) not null,
  MarkaID int not null,
  ModelID int not null,
  TipID int not null,
  RenkID int not null,
  YakitID int not null,
  VitesID int not null,
  HasarDurumID int not null,
  ModelYili int not null,
  SaseNo varchar(30) not null,
  MotorNo varchar(30) not null,
  UNIQUE (Plaka),
  UNIQUE (SaseNo),
  UNIQUE (MotorNo),
  FOREIGN KEY (MusteriID) REFERENCES Musteri(MusteriID),
  FOREIGN KEY (MarkaID) REFERENCES AracMarka(MarkaID),
  FOREIGN KEY (ModelID) REFERENCES AracModel(ModelID),
  FOREIGN KEY (TipID) REFERENCES  AracTipi(TipID),
  FOREIGN KEY (RenkID) REFERENCES AracRenk(RenkID),
  FOREIGN KEY (YakitID) REFERENCES YakitTur(YakitID),
  FOREIGN KEY (VitesID) REFERENCES VitesTurleri(VitesID),
  FOREIGN KEY (HasarDurumID) REFERENCES AracHasarDurumu(HasarDurumID),
);

CREATE TABLE SigortaTipi (
  SigortaTipiID int PRIMARY KEY IDENTITY(1,1),
  TipAdi varchar(30) not null
);

CREATE TABLE SigortaPolicesi (
  PoliceID int PRIMARY KEY IDENTITY(1,1),
  BayiID int not  null,
  MusteriID int not null,
  AracID int not null,
  SigortaTipiID int not null,
  PoliceNo varchar(50) not null,
  BaslangicTarihi DATE not null,
  BitisTarihi DATE not null,
  PrimUcreti DECIMAL(10,2) not null,
  Durum varchar(20) DEFAULT 'Aktif',
  FOREIGN KEY (BayiID) REFERENCES Bayi(BayiID),
  FOREIGN KEY (MusteriID) REFERENCES Musteri(MusteriID),
  FOREIGN KEY (AracID) REFERENCES Arac(AracID),
  FOREIGN KEY (SigortaTipiID) REFERENCES SigortaTipi(SigortaTipiID)
);

CREATE TABLE KaskoDetay (
  KaskoDetayID int PRIMARY KEY IDENTITY(1,1),
  PoliceID int not  null,
  Kapsam varchar(30) not  null,
  RuhsatNo varchar(30) not null,
  EkTeminatlar varchar(200),
  Aciklama varchar(300),
  UNIQUE (PoliceID),
  FOREIGN KEY (PoliceID) REFERENCES SigortaPolicesi(PoliceID)
);

CREATE TABLE DASKDetay (
  DASKDetayID int PRIMARY KEY IDENTITY(1,1),
  PoliceID int not null,
  AdresDetay varchar(200) not null,
  Sehir varchar(25) not null,
  Ilce varchar(30) not null,
  BinaYapimYili int not null,
  BinaKatSayisi int not null,
  BulunduguKat int not null,
  YapiTarzi varchar(50) not null,
  BrütM2 int not null,
  DepremBolgesi int not null,
  TeminatBedeli DECIMAL(12,2) not  null,
  UNIQUE (PoliceID),
  FOREIGN KEY (PoliceID) REFERENCES SigortaPolicesi(PoliceID)
);



  






