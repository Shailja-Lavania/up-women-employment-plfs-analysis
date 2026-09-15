# Store the four PLFS employment categories for rural female workers in UP
rural_women <- data.frame(
  Category = c(
    "Own-account worker / employer",
    "Helper in household enterprise",
    "Regular wage / salary",
    "Casual labour"
  ),
  Percentage = c(41.1, 48.9, 2.9, 7.1)
)

# Check that the four categories add up to 100%
sum(rural_women$Percentage)

# This function draws the chart
draw_rural_chart <- function() {
  
  # Increase the bottom and left margins to make room for labels
  par(mar = c(8, 15, 5, 3))
  
  # rev() reverses the rows, placing the first category at the top
  values <- rev(rural_women$Percentage)
  labels <- rev(rural_women$Category)
  
  bar_positions <- barplot(
    height = values,
    names.arg = labels,
    horiz = TRUE,
    las = 1,
    col = "steelblue",
    border = NA,
    xlim = c(0, 60),
    main = "Employment types among rural women workers in UP",
    xlab = ""
  )
  
  # Add percentage labels at the end of each bar
  text(
    x = values,
    y = bar_positions,
    labels = paste0(values, "%"),
    pos = 4
  )
  
  # Put the axis label and source note on separate lines
  mtext(
    "Percentage of rural female workers",
    side = 1,
    line = 2.3
  )
  
  mtext(
    "Source: PLFS 2023-24, Table 19 | Usual status (ps+ss)",
    side = 1,
    line = 5,
    cex = 0.75
  )
}

# Make a local folder for saved outputs
dir.create("outputs", showWarnings = FALSE)

# Show the chart in RStudio
draw_rural_chart()

# Save the same chart as a PNG file
png(
  filename = "outputs/rural_female_employment_types.png",
  width = 2000,
  height = 1200,
  res = 180
)

draw_rural_chart()

# Finish and close the saved image
dev.off()



