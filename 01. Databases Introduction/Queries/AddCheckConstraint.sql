ALTER TABLE Users
ADD CONSTRAINT CHK_Users_Age CHECK (LEN([Password])>=5)