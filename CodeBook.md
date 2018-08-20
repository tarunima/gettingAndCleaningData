## Codebook for Course Project Getting and Cleaning Data

The cleaned data is saved in tidy_data.txt. 

For every subject and activity identified by column "subject" and "activity", the following variables were extracted from the comprehensive sensor data to create this data set:
- Time and Frequency data for following for each of the three dimensions (X,Y,Z):
  - Body Accelerometer Mean 
  - Body Accelerometer Standard Deviation
  - Gravity Accelerometer Mean
  - Gravity Accelerometer Standard Deviation
  - Body Accelerometer Jerk Mean 
  - Body Accelerometer Jerk Standard Deviation
  - Body Gyrometer Mean
  - Body Gyrometer Standard Deviation
  - Body Gyrometer Jerk Mean
  - Body Gyrometer Jerk Standard Deviation
  - Body Acceloremeter Magniture mean
  - Body Acceloremeter Magniture Standard Deviation
  - Gravity Accelerometer Magniture mean
  - Gravity Accelerometer Magniture Standard Deviation
  - Body Gyro Magnitude Mean
  - Body Gyro Magnitude Standard Deviation
  - Body Gyro Jerk Magitude Mean
  - Body Gyro Jerk Magnitude Standard Deviation
  
  
# Cleaning Column Names:
- Substituting '()' with blank- such as mean() becomes mean.
- Expanding letter prefixes of 't' and 'f' and 'time' and 'frequency'.
- Substituting the first '-' with blank.
