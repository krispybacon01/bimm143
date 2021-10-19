#' ---
#' title: "Class05 Data Visualization"
#' author: "Rui Huang (PID A15606522)"
#' date: "Oct 12, 2021"
#' ---

#class 05 data visualization
library(ggplot2)
p <- ggplot(data=cars) +
  aes(x=speed, y=dist) +
  geom_point() +
  geom_smooth(method="lm") 
  
p + labs(title="my nice plot",
         x="speed (MPH)")

url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"

genes <- read.delim(url)
head(genes)

nrow(genes)
table( genes$State )
#the % are up/down
prec <- table( genes$State )/nrow(genes)*100
round( prec,2 )

ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

x <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

x + labs(title="Gene Expression Changes Upon Drug Treatment",
         x="Control (no drug)",
         y="Drug Treatment")+ 
  scale_color_manual( values=c("blue","gray","red"))

library(gapminder)
head(gapminder)

library(gganimate)
ggplot(gapminder, aes(gdpPercap,lifeExp,size=pop,color=country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_color_manual(values = country_colors) +
  scale_size(range = c(2,12)) +
  scale_x_log10() +
  facet_wrap(~continent) + labs(title = 'Year: {frame_time}', x = 'GDP per capita',
                                y = 'life expectancy') +
transition_time(year) + shadow_wake (wake_length = 0.1, alpha = FALSE)

