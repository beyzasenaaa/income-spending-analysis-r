#Veriyi y??kleme
arasinav <- read.csv("C:/Users/90533/Desktop/h/istatistik/ist analiz/Ara s??nav/arasinav.txt", sep="")

#2000 g??zlem ??ekme
set.seed(22) 

data <- arasinav[sample(1:nrow(arasinav), 2000, replace = FALSE), ]

head(data) 
str(data)



# Gelir ve Harcama Kategorilerinin Se??imi
income <- data$Income
age <- data$Age
dependents <- data$Dependents
occupation <- data$Occupation
city <- data$City_Tier
rent <- data$Rent
loan <- data$Loan_Repayment
insurance <- data $Insurance
groceries <- data$Groceries
transport <- data$Transport
eating_out <- data$Eating_Out
entertainment <- data$Entertainment
utilities <- data$Utilities
healthcare <- data$Healthcare
education <- data$Education
miscellaneous <- data$Miscellaneous

#MEAN

min(age)
max(age)

#Ya?? Gruplar?? i??in G??reli Frekanslar
freq_18_25 <- age[age >= 18 & age < 25]
freq_26_35 <- age[age >= 26 & age < 35]
freq_36_50 <- age[age >= 36 & age < 50]
freq_51_65 <- age[age >= 51 & age < 65]

freq_18_25 <- age >= 18 & age < 25
freq_26_35 <- age >= 26 & age < 35
freq_36_50 <- age >= 36 & age < 50
freq_51_65 <- age >= 51 & age < 65


freq_18_25
freq_26_35
freq_36_50
freq_51_65

#Gelirlerin ya?? gruplar??na g??re y??ll??k gelir ortalamalar??
mean_income_18_25 <- mean(income[freq_18_25], na.rm = TRUE)
mean_income_26_35 <- mean(income[freq_26_35], na.rm = TRUE)
mean_income_36_50 <- mean(income[freq_36_50], na.rm = TRUE)
mean_income_51_65 <- mean(income[freq_51_65], na.rm = TRUE)

#Gelirlerin ya?? gruplar??na g??re ayl??k gelir ortalamalar??

cat("18-25 ya?? grubu ortalama gelir: ", mean_income_18_25 /12 , "\n")
cat("26-35 ya?? grubu ortalama gelir: ", mean_income_26_35 /12 , "\n")
cat("36-50 ya?? grubu ortalama gelir: ", mean_income_36_50 /12 , "\n")
cat("51-65 ya?? grubu ortalama gelir: ", mean_income_51_65 /12 , "\n")


#WILCOXON

#Ayl??k e??itim harcamas?? i??in g??ven aral?????? ve medyan
wilcox.test(education/12, conf.int = TRUE)

#Ya?? gruplar??na g??re ayl??k e??itim harcamas??i??in g??ven aral?????? ve medyan
wilcox.test(education[freq_18_25], conf.int = TRUE)
wilcox.test(education[freq_26_35], conf.int = TRUE)
wilcox.test(education[freq_36_50], conf.int = TRUE)
wilcox.test(education[freq_51_65], conf.int = TRUE)

#??RNEKLEM ORAN TEST??

x <- sum(city == "Tier_1")  
n <- length(city)           
p <- 0.5

test_result <- prop.test(x, n, p , alternative = "greater")

test_result

#ORAN TEST?? G??VEN ARALI??I
x <- sum(loan == 0)  
n <- length(loan)  

confidence_interval <- prop.test(x, n)

confidence_interval


#KORELASYON ANLAMLILI??INI TEST ETME
shapiro.test(groceries/12)
shapiro.test(eating_out/12)

correlation <- cor.test(groceries, eating_out, method = "spearman")  

correlation

library(ggplot2)

ggplot(data, aes(x = groceries/12, y = eating_out/12)) +
  geom_point(color = "steelblue", alpha = 0.7) +  
  geom_smooth(method = "lm", se = FALSE, color = "orchid3") +  
  labs(
    title = "Market ve Disarida Yemek Harcamalari Arasindaki Iliski",
    x = "Market Harcamalari",
    y = "D??sarida Yemek Harcamalari"
  ) + coord_cartesian(ylim = c(0,1000)) + theme_minimal()
  
  
  #GGPLOT
  
  library(ggplot2)
  
  ggplot(data, aes(x = groceries/12, y = eating_out/12)) +
    geom_point(color = "steelblue", alpha = 0.7) +  
    geom_smooth(method = "lm", se = FALSE, color = "orchid3") +  
    labs(title = "Market ve Disarida Yemek Harcamalari Arasindaki Iliski",
      x = "Market Harcamalar??",
      y = "Disarida Yemek Harcamalari") +
      coord_cartesian(ylim = c(0,1000))+
      theme_minimal()
 
  
#BAR GRAF?????? RENKLEND??RME
  
library(dplyr)
library(forcats)
library(ggplot2)

  
new_data <- data.frame(occupation, transport) %>%
  group_by(occupation) %>% 
  ##summarise(mean_entertainment = mean(transport/12, na.rm = TRUE)) %>%  
  mutate(occupation = fct_inorder(occupation)) 

