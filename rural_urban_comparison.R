# Employment categories among female workers in Uttar Pradesh
# Source: PLFS 2023-24, Table 19

employment_comparison <- data.frame(
  Category = c(
    "Own-account worker / employer",
    "Helper in household enterprise",
    "Regular wage / salary",
    "Casual labour"
  ),
  Rural = c(41.1, 48.9, 2.9, 7.1),
  Urban = c(32.1, 24.1, 39.8, 4.0)
)

# Convert the rural and urban columns into the format
# required by barplot().
chart_values <- t(
  as.matrix(employment_comparison[, c("Rural", "Urban")])
)

draw_comparison_chart <- function() {
  
  # Bottom, left, top and right margins.
  # The large right margin provides a separate place for the legend.
  par(
    mar = c(8, 15, 6, 11),
    xpd = NA
  )
  
  bar_positions <- barplot(
    height = chart_values,
    beside = TRUE,
    horiz = TRUE,
    names.arg = employment_comparison$Category,
    las = 1,
    col = c("steelblue", "darkorange"),
    border = NA,
    xlim = c(0, 60),
    main = "",
    xlab = ""
  )
  
  # A two-line title prevents it from being cut off.
  mtext(
    "Employment types among female workers",
    side = 3,
    line = 2.2,
    font = 2,
    cex = 1.15
  )
  
  mtext(
    "in Uttar Pradesh",
    side = 3,
    line = 0.7,
    font = 2,
    cex = 1.15
  )
  
  # Place the legend outside the bars, in the right margin.
  legend(
    x = 61,
    y = max(bar_positions),
    legend = c("Rural", "Urban"),
    fill = c("steelblue", "darkorange"),
    border = NA,
    bty = "n",
    cex = 0.9,
    xpd = NA
  )
  
  mtext(
    "Percentage of female workers",
    side = 1,
    line = 3
  )
  
  mtext(
    "Source: PLFS 2023-24, Table 19 | Usual status (ps+ss)",
    side = 1,
    line = 5.5,
    cex = 0.75
  )
}

# Display the chart in RStudio.
draw_comparison_chart()

# Create the output folder if it does not already exist.
dir.create("outputs", showWarnings = FALSE)

# Save a publication-quality copy.
png(
  filename = "outputs/rural_urban_female_employment_comparison.png",
  width = 2400,
  height = 1500,
  res = 180
)

draw_comparison_chart()

# Finish saving the PNG.
dev.off()