USE staylisten_musicapp_db;

CREATE TABLE Kullanici (
  KullaniciID int PRIMARY KEY IDENTITY(1,1),
  Adi varchar(50) not null,
  Soyadi varchar(50) not null,
  Eposta varchar(50) UNIQUE not null,
  Sifre varchar(50) not null,
  DogumTarihi date not null,
  KayitTarihi datetime not null,
  AbonelikID int not null
);

CREATE TABLE AbonelikPlani (
  AbonelikID int PRIMARY KEY IDENTITY(1,1),
  PlanAdi varchar(30) not null,
  Fiyat decimal(4,2) not null,
  Aciklama varchar(256) not null
);

CREATE TABLE Odeme (
  OdemeID int PRIMARY KEY IDENTITY(1,1),
  KullaniciID int not null,
  Tutar decimal(4,2) not null,
  OdemeTarihi datetime not null,
  OdemeTipi varchar(30) not null
);

CREATE TABLE Sanatci (
  SanatciID int PRIMARY KEY IDENTITY(1,1),
  Adi varchar(50) not null,
  Soyadi varchar(50) not null,
  DogumTarihi date not null,
  Ulke varchar(50) not null
);

CREATE TABLE Album (
  AlbumID int PRIMARY KEY IDENTITY(1,1),
  SanatciID int not null,
  AlbumAdi varchar(100) not null,
  CikisTarihi date not  null
);

CREATE TABLE Sarki (
  SarkiID int PRIMARY KEY IDENTITY(1,1),
  AlbumID int not null,
  TurID int not null,
  SarkiAdi varchar(100) not null,
  Sure int not null,
  DinlemeSayisi int not null
);

CREATE TABLE Sarkisozleri (
  SarkisozleriID int PRIMARY KEY IDENTITY(1,1),
  SarkiID int not null,
  SozMetni varchar(Max) not null
);

CREATE TABLE Tur (
  TurID int PRIMARY KEY IDENTITY(1,1),
  TurAdi varchar(50) not null
);

CREATE TABLE Yazar (
  YazarID int PRIMARY KEY IDENTITY(1,1),
  Adi varchar(50) not null,
  Soyadi varchar(50) not null
);

CREATE TABLE Besteci (
  BesteciID int PRIMARY KEY IDENTITY(1,1),
  Adi varchar(50) not null,
  Soyadi varchar(50) not null
);

CREATE TABLE SarkiYazar (
  SarkiYazarID int PRIMARY KEY IDENTITY(1,1),
  SarkiID int not null,
  YazarID int not null
);

CREATE TABLE SarkiBesteci (
  SarkiBesteciID int PRIMARY KEY IDENTITY(1,1),
  SarkiID int not null,
  BesteciID int not null
);

CREATE TABLE Playlist (
  PlaylistID int PRIMARY KEY IDENTITY(1,1),
  KullaniciID int not null,
  PlaylistAdi varchar(100) not null,
  OlusturmaTarihi date not null
);

CREATE TABLE PlaylistDetay (
  PlaylistDetayID int PRIMARY KEY IDENTITY(1,1),
  PlaylistID int not null,
  SarkiID int not null,
  EklemeTarihi date not null
);

CREATE TABLE Favoriler (
  FavorilerID int PRIMARY KEY IDENTITY(1,1),
  KullaniciID int not null,
  SarkiID int not null,
  EklemeTarihi date not null
);

CREATE TABLE Takip (
  TakipID int PRIMARY KEY IDENTITY(1,1),
  KullaniciID int not null,
  SanatciID int  not null,
  TakipTarihi date not  null
);

ALTER TABLE Kullanici
ADD CONSTRAINT FK_Kullanici_AbonelikPlani
FOREIGN KEY (AbonelikID) REFERENCES AbonelikPlani(AbonelikID);

ALTER TABLE Odeme
ADD CONSTRAINT FK_Odeme_Kullanici
FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID);

ALTER TABLE Album
ADD CONSTRAINT FK_Album_Sanatci
FOREIGN KEY (SanatciID) REFERENCES Sanatci(SanatciID);

ALTER TABLE Sarki
ADD CONSTRAINT FK_Sarki_Album
FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID);

ALTER TABLE Sarki
ADD CONSTRAINT FK_Sarki_Tur
FOREIGN KEY (TurID) REFERENCES Tur(TurID);

ALTER TABLE Sarkisozleri
ADD CONSTRAINT FK_Sarkisozleri_Sarki
FOREIGN KEY (SarkiID) REFERENCES Sarki(SarkiID);

ALTER TABLE SarkiYazar
ADD CONSTRAINT FK_SarkiYazar_Sarki
FOREIGN KEY (SarkiID) REFERENCES Sarki(SarkiID);

ALTER TABLE SarkiYazar
ADD CONSTRAINT FK_SarkiYazar_Yazar
FOREIGN KEY (YazarID) REFERENCES Yazar(YazarID);

ALTER TABLE SarkiBesteci
ADD CONSTRAINT FK_SarkiBesteci_Sarki
FOREIGN KEY (SarkiID) REFERENCES Sarki(SarkiID);

ALTER TABLE SarkiBesteci
ADD CONSTRAINT FK_SarkiBesteci_Besteci
FOREIGN KEY (BesteciID) REFERENCES Besteci(BesteciID);

ALTER TABLE Playlist
ADD CONSTRAINT FK_Playlist_Kullanici
FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID);

ALTER TABLE PlaylistDetay
ADD CONSTRAINT FK_PlaylistDetay_Playlist
FOREIGN KEY (PlaylistID) REFERENCES Playlist(PlaylistID);

ALTER TABLE PlaylistDetay
ADD CONSTRAINT FK_PlaylistDetay_Sarki
FOREIGN KEY (SarkiID) REFERENCES Sarki(SarkiID);

ALTER TABLE Favoriler
ADD CONSTRAINT FK_Favoriler_Kullanici
FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID);

ALTER TABLE Favoriler
ADD CONSTRAINT FK_Favoriler_Sarki
FOREIGN KEY (SarkiID) REFERENCES Sarki(SarkiID);

ALTER TABLE Takip
ADD CONSTRAINT FK_Takip_Kullanici
FOREIGN KEY (KullaniciID) REFERENCES Kullanici(KullaniciID);

ALTER TABLE Takip
ADD CONSTRAINT FK_Takip_Sanatci
FOREIGN KEY (SanatciID) REFERENCES Sanatci(SanatciID);










