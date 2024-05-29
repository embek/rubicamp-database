SELECT
    nim,
    nama_mahasiswa,
    nama_jurusan
FROM
    mahasiswa
    JOIN jurusan USING (kode_jurusan);

SELECT
    nim,
    nama_mahasiswa,
    date () - tgl_lahir AS umur
FROM
    mahasiswa
GROUP BY
    nim
HAVING
    umur < 20;

SELECT
    nim,
    nama_mahasiswa,
    nilai
FROM
    daftar_peserta
    JOIN mahasiswa USING (nim)
GROUP BY
    nim
HAVING
    nilai <= 'B';

SELECT
    nim,
    nama_mahasiswa,
    SUM(sks) AS jumlah_sks
FROM
    mahasiswa
    JOIN daftar_peserta USING (nim)
    JOIN matakuliah USING (kode_matakuliah)
GROUP BY
    nim
HAVING
    jumlah_sks > 10;

SELECT
    nim,
    nama_mahasiswa,
    nama_matakuliah
FROM
    daftar_peserta
    JOIN matakuliah USING (kode_matakuliah)
    JOIN mahasiswa USING (nim)
WHERE
    nama_matakuliah LIKE '%Data Mining%';

SELECT
    no_induk_dosen,
    nama_dosen,
    COUNT(DISTINCT nama_mahasiswa) AS jumlah_mahasiswa
FROM
    daftar_pengampu
    JOIN dosen USING (no_induk_dosen)
    JOIN daftar_peserta USING (kode_matakuliah)
    JOIN matakuliah USING (kode_matakuliah)
    JOIN mahasiswa USING (nim)
GROUP BY
    nama_dosen;

SELECT
    nim,
    nama_mahasiswa,
    date ('now') - date (tgl_lahir) AS umur
FROM
    mahasiswa
ORDER BY
    umur ASC;

SELECT
    DISTINCT nama_matakuliah,
    nim,
    nama_mahasiswa,
    kode_jurusan,
    nama_jurusan,
    no_induk_dosen,
    nama_dosen,
    nilai
FROM
    dosen
    JOIN daftar_pengampu USING (no_induk_dosen)
    JOIN matakuliah USING (kode_matakuliah)
    JOIN daftar_peserta USING (kode_matakuliah)
    JOIN mahasiswa USING (nim)
    JOIN jurusan USING (kode_jurusan)
WHERE
    nilai >= 'D';