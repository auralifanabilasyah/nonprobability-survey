# nonprobability-survey

# Survei Kepuasan Mahasiswa Program Studi Statistika terhadap Penggunaan Google Scholar dalam Pencarian Jurnal Ilmiah

---

# Latar Belakang

Perkembangan teknologi informasi memberikan kemudahan bagi mahasiswa dalam memperoleh berbagai sumber referensi ilmiah secara online. Salah satu platform yang paling sering digunakan dalam pencarian jurnal ilmiah adalah Google Scholar. Platform ini menyediakan berbagai artikel, jurnal, skripsi, prosiding, dan publikasi ilmiah lainnya yang dapat membantu mahasiswa dalam menunjang kegiatan akademik.

Mahasiswa Program Studi Statistika membutuhkan referensi ilmiah yang relevan dan terpercaya untuk membantu proses pembelajaran, penyusunan tugas, praktikum, maupun penelitian. Penggunaan Google Scholar dianggap lebih praktis karena mahasiswa dapat mencari jurnal dengan mudah hanya menggunakan kata kunci tertentu. Selain itu, Google Scholar juga menyediakan banyak pilihan referensi ilmiah dari berbagai bidang ilmu sehingga memudahkan mahasiswa dalam memperoleh sumber informasi akademik.

Meskipun demikian, dalam penggunaannya masih terdapat beberapa kendala yang dirasakan mahasiswa, seperti kesulitan menemukan jurnal yang sesuai dengan topik, keterbatasan akses pada beberapa jurnal tertentu, serta banyaknya hasil pencarian yang terkadang membuat mahasiswa kesulitan memilih referensi yang relevan.

Oleh karena itu, dilakukan survei untuk mengetahui bagaimana tingkat kepuasan mahasiswa Program Studi Statistika terhadap penggunaan Google Scholar dalam pencarian jurnal ilmiah.

---

# Tujuan Penelitian

1. Mengetahui tingkat kepuasan mahasiswa terhadap penggunaan Google Scholar.
2. Mengetahui kemudahan penggunaan Google Scholar dalam pencarian jurnal ilmiah.
3. Mengetahui manfaat Google Scholar dalam membantu kegiatan akademik mahasiswa.
4. Mengetahui hasil naive estimation dan weighting sederhana berdasarkan data survei.

---

# Metode Penelitian

Penelitian ini menggunakan metode non-probability sampling dengan teknik convenience sampling.

Convenience sampling merupakan teknik pengambilan sampel berdasarkan kemudahan peneliti dalam memperoleh responden yang bersedia mengisi kuesioner penelitian.

Pengumpulan data dilakukan menggunakan Google Form yang disebarkan kepada mahasiswa Program Studi Statistika.

---

# Variabel Penelitian

| Variabel | Keterangan |
|---|---|
| Semester | Semester mahasiswa |
| Jenis Kelamin | Laki-laki atau perempuan |
| x1 | Kemudahan akses Google Scholar |
| x2 | Kemudahan mencari jurnal menggunakan kata kunci |
| x3 | Kecepatan Google Scholar dalam menampilkan hasil pencarian |
| x4 | Kesesuaian hasil pencarian dengan topik |
| x5 | Banyaknya pilihan jurnal yang tersedia |
| x6 | Google Scholar membantu tugas atau penelitian |
| y | Kepuasan penggunaan Google Scholar secara keseluruhan |

---

# Tools yang Digunakan

- Google Form
- Microsoft Excel
- RStudio
- GitHub

---

# Struktur Repository

```bash
nonprobability-survey/
│
├── data/
│   └── teksam fiks.xlsx
│
├── script/
│   └── analisis.R
│
├── output/
│   ├── grafik-gender.png
│   └── grafik-semester.png
│
└── README.md
```

---

# Import Dataset

```r
# INSTALL PACKAGE
install.packages("readxl")

# MEMANGGIL PACKAGE
library(readxl)

# IMPORT DATA
data <- read_excel("data/teksam fiks.xlsx")
```

Syntax digunakan untuk membaca dataset survei ke dalam RStudio.

---

# Melihat Nama Kolom dan Data

```r
names(data)

head(data)
```

Syntax digunakan untuk melihat nama variabel dan isi data penelitian.

---

# Rename Variabel

```r
names(data)[6] <- "x1"
names(data)[7] <- "x2"
names(data)[8] <- "x3"
names(data)[9] <- "x4"
names(data)[10] <- "x5"
names(data)[11] <- "x6"
names(data)[12] <- "y"
```

Syntax digunakan untuk mempermudah proses analisis data.

---

# Frekuensi Jenis Kelamin

```r
table(data$`jenis Kelamin`)

prop.table(table(data$`jenis Kelamin`))*100
```

Syntax digunakan untuk menghitung jumlah dan persentase responden berdasarkan jenis kelamin.

---

# Frekuensi Semester

```r
table(data$Semester)

prop.table(table(data$Semester))*100
```

Syntax digunakan untuk menghitung jumlah dan persentase responden berdasarkan semester.

---

# Analisis Deskriptif

```r
mean(data$x1)
mean(data$x2)
mean(data$x3)
mean(data$x4)
mean(data$x5)
mean(data$x6)
mean(data$y)
```

Syntax digunakan untuk menghitung nilai rata-rata setiap variabel penelitian.

---

# Standard Deviation

```r
sd(data$x1)
sd(data$x2)
sd(data$x3)
sd(data$x4)
sd(data$x5)
sd(data$x6)
sd(data$y)
```

Syntax digunakan untuk menghitung standar deviasi setiap variabel penelitian.

---

# Grafik Jenis Kelamin

```r
png("grafik-gender.png")

barplot(table(data$`jenis Kelamin`),
        main = "Distribusi Jenis Kelamin",
        xlab = "Jenis Kelamin",
        ylab = "Frekuensi")

dev.off()
```

