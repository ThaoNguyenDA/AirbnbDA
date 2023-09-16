library(tidyverse)
ggplot(data = amsterdam_weekdays) +
  geom_bar(mapping = aes(x = room_type))
mean(filter(amsterdam_weekdays, room_type == "Private room")$realSum)
