rural <- 22.4
urban <- 10.5
rural
urban
gap <- rural - urban
round(gap, 1)
# The employment rate among rural young women was 11.9 percentage points higher than among urban young women.
# putting numbers into a small table
results <- data.frame(
Area = c("Rural", "Urban"),
Female_WPR = c(rural, urban)
)
print(results)
# Chart 1:
bar_positions <- barplot(
height = results$Female_WPR,
names.arg = results$Area,
col = c("steelblue", "darkorange"),
ylim = c(0, 30),
main = "Young women's employment in Uttar Pradesh",
sub = "PLFS 2023-24 | Ages 15-29 | Usual status",
ylab = "Employed women as a percentage of all women aged 15-29"
)
text(
x = bar_positions,
y = results$Female_WPR,
labels = paste0(results$Female_WPR, "%"),
pos = 3
)
#Saving the chart
save_folder <- "D:/xyz/R-4.0.0/analysis"
dir.create(
save_folder,
recursive = TRUE,
showWarnings = FALSE
)
png(
filename = file.path(save_folder, "young_women_employment.png"),
width = 1800,
height = 1200,
res = 180
)
bar_positions <- barplot(
height = results$Female_WPR,
names.arg = results$Area,
col = c("steelblue", "darkorange"),
ylim = c(0, 30),
main = "Young women's employment in Uttar Pradesh",
sub = "PLFS 2023-24 | Ages 15-29 | Usual status",
ylab = "Worker Population Ratio (%)"
)
text(
x = bar_positions,
y = results$Female_WPR,
labels = paste0(results$Female_WPR, "%"),
pos = 3
)
dev.off()

