# MEMANGGIL PACKAGE
library(readxl)

# IMPORT DATA EXCEL
data <- read_excel("C:/Users/ASUS/Documents/abel/teksam fiks.xlsx")

# MELIHAT NAMA KOLOM
names(data)

# MELIHAT DATA
head(data)

# =========================
# RENAME VARIABEL PERTANYAAN
# =========================
# Timestamp dan Nama Lengkap tidak digunakan

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

png("grafik-gender.png")

barplot(table(data$`jenis Kelamin`),
        main = "Distribusi Jenis Kelamin",
        xlab = "Jenis Kelamin",
        ylab = "Frekuensi")

dev.off()

# =========================
# GRAFIK SEMESTER
# =========================

png("grafik-semester.png")

barplot(table(data$Semester),
        main = "Distribusi Semester",
        xlab = "Semester",
        ylab = "Frekuensi")

dev.off()

# =========================
# NAIVE ESTIMATION
# =========================

puas <- sum(data$y >= 4)

n <- nrow(data)

naive <- puas/n

naive

# =========================
# WEIGHTING SEDERHANA
# =========================

prop_pop <- 0.50

prop_sample <- 0.147

w <- prop_pop/prop_sample

w

# =========================
# WEIGHTED ESTIMATION
# =========================

weighted_estimation <- naive * w

weighted_estimation

# =========================
# RINGKASAN DATA
# =========================

summary(data)

# =========================
# HASIL AKHIR
# =========================

cat("Naive Estimation =", naive, "/n")

cat("Weighted Estimation =", weighted_estimation, "/n")
