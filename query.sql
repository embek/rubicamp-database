CREATE TABLE
    jurusan (
        kode_jurusan CHARACTER(3) PRIMARY KEY NOT NULL,
        nama_jurusan VARCHAR(10) NOT NULL
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
        alamat VARCHAR(50)
    );

INSERT INTO
    mahasiswa
VALUES
    ('1234', 'ayam', 'bandung'),
    ('2345', 'bebek', 'surabaya'),
    ('3456', 'kuda', 'semarang'),
    ('7899', 'sapi', 'semarang');

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
        sks INTEGER
    );

INSERT INTO
    matakuliah
VALUES
    ('AL001', 'Matematika', 3),
    ('AL002', 'Ipa', 2),
    ('AL003', 'Pramuka', 10),
    ('SS001', 'Geografi', 2),
    ('SS002', 'Hukum Rimba', 4);

CREATE TABLE
    daftar_pengampu (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_matakuliah VARCHAR(20) NOT NULL,
        nama_dosen VARCHAR(30) NOT NULL,
        FOREIGN KEY (nama_matakuliah) REFERENCES matakuliah (nama_matakuliah),
        FOREIGN KEY (nama_dosen) REFERENCES dosen (nama_dosen)
    );

INSERT INTO
    daftar_pengampu (nama_matakuliah, nama_dosen)
VALUES
    ('Matematika', 'Pak Singa'),
    ('Matematika', 'Bu Aya'),
    ('Ipa', 'Bu Aya'),
    ('Pramuka', 'Pak Singa'),
    ('Geografi', 'Mas Ako'),
    ('Hukum Rimba', 'Bu Merpati'),
    ('Hukum Rimba', 'Ms.Teri');

CREATE TABLE
    daftar_peserta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_matakuliah VARCHAR(20) NOT NULL,
        nama_mahasiswa VARCHAR(30) NOT NULL,
        hari VARCHAR(7),
        FOREIGN KEY (nama_matakuliah) REFERENCES matakuliah (nama_matakuliah),
        FOREIGN KEY (nama_mahasiswa) REFERENCES mahasiswa (nama_mahasiswa)
    );

INSERT INTO
    daftar_peserta (nama_matakuliah, nama_mahasiswa, hari)
VALUES
    ('Geografi', 'kuda', 'senin'),
    ('Hukum Rimba', 'kuda', 'selasa'),
    ('Hukum Rimba', 'sapi', 'selasa'),
    ('Ipa', 'ayam', 'rabu'),
    ('Ipa', 'bebek', 'rabu'),
    ('Matematika', 'ayam', 'kamis'),
    ('Matematika', 'bebek', 'kamis'),
    ('Pramuka', 'bebek', 'jumat');

CREATE TABLE
    penawaran_matakuliah (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_jurusan VARCHAR(10) NOT NULL,
        nama_matakuliah VARCHAR(20) NOT NULL,
        peserta_maksimal INTEGER,
        FOREIGN KEY (nama_jurusan) REFERENCES jurusan (nama_jurusan),
        FOREIGN KEY (nama_matakuliah) REFERENCES matakuliah (nama_matakuliah)
    );

INSERT INTO
    penawaran_matakuliah (nama_jurusan, nama_matakuliah, peserta_maksimal)
VALUES
    ('Alam', 'Matematika', 5),
    ('Alam', 'Ipa', 7),
    ('Alam', 'Pramuka', 15),
    ('Sosial', 'Geografi', 6),
    ('Sosial', 'Hukum Rimba', 9);