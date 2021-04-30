data <- read.csv("input.csv")
data[is.na(data)] <- 0
model <- glm(true_crime~white+income + events_count+pop, data=data, family=poisson())
summary(model)
data <- read.csv("in_final_3.csv")
data[is.na(data)] <- 0
data$predicted <- predict(model, data, type="response")
write.csv(data, "final_output.csv")