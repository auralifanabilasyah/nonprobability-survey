library(readxl)

# =========================
# IMPORT DATA EXCEL
# =========================

data <- read_excel("C:/Users/ASUS/Documents/abel/teksam fiks.xlsx")

# =========================
# MELIHAT NAMA KOLOM DAN DATA
# =========================

names(data)

head(data)

# =========================
# RENAME VARIABEL
# Timestamp dan Nama Lengkap tidak digunakan
# =========================

names(data)[6] <- "x1"
names(data)[7] <- "x2"
names(data)[8] <- "x3"
names(data)[9] <- "x4"
names(data)[10] <- "x5"
names(data)[11] <- "x6"
names(data)[12] <- "y"

# =========================
# FREKUENSI JENIS KELAMIN
# =========================

table(data$`jenis Kelamin`)

prop.table(table(data$`jenis Kelamin`))*100

# =========================
# FREKUENSI SEMESTER
# =========================

table(data$Semester)

prop.table(table(data$Semester))*100

# =========================
# ANALISIS DESKRIPTIF
# =========================

mean(data$x1)
mean(data$x2)
mean(data$x3)
mean(data$x4)
mean(data$x5)
mean(data$x6)
mean(data$y)

# =========================
# STANDARD DEVIATION
# =========================

sd(data$x1)
sd(data$x2)
sd(data$x3)
sd(data$x4)
sd(data$x5)
sd(data$x6)
sd(data$y)

# =========================
# GRAFIK JENIS KELAMIN
# =========================

png("grafik-gender.png", width = 800, height = 600)

barplot(table(data$`jenis Kelamin`),
        main = "Distribusi Jenis Kelamin",
        xlab = "Jenis Kelamin",
        ylab = "Frekuensi")

dev.off()

# =========================
# GRAFIK SEMESTER
# =========================

png("grafik-semester.png", width = 800, height = 600)

barplot(table(data$Semester),
        main = "Distribusi Semester",
        xlab = "Semester",
        ylab = "Frekuensi")

dev.off()

# =========================
# NAIVE ESTIMATION
# =========================

# Menghitung jumlah responden puas
# (jawaban kepuasan >= 4)

puas <- sum(data$y >= 4)

# Menghitung total responden

n <- nrow(data)

# Rumus Naive Estimation
# P̂ = Jumlah Setuju / Total Responden

naive <- puas/n

# Menampilkan hasil

naive

cat("Naive Estimation =", naive, "/n")

# =========================
# WEIGHTING SEDERHANA
# =========================

# Proporsi populasi diasumsikan 50%

prop_pop <- 0.50

# Proporsi sampel laki-laki

prop_sample <- 0.147

# Menghitung bobot

w <- prop_pop/prop_sample

# Menampilkan hasil weighting

w

cat("Bobot Weighting =", w, "/n")

# =========================
# RINGKASAN DATA
# =========================

summary(data)

# =========================
# MELIHAT LOKASI FILE GRAFIK
# =========================

getwd()w, "\n")
