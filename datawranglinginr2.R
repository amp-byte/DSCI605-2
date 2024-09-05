#install tidyverse package
#install.packages("tidyverse")

# 1. Load the library
library(tidyverse)

# 2. Set the working directory
setwd("/Users/ampops/Desktop/dsci605/module2")

# 3. Read csv file into R using the function read_csv().
Salaries <- read_csv("/Users/ampops/Desktop/dsci605/module2/Salaries.csv")

# View(Salaries)
# class(Salaries)

# 4. Use select(), filter(), group_by(), count() in this part and combine them with pipe operator
# + Assign the output to a new object named "Salaries_new." "Salaries_new" should have four columns now. 
# + Order the steps by
#   - Select some columns
#   - Filter the data where "salary" is not missing value.
#   - Group the data based on the columns of "rank", "discipline", "sex"
#   - Get the tally count of the observation

Salaries_new <- Salaries %>% 
  select(rank, discipline, sex, salary) %>% 
  filter(salary != 0) %>% 
  group_by(rank, discipline, sex) %>% 
  count(rank, discipline, sex)

# view(Salaries_new)

# 5. using spread() to transfer the "sex" column to many more columns based on the values in sex.
# Use spread(): spread(data, key, value, fill = NA, convert = FALSE, drop = TRUE, sep = NULL)
# + Please use the data frame "Salaries_new" for the spread() operation
# + Please split the column "sex" in the data frame "Salaries_new" to many more columns based on the values in sex
# + Have the values of n(tally count) for the new columns.
# + Fill the missing value with "FALSE" by setting "fill=FALSE"
# + Assign the output to an object "wide"
# + Use pipe operator in this case

wide <- Salaries_new %>%
  spread(sex, n, fill = FALSE, convert = FALSE, drop = TRUE, sep = NULL)

# view(wide)

# 6. Reshape the table from wide to long: using gather() to combine multiple "sex" related columns to one column sex
# Use gather(): gather(data, key, value, ..., na.rm = FALSE, convert = FALSE, factor_key = FALSE)
# + Please reshape the data frame "wide" obtained from spread() into the long table 
# + In the spread() step, you will get two columns about sex "Female" and "Male"
# + Please make the two sex columns into one column and name the column as "sex"
# + Please have the values in the two sex columns for a new column "n" (tally count)
# + Remove the NA by setting "na.rm=TRUE"
# + Use pipe operator in this case

long <- wide %>% 
  gather(sex, n, Female, Male, na.rm = TRUE, convert = FALSE, factor_key = FALSE)

# view(long)