# Grafik ??izimi
ggplot(data = new_data, aes(x = occupation, y = transport/12, fill = occupation)) +
  geom_bar(stat = "identity") + 
  labs(title = "Mesleklere G??re Ayl??k  Ula????m Harcamalar??",
    x = "Meslek Gruplari",
    y = "Ortalama Ulasim Harcamasi"
  ) +
  scale_fill_brewer(palette = "Blues") + theme_light()  


ggplot(data, aes(x = occupation, y = transport, fill = ..y..)) +
  geom_bar(stat = "summary", fun = "mean") +
  labs(title = "Mesleklere Gore Ortalama Ulasim Harcamalari",
    x = "Meslek Gruplari",
    y = "Ortalama Ulasim Harcamasi",
    fill = "Ortalama Harcama") +
  scale_fill_gradient(low = "orchid3", high = "steelblue") + 
  theme_minimal()


#GRAF????E YATAY VE D??KEY????ZG??LER EKLEMEK


ggplot(data) +
  aes(x = utilities, y = dependents) +
  geom_point() +
  geom_vline(
    xintercept = 10000,
    color = "orchid3",
    linetype = "dashed",
    size = 1.5
  ) +
  geom_hline(
    yintercept = 20000,
    color = "steelblue"
  ) +
  labs(
    title = "Utilities ve Dependents Arasindaki Iliski",
    x = "Kamu Hizmetleri Harcamalari",
    y = "Bagimli Sayisi??"
  ) +
  theme_minimal()


#FAKT??R D??ZEY?? ??????N BOXPLOT OLU??TURMA

library(ggplot2)
ggplot(data) +
  aes(x = occupation, y =income/12) +
  geom_boxplot() +
  labs(
    title = "Meslek Gruplarina Gore Gelir Duzeyi",
    x = "Meslek Gruplari",
    y = "Aylik Gelir "
  ) + coord_cartesian(ylim = c(0,25000))


max(income)




#H??STOGRAMA YO??UNLUK TAHM??N?? EKLEMEK
ggplot() +
  aes(x = age) +
  geom_histogram(aes(y = ..density..), bins = 20, fill = "steelblue", color = "gray2") +
  geom_density(color = "orchid3", size = 1.2) +
  labs(title = "Yas Dagilimi ve Yogunluk Egrisi",
   x = "Yas",
   y = "Yogunluk") +
  theme_minimal()



#QQPLOT OLU??TURMA
library(dplyr)
ggplot(data, aes(sample = income)) +
  stat_qq(color = "steelblue") +
  stat_qq_line(color = "orchid3") +
  labs(title = iconv("Gelir Degiskeninin Normal Dagilima Uygunlugu", to = "UTF-8"),
    x = ("Beklenilen Veri"),
    y = ("Gozlemlenen Veri"))+
  theme_minimal()


shapiro.test(income)


#DE??????KEN?? RENKLEND??RME

library(dplyr)

data <- data %>%
  mutate(transport_category = case_when(
    transport <= 5000 ~ "Dusuk",
    transport > 5000 & transport <= 20000 ~ "Orta",
    transport > 20000 ~ "Yuksek"
  ))

 

library(ggplot2)

ggplot(data) +
  aes(x = age, y = transport, color = transport_category) +
  geom_point() +
  scale_color_manual(values = c("steelblue", "orchid3", "darkorange")) +
  labs(
    title = "Degisken Renklendirme",
    x = "Yas",
    y = "Ulasim Harcamalari",
    color = "Harcama Seviyesi"
  ) +
  theme_minimal()




#BAS??T DO??RUSAL REGRESYON MODEL??

model <- lm(entertainment ~ income)

model


#??OKLU DO??RUSAL REGRESYON MODEL??

mul_model <- lm(income ~ age + city + occupation)

mul_model


#SUMMARY
summary(model)




#D??N????T??R??LLM???? VER?? REGRESYONU

transformed_model <- lm(log(income) ~ eating_out)
transformed_model
summary(transformed_model)


#REGRESYON MODEL??N??N ARTIK DE??ERLER??N?? G??RSELLE??T??RME

res <- lm(income ~ eating_out + transport )  
library(broom)
augmented_res <- augment(res)

library(ggplot2)
ggplot(augmented_res, aes(x = .fitted, y = .resid)) + 
  geom_point() + 
  labs(title = "Gelir ile Eglence Harcamalari Arasindaki g??rusal Regresyon Artik Degerleri",
       x = "Fitted Values (Tahmin Edilen De??erler)",
       y = "Residuals (Artik Degerler)") + 
  theme_minimal()


#ETK??L?? G??ZLEMLER?? TANIMLAMA

model1 <- lm(income ~ rent + transport  )

influential_obs <- influence.measures(model1)

summary(influential_obs)





#ONE WAY ANOVA

oneway <- oneway.test(transport ~ city)
oneway



#RMARKDOWN

install.packages("rmarkdown")
tinytex::reinstall_tinytex()
