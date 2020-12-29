#Edited by: Sulaiman Hawibowo
#Self Assessment for Basic Statistic with R Language

#Soal1. Lakukan uji univariat terhadap masing-masing variabel sales dan profit (mean, median, standar deviasi, dan variansi)! 
#Jelaskan arti dari masing-masing angka tersebut!
case_1 = read.csv("dataset_superstore_simple.csv")
#Case1
attach(case_1)
summary(case_1)
mean(sales)
mean(profit)
median(sales)
median(profit)
sd(sales)
sd(profit)
var(sales)
var(profit)

#Grafik apa yang paling sesuai untuk memvisualisasikan histori sales selama tahun 2015? Buatlah visualisasinya!
#Case2
case_1 = read.csv("dataset_superstore_simple.csv")
attach(case_1)
case_1$order_date = as.Date(case_1$order_date)
str(case_1)
order(case_1$order_date)
sorted = case_1[order(case_1$order_date),]
sorted_date = subset(sorted, order_date >= "2015-01-01" & order_date <= "2015-12-31")
attach(sorted_date)
count = table(order_date)    
View(count)
barplot(count)
count2 = table(sales)
View(count2)
barplot(count2)

#Apakah ada korelasi antara variabel sales dan profit? 
#Case3
case_1 = read.csv("dataset_superstore_simple.csv")
attach(case_1)
korelasi = cor(profit,sales)

#Visualisasi data apa yang cocok untuk menjelaskan hubungan antara variabel sales dan profit untuk tahun 2015-2016? Buatlah visualisasinya!
#Case4
sorted_date2 = subset(sorted, order_date >= "2015-01-01" & order_date <= "2016-12-31")
attach(sorted_date2)
scatter.smooth(x = sales, y = profit)
barplot(sales)
plot(sales,profit, type = "l")

#Buatlahmodelregresiuntukmemprediksivariabelprofit.Jelaskanhasildarimodel yang kamu dapatkan, dan berilah rekomendasi kepada manajemen perusahaan tersebut.
#Case5
case_5 = read.csv("dataset_superstore_simple.csv")
attach(case_5)
cor(segment, profit)
cor(sales,profit)
linearmod = lm(profit ~ sales + quantity)
print(linearmod)
summary(linearmod)

# 6. Misalkan perusahaan e-commerce superstore sedang melakukan A/B Testing
terhadap platformnya dengan melakukan modifikasi layout web. Dari 10.000 sampel untuk masing-masing versi (versi lama & versi baru), didapatkan data bahwa yang akhirnya melakukan pembelian adalah 1.530 pengguna untuk versi lama, dan 1.970 untuk versi baru. Lakukan uji hipotesis dari data yang didapat, dan berilah rekomendasi untuk manajemen apa yang harus dilakukan!

#Case6
prop.test(c(1530,1970), c(10000,10000))
