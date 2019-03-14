#title: make shots data script
#description: make a summary for each of all five players shots data, then combine all five players data and make a summary of combination shots data.
#inputs:stephen-curry.csv,kevin-durant.csv,klay-thompson.csv,draymond-green.csv,andre-iguodala.csv
#outputs:stephen-curry-summary.txt,klay-thompson-summary.txt,kevin-durant-summary.txt,draymond-green-summary.txt,andre-iguodala-summary.txt
#         data/shots-data.csv,output/shots-data-summary.txt

curry <- read.csv(file = "data/stephen-curry.csv", stringsAsFactors = FALSE)
kevin <- read.csv(file = "data/kevin-durant.csv", stringsAsFactors = FALSE)
klay <- read.csv(file = "data/klay-thompson.csv", stringsAsFactors = FALSE)
draymond <- read.csv(file = "data/draymond-green.csv", stringsAsFactors = FALSE)
andre <- read.csv(file ="data/andre-iguodala.csv", stringsAsFactors = FALSE)

curry$name <- "Stephen Curry"
kevin$name <- "Kevin Durant"
klay$name <- "Klay Thompson"
draymond$name <- "Draymond Green"
andre$name <- "Andre Iguodala"

curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"
kevin$shot_made_flag[kevin$shot_made_flag == 'y'] <- "shot_yes"
kevin$shot_made_flag[kevin$shot_made_flag == 'n'] <- "shot_no"
klay$shot_made_flag[klay$shot_made_flag == 'y'] <- "shot_yes"
klay$shot_made_flag[klay$shot_made_flag == 'n'] <- "shot_no"
draymond$shot_made_flag[draymond$shot_made_flag == 'y'] <- "shot_yes"
draymond$shot_made_flag[draymond$shot_made_flag == 'n'] <- "shot_no"
andre$shot_made_flag[andre$shot_made_flag == 'y'] <- "shot_yes"
andre$shot_made_flag[andre$shot_made_flag == 'n'] <- "shot_no"

curry$minute <- curry$period *12 - curry$minutes_remaining
kevin$minute <- kevin$period *12 - kevin$minutes_remaining
klay$minute <- klay$period *12 - klay$minutes_remaining
draymond$minute <- draymond$period *12 - draymond$minutes_remaining
andre$minute <- andre$period *12 - andre$minutes_remaining

sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = 'output/klay-thompson-summary.txt')
summary(klay)
sink()

sink(file = 'output/kevin-durant-summary.txt')
summary(kevin)
sink()

sink(file = 'output/draymond-green-summary.txt')
summary(draymond)
sink()

sink(file = 'output/andre-iguodala-summary.txt')
summary(andre)
sink()

players <- rbind(curry,klay,kevin,draymond,andre)
write.csv(
  x = players,
  file = "data/shots-data.csv"
)

sink(file = 'output/shots-data-summary.txt')
summary(players)
sink()