library(tidyverse)
kindofroom <- unique(amsterdam_weekdays$room_type)

private_superhost <- mean(filter(amsterdam_weekdays, 
                                 room_type == "Private room" & host_is_superhost == "True")$realSum)

private_nosuperhost <- mean(filter(amsterdam_weekdays, 
                                   room_type == "Private room" & host_is_superhost == "False")$realSum)

entirehouse_superhost <- mean(filter(amsterdam_weekdays, 
                                     room_type == "Entire home/apt" & host_is_superhost == "True")$realSum)

entirehouse_nosuperhost <- mean(filter(amsterdam_weekdays, 
                                       room_type == "Entire home/apt" & host_is_superhost == "False")$realSum)

shareroom_superhost <- mean(filter(amsterdam_weekdays, 
                                   room_type == "Shared room" & host_is_superhost == "True")$realSum)

shareroom_nosuperhost <- mean(filter(amsterdam_weekdays, 
                                   room_type == "Shared room" & host_is_superhost == "False")$realSum)

roomprice <- tribble(
  ~room_type, ~price,
  "Private room with superhost"      , private_superhost,
  "Private room with no superhost"   , private_nosuperhost,
  "Entire home/apt with superhost"   , entirehouse_superhost, 
  "Entire home/apt with no superhost", entirehouse_nosuperhost, 
  "Share room with superhost"        , shareroom_superhost, 
  "Sahre room with no superhost"     , shareroom_nosuperhost
)

ggplot(data = roomprice) +
  geom_bar(
    mapping = aes(x = room_type, y = price, fill = room_type), stat = "identity")+
  theme(strip.text = element_blank())+
  labs(title="The price value of type of room with superhost/no superhost",
       x = "Type of room with superhost/no superhost",
       y = "The price value")

ggplot(data = amsterdam_weekdays, mapping = aes(x = dist, y = realSum)) +
  geom_point(aes(color = host_is_superhost)) +
  geom_smooth(se = FALSE)+
  facet_wrap(~ room_type, nrow = 3) +
  labs(title="Price of room by the chnage of distance from city center",
       x = "Distance from city center",
       y = "Price")+
  scale_y_continuous(limits=c(0,4000), labels = scales::comma)

ggplot(data = amsterdam_weekdays, mapping = aes(x = metro_dist, y = realSum)) +
  geom_point(aes(color = host_is_superhost)) +
  geom_smooth(se = FALSE)+
  facet_wrap(~ room_type, nrow = 3) +
  labs(title="Price of room by the chnage of distance from metro station",
       x = "Distance from metro station",
       y = "Price")
  ##scale_y_continuous(limits=c(0,4000), labels = scales::comma)

ggplot(data = amsterdam_weekdays, mapping = aes(x = cleanliness_rating, y = realSum)) +
  geom_point(aes(color = host_is_superhost)) +
  geom_smooth(se = FALSE)+
  facet_wrap(~ room_type, nrow = 3) +
  labs(title="Price of room by the chnage of distance from metro station",
       x = "Distance from metro station",
       y = "Price")

cleanrate_entirehome <- unique(filter(amsterdam_weekdays, 
                                      room_type == "Entire home/apt")$cleanliness_rating)
cleanrate_private <- unique(filter(amsterdam_weekdays, 
                                  room_type == "Private room")$cleanliness_rating)
cleanrate_shareroom <- unique(filter(amsterdam_weekdays, 
                                     room_type == "Shared room")$cleanliness_rating)
cleanrating_for_entirehome = c()
average_price
for (i in cleanrate_entirehome){
  
}


