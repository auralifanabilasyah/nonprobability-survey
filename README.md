# NONPROBABILITY SURVEY  
## Survei Kepuasan Mahasiswa Program Studi Statistika terhadap Penggunaan Google Scholar dalam Pencarian Jurnal Ilmiah

---

# Deskripsi Penelitian

Penelitian ini membahas mengenai tingkat kepuasan mahasiswa Program Studi Statistika terhadap penggunaan Google Scholar sebagai media pencarian jurnal ilmiah.

Di era digital saat ini, mahasiswa sangat bergantung pada sumber referensi online untuk menunjang kegiatan akademik seperti tugas kuliah, praktikum, dan penelitian. Salah satu platform yang paling sering digunakan adalah Google Scholar karena menyediakan berbagai jurnal ilmiah, artikel penelitian, prosiding, hingga skripsi dari berbagai bidang ilmu.

Google Scholar dipilih karena kemudahan akses dan kecepatan dalam pencarian. Namun, dalam praktiknya masih terdapat beberapa kendala seperti hasil pencarian yang terlalu banyak, tidak semua jurnal dapat diakses secara penuh, serta tingkat relevansi hasil pencarian yang bervariasi.

Oleh karena itu, penelitian ini dilakukan untuk melihat bagaimana persepsi dan tingkat kepuasan mahasiswa terhadap penggunaan Google Scholar.

---

# Metode Penelitian

Penelitian ini menggunakan metode **non-probability sampling** dengan teknik **convenience sampling**.

Convenience sampling adalah teknik pengambilan sampel berdasarkan kemudahan peneliti dalam menjangkau responden. Responden dalam penelitian ini adalah mahasiswa Statistika yang pernah menggunakan Google Scholar.

Metode ini dipilih karena pengumpulan data dilakukan secara online menggunakan Google Form sehingga lebih cepat dan efisien.

---

# Data Penelitian

Data diperoleh dari hasil kuesioner Google Form yang berisi pertanyaan mengenai pengalaman penggunaan Google Scholar.

Variabel penelitian terdiri dari:
- Semester
- Jenis kelamin
- x1 sampai x6 (indikator kepuasan)
- y (kepuasan keseluruhan)

---

# Link Kuesioner

Kuesioner penelitian dapat diakses melalui:

https://forms.gle/VHFJ2z83TLsiU7hy7

---

# Variabel Penelitian

| Variabel | Keterangan |
|---|---|
| Semester | Tingkat semester responden |
| Jenis Kelamin | Laki-laki / perempuan |
| x1 | Kemudahan akses Google Scholar |
| x2 | Kemudahan mencari jurnal |
| x3 | Kecepatan hasil pencarian |
| x4 | Kesesuaian hasil pencarian |
| x5 | Banyaknya pilihan jurnal |
| x6 | Manfaat untuk tugas/penelitian |
| y | Kepuasan keseluruhan |

---

# IMPORT DATA (R STUDIO)

```r
library(readxl)

data <- read_excel("C:/Users/ASUS/Documents/abel/teksam fiks.xlsx")
```

Proses ini menunjukkan bahwa data survei mengenai kepuasan penggunaan Google Scholar berhasil diimport ke dalam RStudio tanpa error. Data yang diperoleh terdiri dari 34 responden dengan 12 variabel yang mencakup identitas responden serta indikator penilaian kepuasan, sehingga sudah siap untuk dilakukan analisis lebih lanjut.

---

# RENAME VARIABEL

```r
names(data)[6] <- "x1"
names(data)[7] <- "x2"
names(data)[8] <- "x3"
names(data)[9] <- "x4"
names(data)[10] <- "x5"
names(data)[11] <- "x6"
names(data)[12] <- "y"
```

---

# ANALISIS JENIS KELAMIN

```r
table(data$`jenis Kelamin`)
prop.table(table(data$`jenis Kelamin`))*100
```

## Hasil

- Perempuan: 29 responden (85.3%)
- Laki-laki: 5 responden (14.7%)

