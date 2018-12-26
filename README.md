### API from openweathermap
https://api.openweathermap.org/data/2.5/forecast?q=London,us&mode=xml&appid=648a3aac37935e5b45e09727df728ac2
1. above URL provide data in XML format, if required in json remove "mode=xml"
2. replace appid value with your own appid

### Getting Started
1. open the project DemoOpenWeather.xcodeproj to run the project
2. cmd+B to build the project, and cmd+R to run 

###  Features Implemented
1. Design pattern followed as MVVM
2. Integrated Weather API for up-to-date weather forecast for next 5 days
3. View weather forecasts of a city mentioned

### Unit Test Cases
1. Unit test case passed for Weather Model
2. Unit test case passed for WeatherView Model for web-service calling

### Missing Features
1. Showing all list of weather forecasts in single view of a city
2. Group the records according to date
3. UI needs to update for display record properly


