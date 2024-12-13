# PURPOSE: Create new logo using ggplot, use a football field and add fake data

library(tidyverse)



# Create the field --------------------------------------------------------

# Lazily copy Quang's code
field <- ggplot() +
  annotate("rect",
           xmin = 160/3,
           xmax = 0,
           ymin = 15,
           ymax = 65,
           fill = scales::alpha("#21ae5f", 0.9)) +
  annotate("text", 
           y = seq(20, 60, 10),
           x = 12,
           color = "white",
           family = "Chivo",
           label = seq(10, 50, 10),
           size = 6,
           angle = 90) +
  annotate("text", 
           y = seq(20, 60, 10),
           x = 40,
           color = "white",
           family = "Chivo",
           label = seq(10, 50, 10),
           size = 6,
           angle = 270) +
  annotate("text", 
           y = setdiff(seq(15, 65, 1), seq(15, 65, 5)),
           x = 160/3,
           color = "white",
           label = "—") +
  annotate("text", 
           y = setdiff(seq(15, 65, 1), seq(15, 65, 5)),
           x = 0,
           color = "white",
           label = "—") +
  annotate("text", 
           y = setdiff(seq(15, 65, 1), seq(15, 65, 5)),
           x = 23.36667,
           color = "white",
           size = 3,
           label = "—") +
  annotate("text", 
           y = setdiff(seq(15, 65, 1), seq(15, 65, 5)),
           x = 29.96667,
           color = "white",
           size = 3,
           label = "—") +
  annotate("segment", 
           y = 15,
           yend = 65,
           x = c(160/3, 0),
           xend = c(160/3, 0),
           color = "white") +
  geom_hline(yintercept = seq(15, 65, 5), color = "white") +
  scale_size_identity() +
  scale_color_identity() +
  scale_linetype_identity() +
  scale_linewidth_identity() +
  scale_x_reverse() +
  guides(fill = guide_legend(override.aes = list(size = 5.4))) +
  labs(title = "Statistical Thinking in Sports Analytics",
       subtitle = "Ron Yurko",
       fill = NULL) +
  theme_minimal() +
  theme(plot.title = element_blank(),
        plot.subtitle = element_blank(),
        text = element_text(family = "Fira Sans", color = "#26282A"),
        panel.grid = element_blank(),
        legend.position = "top",
        legend.text = element_text(size = 10.5),
        legend.margin = margin(b = -22),
        axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank())


# Fake data to display on top ---------------------------------------------

set.seed(2024)
fake_points_title <- tibble(x = rnorm(10000, mean = 160/6, sd = 5.5),
                            y = rnorm(10000, mean = 45, sd = 4))

fake_points_subtitle <- tibble(x = rnorm(10000, mean = 160/6, sd = 2),
                               y = rnorm(10000, mean = 30, sd = 2))

field + 
  geom_point(data = fake_points_title, aes(x, y),
             color = "black", alpha = 0.35) +
  geom_point(data = fake_points_subtitle, aes(x, y),
             color = "black", alpha = 0.35) +
  annotate("text", 
           y = 45,
           x = 160/6,
           color = "white",
           family = "Chivo",
           label = "Statistical Thinking\nin Sports Analytics",
           size = 6) +
  annotate("text", 
           y = 30,
           x = 160/6,
           color = "white",
           family = "Chivo",
           label = "by Ron Yurko",
           size = 4)
# Kind of dig it... take that AI!