## Interpretasi
Hasil analisis menunjukkan bahwa distribusi responden berdasarkan jenis kelamin tidak seimbang, dengan dominasi perempuan yang sangat signifikan dibandingkan laki-laki. Kondisi ini mengindikasikan adanya ketidakseimbangan sampel (sample imbalance) yang dapat memengaruhi representasi hasil penelitian. Dalam konteks analisis statistik, ketidakseimbangan ini dapat menyebabkan bias karena persepsi mayoritas responden berasal dari kelompok perempuan. Oleh karena itu, hasil penelitian lebih merepresentasikan persepsi perempuan dibandingkan laki-laki dalam penggunaan Google Scholar.

---

# ANALISIS SEMESTER

```r
table(data$Semester)
prop.table(table(data$Semester))*100
```

## Hasil

- Semester 2: 5 responden (14.7%)
- Semester 4: 26 responden (76.5%)
- Semester 6: 3 responden (8.8%)

## Interpretasi

distribusi semester menunjukkan bahwa sebagian besar responden berasal dari semester 4. Hal ini mengindikasikan bahwa sampel penelitian didominasi oleh mahasiswa tingkat menengah yang kemungkinan sudah cukup familiar dengan penggunaan Google Scholar dalam kegiatan akademik. Sementara itu, jumlah responden dari semester awal dan akhir relatif kecil sehingga representasi kedua kelompok tersebut kurang seimbang. Kondisi ini dapat memengaruhi hasil analisis karena persepsi terhadap penggunaan Google Scholar bisa berbeda berdasarkan tingkat pengalaman akademik.

---

# ANALISIS DESKRIPTIF (MEAN)

```r
mean(data$x1)
mean(data$x2)
mean(data$x3)
mean(data$x4)
mean(data$x5)
mean(data$x6)
mean(data$y)
```


## Hasil Rata-rata (Mean)

- x1 = 4.12
- x2 = 3.74
- x3 = 4.03
- x4 = 3.44
- x5 = 3.65
- x6 = 4.00
- y  = 3.79

## Interpretasi 

Hasil analisis menunjukkan bahwa seluruh variabel memiliki nilai rata-rata yang berada di atas angka 3, yang berarti secara umum responden cenderung memberikan penilaian positif terhadap Google Scholar. Variabel dengan nilai tertinggi adalah x1 yang menunjukkan bahwa kemudahan akses Google Scholar dinilai sangat baik oleh responden. Selain itu, variabel x3 juga memiliki nilai tinggi yang menunjukkan bahwa kecepatan akses dalam menampilkan hasil pencarian dinilai memuaskan. Namun, variabel x4 memiliki nilai paling rendah yang menunjukkan bahwa kesesuaian hasil pencarian dengan topik masih menjadi aspek yang perlu ditingkatkan. Secara keseluruhan, variabel y menunjukkan tingkat kepuasan yang cukup tinggi, yang mengindikasikan bahwa Google Scholar secara umum diterima dengan baik oleh responden.

---

# STANDARD DEVIATION

```r
sd(data$x1)
sd(data$x2)
sd(data$x3)
sd(data$x4)
sd(data$x5)
sd(data$x6)
sd(data$y)
```

## Hasil

- x1 = 0.64  
- x2 = 0.75  
- x3 = 0.72  
- x4 = 0.70  
- x5 = 0.73  
- x6 = 0.65  
- y  = 0.73  

## Interpretasi

Nilai standar deviasi yang relatif kecil menunjukkan bahwa tingkat variasi jawaban antar responden tidak terlalu besar. Hal ini mengindikasikan bahwa persepsi responden terhadap Google Scholar cenderung seragam atau homogen. Variabel dengan standar deviasi tertinggi menunjukkan adanya sedikit perbedaan pendapat antar responden, namun secara keseluruhan data tetap menunjukkan konsistensi yang cukup baik. Kondisi ini memperkuat validitas hasil analisis deskriptif karena tidak terdapat perbedaan ekstrem dalam jawaban responden.

---

# VISUALISASI DATA

## 1. Grafik Jenis Kelamin

![Grafik Gender](output/grafik-gender.png)

### Penjelasan

Visualisasi data melalui diagram batang memperjelas bahwa responden perempuan mendominasi secara signifikan dibandingkan laki-laki. Hal ini memperkuat hasil analisis frekuensi sebelumnya bahwa terdapat ketidakseimbangan sampel berdasarkan gender. Ketidakseimbangan ini perlu diperhatikan dalam interpretasi hasil penelitian karena dapat menyebabkan bias dalam generalisasi hasil terhadap populasi yang lebih luas.

