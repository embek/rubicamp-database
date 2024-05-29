CREATE TABLE
    jurusan (
        kode_jurusan CHARACTER(3) PRIMARY KEY NOT NULL,
        nama_jurusan VARCHAR(30) NOT NULL
    );

INSERT INTO
    jurusan
VALUES
    ('J01', 'Alam'),
    ('J02', 'Sosial');

CREATE TABLE
    mahasiswa (
        nim CHARACTER(4) PRIMARY KEY NOT NULL,
        nama_mahasiswa VARCHAR(30) NOT NULL,
        alamat VARCHAR(50),
        kode_jurusan CHARACTER(3) NOT NULL,
        tgl_lahir DATE,
        FOREIGN KEY (kode_jurusan) REFERENCES jurusan (kode_jurusan)
    );

INSERT INTO
    mahasiswa
VALUES
    ('1234', 'ayam', 'bandung', 'J01', '2007-04-12'),
    ('2345', 'bebek', 'surabaya', 'J01', '2006-07-20'),
    ('3456', 'kuda', 'semarang', 'J02', '2004-11-07'),
    ('7899', 'sapi', 'semarang', 'J02', '2000-01-02');

CREATE TABLE
    dosen (
        no_induk_dosen CHARACTER(7) PRIMARY KEY NOT NULL,
        nama_dosen VARCHAR(30)
    );

INSERT INTO
    dosen
VALUES
    ('1596357', 'Prof. Singa'),
    ('7536982', 'Bu Aya'),
    ('7894215', 'Mas Ako'),
    ('6248539', 'Bu Merpati'),
    ('7346528', 'Ms. Teri');

CREATE TABLE
    matakuliah (
        kode_matakuliah CHARACTER(5) PRIMARY KEY NOT NULL,
        nama_matakuliah VARCHAR(20) NOT NULL,
        sks INTEGER NOT NULL
    );

INSERT INTO
    matakuliah
VALUES
    ('AL001', 'Matematika', 4),
    ('AL002', 'Ipa', 4),
    ('AL003', 'Pramuka', 6),
    ('SS001', 'Geografi', 5),
    ('SS002', 'Hukum Rimba', 3),
    ('SS003', 'Data Mining', 5);

CREATE TABLE
    daftar_pengampu (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kode_matakuliah CHARACTER(5) NOT NULL,
        no_induk_dosen VARCHAR(30) NOT NULL,
        FOREIGN KEY (kode_matakuliah) REFERENCES matakuliah (kode_matakuliah),
        FOREIGN KEY (no_induk_dosen) REFERENCES dosen (no_induk_dosen)
    );

INSERT INTO
    daftar_pengampu (kode_matakuliah, no_induk_dosen)
VALUES
    ('AL001', '1596357'),
    ('AL001', '7536982'),
    ('AL002', '7536982'),
    ('AL003', '1596357'),
    ('SS001', '7894215'),
    ('SS002', '6248539'),
    ('SS002', '7346528'),
    ('SS003', '7894215');

CREATE TABLE
    daftar_peserta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kode_matakuliah VARCHAR(20) NOT NULL,
        nim VARCHAR(4) NOT NULL,
        nilai VARCHAR(2) NOT NULL,
        FOREIGN KEY (kode_matakuliah) REFERENCES matakuliah (kode_matakuliah),
        FOREIGN KEY (nim) REFERENCES mahasiswa (nim)
    );

INSERT INTO
    daftar_peserta (kode_matakuliah, nim, nilai)
VALUES
    ('SS001', '3456', 'A'),
    ('SS003', '7899', 'A'),
    ('SS003', '3456', 'C'),
    ('SS002', '3456', 'AB'),
    ('SS002', '7899', 'E'),
    ('AL002', '1234', 'B'),
    ('AL002', '2345', 'AB'),
    ('AL001', '1234', 'D'),
    ('AL001', '2345', 'AB'),
    ('AL003', '2345', 'A');