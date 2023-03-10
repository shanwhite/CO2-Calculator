// system that calculates the carbon footprint of the user (focuses on travelling by car)
// prompts user for start and end points of their journey
// calculates mileage for shortest route from start to end
// calculates tonnes of co2 produced (carbon footprint)


import controlP5.*;

ControlP5 cp5;


void setup()
{
  size(1920,980);
  background(179,224,242);
  // stroke(0);
  
  // getting user input for the coordinates of the start and end locations 
  // user input section is adapted from Input.pde in the second tab
  
  // values are then split into latitude and longitude to calculate the distance between the locations
  String location1 = getString("Coordinates of Start Location: ");
  String[] loc1 = split(location1, ',');      // separates coordinates into latitude and longitude and stores them in an array
  double lat1 = Double.parseDouble(loc1[0]);  // assign first value as latitude
  double lon1 = Double.parseDouble(loc1[1]);  // assign second value as longitude
  
  String location2 = getString("Coordinates of End Location: ");
  String[] loc2 = split(location2, ',');
  double lat2 = Double.parseDouble(loc2[0]);
  double lon2 = Double.parseDouble(loc2[1]);
  
  
  
  // calculation of mileage using Haversine formula
  /* code is adapted from https://www.geeksforgeeks.org/haversine-formula-to-find-distance-between-two-points-on-a-sphere/
     modified the calculation for the distance between two points to conform to processing rules*/
  // distance between latitudes and longitudes
  double dLat = Math.toRadians(lat2 - lat1);
  double dLon = Math.toRadians(lon2 - lon1);
  
  // convert to radians
  lat1 = Math.toRadians(lat1);
  lat2 = Math.toRadians(lat2);
  
  // apply Haversine formula
  double a = Math.pow(Math.sin(dLat/2),2) +
             Math.pow(Math.sin(dLon/2),2) * Math.cos(lat1) * Math.cos(lat2);
  float radius = 6371;            // radius of earth
  float float_a = (float)a;
  float dist = 2 * radius * asin(sqrt(float_a));
  double distance = (double)dist;
  
  
  
  // drawing of car
  fill(178,34,34);
  rect(785,425,350,111);               // bottom half of car body
  arc(960,425,265,230,PI, TWO_PI);     // top half of car body
  fill(60,70,75);
  ellipse(860,535,80,80);              // tyres
  ellipse(1060,535,80,80);             // tyres
  fill(218,218,218);
  ellipse(860,535,10,10);              // tyres
  ellipse(1060,535,10,10);             // tyres
  
  
  
  // credits for fuel consumption values: https://www.thejournal.ie/dear-driver-what-is-good-mpg-3150884-Dec2016/
  // assuming average fuel consumption for petrol car is 5.35L/100km
  float fuel = dist/100*5.35;     // fuel consumed in terms of litres
  float emissions = fuel * 0.0023;   // info for CO2 emitted per unit (converted from kg to tonnes): http://mangrovesforfiji.com/carbon-footprint/tourists-and-volunteers/calculate-your-carbon-footprint/
  
  
  
  // Display coordinates and final calculations
  fill(0);
  textSize(20);
  text("Start Location: " + location1, 25, 40);
  text("End Location: " + location2, 25, 70);
  textSize(36);
  text("Distance Travelled: " + dist + " km", 717, 700);
  text("Amount of Carbon Dioxide Emitted: " + emissions + " tonnes", 555, 800);
  
} 
