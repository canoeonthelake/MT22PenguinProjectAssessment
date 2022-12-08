# Gentoo linear regression figure
plot_gentoo_figure <- function(gentoo_massbill){
  gentoo_massbill %>% 
  ggplot(aes(x = culmen_length_mm, 
             y = body_mass_g)) + 
  geom_point() +
  geom_smooth(method = "lm") +
  annotate("text", x=54, y=6500, label= "y = 109.46x - 123.83") +
  labs(title = "Linear regression of bill length and body mass of Gentoo penguins",
       x = "Bill length (mm)",
       y = "Body mass (g)") +
  theme_bw()
}

#Gentoo piecewise regression figure
plot_segmented_figure <- function(gentoo_segments){
  gentoo_segments %>% 
ggplot(aes(x = culmen_length_mm, 
           y = body_mass_g)) + 
  geom_point(alpha = 0.3) +
  geom_line(aes(x = culmen_length_mm, 
                y = fitted_seg1), 
            colour = "blue") + 
    labs(title = "Piecewise regression of bill length and body mass of Gentoo penguins",
         x = "Bill length (mm)",
         y = "Body mass (g)") +
  theme_bw()
}

# Save the gentoo plot as a png and define the size, resolution, and scaling
save_gentoo_plot_png <- function(gentoo_massbill, 
                                 filename, size, res, scaling){
  agg_png(filename, width = size, 
                    height = size, 
                    units = "cm", 
                    res = res, 
                    scaling = scaling)
  gentoo_plot <- plot_gentoo_figure(gentoo_massbill)
  print(gentoo_plot)
  dev.off()
}


# Save the segmented gentoo plot as a png and define the size, resolution, and scaling
save_segmented_plot_png <- function(gentoo_segmented_data, 
                                 filename, size, res, scaling){
  agg_png(filename, width = size, 
          height = size, 
          units = "cm", 
          res = res, 
          scaling = scaling)
  gentoo_plot <- plot_segmented_figure(gentoo_segmented_data)
  print(segmented_plot)
  dev.off()
}
