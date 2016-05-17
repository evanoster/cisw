## ----df, message = FALSE-------------------------------------------------
library(dplyr)
bankData <- read.table("data/bank-full.csv",
                       header = T, sep = ";",
                       stringsAsFactors = F)
(bankData <- tbl_df(bankData))

## ----filter1-------------------------------------------------------------
filter(bankData,
       month %in% c("april", "may", "jun"), 
       default == "yes")

## ----ex-agg-soln1, opts.label="solution"---------------------------------
defaults <- filter(bankData, default == "yes")
nrow(defaults)
brokeEntrepreneurs <- filter(bankData, 
                             job == "entrepreneur", 
                             marital == "divorced", 
                             default == "yes")
nrow(brokeEntrepreneurs)

## ----select1-------------------------------------------------------------
select(bankData, age, job, default, balance, housing)

## ----arrange2------------------------------------------------------------
arrange(bankData, balance, default)

## ----arrange-exc---------------------------------------------------------
arrange(bankData, y, marital, desc(job), balance)

## ----mutate1-------------------------------------------------------------
mutate(bankData,
       DefaultFlag = ifelse(default == 'yes',
                              yes =  1,
                              no = 0)
)

## ----summarise-----------------------------------------------------------
summarise(group_by(bankData, default), Num = n())

## ----summarise2----------------------------------------------------------
summarise(group_by(bankData, default), ave_balance = mean(balance))

## ----summarise3----------------------------------------------------------
summarise(group_by(bankData, default),
          ave_balance = mean(balance),
          num = n()
)

## ----insideout-----------------------------------------------------------
arrange(filter(select(bankData, age, job, education, default), default == 'yes'), job, education, age)

## ----formatinsideout-----------------------------------------------------
arrange(
  filter(
    select(bankData, age, job, education, default), 
    default == 'yes'), 
  job, education, age)

## ----piping--------------------------------------------------------------
bankData %>% 
  select(age, job, education, default) %>%
  filter(default == 'yes') %>%
  arrange(job, education, age)

## ----groupsum------------------------------------------------------------
bankData %>% 
  group_by(job) %>%
  summarise(num = n(),
            ave_balance = mean(balance),
            num_defaults = sum(default == 'yes'),
            default_rate = num_defaults/num)

## ----pipeplot, fig.height = 3--------------------------------------------
library(ggplot2)
bankData %>% 
  filter(job %in% c("management", "technician", "unemployed")) %>%
  group_by(job, marital) %>% 
  summarise(Counts = n()) %>% 
  ggplot() + 
  geom_bar(aes(x = job, y = Counts, fill = marital),
           stat = 'identity', position = 'dodge')


## ----ex-pipe-soln--------------------------------------------------------
bankData %>% 
  group_by(job, housing) %>%
  summarise(Counts = n(),
            average_balance = mean(as.numeric(balance)),
            median_balance = median(as.numeric(balance)))

