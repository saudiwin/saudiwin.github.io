# descriptives for kais saied survey

library(tidyverse)
library(qualtRics)
library(ggplot2)
library(lubridate)
library(forcats)
library(cmdstanr)
library(bayesplot)
library(ggthemes)
library(RRreg)
library(rr)
library(readxl)
library(gt)

knitr::opts_chunk$set(message = F,warning = F)

run_sim <- F

set.seed(7364001)

# load census data

census <- read_xls("data/tunisia_pop_census_2014.xls") %>%
  select(gender="Sex: Name",
         gov="Regions: Name",
         pop="Facts: Value",
         age_cat="Age group: Name") %>%
  filter(!(gov %in% c("Tunisia","North East",
                      "North West","Center East",
                      "Center West","South East",
                      "South West"))) %>%
  filter(!(age_cat %in% c("0-4","5-9","10-14"))) %>%
  mutate(gov=str_remove(gov, "Governorate of "),
         gov=factor(gov),
         age_cat=factor(age_cat,
                        levels=c("15-19",
                                 "20-24","25-29","30-34",
                                 "35-39","40-44","45-49",
                                 "50-54","55-59",
                                 "60-64","65-69","70-74",
                                 "75-79","80 year and more")),
         age_cat_order=ordered(age_cat),
         gov=case_match(gov,
                        'Medenine'~"Médenine",
                        'Gabes'~"Gabès",
                        'du Kef'~"Le Kef",
                        'Beja'~"Béja",
                        'Manouba'~"Mannouba",
                        .default=gov),
         pop=ifelse(age_cat=="15-19",pop*(2/5),pop),
         prop=pop/sum(pop))

# load survey data

survey_data <- read_csv("data/kais_survey.csv") %>%
  mutate(kais_rr=factor(kais_rr, exclude=NA),
         kais_direct=factor(kais_direct, exclude=NA)) %>%
  mutate(kais_rr=factor(kais_rr,
                        levels=c("One of the two statements is true.",
                                 "Both statements are true OR neither is true.")),
         kais_rr_num=as.numeric(kais_rr)-1,
         kais_direct=factor(kais_direct,levels=c("No","Yes")),
         kais_direct_num=as.numeric(kais_direct)-1,
         kais_combined=coalesce(kais_rr_num,kais_direct_num),
         duration=scale(`Duration (in seconds)`),
         start_date_num=scale(StartDate),
         treatment=as.numeric(!is.na(FL_63_DO_saied_sensitive)))

# load screener data

screener_data <- read_csv("data/kais_screener_survey.csv") %>%
  select(ExternalReference="ResponseId",
         age_cat,gov,gender_screener="gender")

screener_data <- mutate(screener_data,
                        age_cat=factor(age_cat,
                                       labels=levels(census$age_cat)),
                        age_cat_order=ordered(age_cat))

survey_data <- left_join(survey_data,screener_data,by="ExternalReference") %>%
  mutate(gender=coalesce(as.character(gender),
                         as.character(gender_screener)),
         gender=ordered(gender, levels=c("Male","Female","Other:")))

# load cmdstan model

sen_mod <- cmdstan_model("data/beta_mod.stan")

# need complete dataset

comp_data_rr <- survey_data %>%
  mutate(gender=factor(gender, exclude=NA)) %>%
  filter(!is.na(gender),!is.na(kais_rr)) %>%
  mutate(kais_rr=factor(kais_rr,
                        levels=c("One of the two statements is true.",
                                 "Both statements are true OR neither is true.")),
         kais_rr_num=as.numeric(kais_rr)-1,
         duration=scale(`Duration (in seconds)`),
         start_date_num=scale(StartDate))

comp_data_direct <- survey_data %>%
  filter(!is.na(gender),!is.na(kais_direct))

# plot of direct responses

comp_data_direct %>%
  ggplot(aes(x=kais_direct)) +
  geom_bar() +
  theme_tufte() +
  labs(x="",y="") +
  ggtitle("Responses to Question",
             subtitle="Do you oppose President Kais Saied's moves to change Tunisia's constitution\nand close the parliament?")

ggsave("direct_response.png",scale=0.7)

# plot of randomized responses

comp_data_rr %>%
  ggplot(aes(x=kais_rr)) +
  geom_bar() +
  theme_tufte() +
  labs(x="",y="") +
  ggtitle("Responses to Randomized Question",
          subtitle="Is your mother's birthdate in first three months or do you oppose Kais Saied?")

ggsave("randomized_response.png",scale=0.7)