---

## 2. Grafik Semester

![Grafik Semester](output/grafik-semester.png)

### Penjelasan

Grafik distribusi semester menunjukkan bahwa mayoritas responden berada pada semester 4. Hal ini menunjukkan bahwa data lebih banyak merepresentasikan mahasiswa tingkat menengah. Kondisi ini penting untuk diperhatikan karena tingkat pengalaman akademik dapat memengaruhi cara mahasiswa dalam menggunakan Google Scholar, sehingga hasil penelitian lebih mencerminkan kelompok tersebut.

---

# NAIVE ESTIMATION

Naive estimation digunakan untuk menghitung proporsi sederhana responden yang merasa puas.

```r
puas <- sum(data$y >= 4)
n <- nrow(data)
naive <- puas/n
naive
```

## Hasil

0.7647 (76.47%)

## Interpretasi

Hasil naive estimation menunjukkan bahwa sekitar 76% responden memiliki tingkat kepuasan yang tinggi terhadap Google Scholar. Hal ini diperoleh dari responden yang memberikan nilai kepuasan keseluruhan (y) dengan skor 4 atau lebih. Hasil ini menunjukkan bahwa mayoritas pengguna merasa puas terhadap layanan Google Scholar, sehingga dapat disimpulkan bahwa platform ini efektif dalam mendukung kebutuhan pencarian jurnal ilmiah mahasiswa.

---

# WEIGHTING SEDERHANA

```r
prop_pop <- 0.50
prop_sample <- 0.147
w <- prop_pop/prop_sample
w
```

## Hasil

3.401361

## Interpretasi

Hasil weighting menunjukkan adanya ketidakseimbangan antara proporsi sampel dan populasi yang diasumsikan. Bobot sebesar 3.401 menunjukkan bahwa setiap responden laki-laki dalam sampel mewakili sekitar 3.4 individu dalam populasi. Teknik pembobotan ini digunakan untuk mengoreksi bias sampel agar hasil analisis lebih representatif terhadap kondisi populasi yang sebenarnya. Dengan demikian, hasil penelitian menjadi lebih akurat dalam menggambarkan distribusi populasi..

---

# KESIMPULAN
Berdasarkan hasil analisis data yang telah dilakukan, dapat disimpulkan bahwa:

1. Secara umum, mahasiswa Statistika menunjukkan tingkat kepuasan yang cukup tinggi terhadap penggunaan Google Scholar sebagai alat pencarian jurnal ilmiah. Hal ini terlihat dari hasil analisis deskriptif yang menunjukkan nilai rata-rata variabel berada pada kategori tinggi serta kecenderungan jawaban responden yang dominan positif.
2. Kemudahan akses dan kecepatan pencarian menjadi keunggulan utama Google Scholar yang paling dirasakan oleh mahasiswa. Kedua aspek ini dinilai sangat membantu dalam mempercepat proses pencarian referensi ilmiah, terutama dalam mendukung tugas kuliah dan kegiatan penelitian akademik.
3. Meskipun demikian, kesesuaian hasil pencarian dengan topik yang dicari masih menjadi kelemahan utama. Hal ini menunjukkan bahwa tingkat relevansi hasil pencarian belum sepenuhnya optimal sehingga masih diperlukan peningkatan agar hasil yang ditampilkan lebih sesuai dengan kebutuhan pengguna.
4. Berdasarkan hasil naive estimation, sebanyak 76,47% responden berada pada kategori puas terhadap penggunaan Google Scholar. Hal ini menunjukkan bahwa mayoritas mahasiswa memiliki pengalaman yang positif dalam menggunakan platform tersebut untuk kebutuhan akademik.
5. Secara keseluruhan, data menunjukkan tingkat homogenitas yang cukup tinggi antar responden. Hal ini ditandai dengan nilai standar deviasi yang relatif kecil, yang berarti bahwa persepsi mahasiswa terhadap Google Scholar tidak terlalu bervariasi dan cenderung seragam.

---

# PENUTUP

Penelitian ini memberikan gambaran mengenai pengalaman mahasiswa dalam menggunakan Google Scholar sebagai sumber referensi akademik. Hasil ini dapat digunakan sebagai bahan evaluasi dalam meningkatkan kualitas pencarian literatur ilmiah di masa depan.
