# Whether, Sweater

**Whether, Sweater** is an backend application designed to help users plan their road trips by providing current and forecasted weather information for their destinations. This project follows a service-oriented architecture, with the back-end team responsible for developing and exposing the APIs that satisfy the requirements of the front-end team. There currently is no front end application. The backend was created based off of wireframes sent from the front end team and a json contract. 

## Features
- **API Communication:** The front-end team communicates with the back-end team through a set of well-defined APIs.
- **Weather Information:** The application integrates with weather APIs to retrieve and display current and forecasted weather data at user-selected destinations.
- **Real-time Updates:** The weather information is updated in real-time to provide accurate and up-to-date weather forecasts.
- **Data Validation:** To ensure data accuracy and reliability, the back-end team has implemented robust error handling and data validation mechanisms.
- **Collaborative Development:** Close collaboration with the front-end team is maintained to understand and fulfill their requirements effectively.
- **Performance Optimization:** The APIs are optimized for high performance and scalability, capable of handling a large number of concurrent requests.
- **Quality Assurance:** Unit tests are conducted, and code reviews are performed to maintain code quality and identify and fix any bugs or issues.

## Technologies Used
* ![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
* ![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
* ![Love](https://ForTheBadge.com/images/badges/built-with-love.svg)
- **APIs:** MapQuest Geocoding Api, Weather Api

## Running On
  - Rails 7.0.4
  - Ruby 3.1.1

## Testing
- **Framework:** RSpec 


## Getting Started
To set up **Whether, Sweater** locally, follow the instructions below:

1. Fork & Clone the repository
2. Install the required dependencies using bundler:
```
bundle install
```
3. Set up the database by running the following commands:
```
rails db:{drop,create,migrate}
```
### Configure API keys: 
4. Go to [Mapquest_API](https://developer.mapquest.com/documentation/geocoding-api/) to sign up for your api key.

5. Go to [Weather_API](https://www.weatherapi.com/) to sign up for your api key.

6. Create application.yml file
```
bundle exec figaro install
```
7. Now add your API keys into the newly created application.yml file like this:
```
WEATHER_API_KEY: <your_weather_api_key_here>
MAPQUEST_API_KEY: <your_mapquest_api_key_here>
```
### Run
```
bundle exec rspec
```
All tests should be passing!

## Usage
Once you have completed the installation steps, you can use the endpoints built in this backend application to return the specified information to use for a front end application. 

### **Information sent:**

- **Weather info:**
  - a data attribute, under which all other attributes are present:
    - attributes, an object containing weather information
      - current_weather, holds current weather data:
        - last_updated, in a human-readable format such as “2023-04-07 16:30”
        - temperature, floating point number indicating the current temperature in Fahrenheit
        - feels_like, floating point number indicating a temperature in Fahrenheit
        - humidity, numeric (int or float)
        - uvi, numeric (int or float)
        - visibility, numeric (int or float)
        - condition, the text description for the current weather condition
        - icon, png string for current weather condition
      - daily_weather, array of the next 5 days of daily weather data:
        - date, in a human-readable format such as “2023-04-07”
        - sunrise, in a human-readable format such as “07:13 AM”
        - sunset, in a human-readable format such as “08:07 PM”
        - max_temp, floating point number indicating the maximum expected temperature in Fahrenheit
        - min_temp, floating point number indicating the minimum expected temperature in Fahrenheit
        - condition, the text description for the weather condition
        - icon, png string for weather condition
      - hourly_weather, array of all 24 hour’s hour data for the current day:
        - time, in a human-readable format such as “22:00”
        - temperature, floating point number indicating the temperature in Fahrenheit for that hour
        - conditions, the text description for the weather condition at that hour
        - icon, string, png string for weather condition at that hour

- **Road Trip Info:**
  - a data attribute, under which all other attributes are present:
    - attributes, an object containing road trip information:
      - start_city, string, such as “Cincinatti, OH”
      - end_city, string, such as “Chicaco, IL”
      - travel_time, string, something user-friendly like “2 hours, 13 minutes” or “2h13m” or “02:13:00” or something of that nature (you don’t have to include seconds); set this string to “impossible route” if there is no route between your cities
      - weather_at_eta, conditions at end_city when you arrive (not CURRENT weather), object containing:
        - datetime, date and time for the reported weather at the destination at the approximate hour of arrival
        - temperature, numeric value in Fahrenheit
        - condition, the text description for the weather condition at that hour
        - note: this object will be blank if the travel time is impossible


## Goals
Expose an API that aggregates data from multiple external APIs
Expose an API that requires an authentication token
Expose an API for CRUD functionality
Determine completion criteria based on the needs of other developers
Test both API consumption and exposure