Syntax digunakan untuk membuat grafik distribusi jenis kelamin.

---

# Grafik Semester

```r
png("grafik-semester.png")

barplot(table(data$Semester),
        main = "Distribusi Semester",
        xlab = "Semester",
        ylab = "Frekuensi")

dev.off()
```

Syntax digunakan untuk membuat grafik distribusi semester.

---

# Naive Estimation

Rumus naive estimation:

\[
\hat{P} = \frac{Jumlah\ Responden\ Puas}{Jumlah\ Seluruh\ Responden}
\]

```r
# Menghitung jumlah responden puas
puas <- sum(data$y >= 4)

# Menghitung total responden
n <- nrow(data)

# Naive Estimation
naive <- puas/n

naive

cat("Naive Estimation =", naive, "\n")
```

Hasil naive estimation:

\[
0.7647 = 76.47\%
\]

Interpretasi:

Hasil tersebut menunjukkan bahwa sekitar 76,47% responden merasa puas terhadap penggunaan Google Scholar dalam pencarian jurnal ilmiah.

---

# Weighting Sederhana

Rumus weighting:

\[
w_i = \frac{Proporsi\ Populasi}{Proporsi\ Sampel}
\]

```r
prop_pop <- 0.50

prop_sample <- 0.147

w <- prop_pop/prop_sample

w

cat("Bobot Weighting =", w, "\n")
```

Hasil weighting:

\[
3.40
\]

Interpretasi:

Hasil weighting menunjukkan bahwa kelompok laki-laki memperoleh bobot lebih besar karena jumlah responden laki-laki dalam sampel lebih sedikit dibandingkan proporsi populasi.

---

# Hasil Analisis dan Interpretasi

## Karakteristik Responden

Jumlah responden dalam penelitian ini sebanyak 34 mahasiswa Program Studi Statistika.

### Distribusi Jenis Kelamin

| Jenis Kelamin | Frekuensi | Persentase |
|---|---|---|
| Perempuan | 29 | 85,3% |
| Laki-laki | 5 | 14,7% |

Mayoritas responden berjenis kelamin perempuan sebesar 85,3%, sedangkan responden laki-laki sebesar 14,7%.

---

### Distribusi Semester

| Semester | Frekuensi | Persentase |
|---|---|---|
| Semester 2 | 5 | 14,7% |
| Semester 4 | 26 | 76,5% |
| Semester 6 | 3 | 8,8% |

Mayoritas responden berasal dari semester 4 sebesar 76,5%.

---

# Hasil Analisis Deskriptif

| Variabel | Mean | Standar Deviasi | Interpretasi |
|---|---|---|---|
| x1 | 4.12 | 0.64 | Mahasiswa merasa puas terhadap kemudahan akses Google Scholar |
| x2 | 3.74 | 0.75 | Mahasiswa cukup puas terhadap kemudahan pencarian jurnal |
| x3 | 4.03 | 0.72 | Mahasiswa merasa puas terhadap kecepatan pencarian |
| x4 | 3.44 | 0.70 | Mahasiswa cukup puas terhadap kesesuaian hasil pencarian |
| x5 | 3.65 | 0.73 | Mahasiswa cukup puas terhadap banyaknya pilihan jurnal |
| x6 | 4.00 | 0.65 | Google Scholar membantu tugas dan penelitian mahasiswa |
| y | 3.79 | 0.73 | Tingkat kepuasan mahasiswa tergolong cukup baik |

---

# Interpretasi Analisis

Berdasarkan hasil analisis deskriptif, variabel dengan nilai rata-rata tertinggi terdapat pada variabel kemudahan akses Google Scholar (x1) sebesar 4,12. Hal ini menunjukkan bahwa mahasiswa merasa Google Scholar mudah diakses kapan saja saat dibutuhkan.

Variabel kecepatan pencarian (x3) juga memperoleh nilai rata-rata yang tinggi sebesar 4,03. Hal ini menunjukkan bahwa mahasiswa merasa Google Scholar mampu menampilkan hasil pencarian jurnal dengan cepat dan efisien.

Selain itu, variabel membantu tugas atau penelitian (x6) memperoleh nilai mean sebesar 4,00 yang menunjukkan bahwa Google Scholar sangat membantu mahasiswa dalam menunjang kegiatan akademik.

Sementara itu, variabel kesesuaian hasil pencarian (x4) memiliki nilai rata-rata paling rendah yaitu sebesar 3,44. Hal ini menunjukkan bahwa sebagian mahasiswa masih mengalami kesulitan dalam memperoleh hasil pencarian yang benar-benar sesuai dengan topik yang dicari.

Nilai standar deviasi seluruh variabel berada di bawah 1, sehingga dapat disimpulkan bahwa jawaban responden relatif homogen atau tidak terlalu bervariasi.

---

# Visualisasi

## Grafik Distribusi Jenis Kelamin

![Grafik Gender](output/grafik-gender.png)

---

## Grafik Distribusi Semester

![Grafik Semester](output/grafik-semester.png)

---

# Kesimpulan

Berdasarkan hasil penelitian dapat disimpulkan bahwa mahasiswa Program Studi Statistika secara umum merasa cukup puas terhadap penggunaan Google Scholar dalam pencarian jurnal ilmiah.

Google Scholar dinilai mudah diakses, cepat dalam menampilkan hasil pencarian, serta membantu mahasiswa dalam memperoleh referensi ilmiah untuk kebutuhan akademik.

Namun demikian, masih terdapat beberapa kendala terutama pada kesesuaian hasil pencarian dengan topik yang dicari sehingga mahasiswa terkadang perlu menggunakan kata kunci yang lebih spesifik untuk memperoleh referensi yang sesuai.
