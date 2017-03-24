-- Lisää CREATE TABLE lauseet tähän tiedostoon
CREATE TABLE Opettaja(
	opettaja_id SERIAL PRIMARY KEY,
	etunimi varchar(30) NOT NULL,
	sukunimi varchar(30) NOT NULL,
	puhelinnumero varchar(10),
	email varchar(30),
	password varchar(10) NOT NULL
);

CREATE TABLE Oppilas(
	oppilas_id SERIAL PRIMARY KEY,
	etunimi varchar(30) NOT NULL,
	sukunimi varchar(30) NOT NULL,
	puhelinnumero varchar(10),
	email varchar(30),
);

CREATE TABLE SoittotunninMateriaali(
	materiaali_id REFERENCES Materiaali(materiaali_id),
	tunti_id REFERENCES Soittotunti(tunti_id)
);

CREATE TABLE Soittotunti(
	tunti_id SERIAL PRIMARY KEY,
	oppilas_id REFERENCES Oppilas(oppilas_id),
	opettaja_id REFERENCES Opettaja(opettaja_id),
	pvm DATE NOT NULL,
	kesto INTEGER NOT NULL,
	huomioita varchar(400),

);

CREATE TABLE Materiaali(
	materiaali_id SERIAL PRIMARY KEY,
	saveltaja varchar(30) NOT NULL,
	otsikko varchar(30) NOT NULL,
	tyyppi varchar(15),
	savellaji varchar(10),
	instrumentti_id REFERENCES Instrumentti(instrumentti_id),
);

CREATE TABLE OpettajanMateriaali(
	materiaali_id REFERENCES Materiaali(materiaali_id),
	opettaja_id REFERENCES Opettaja(opettaja_id)
);

CREATE TABLE OpettajanOppilas(
	opettaja_id REFERENCES Opettaja(opettaja_id),
	oppilas_id REFERENCES Oppilas(oppilas_id)
);

CREATE TABLE OpettajanInstrumentti(
	instrumentti_id REFERENCES Instrumentti(instrumentti_id),
	opettaja_id REFERENCES Opettaja(opettaja_id)
); 

CREATE TABLE OppilaanInstrumentti(
	instrumentti_id REFERENCES Instrumentti(instrumentti_id),
	oppilas_id REFERENCES Oppilas(oppilas_id)
); 
CREATE TABLE Instrumentti(
	instrumentti_id SERIAL PRIMARY KEY,
	nimi varchar(30) NOT NULL
);