# File Name: PCA_plot.R
# Author: Kenan Tan
# Date: 2025-01-11
# Description: Description of the script

library(tidyverse)
library(RColorBrewer)

setwd("U:/code/r_plot/workspace/")

df <- read.csv("pca_df.csv")
df <- separate(df,X , into = c("genotype","stage","tissue","rep"), sep = "_")

ggplot(df, mapping = aes(x = PC1, y = PC2)) +
  geom_point(aes(color = tissue, shape = stage, fill = genotype), size = 4, 
             stroke = 1.5) +  # stroke用于控制边框宽度
  scale_color_brewer(palette = "Set1")  + # 使用ColorBrewer配色方案
  scale_fill_manual(values = c("bs1" = "grey", "WT" = "white")) +  # 实心与空心的填充色
  scale_shape_manual(values = c("W2.5" = 21, "W3" = 22, "W3.5" = 23)) +  # 设置不同阶段的形状
  labs(title = "PCA plot", x = "Principal Component 1", y = "Principal Component 2") + # 添加标题和坐标轴标签
  theme_bw(base_size = 15,base_rect_size = 1) +  # 使用简洁主题，并调整基础字体大小
  theme(legend.position = "right",legend.title = element_text(size = 12),legend.text = element_text(size = 10))  # 调整图例字体大小和位置
