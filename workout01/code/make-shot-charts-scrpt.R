#title: make shots chart script
#description: make a dotplot for each of the five players' shot point and export as a pdf,
#             then use grid to combine all five players' shot point to gsw and export as a pdf and a png.
#inputs:shots-data.csv
#outputs:stephen-curry-shot-chart.pdf,klay-thompson-shot-chart.pdf,kevin-durant-shot-chart.pdf,draymond-green-shot-chart.pdf
#         andre-iguodala-shot-chart.pdf,gsw-shot-charts.pdf,gsw-shot-charts.png
library(ggplot2)
library(jpeg)
library(grid)
court_file <- "images/nba-court.jpg"
dat <- read.csv(file = "data/shots-data.csv", stringsAsFactors = FALSE)

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

curry_shot_chart <- ggplot(data = dat[dat$name == "Stephen Curry",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

klay_shot_chart <- ggplot(data = dat[dat$name == "Klay Thompson",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

kevin_shot_chart <- ggplot(data = dat[dat$name == "Kevin Durant",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()


draymond_shot_chart <- ggplot(data = dat[dat$name == "Draymond Green",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

andre_shot_chart <- ggplot(data = dat[dat$name == "Andre Iguodala",]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()


##4.1) Shot charts of each player
pdf(file = "images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()
pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart
dev.off()
pdf(file = "images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
kevin_shot_chart
dev.off()
pdf(file = "images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
draymond_shot_chart
dev.off()
pdf(file = "images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
andre_shot_chart
dev.off()

##4.2) Facetted Shot Chart
gsw_shot_chart <- ggplot(data = dat) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') +
  theme_minimal() + facet_wrap(~ name)


pdf(file = "images/gsw-shot-charts.pdf", width = 8, height = 7)
gsw_shot_chart
dev.off()

png(filename = "images/gsw-shot-charts.png",units = "in", width = 8, height = 7,res = 500)
gsw_shot_chart
dev.off()
