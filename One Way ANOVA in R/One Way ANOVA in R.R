# Load Libraies

library("dplyr")
library("rcompanion")
library("car")


#Question/Task: See how the views differ by Grade

#Testing assumptions

#Normality

plotNormalHistogram(YouTubeChannels$Video.views)

#Square root
YouTubeChannels$Video.viewsSQRT <- sqrt(YouTubeChannels$Video.views)
plotNormalHistogram(YouTubeChannels$Video.viewsSQRT)


#Homogeneity of Variance
bartlett.test(Video.viewsSQRT ~ Grade, data=YouTubeChannels)
# Does not meet the assumption for homogeneity of variance

#Unequal variance
ANOVA1 <- lm(Video.viewsSQRT ~ Grade, data=YouTubeChannels)
Anova(ANOVA1, Type="II", white.adjust=TRUE)

#Post Hocs with unequal variance
pairwise.t.test(YouTubeChannels$Video.viewsSQRT, YouTubeChannels$Grade, p.adjust="bonferroni", pool.sd = FALSE)

#Find the mean 
YouTubeChannelsMeans <- YouTubeChannels %>% group_by(Grade) %>% summarize(Mean = mean(Video.views))

#Conclusion:
#Higher grades gets more views. 

