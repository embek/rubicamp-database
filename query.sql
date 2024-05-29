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
        alamat VARCHAR(50),
        nama_jurusan VARCHAR(10) NOT NULL,
        umur INTEGER,
        FOREIGN KEY (nama_jurusan) REFERENCES jurusan (nama_jurusan)
    );

INSERT INTO
    mahasiswa
VALUES
    ('1234', 'ayam', 'bandung', 'Alam', 17),
    ('2345', 'bebek', 'surabaya', 'Alam', 18),
    ('3456', 'kuda', 'semarang', 'Sosial', 20),
    ('7899', 'sapi', 'semarang', 'Sosial', 24);

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
    ('AL001', 'Matematika', 4),
    ('AL002', 'Ipa', 4),
    ('AL003', 'Pramuka', 6),
    ('SS001', 'Geografi', 5),
    ('SS002', 'Hukum Rimba', 3),
    ('SS003', 'Data Mining', 5);

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
    ('Hukum Rimba', 'Ms.Teri'),
    ('Data Mining', 'Mas Ako');

CREATE TABLE
    daftar_peserta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama_matakuliah VARCHAR(20) NOT NULL,
        nama_mahasiswa VARCHAR(30) NOT NULL,
        hari VARCHAR(7),
        nilai VARCHAR(2),
        FOREIGN KEY (nama_matakuliah) REFERENCES matakuliah (nama_matakuliah),
        FOREIGN KEY (nama_mahasiswa) REFERENCES mahasiswa (nama_mahasiswa)
    );

INSERT INTO
    daftar_peserta (nama_matakuliah, nama_mahasiswa, hari, nilai)
VALUES
    ('Geografi', 'kuda', 'senin', 'A'),
    ('Data Mining', 'sapi', 'rabu', 'A'),
    ('Data Mining', 'kuda', 'rabu', 'C'),
    ('Hukum Rimba', 'kuda', 'selasa', 'AB'),
    ('Hukum Rimba', 'sapi', 'selasa', 'E'),
    ('Ipa', 'ayam', 'rabu', 'B'),
    ('Ipa', 'bebek', 'rabu', 'AB'),
    ('Matematika', 'ayam', 'kamis', 'D'),
    ('Matematika', 'bebek', 'kamis', 'AB'),
    ('Pramuka', 'bebek', 'jumat', 'A');

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
    ('Sosial', 'Hukum Rimba', 9),
    ('Sosial', 'Data Mining', 4);

SELECT
    nama_mahasiswa,
    nama_jurusan
FROM
    mahasiswa;

SELECT
    nama_mahasiswa,
    umur
FROM
    mahasiswa
GROUP BY
    nama_mahasiswa
HAVING
    umur < 20;

SELECT
    nama_mahasiswa,
    nilai
FROM
    daftar_peserta
GROUP BY
    nama_mahasiswa
HAVING
    nilai <= 'B';

SELECT
    nama_mahasiswa,
    SUM(sks) as jumlah_sks
FROM
    daftar_peserta
    JOIN matakuliah USING (nama_matakuliah)
GROUP BY
    nama_mahasiswa
HAVING
    jumlah_sks > 10;

SELECT
    nama_mahasiswa,
    nama_matakuliah
FROM
    daftar_peserta
WHERE
    nama_matakuliah = 'Data Mining';

SELECT
    nama_dosen,
    COUNT(DISTINCT nama_mahasiswa)
FROM
    daftar_pengampu
    JOIN daftar_peserta USING (nama_matakuliah)
GROUP BY
    nama_dosen;

SELECT
    nama_mahasiswa,
    umur
FROM
    mahasiswa
ORDER BY
    umur ASC;

SELECT
    *
FROM
    daftar_peserta
    LEFT JOIN mahasiswa USING (nama_mahasiswa)
    LEFT JOIN penawaran_matakuliah USING (nama_matakuliah, nama_jurusan)
    LEFT JOIN daftar_pengampu USING (nama_matakuliah)
WHERE
    nilai > = 'D';