SELECT COUNT(*) AS Total_Singers FROM singer	concert_singer
SELECT COUNT(*) FROM singer	concert_singer
SELECT Name, Country, Age  FROM singer  ORDER BY Age DESC	concert_singer
SELECT Name, Country, Age  FROM singer  ORDER BY Age DESC	concert_singer
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France'	concert_singer
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France'	concert_singer
SELECT Song_Name, Song_release_year  FROM singer  ORDER BY Age ASC  LIMIT 1	concert_singer
SELECT Song_Name, Song_release_year  FROM singer  WHERE Age = (SELECT MIN(Age) FROM singer)	concert_singer
SELECT DISTINCT Country  FROM singer  WHERE Age > 20	concert_singer
SELECT DISTINCT Country  FROM singer  WHERE Age > 20	concert_singer
SELECT Country, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Country	concert_singer
SELECT Country, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Country	concert_singer
SELECT Song_Name  FROM singer  WHERE Age > (SELECT AVG(Age) FROM singer)	concert_singer
SELECT Song_Name  FROM singer  WHERE Age > (SELECT AVG(Age) FROM singer)	concert_singer
SELECT Location, Name  FROM stadium  WHERE Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT Location, Name  FROM stadium  WHERE Capacity BETWEEN 5000 AND 10000	concert_singer
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium	concert_singer
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium	concert_singer
SELECT s.Name, s.Capacity  FROM stadium s  ORDER BY s.Average DESC  LIMIT 1	concert_singer
SELECT s.Name, s.Capacity  FROM stadium s  ORDER BY s.Average DESC  LIMIT 1	concert_singer
SELECT COUNT(*) FROM concert WHERE Year IN (2014, 2015)	concert_singer
SELECT COUNT(*) FROM concert WHERE Year IN (2014, 2015)	concert_singer
SELECT s.Name, COUNT(c.concert_ID) AS NumberOfConcerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name	concert_singer
SELECT s.Name, COUNT(c.concert_ID) AS NumberOfConcerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name	concert_singer
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year >= 2014 GROUP BY s.Stadium_ID ORDER BY COUNT(c.concert_ID) DESC LIMIT 1	concert_singer
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year > 2013 GROUP BY s.Stadium_ID ORDER BY COUNT(c.concert_ID) DESC LIMIT 1	concert_singer
SELECT Year, COUNT(*) AS NumberOfConcerts FROM concert GROUP BY Year ORDER BY NumberOfConcerts DESC LIMIT 1	concert_singer
SELECT Year  FROM concert  GROUP BY Year  ORDER BY COUNT(*) DESC  LIMIT 1	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)	concert_singer
SELECT DISTINCT Country  FROM singer  WHERE Age > 40  UNION  SELECT DISTINCT Country  FROM singer  WHERE Age < 30	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)	concert_singer
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)	concert_singer
SELECT      c.concert_Name,      c.Theme,      COUNT sic.Singer_ID AS Number_of_Singers FROM      concert c LEFT JOIN      singer_in_concert sic ON c.concert_ID = sic.concert_ID GROUP BY      c.concert_ID, c.concert_Name, c.Theme	concert_singer
SELECT      c.concert_ID,     c.theme,     COUNT(sc.Singer_ID) AS Number_of_Singers FROM      concert c JOIN      singer_in_concert sc ON c.concert_ID = sc.concert_ID GROUP BY      c.concert_ID, c.theme	concert_singer
SELECT s.Name, COUNT sic.concert_ID AS Number_of_Concerts FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Name	concert_singer
SELECT s.Name, COUNT sic.concert_ID AS Number_of_Concerts FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Singer_ID	concert_singer
SELECT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID WHERE YEAR(sic.concert_ID) = 2014	concert_singer
SELECT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID WHERE YEAR(sic.concert_ID) = 2014	concert_singer
SELECT Name, Country  FROM singer  WHERE Song_Name LIKE '%Hey%'	concert_singer
SELECT s.Name, s.Country FROM singer s WHERE s.Song_Name LIKE '%Hey%'	concert_singer
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN (2014, 2015) GROUP BY s.Stadium_ID HAVING COUNT(DISTINCT c.Year) > 1	concert_singer
SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year IN (2014, 2015) GROUP BY s.Stadium_ID HAVING COUNT(DISTINCT c.Year) > 1	concert_singer
SELECT COUNT(*)  FROM concert  JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID  WHERE stadium.Capacity = (SELECT MAX(Capacity) FROM stadium)	concert_singer
SELECT COUNT(*)  FROM concert  JOIN stadium ON concert.Stadium_ID = stadium.Stadium_ID  WHERE stadium.Capacity = (SELECT MAX(Capacity) FROM stadium)	concert_singer
SELECT COUNT(*) FROM Pets WHERE weight > 10	pets_1
SELECT COUNT(*) FROM Pets WHERE weight > 10	pets_1
SELECT MIN(weight) AS YoungestDogWeight FROM Pets WHERE PetType = 'dog'	pets_1
SELECT MIN(weight) AS youngest_dog_weight FROM Pets WHERE PetType = 'Dog'	pets_1
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType	pets_1
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType	pets_1
SELECT COUNT(*)  FROM Has_Pet HP JOIN Student S ON HP.StuID = S.StuID WHERE S.age > 20	pets_1
SELECT COUNT(*)  FROM Has_Pet HP JOIN Students S ON HP.StuID = S.StuID WHERE S.age > 20	pets_1
SELECT COUNT(*)  FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID JOIN Student S ON HP.StuID = S.StuID WHERE P.PetType = 'dog' AND S.sex = 'F'	pets_1
SELECT COUNT(*)  FROM Has_Pet HP JOIN Student S ON HP.StuID = S.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE S.gender = 'female' AND P.PetType = 'dog'	pets_1
SELECT COUNT(DISTINCT PetType) AS NumberOfDistinctPetTypes FROM Pets	pets_1
SELECT COUNT(DISTINCT PetType) FROM Pets	pets_1
SELECT DISTINCT s.first_name FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IN ('cat', 'dog')	pets_1
SELECT DISTINCT s.First_Name FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IN ('cat', 'dog')	pets_1
SELECT s.StuName FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IN ('cat', 'dog') GROUP BY s.StuID, s.StuName HAVING COUNT(DISTINCT p.PetType) = 2	pets_1
SELECT s.first_name FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType IN ('cat', 'dog') GROUP BY s.StuID, s.first_name HAVING COUNT(DISTINCT p.PetType) = 2	pets_1
SELECT Student.major, Student.age FROM Student WHERE Student.StuID NOT IN (     SELECT Has_Pet.StuID     FROM Has_Pet     JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE Pets.PetType = 'cat' )	pets_1
SELECT s.Major, s.Age FROM Student s WHERE NOT EXISTS (     SELECT 1     FROM Has_Pet hp     JOIN Pets p ON hp.PetID = p.PetID     WHERE hp.StuID = s.StuID AND p.PetType = 'cat' )	pets_1
SELECT StuID  FROM Student  WHERE StuID NOT IN (     SELECT StuID      FROM Has_Pet      JOIN Pets ON Has_Pet.PetID = Pets.PetID      WHERE PetType = 'cat' )	pets_1
SELECT StuID FROM Student WHERE StuID NOT IN (     SELECT StuID     FROM Has_Pet     JOIN Pets ON Has_Pet.PetID = Pets.PetID     WHERE PetType = 'cat' )	pets_1
SELECT s.First_Name, s.Age FROM Student s WHERE EXISTS (     SELECT 1     FROM Has_Pet hp     JOIN Pets p ON hp.PetID = p.PetID     WHERE hp.StuID = s.StuID AND p.PetType = 'dog' ) AND NOT EXISTS (     SELECT 1     FROM Has_Pet hp     JOIN Pets p ON hp.PetID = p.PetID     WHERE hp.StuID = s.StuID AND p.PetType = 'cat' )	pets_1
SELECT s.First_Name FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE p.PetType = 'dog' AND NOT EXISTS (     SELECT 1     FROM Has_Pet hp2     JOIN Pets p2 ON hp2.PetID = p2.PetID     WHERE hp2.StuID = s.StuID AND p2.PetType = 'cat' )	pets_1
SELECT PetType, weight  FROM Pets  ORDER BY pet_age ASC  LIMIT 1	pets_1
SELECT PetType, weight  FROM Pets  ORDER BY pet_age ASC  LIMIT 1	pets_1
SELECT PetID, weight  FROM Pets  WHERE pet_age > 1	pets_1
SELECT PetID, weight  FROM Pets  WHERE pet_age > 1	pets_1
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType	pets_1
SELECT PetType, AVG(pet_age) AS avg_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType	pets_1
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType	pets_1
SELECT Pets.PetType, AVG(Pets.weight) AS AverageWeight FROM Pets GROUP BY Pets.PetType	pets_1
SELECT S.First_Name, S.Age FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID	pets_1
SELECT DISTINCT s.first_name, s.age FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID	pets_1
SELECT p.PetID FROM Has_Pet hp JOIN Student s ON hp.StuID = s.StuID WHERE s.Last_Name = 'Smith'	pets_1
SELECT Pets.PetID FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Last_Name = 'Smith'	pets_1
SELECT Student.StuID, COUNT(Has_Pet.PetID) AS NumberOfPets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID	pets_1
SELECT Student.StuID, COUNT(Has_Pet.PetID) AS NumberOfPets FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID	pets_1
SELECT s.first_name, s.gender FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID GROUP BY s.StuID, s.first_name, s.gender HAVING COUNT(hp.PetID) > 1	pets_1
SELECT S.First_Name, S.Gender FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID, S.First_Name, S.Gender HAVING COUNT(HP.PetID) > 1	pets_1
SELECT S.LName FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID WHERE P.Type = 'cat' AND P.Age = 3	pets_1
SELECT Student.Last_Name FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' AND Pets.pet_age = 3	pets_1
SELECT AVG(Student.stu_age) FROM Student LEFT JOIN Has_Pet ON Student.StuID = Has_Pet.StuID WHERE Has_Pet.StuID IS NULL	pets_1
SELECT AVG(Student.pet_age) FROM Student WHERE Student.StuID NOT IN (SELECT StuID FROM Has_Pet)	pets_1
SELECT COUNT(*) FROM continents	car_1
SELECT COUNT(*) AS NumberOfContinents FROM continents	car_1
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS NumberOfCountries FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent	car_1
SELECT c.ContId, c.Continent, COUNT(co.CountryId) AS CountryCount FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent GROUP BY c.ContId, c.Continent	car_1
SELECT COUNT(CountryId) AS TotalCountries FROM countries	car_1
SELECT COUNT(*) FROM countries	car_1
SELECT cm.MakeName, cm.MakeId, COUNT(ml.Model) AS NumberOfModels FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.MakeName, cm.MakeId	car_1
SELECT      cm.Name AS MakerName,     cm.Id AS MakerId,     COUNT(ml.ModelId) AS ModelCount FROM      car_makers cm JOIN      model_list ml ON cm.Id = ml.Maker GROUP BY      cm.Name, cm.Id	car_1
SELECT cn.Make, cn.Model, cd.Horsepower FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId ORDER BY cd.Horsepower ASC LIMIT 1	car_1
SELECT cn.Model  FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId ORDER BY cd.Horsepower ASC LIMIT 1	car_1
SELECT c.Model FROM car_names c JOIN cars_data cd ON c.MakeId = cd.Id WHERE cd.Weight < (SELECT AVG(Weight) FROM cars_data)	car_1
SELECT c.Model  FROM car_names c JOIN cars_data cd ON c.MakeId = cd.Id WHERE cd.Weight < (SELECT AVG(Weight) FROM cars_data)	car_1
SELECT DISTINCT cm.Maker FROM car_makers cm JOIN cars_data cd ON cm.Id = cd.MakeId WHERE cd.Year = 1970	car_1
SELECT DISTINCT cm.Maker, cm.FullName FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker WHERE ml.Model LIKE '%1970%'	car_1
SELECT cm.Maker, cd.Year FROM car_makers cm JOIN cars_data cd ON cm.Id = cd.MakeId ORDER BY cd.Year ASC LIMIT 1	car_1
SELECT Maker, MIN(Year) AS Earliest_Year FROM cars_data JOIN car_makers ON cars_data.Id = car_makers.MakeId GROUP BY Maker	car_1
SELECT DISTINCT m.Model FROM cars_data c JOIN model_list m ON c.Id = m.ModelId WHERE c.Year > 1980	car_1
SELECT DISTINCT Model  FROM model_list  JOIN cars_data ON model_list.ModelId = cars_data.Id  WHERE Year > 1980	car_1
SELECT c.ContinentName, COUNT(cm.Id) AS MakerCount FROM car_makers cm JOIN countries co ON cm.Country = co.CountryId JOIN continents ct ON co.Continent = ct.ContId GROUP BY c.ContinentName	car_1
SELECT c.Continent, COUNT(cm.Id) AS NumberOfCarMakers FROM continents c JOIN countries co ON c.ContId = co.ContId JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent	car_1
SELECT c.Country, COUNT(cm.Id) AS MakerCount FROM car_makers cm JOIN countries c ON cm.Country = c.CountryId GROUP BY c.Country ORDER BY MakerCount DESC LIMIT 1	car_1
SELECT c.Country, COUNT(cm.Id) AS MakerCount FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.Country ORDER BY MakerCount DESC LIMIT 1	car_1
SELECT ml.Maker, COUNT(ml.Model) AS ModelCount FROM model_list ml JOIN car_makers cm ON ml.Maker = cm.Id GROUP BY ml.Maker	car_1
SELECT      cm.Maker,      COUNT(ml.Model) AS NumberOfModels,     cm.Id AS MakerId,     cm.Name AS MakerName FROM      model_list ml JOIN      car_makers cm ON ml.Maker = cm.Id GROUP BY      cm.Maker, cm.Id, cm.Name	car_1
SELECT cd.Accelerate  FROM cars_data cd  JOIN car_names cn ON cd.Id = cn.MakeId  WHERE cn.Make = 'AMC' AND cn.Model = 'Hornet Sportabout (SW)'	car_1
SELECT Accelerate  FROM cars_data  JOIN car_names ON cars_data.Id = car_names.MakeId  WHERE car_names.Model = 'amc hornet sportabout (sw)'	car_1
SELECT COUNT(*)  FROM car_makers  JOIN countries ON car_makers.Country = countries.CountryId  WHERE countries.CountryName = 'France'	car_1
SELECT COUNT(*)  FROM car_makers  JOIN countries ON car_makers.Country = countries.CountryId  WHERE countries.CountryName = 'France'	car_1
SELECT COUNT(*)  FROM model_list  JOIN car_makers ON model_list.Maker = car_makers.Id  WHERE car_makers.Country = 'USA'	car_1
SELECT COUNT(*)  FROM cars_data  JOIN model_list ON cars_data.Id = model_list.ModelId  JOIN car_names ON model_list.Maker = car_names.MakeId  WHERE car_names.Country = 'United States'	car_1
SELECT AVG(MPG) AS AverageMPG FROM cars_data WHERE Cylinders = 4	car_1
SELECT AVG(MPG) AS AverageMPG FROM cars_data WHERE Cylinders = 4	car_1
SELECT MIN(Weight)  FROM cars_data  WHERE Cylinders = 8 AND Year = 1974	car_1
SELECT MIN(Weight)  FROM cars_data  WHERE Cylinders = 8 AND Year = 1974	car_1
SELECT Maker, Model FROM model_list	car_1
SELECT Maker, Model FROM model_list	car_1
SELECT c.Country, cm.Id, cm.Maker FROM car_makers cm JOIN countries c ON cm.Country = c.CountryId GROUP BY c.Country, cm.Id, cm.Maker HAVING COUNT(cm.Id) >= 1	car_1
SELECT c.Country, cm.Id, cm.Maker FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.Country, cm.Id, cm.Maker HAVING COUNT(cm.Id) >= 1	car_1
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150	car_1
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150	car_1
SELECT Year, AVG(Weight) AS AverageWeight FROM cars_data GROUP BY Year	car_1
SELECT YEAR, AVG(Weight) AS Average_Weight FROM cars_data GROUP BY YEAR	car_1
SELECT c.Country, COUNT(cm.Id) AS ManufacturerCount FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.Region = 'Europe' GROUP BY c.Country HAVING COUNT(cm.Id) >= 3	car_1
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.Continent = 'Europe' GROUP BY c.CountryName HAVING COUNT(cm.Maker) >= 3	car_1
SELECT MAX(cars_data.Horsepower), car_names.Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 3	car_1
SELECT MAX(Horsepower), car_names.Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE Cylinders = 3	car_1
SELECT model_list.Model, cars_data.MPG FROM cars_data JOIN model_list ON cars_data.Id = model_list.ModelId ORDER BY cars_data.MPG DESC LIMIT 1	car_1
SELECT c.Model, cd.MPG  FROM cars_data cd  JOIN car_names c ON cd.Id = c.MakeId  ORDER BY cd.MPG DESC  LIMIT 1	car_1
SELECT AVG(Horsepower)  FROM cars_data  WHERE Year < 1980	car_1
SELECT AVG(Horsepower)  FROM cars_data  WHERE Year < 1980	car_1
SELECT AVG(cars_data.Edispl)  FROM cars_data  JOIN car_names ON cars_data.Id = car_names.MakeId  WHERE car_names.Model = 'volvo'	car_1
SELECT AVG(Edispl)  FROM cars_data  JOIN car_names ON cars_data.Id = car_names.MakeId  JOIN car_makers ON car_names.MakeId = car_makers.Id  WHERE car_makers.Maker = 'Volvo'	car_1
SELECT Cylinders, MAX(Accelerate) AS MaxAccelerate FROM cars_data GROUP BY Cylinders	car_1
SELECT Cylinders, MAX(Accelerate) AS Max_Accelerate FROM cars_data GROUP BY Cylinders	car_1
SELECT ml.Model, COUNT(cn.MakeId) AS VersionCount FROM model_list ml JOIN car_names cn ON ml.Model = cn.Model GROUP BY ml.Model ORDER BY VersionCount DESC LIMIT 1	car_1
SELECT ml.Model, COUNT(DISTINCT cn.Make) AS VersionCount FROM model_list ml JOIN car_names cn ON ml.Model = cn.Model GROUP BY ml.Model ORDER BY VersionCount DESC LIMIT 1	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4	car_1
SELECT COUNT(*) FROM cars_data WHERE Year = 1980	car_1
SELECT COUNT(*) FROM cars_data WHERE Year = 1980	car_1
SELECT COUNT(*)  FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId JOIN car_makers cm ON cn.MakeId = cm.Id WHERE cm.FullName = 'American Motor Company'	car_1
SELECT COUNT(*)  FROM model_list ml JOIN car_makers cm ON ml.Maker = cm.Id WHERE cm.Name = 'American Motor Company'	car_1
SELECT Maker, ModelId  FROM model_list  GROUP BY Maker  HAVING COUNT(ModelId) > 3	car_1
SELECT Maker, COUNT(Model) AS ModelCount FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY Maker HAVING ModelCount > 3	car_1
SELECT DISTINCT ml.Model, cm.Make FROM model_list ml JOIN car_names cn ON ml.Maker = cn.MakeId JOIN cars_data cd ON cn.Id = cd.Id WHERE (cm.Make = 'General Motors' OR cd.Weight > 3500) AND ml.Model IS NOT NULL	car_1
SELECT DISTINCT ml.Model FROM model_list ml JOIN cars_data cd ON ml.ModelId = cd.Id WHERE ml.Maker = 'General Motors' OR cd.Weight > 3500	car_1
SELECT DISTINCT Year  FROM cars_data  WHERE Weight BETWEEN 3000 AND 4000	car_1
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 OR Weight > 3000	car_1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1	car_1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1	car_1
SELECT c.Cylinders FROM cars_data c JOIN car_names cn ON c.Id = cn.MakeId WHERE cn.Make = 'volvo' ORDER BY c.Accelerate ASC LIMIT 1	car_1
SELECT MIN(T1.Accelerate), T2.Cylinders FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Make = 'Volvo' ORDER BY T1.Accelerate ASC LIMIT 1	car_1
SELECT COUNT(*)  FROM cars_data  WHERE Accelerate > (SELECT MAX(Horsepower) FROM cars_data)	car_1
SELECT COUNT(*)  FROM cars_data  WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))	car_1
SELECT COUNT(*)  FROM (     SELECT Country      FROM car_makers      GROUP BY Country      HAVING COUNT(Maker) > 2 ) AS CountriesWithMoreThanTwoMakers	car_1
SELECT COUNT(Country)  FROM (     SELECT Country      FROM car_makers      GROUP BY Country      HAVING COUNT(Maker) > 2 ) AS CountriesWithMoreThanTwoMakers	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6	car_1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6	car_1
SELECT cn.Make, cn.Model, cd.Horsepower FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Cylinders = 4 ORDER BY cd.Horsepower DESC LIMIT 1	car_1
SELECT cn.Make, cn.Model, cd.Horsepower FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Cylinders = 4 ORDER BY cd.Horsepower DESC LIMIT 1	car_1
SELECT cn.MakeId, cn.Make FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND cd.Cylinders <= 3	car_1
SELECT cn.MakeId, cn.Make, cd.Horsepower, cd.Cylinders FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Horsepower < (SELECT MIN(Horsepower) FROM cars_data) AND cd.Cylinders < 4	car_1
SELECT MAX(MPG)  FROM cars_data  WHERE Cylinders = 8 OR Year < 1980	car_1
SELECT MAX(MPG)  FROM cars_data  WHERE Cylinders = 8 OR Year < 1980	car_1
SELECT cn.Make, cn.Model  FROM cars_data cd  JOIN car_names cn ON cd.Id = cn.MakeId  WHERE cd.Weight < 3500 AND cn.Make != 'Ford Motor Company'	car_1
SELECT DISTINCT cn.Model FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Weight < 3500 AND cn.Make != 'Ford'	car_1
SELECT Country  FROM countries  WHERE CountryId NOT IN (SELECT DISTINCT Country FROM car_makers)	car_1
SELECT Country  FROM countries  WHERE CountryId NOT IN (SELECT Country FROM car_makers)	car_1
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.Maker HAVING COUNT(ml.Model) >= 2 AND COUNT(DISTINCT ml.Model) > 3	car_1
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.Maker HAVING COUNT(ml.ModelId) >= 2 AND COUNT(DISTINCT ml.Model) > 3	car_1
SELECT c.CountryId, c.Country FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE (SELECT COUNT(*) FROM car_makers WHERE Country = cm.Country) > 3    OR EXISTS (SELECT 1 FROM model_list ml JOIN car_makers cm2 ON ml.Maker = cm2.Id WHERE cm2.Country = cm.Country AND ml.Model = 'fiat') GROUP BY c.CountryId, c.Country	car_1
SELECT DISTINCT c.CountryId, c.Country FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE (     SELECT COUNT(*) FROM car_makers WHERE Country = cm.Country ) > 3 OR EXISTS (     SELECT 1 FROM model_list ml JOIN car_makers cm2 ON ml.Maker = cm2.Id WHERE cm2.Country = cm.Country AND ml.Model = 'fiat' )	car_1
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'	flight_2
SELECT Airline, Abbreviation  FROM airlines  WHERE Country = 'USA'	flight_2
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'	flight_2
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'	flight_2
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'	flight_2
SELECT COUNT(*) FROM airlines	flight_2
SELECT COUNT(*) FROM airlines	flight_2
SELECT COUNT(*) FROM airports	flight_2
SELECT COUNT(*) FROM airports	flight_2
SELECT COUNT(*) FROM flights	flight_2
SELECT COUNT(*) AS NumberOfFlights FROM flights	flight_2
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'	flight_2
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'	flight_2
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'	flight_2
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'	flight_2
SELECT City, Country  FROM airports  WHERE AirportName = 'Alton'	flight_2
SELECT City, Country  FROM airports  WHERE AirportName = 'Alton'	flight_2
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'	flight_2
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'	flight_2
SELECT AirportName FROM airports WHERE City = 'Aberdeen'	flight_2
SELECT AirportName FROM airports WHERE City = 'Aberdeen'	flight_2
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.AirportCode = 'ATO'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.AirportName = 'ATO'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM airports AS a JOIN flights AS f ON a.AirportCode = f.DestinationAirportCode WHERE a.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights f JOIN airports s ON f.SourceAirport = s.AirportCode JOIN airports d ON f.DestAirport = d.AirportCode WHERE s.City = 'Aberdeen' AND d.City = 'Ashley'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen' AND flights.DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Ashley')	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  WHERE airlines.Airline = 'JetBlue Airways'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  WHERE airlines.Airline = 'JetBlue Airways'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  WHERE airlines.Airline = 'United Airlines' AND flights.SourceAirport = 'AHD'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  WHERE airlines.Airline = 'United Airlines' AND SourceAirport = 'AHD'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.Airline = airlines.Airline  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'	flight_2
SELECT a.City, COUNT(f.FlightNo) AS ArrivalCount FROM airports a JOIN flights f ON a.AirportCode = f.DestAirport GROUP BY a.City ORDER BY ArrivalCount DESC LIMIT 1	flight_2
SELECT a.City, COUNT(f.DestAirport) AS DestinationFrequency FROM airports a JOIN flights f ON a.AirportCode = f.DestAirport GROUP BY a.City ORDER BY DestinationFrequency DESC LIMIT 1	flight_2
SELECT a.City, COUNT(f.FlightNo) AS DepartingFlightsCount FROM airports a JOIN flights f ON a.AirportCode = f.SourceAirport GROUP BY a.City ORDER BY DepartingFlightsCount DESC LIMIT 1	flight_2
SELECT City  FROM airports  JOIN flights ON airports.AirportCode = flights.SourceAirport  GROUP BY City  ORDER BY COUNT(*) DESC  LIMIT 1	flight_2
SELECT DestAirport  FROM flights  GROUP BY DestAirport  ORDER BY COUNT(*) DESC  LIMIT 1	flight_2
SELECT SourceAirport AS AirportCode FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1	flight_2
SELECT SourceAirport AS AirportCode FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1	flight_2
SELECT DestAirport  FROM flights  GROUP BY DestAirport  ORDER BY COUNT(*) ASC  LIMIT 1	flight_2
SELECT a.Airline, COUNT(f.FlightNo) AS FlightCount FROM airlines a JOIN flights f ON a.Airline = f.Airline GROUP BY a.Airline ORDER BY FlightCount DESC LIMIT 1	flight_2
SELECT Airline, COUNT(*) AS FlightCount FROM flights GROUP BY Airline ORDER BY FlightCount DESC LIMIT 1	flight_2
SELECT a.Abbreviation, a.Country FROM airlines a JOIN (     SELECT OriginAirportCode, COUNT(*) AS FlightCount     FROM flights     GROUP BY OriginAirportCode ) f ON a.AirportCode = f.OriginAirportCode ORDER BY f.FlightCount ASC LIMIT 1	flight_2
SELECT a.Abbreviation, a.Country FROM airlines a JOIN (     SELECT OriginAirportCode, COUNT(*) AS FlightCount     FROM flights     GROUP BY OriginAirportCode ) f ON a.AirportCode = f.OriginAirportCode ORDER BY f.FlightCount ASC LIMIT 1	flight_2
SELECT DISTINCT a.Airline, a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.Airline = f.Airline WHERE f.SourceAirport = 'AHD'	flight_2
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.Airline = T2.Airline WHERE T2.SourceAirport = 'AHD'	flight_2
SELECT DISTINCT a.Airline, a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.Airline = f.DestAirport WHERE f.SourceAirport = 'AHD'	flight_2
SELECT DISTINCT a.Airline, a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.Airline = f.Airline WHERE f.DestAirport = 'AHD'	flight_2
SELECT DISTINCT f.Airline FROM flights f WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY f.Airline HAVING COUNT(DISTINCT f.SourceAirport) = 2	flight_2
SELECT a.Airline, a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.Airline = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.Airline, a.Abbreviation, a.Country HAVING COUNT(DISTINCT f.SourceAirport) > 1	flight_2
SELECT DISTINCT Airline FROM flights WHERE SourceAirport = 'CVO' AND Airline NOT IN (     SELECT Airline     FROM flights     WHERE SourceAirport = 'APG' )	flight_2
SELECT DISTINCT a.Airline, a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.Airline = f.Airline WHERE f.SourceAirport = 'CVO' AND NOT EXISTS (     SELECT 1     FROM flights f2     WHERE f2.Airline = a.Airline AND f2.SourceAirport = 'APG' )	flight_2
SELECT a.Airline, a.Abbreviation, a.Country FROM airlines a JOIN (     SELECT Airline     FROM flights     GROUP BY Airline     HAVING COUNT(*) >= 10 ) f ON a.Airline = f.Airline	flight_2
SELECT a.Airline, COUNT(f.FlightNo) AS FlightCount FROM airlines a JOIN flights f ON a.Airline = f.Airline GROUP BY a.Airline HAVING COUNT(f.FlightNo) >= 10	flight_2
SELECT a.Airline, COUNT(f.FlightNo) AS FlightCount FROM airlines a JOIN flights f ON a.Airline = f.Airline GROUP BY a.Airline HAVING COUNT(f.FlightNo) < 200	flight_2
SELECT a.Airline, COUNT(f.FlightNo) AS FlightCount FROM airlines a JOIN flights f ON a.Airline = f.Airline GROUP BY a.Airline HAVING COUNT(f.FlightNo) < 200	flight_2
SELECT FlightNo FROM flights WHERE Airline = 'United Airlines'	flight_2
SELECT FlightNo FROM flights WHERE Airline = 'United Airlines'	flight_2
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'	flight_2
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'	flight_2
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'	flight_2
SELECT f.FlightNo FROM flights f JOIN airports a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen'	flight_2
SELECT FlightNo  FROM flights  JOIN airports ON flights.SourceAirport = airports.AirportCode  WHERE airports.City = 'Aberdeen'	flight_2
SELECT f.FlightNo FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen'	flight_2
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen'	flight_2
SELECT COUNT(*)  FROM airports AS a JOIN flights AS f ON a.AirportCode = f.DestinationAirport WHERE a.City IN ('Aberdeen', 'Abilene')	flight_2
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.DestAirport = airports.AirportCode  WHERE airports.City IN ('Aberdeen', 'Abilene')	flight_2
SELECT AirportName  FROM airports  WHERE AirportCode NOT IN (     SELECT SourceAirport FROM flights     UNION     SELECT DestAirport FROM flights )	flight_2
SELECT AirportCode, AirportName  FROM airports  WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights)  AND AirportCode NOT IN (SELECT DestAirport FROM flights)	flight_2
SELECT COUNT(*) FROM employee	employee_hire_evaluation
SELECT COUNT(*) FROM employee	employee_hire_evaluation
SELECT Name FROM employee ORDER BY Age ASC	employee_hire_evaluation
SELECT Name FROM employee ORDER BY Age ASC	employee_hire_evaluation
SELECT City, COUNT(Employee_ID) AS Employee_Count FROM employee GROUP BY City	employee_hire_evaluation
SELECT City, COUNT(Employee_ID) AS Number_of_Employees FROM employee GROUP BY City	employee_hire_evaluation
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(Employee_ID) > 1	employee_hire_evaluation
SELECT e.City FROM employee e JOIN hiring h ON e.Employee_ID = h.Employee_ID WHERE e.Age < 30 GROUP BY e.City HAVING COUNT(e.Employee_ID) > 1	employee_hire_evaluation
SELECT Location, COUNT(*) AS Number_of_Shops FROM shop GROUP BY Location	employee_hire_evaluation
SELECT Location, COUNT(*) AS Number_of_Shops FROM shop GROUP BY Location	employee_hire_evaluation
SELECT s.Manager_name, s.District  FROM shop s  ORDER BY s.Number_products DESC  LIMIT 1	employee_hire_evaluation
SELECT s.Manager_name, s.District  FROM shop s  ORDER BY s.Number_products DESC  LIMIT 1	employee_hire_evaluation
SELECT MIN(Number_products) AS Min_Products, MAX(Number_products) AS Max_Products FROM shop	employee_hire_evaluation
SELECT MIN(Number_products) AS Min_Products, MAX(Number_products) AS Max_Products FROM shop	employee_hire_evaluation
SELECT Name, Location, District  FROM shop  ORDER BY Number_products DESC	employee_hire_evaluation
SELECT Name, Location, District  FROM shop  ORDER BY Number_products DESC	employee_hire_evaluation
SELECT Name  FROM shop  WHERE Number_products > (SELECT AVG(Number_products) FROM shop)	employee_hire_evaluation
SELECT Name  FROM shop  WHERE Number_products > (SELECT AVG(Number_products) FROM shop)	employee_hire_evaluation
SELECT e.Name FROM employee e JOIN (     SELECT Employee_ID, COUNT(Employee_ID) AS Award_Count     FROM evaluation     GROUP BY Employee_ID     ORDER BY Award_Count DESC     LIMIT 1 ) sub ON e.Employee_ID = sub.Employee_ID	employee_hire_evaluation
SELECT e.Name FROM employee e JOIN (     SELECT Employee_ID, COUNT(Employee_ID) AS Award_Count     FROM evaluation     GROUP BY Employee_ID     ORDER BY Award_Count DESC     LIMIT 1 ) sub ON e.Employee_ID = sub.Employee_ID	employee_hire_evaluation
SELECT e.Name  FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID WHERE ev.Bonus = (SELECT MAX(Bonus) FROM evaluation WHERE Bonus IS NOT NULL)	employee_hire_evaluation
SELECT e.Name  FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID ORDER BY ev.Bonus DESC LIMIT 1	employee_hire_evaluation
SELECT Name  FROM employee  WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT Name  FROM employee  WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1	employee_hire_evaluation
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1	employee_hire_evaluation
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)	employee_hire_evaluation
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)	employee_hire_evaluation
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name	employee_hire_evaluation
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name	employee_hire_evaluation
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation	employee_hire_evaluation
SELECT SUM(Bonus) AS Total_Bonus FROM evaluation	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT * FROM hiring	employee_hire_evaluation
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000	employee_hire_evaluation
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000	employee_hire_evaluation
SELECT COUNT(DISTINCT Location) AS Number_of_Distinct_Locations FROM shop	employee_hire_evaluation
SELECT COUNT(DISTINCT Location) AS Number_of_Distinct_Locations FROM shop	employee_hire_evaluation
SELECT COUNT(*) FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(Document_ID) AS Total_Documents FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description  FROM Documents	cre_Doc_Template_Mgt
SELECT Document_ID, Document_Name, Document_Description  FROM Documents	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID  FROM Documents  WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_Name, Template_ID  FROM Documents  WHERE Document_Description LIKE '%w%'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description  FROM Documents  WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT Document_ID, Template_ID, Document_Description  FROM Documents  WHERE Document_Name = 'Robbin CV'	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Template_ID) AS NumberOfTemplates FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(DISTINCT Template_ID) AS Number_of_Different_Templates FROM Documents	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Templates  JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code  WHERE Ref_Template_Types.Template_Type_Code = 'PPT'	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID JOIN Ref_Template_Types rtt ON t.Template_Type_Code = rtt.Template_Type_Code WHERE rtt.Template_Type_Description = 'PPT'	cre_Doc_Template_Mgt
SELECT Template_ID, COUNT(Document_ID) AS Number_of_Documents FROM Documents GROUP BY Template_ID	cre_Doc_Template_Mgt
SELECT Template_ID, COUNT(*) AS Usage_Count FROM Documents GROUP BY Template_ID	cre_Doc_Template_Mgt
SELECT T1.Template_ID, T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID, T2.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT T1.Template_ID, T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID, T2.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) > 1	cre_Doc_Template_Mgt
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) > 1	cre_Doc_Template_Mgt
SELECT Template_ID  FROM Templates  WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)	cre_Doc_Template_Mgt
SELECT COUNT(*) AS Total_Templates FROM Templates	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code  FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID, Version_Number, Template_Type_Code  FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT DISTINCT Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT Template_ID  FROM Templates  WHERE Template_Type_Code IN ('PP', 'PPT')	cre_Doc_Template_Mgt
SELECT Template_ID  FROM Templates  WHERE Template_Type_Code IN ('PP', 'PPT')	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Templates  WHERE Template_Type_Code = 'CV'	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Templates  JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code  WHERE Ref_Template_Types.Template_Type_Description = 'CV'	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code  FROM Templates  WHERE Version_Number > 5	cre_Doc_Template_Mgt
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5	cre_Doc_Template_Mgt
SELECT      Ref_Template_Types.Template_Type_Code,      COUNT(Templates.Template_ID) AS Number_of_Templates FROM      Templates JOIN      Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY      Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code, COUNT(*) AS Number_of_Templates FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1	cre_Doc_Template_Mgt
SELECT tt.Template_Type_Code FROM Ref_Template_Types tt JOIN Templates t ON tt.Template_Type_Code = t.Template_Type_Code GROUP BY tt.Template_Type_Code HAVING COUNT(t.Template_ID) < 3	cre_Doc_Template_Mgt
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  HAVING COUNT(*) < 3	cre_Doc_Template_Mgt
SELECT MIN(Version_Number) AS Smallest_Version, Template_Type_Code FROM Templates	cre_Doc_Template_Mgt
SELECT MIN(Version_Number) AS Lowest_Version_Number, Template_Type_Code FROM Templates GROUP BY Template_Type_Code	cre_Doc_Template_Mgt
SELECT tt.Template_Type_Code FROM Templates t JOIN Ref_Template_Types tt ON t.Template_Type_Code = tt.Template_Type_Code WHERE t.Template_Details LIKE '%Document with the name "Data base"%'	cre_Doc_Template_Mgt
SELECT rtt.Template_Type_Code FROM Templates t JOIN Ref_Template_Types rtt ON t.Template_Type_Code = rtt.Template_Type_Code WHERE t.Template_Details LIKE '%Data base%'	cre_Doc_Template_Mgt
SELECT d.Document_Name FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID JOIN Ref_Template_Types rtt ON t.Template_Type_Code = rtt.Template_Type_Code WHERE rtt.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT d.Document_Name FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE t.Template_Type_Code = 'BK'	cre_Doc_Template_Mgt
SELECT      Ref_Template_Types.Template_Type_Code,      COUNT(Documents.Document_ID) AS Number_of_Documents FROM      Documents JOIN      Templates ON Documents.Template_ID = Templates.Template_ID JOIN      Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY      Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT      rt.Template_Type_Code,      COUNT(t.Template_ID) AS Document_Count FROM      Templates t JOIN      Ref_Template_Types rt ON t.Template_Type_Code = rt.Template_Type_Code GROUP BY      rt.Template_Type_Code	cre_Doc_Template_Mgt
SELECT T2.Template_Type_Code, COUNT(*) AS Document_Count FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code ORDER BY Document_Count DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code  FROM Templates  GROUP BY Template_Type_Code  ORDER BY COUNT(*) DESC  LIMIT 1	cre_Doc_Template_Mgt
SELECT Template_Type_Code  FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (     SELECT Template_Type_Code      FROM Templates )	cre_Doc_Template_Mgt
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (     SELECT DISTINCT Template_Type_Code     FROM Templates )	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description  FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Code, Template_Type_Description  FROM Ref_Template_Types	cre_Doc_Template_Mgt
SELECT Template_Type_Description  FROM Ref_Template_Types  WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Description  FROM Ref_Template_Types  WHERE Template_Type_Code = 'AD'	cre_Doc_Template_Mgt
SELECT Template_Type_Code  FROM Ref_Template_Types  WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT Template_Type_Code  FROM Ref_Template_Types  WHERE Template_Type_Description = 'Book'	cre_Doc_Template_Mgt
SELECT DISTINCT rtt.Template_Type_Description FROM Templates t JOIN Ref_Template_Types rtt ON t.Template_Type_Code = rtt.Template_Type_Code	cre_Doc_Template_Mgt
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Documents JOIN Ref_Template_Types ON Documents.Template_ID = Ref_Template_Types.Template_Type_Code	cre_Doc_Template_Mgt
SELECT T1.Template_ID FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code WHERE T3.Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT Template_ID  FROM Templates  WHERE Template_Type_Description = 'Presentation'	cre_Doc_Template_Mgt
SELECT COUNT(*) AS Total_Paragraphs FROM Paragraphs	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT COUNT(*)  FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'	cre_Doc_Template_Mgt
SELECT Paragraph_ID, Document_ID, Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'	cre_Doc_Template_Mgt
SELECT Paragraph_Text, Other_Details  FROM Paragraphs  WHERE Paragraph_Text LIKE '%Korea%'	cre_Doc_Template_Mgt
SELECT Paragraph_ID, Paragraph_Text  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Welcome to NY'	cre_Doc_Template_Mgt
SELECT Paragraph_Text  FROM Paragraphs  JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID  WHERE Documents.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT p.Paragraph_Text FROM Paragraphs p JOIN Documents d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Customer reviews'	cre_Doc_Template_Mgt
SELECT d.Document_ID, COUNT(p.Paragraph_ID) AS Paragraph_Count FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID ORDER BY d.Document_ID	cre_Doc_Template_Mgt
SELECT Paragraphs.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS Paragraph_Count FROM Paragraphs GROUP BY Paragraphs.Document_ID ORDER BY Paragraphs.Document_ID	cre_Doc_Template_Mgt
SELECT      d.Document_ID,     d.Document_Name,     COUNT(p.Paragraph_ID) AS Paragraph_Count FROM      Documents d LEFT JOIN      Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY      d.Document_ID, d.Document_Name	cre_Doc_Template_Mgt
SELECT      D.Document_ID,     D.Document_Name,     COUNT(P.Paragraph_ID) AS Paragraph_Count FROM      Documents D LEFT JOIN      Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY      D.Document_ID, D.Document_Name	cre_Doc_Template_Mgt
SELECT Document_ID  FROM Paragraphs  GROUP BY Document_ID  HAVING COUNT(Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT Document_ID  FROM Paragraphs  GROUP BY Document_ID  HAVING COUNT(Paragraph_ID) >= 2	cre_Doc_Template_Mgt
SELECT d.Document_ID, d.Document_Name FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name ORDER BY COUNT(p.Paragraph_ID) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT d.Document_ID, d.Document_Name FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name ORDER BY COUNT(p.Paragraph_ID) DESC LIMIT 1	cre_Doc_Template_Mgt
SELECT Document_ID  FROM Paragraphs  GROUP BY Document_ID  ORDER BY COUNT(*) ASC  LIMIT 1	cre_Doc_Template_Mgt
SELECT Document_ID  FROM Paragraphs  GROUP BY Document_ID  ORDER BY COUNT(*) ASC  LIMIT 1	cre_Doc_Template_Mgt
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT d.Document_ID FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID HAVING COUNT(p.Paragraph_ID) BETWEEN 1 AND 2	cre_Doc_Template_Mgt
SELECT p.Document_ID FROM Paragraphs p WHERE p.Paragraph_Text LIKE '%Brazil%'    OR p.Paragraph_Text LIKE '%Ireland%'	cre_Doc_Template_Mgt
SELECT d.Document_ID FROM Documents d JOIN Paragraphs p ON d.Document_ID = p.Document_ID WHERE p.Paragraph_Text LIKE '%Brazil%'   AND p.Paragraph_Text LIKE '%Ireland%'	cre_Doc_Template_Mgt
SELECT COUNT(*) FROM teacher	course_teach
SELECT COUNT(*) FROM teacher	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Age, Hometown FROM teacher	course_teach
SELECT Age, Hometown FROM teacher	course_teach
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'	course_teach
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'	course_teach
SELECT Name FROM teacher WHERE Age IN (32, 33)	course_teach
SELECT Name FROM teacher WHERE Age IN (32, 33)	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1	course_teach
SELECT T1.Hometown, COUNT(*) AS Number_of_Teachers FROM teacher AS T1 GROUP BY T1.Hometown	course_teach
SELECT Hometown, COUNT(*) AS Number_of_Teachers FROM teacher GROUP BY Hometown	course_teach
SELECT Hometown, COUNT(*) AS Count FROM teacher GROUP BY Hometown ORDER BY Count DESC LIMIT 1	course_teach
SELECT Hometown, COUNT(*) AS Common_Count FROM teacher GROUP BY Hometown ORDER BY Common_Count DESC LIMIT 1	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2	course_teach
SELECT T1.Name, T2.Course_ID FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID	course_teach
SELECT t.Name, c.Course_ID FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID	course_teach
SELECT T2.Name, T1.Course_ID FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name ASC	course_teach
SELECT t.Name, c.Course_ID FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID ORDER BY t.Name ASC	course_teach
SELECT t.Name  FROM teacher t  JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID  WHERE ca.Course_ID = 'Math'	course_teach
SELECT t.Name FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course_ID IN (SELECT c.Course_ID FROM course c WHERE c.Name = 'Math')	course_teach
SELECT t.Name, COUNT(ca.Course_ID) AS Number_of_Courses FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name	course_teach
SELECT t.Name, COUNT(ca.Course_ID) AS Course_Count FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name	course_teach
SELECT t.Name  FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name HAVING COUNT(ca.Course_ID) >= 2	course_teach
SELECT T1.Name  FROM teacher AS T1  JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID  GROUP BY T1.Teacher_ID  HAVING COUNT(T2.Course_ID) >= 2	course_teach
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)	course_teach
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)	course_teach
SELECT COUNT(*) FROM visitor WHERE Age < 30	museum_visit
SELECT Name  FROM visitor  WHERE Level_of_membership > 4  ORDER BY Level_of_membership DESC	museum_visit
SELECT AVG(Age)  FROM visitor  WHERE Level_of_membership <= 4	museum_visit
SELECT Name, Level_of_membership  FROM visitor  WHERE Level_of_membership > 4  ORDER BY Age DESC	museum_visit
SELECT Museum_ID, Name  FROM museum  ORDER BY Num_of_Staff DESC  LIMIT 1	museum_visit
SELECT AVG(Num_of_Staff)  FROM museum  WHERE Open_Year < 2009	museum_visit
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'	museum_visit
SELECT Name  FROM museum  WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)	museum_visit
SELECT v.visitor_ID, v.Name, TIMESTAMPDIFF(YEAR, v.Birthdate, CURDATE()) AS Age FROM visitor v JOIN visit vi ON v.visitor_ID = vi.visitor_ID GROUP BY v.visitor_ID, v.Name, v.Birthdate HAVING COUNT(vi.Museum_ID) > 1	museum_visit
SELECT v.ID, v.Name, v.Membership_Level FROM visitor v JOIN (     SELECT visitor_ID, SUM(Total_spent) AS Total_Spent     FROM visit     GROUP BY visitor_ID     ORDER BY Total_Spent DESC     LIMIT 1 ) sub ON v.ID = sub.visitor_ID	museum_visit
SELECT m.Museum_ID, m.Name FROM museum m JOIN visit v ON m.Museum_ID = v.Museum_ID GROUP BY m.Museum_ID, m.Name ORDER BY COUNT(v.visitor_ID) DESC LIMIT 1	museum_visit
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)	museum_visit
SELECT v.Name, v.Age  FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID ORDER BY vi.Num_of_Ticket DESC LIMIT 1	museum_visit
SELECT AVG(Num_of_Ticket) AS Average_Tickets, MAX(Num_of_Ticket) AS Max_Tickets FROM visit	museum_visit
SELECT SUM(Total_spent) AS Total_Ticket_Expense FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1	museum_visit
SELECT v.Name FROM visitor v JOIN visit vi ON v.visitor_ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year < 2009 INTERSECT SELECT v.Name FROM visitor v JOIN visit vi ON v.visitor_ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year > 2011	museum_visit
SELECT COUNT(DISTINCT visitor_ID)  FROM visit  WHERE visitor_ID NOT IN (     SELECT visitor_ID      FROM visit      JOIN museum ON visit.Museum_ID = museum.Museum_ID      WHERE open_year > 2010 )	museum_visit
SELECT COUNT(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008	museum_visit
SELECT COUNT(*) FROM players	wta_1
SELECT COUNT(*) FROM players	wta_1
SELECT COUNT(*) AS total_matches FROM matches	wta_1
SELECT COUNT(*) FROM matches	wta_1
SELECT first_name, birth_date  FROM players  WHERE country_code = 'USA'	wta_1
SELECT first_name, birth_date  FROM players  WHERE country_code = 'USA'	wta_1
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches	wta_1
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches	wta_1
SELECT AVG(winner_rank) AS average_winner_rank FROM matches	wta_1
SELECT AVG(winner_rank) AS average_winner_rank FROM matches	wta_1
SELECT MAX(loser_rank) AS max_loser_rank FROM matches	wta_1
SELECT MIN(loser_rank) AS best_loser_rank FROM matches	wta_1
SELECT COUNT(DISTINCT country_code) AS distinct_country_codes FROM players	wta_1
SELECT COUNT(DISTINCT country_code) AS distinct_countries FROM players	wta_1
SELECT COUNT(DISTINCT loser_name) AS distinct_loser_names FROM matches	wta_1
SELECT COUNT(DISTINCT loser_name) AS distinct_loser_names FROM matches	wta_1
SELECT tourney_name  FROM matches  GROUP BY tourney_name  HAVING COUNT(*) > 10	wta_1
SELECT tourney_name  FROM matches  GROUP BY tourney_name  HAVING COUNT(*) > 10	wta_1
SELECT DISTINCT w1.winner_name FROM matches w1 JOIN matches w2 ON w1.winner_id = w2.winner_id AND w1.year <> w2.year WHERE w1.year IN (2013, 2016)	wta_1
SELECT p.winner_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.year IN (2013, 2016) GROUP BY p.winner_name HAVING COUNT(DISTINCT m.year) = 2	wta_1
SELECT COUNT(*)  FROM matches  WHERE year IN (2013, 2016)	wta_1
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)	wta_1
SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id, p.country_code, p.first_name HAVING COUNT(DISTINCT m.tourney_name) = 2	wta_1
SELECT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id, p.first_name, p.country_code HAVING COUNT(DISTINCT m.tourney_name) = 2	wta_1
SELECT p.first_name, p.country_code FROM players p ORDER BY p.birth_date ASC LIMIT 1	wta_1
SELECT first_name, country_code  FROM players  ORDER BY birth_date ASC  LIMIT 1	wta_1
SELECT first_name, last_name  FROM players  ORDER BY birth_date	wta_1
SELECT first_name, last_name  FROM players  ORDER BY birth_date	wta_1
SELECT first_name, last_name  FROM players  WHERE hand = 'L'  ORDER BY birth_date	wta_1
SELECT first_name, last_name  FROM players  WHERE hand = 'left'  ORDER BY birth_date	wta_1
SELECT p.first_name, p.country_code FROM players p JOIN (     SELECT player_id, SUM(tours) AS total_tours     FROM rankings     GROUP BY player_id     ORDER BY total_tours DESC     LIMIT 1 ) r ON p.player_id = r.player_id	wta_1
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id ORDER BY SUM(r.tours) DESC LIMIT 1	wta_1
SELECT year  FROM matches  GROUP BY year  ORDER BY COUNT(*) DESC  LIMIT 1	wta_1
SELECT year  FROM matches  GROUP BY year  ORDER BY COUNT(*) DESC  LIMIT 1	wta_1
SELECT p.winner_name, r.ranking_points FROM matches m JOIN players p ON m.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id WHERE m.winner_id IN (     SELECT winner_id     FROM matches     GROUP BY winner_id     ORDER BY COUNT(winner_id) DESC     LIMIT 1 ) ORDER BY r.ranking_points DESC	wta_1
SELECT p.winner_name, SUM(r.ranking_points) AS total_rank_points FROM matches m JOIN players p ON m.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id GROUP BY p.winner_name ORDER BY COUNT(m.match_num) DESC, total_rank_points DESC LIMIT 1	wta_1
SELECT p.winner_name FROM matches m JOIN players p ON m.winner_id = p.player_id WHERE m.tourney_name = 'Australian Open' ORDER BY p.winner_rank_points DESC LIMIT 1	wta_1
SELECT p.winner_name FROM matches m JOIN players p ON m.winner_id = p.player_id WHERE m.tourney_name = 'Australian Open' ORDER BY p.winner_rank_points DESC LIMIT 1	wta_1
SELECT      m.loser_name,      m.winner_name  FROM      matches m  ORDER BY      m.minutes DESC  LIMIT 1	wta_1
SELECT      p1.first_name AS winner_first_name,      p1.last_name AS winner_last_name,      p2.first_name AS loser_first_name,      p2.last_name AS loser_last_name FROM      matches m JOIN      players p1 ON m.winner_id = p1.player_id JOIN      players p2 ON m.loser_id = p2.player_id ORDER BY      m.minutes DESC LIMIT 1	wta_1
SELECT p.first_name, AVG(r.ranking) AS avg_ranking FROM rankings r JOIN players p ON r.player_id = p.player_id GROUP BY p.player_id, p.first_name	wta_1
SELECT p.first_name, AVG(r.ranking) AS avg_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name	wta_1
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name	wta_1
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name	wta_1
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code	wta_1
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code	wta_1
SELECT country_code  FROM players  GROUP BY country_code  ORDER BY COUNT(*) DESC  LIMIT 1	wta_1
SELECT country_code  FROM players  GROUP BY country_code  ORDER BY COUNT(*) DESC  LIMIT 1	wta_1
SELECT country_code  FROM players  GROUP BY country_code  HAVING COUNT(player_id) > 50	wta_1
SELECT country_code  FROM players  GROUP BY country_code  HAVING COUNT(player_id) > 50	wta_1
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date	wta_1
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date	wta_1
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year	wta_1
SELECT year, COUNT(*) AS match_count FROM matches GROUP BY year	wta_1
SELECT p.winner_name, r.ranking FROM players p JOIN rankings r ON p.player_id = r.player_id WHERE p.player_id IN (     SELECT winner_id     FROM matches     ORDER BY winner_age ASC     LIMIT 3 ) ORDER BY r.ranking DESC	wta_1
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age ASC LIMIT 3	wta_1
SELECT COUNT(DISTINCT p.player_id) AS distinct_winners FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'WTA Championships' AND p.hand = 'L'	wta_1
SELECT COUNT(winner_id)  FROM matches  JOIN players ON matches.winner_id = players.player_id  WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships'	wta_1
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN (     SELECT winner_id, SUM(winner_rank_points) AS total_rank_points     FROM matches     GROUP BY winner_id     ORDER BY total_rank_points DESC     LIMIT 1 ) m ON p.player_id = m.winner_id	wta_1
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN (     SELECT winner_id, SUM(winner_rank_points) AS total_rank_points     FROM matches     GROUP BY winner_id     ORDER BY total_rank_points DESC     LIMIT 1 ) sub ON p.player_id = sub.winner_id	wta_1
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand	wta_1
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand	wta_1
SELECT COUNT(*)  FROM ship  WHERE disposition_of_ship = 'Captured'	battle_death
SELECT name, tonnage  FROM ship  ORDER BY name DESC	battle_death
SELECT name, date, result FROM battle	battle_death
SELECT MAX(killed + injured) AS max_toll, MIN(killed + injured) AS min_toll FROM death	battle_death
SELECT AVG(injured) AS average_injuries FROM death	battle_death
SELECT d.note, d.killed, d.injured FROM death d JOIN ship s ON d.caused_by_ship_id = s.id WHERE s.tonnage = 't'	battle_death
SELECT name, result  FROM battle  WHERE bulgarian_commander != 'Boril'	battle_death
SELECT DISTINCT b.id, b.name FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.ship_type = 'Brig'	battle_death
SELECT b.id, b.name FROM battle b JOIN death d ON b.id = d.caused_by_ship_id GROUP BY b.id, b.name HAVING SUM(d.killed) > 10	battle_death
SELECT s.id, s.name  FROM ship s JOIN death d ON s.id = d.caused_by_ship_id GROUP BY s.id, s.name ORDER BY SUM(d.injured) DESC LIMIT 1	battle_death
SELECT DISTINCT name  FROM battle  WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'	battle_death
SELECT COUNT(DISTINCT result) FROM battle	battle_death
SELECT COUNT(*)  FROM battle  WHERE id NOT IN (     SELECT DISTINCT lost_in_battle      FROM ship      WHERE tonnage = 225 )	battle_death
SELECT b.name, b.date FROM battle b JOIN ship s1 ON b.id = s1.lost_in_battle JOIN ship s2 ON b.id = s2.lost_in_battle WHERE s1.name = 'Lettice' AND s2.name = 'HMS Atalanta'	battle_death
SELECT b.name, b.result, b.bulgarian_commander FROM battle b LEFT JOIN ship s ON b.id = s.lost_in_battle WHERE s.location != 'English Channel' OR s.location IS NULL	battle_death
SELECT note FROM death WHERE note LIKE '%East%'	battle_death
SELECT a.line_1, a.line_2  FROM Addresses a	student_transcripts_tracking
SELECT line_1, line_2 FROM Addresses	student_transcripts_tracking
SELECT COUNT(*) AS total_courses FROM Courses	student_transcripts_tracking
SELECT COUNT(*) AS total_courses FROM Courses	student_transcripts_tracking
SELECT course_description  FROM Courses  WHERE course_name = 'Math'	student_transcripts_tracking
SELECT course_description  FROM Courses  WHERE course_name LIKE '%math%'	student_transcripts_tracking
SELECT zip_postcode  FROM Addresses  WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'	student_transcripts_tracking
SELECT d.department_name, d.department_id FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_id, d.department_name ORDER BY COUNT(dp.degree_program_id) DESC LIMIT 1	student_transcripts_tracking
SELECT d.department_id, d.department_name FROM Departments d JOIN (     SELECT department_id, COUNT(degree_program_id) AS degree_count     FROM Degree_Programs     GROUP BY department_id ) dp ON d.department_id = dp.department_id WHERE dp.degree_count = (     SELECT MAX(degree_count)     FROM (         SELECT COUNT(degree_program_id) AS degree_count         FROM Degree_Programs         GROUP BY department_id     ) subquery )	student_transcripts_tracking
SELECT COUNT(DISTINCT department_id) AS department_count FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT department_id) AS distinct_departments_offering_degrees FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_summary_name) AS distinct_degree_names FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(DISTINCT degree_summary_name) AS distinct_degrees FROM Degree_Programs	student_transcripts_tracking
SELECT COUNT(*)  FROM Degree_Programs dp JOIN Departments d ON dp.department_id = d.department_id WHERE d.department_name = 'Engineering'	student_transcripts_tracking
SELECT COUNT(*)  FROM Degree_Programs dp JOIN Departments d ON dp.department_id = d.department_id WHERE d.department_name = 'Engineering'	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT section_name, section_description FROM Sections	student_transcripts_tracking
SELECT c.course_name, c.course_id FROM Courses c JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id, c.course_name HAVING COUNT(s.section_id) <= 2	student_transcripts_tracking
SELECT c.course_name, c.course_id FROM Courses c JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id, c.course_name HAVING COUNT(s.section_id) < 2	student_transcripts_tracking
SELECT section_name  FROM Sections  ORDER BY section_name DESC	student_transcripts_tracking
SELECT section_name  FROM Sections  ORDER BY section_name DESC	student_transcripts_tracking
SELECT s.semester_name, s.semester_id FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id, s.semester_name ORDER BY COUNT(se.student_enrolment_id) DESC LIMIT 1	student_transcripts_tracking
SELECT      s.semester_name,     s.semester_id FROM      Semesters s JOIN (     SELECT          semester_id,         COUNT(student_id) AS student_count     FROM          Student_Enrolment     GROUP BY          semester_id     ORDER BY          student_count DESC     LIMIT 1 ) sub ON s.semester_id = sub.semester_id	student_transcripts_tracking
SELECT department_description  FROM Departments  WHERE department_name LIKE '%computer%'	student_transcripts_tracking
SELECT department_description  FROM Departments  WHERE department_name LIKE '%computer%'	student_transcripts_tracking
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2	student_transcripts_tracking
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name HAVING COUNT(DISTINCT se.degree_program_id) = 2	student_transcripts_tracking
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name LIKE '%Bachelor%'	student_transcripts_tracking
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_name = 'Bachelors'	student_transcripts_tracking
SELECT dp.degree_program_name, COUNT(se.student_enrolment_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_name ORDER BY student_count DESC LIMIT 1	student_transcripts_tracking
SELECT dp.degree_summary_name, COUNT(se.student_enrolment_id) AS student_count FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_summary_name ORDER BY student_count DESC LIMIT 1	student_transcripts_tracking
SELECT degree_program_id, COUNT(student_id) AS student_count FROM Student_Enrolment GROUP BY degree_program_id ORDER BY student_count DESC LIMIT 1	student_transcripts_tracking
SELECT dp.degree_program_id, dp.degree_summary_name FROM Degree_Programs dp JOIN Student_Enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY dp.degree_program_id, dp.degree_summary_name ORDER BY COUNT(se.student_enrolment_id) DESC LIMIT 1	student_transcripts_tracking
SELECT      s.student_id,     s.first_name,     s.middle_name,     s.last_name,     COUNT(se.student_enrolment_id) AS enrollment_count FROM      Students s JOIN      Student_Enrolment se ON s.student_id = se.student_id GROUP BY      s.student_id, s.first_name, s.middle_name, s.last_name ORDER BY      enrollment_count DESC LIMIT 1	student_transcripts_tracking
SELECT      s.first_name,      s.middle_name,      s.last_name,      se.student_id,      COUNT(se.student_enrolment_id) AS enrollment_count FROM      Students s JOIN      Student_Enrolment se ON s.student_id = se.student_id GROUP BY      s.student_id,      s.first_name,      s.middle_name,      s.last_name ORDER BY      enrollment_count DESC LIMIT 1	student_transcripts_tracking
SELECT semester_name  FROM Semesters  WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT semester_name  FROM Semesters  WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)	student_transcripts_tracking
SELECT DISTINCT c.course_name  FROM Courses c  JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id	student_transcripts_tracking
SELECT DISTINCT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id	student_transcripts_tracking
SELECT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id GROUP BY c.course_id, c.course_name ORDER BY COUNT(sec.student_course_id) DESC LIMIT 1	student_transcripts_tracking
SELECT c.course_name FROM Courses c JOIN Student_Enrolment_Courses sec ON c.course_id = sec.course_id GROUP BY c.course_id, c.course_name ORDER BY COUNT(sec.student_course_id) DESC LIMIT 1	student_transcripts_tracking
SELECT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id WHERE a.state = 'North Carolina' AND NOT EXISTS (     SELECT 1     FROM Student_Enrolment se     WHERE se.student_id = s.student_id )	student_transcripts_tracking
SELECT s.last_name FROM Students s WHERE s.state = 'North Carolina' AND NOT EXISTS (     SELECT 1     FROM Student_Enrolment se     WHERE se.student_id = s.student_id )	student_transcripts_tracking
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id, t.transcript_date HAVING COUNT(tc.student_course_id) >= 2	student_transcripts_tracking
SELECT t.transcript_id, t.transcript_date  FROM Transcripts t  JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id  GROUP BY t.transcript_id, t.transcript_date  HAVING COUNT(DISTINCT tc.student_course_id) >= 2	student_transcripts_tracking
SELECT p.phone_number FROM people p WHERE p.first_name = 'Timmothy' AND p.last_name = 'Ward'	student_transcripts_tracking
SELECT cell_mobile_number  FROM Students  WHERE first_name = 'Timothy' AND last_name = 'Ward'	student_transcripts_tracking
SELECT first_name, middle_name, last_name  FROM Students  ORDER BY date_first_registered ASC  LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name  FROM Students  ORDER BY date_first_registered ASC  LIMIT 1	student_transcripts_tracking
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id WHERE se.date_left IS NOT NULL ORDER BY se.date_left ASC LIMIT 1	student_transcripts_tracking
SELECT first_name, middle_name, last_name  FROM Students  WHERE date_left IS NOT NULL  ORDER BY date_left ASC  LIMIT 1	student_transcripts_tracking
SELECT s.first_name, s.middle_name, s.last_name FROM Students s WHERE s.permanent_address_id <> s.current_address_id	student_transcripts_tracking
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Addresses pa ON s.permanent_address_id = pa.address_id JOIN Addresses ca ON s.current_address_id = ca.address_id WHERE pa.address_line_1 <> ca.address_line_1 OR pa.city <> ca.city OR pa.state <> ca.state OR pa.zip_code <> ca.zip_code	student_transcripts_tracking
SELECT a.address_id, a.line1, a.line2, a.city, a.state, a.zip_code FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id GROUP BY a.address_id, a.line1, a.line2, a.city, a.state, a.zip_code ORDER BY COUNT(s.student_id) DESC LIMIT 1	student_transcripts_tracking
SELECT a.address_id, a.line1, a.line2 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id OR a.address_id = s.permanent_address_id GROUP BY a.address_id, a.line1, a.line2 ORDER BY COUNT(s.student_id) DESC LIMIT 1	student_transcripts_tracking
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts	student_transcripts_tracking
SELECT AVG(transcript_date) AS average_transcript_date FROM Transcripts	student_transcripts_tracking
SELECT transcript_date, other_details  FROM Transcripts  ORDER BY transcript_date ASC  LIMIT 1	student_transcripts_tracking
SELECT MIN(transcript_date) AS earliest_transcript_date, other_details  FROM Transcripts	student_transcripts_tracking
SELECT COUNT(transcript_id) AS total_transcripts FROM Transcripts	student_transcripts_tracking
SELECT COUNT(*) FROM Transcripts	student_transcripts_tracking
SELECT MAX(transcript_date) AS last_transcript_release_date FROM Transcripts	student_transcripts_tracking
SELECT MAX(transcript_date) AS last_transcript_date FROM Transcripts	student_transcripts_tracking
SELECT student_course_id, COUNT(DISTINCT transcript_id) AS max_transcripts FROM Transcript_Contents GROUP BY student_course_id ORDER BY max_transcripts DESC LIMIT 1	student_transcripts_tracking
SELECT student_course_id, COUNT(DISTINCT transcript_id) AS max_transcripts FROM Transcript_Contents GROUP BY student_course_id ORDER BY max_transcripts DESC LIMIT 1	student_transcripts_tracking
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id, t.transcript_date ORDER BY COUNT(*) ASC LIMIT 1	student_transcripts_tracking
SELECT t.transcript_date, t.transcript_id FROM Transcripts t JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id, t.transcript_date ORDER BY COUNT(*) ASC LIMIT 1	student_transcripts_tracking
SELECT s.semester_name, s.semester_description FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.degree_program_id IN (     SELECT degree_program_id FROM Degree_Programs WHERE program_type = 'Master' ) AND se.degree_program_id IN (     SELECT degree_program_id FROM Degree_Programs WHERE program_type = 'Bachelor' )	student_transcripts_tracking
SELECT s.semester_id FROM Student_Enrolment se JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id JOIN Semesters s ON se.semester_id = s.semester_id WHERE dp.degree_name IN ('Masters', 'Bachelors') GROUP BY s.semester_id HAVING COUNT(DISTINCT dp.degree_name) > 1	student_transcripts_tracking
SELECT COUNT(DISTINCT current_address_id) AS distinct_current_addresses FROM Students	student_transcripts_tracking
SELECT DISTINCT a.address_id, a.line_1, a.line_2, a.line_3, a.city, a.zip_postcode, a.state_province_county, a.country FROM Addresses a JOIN Students s ON a.address_id IN (s.current_address_id, s.permanent_address_id)	student_transcripts_tracking
SELECT * FROM Students ORDER BY student_name DESC	student_transcripts_tracking
SELECT DISTINCT other_details  FROM Student_Enrolment  ORDER BY student_id DESC	student_transcripts_tracking
SELECT section_description  FROM Sections  WHERE section_name = 'h'	student_transcripts_tracking
SELECT section_description  FROM Sections  WHERE section_name = 'h'	student_transcripts_tracking
SELECT s.first_name FROM Students s JOIN Addresses a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT DISTINCT s.first_name FROM Students s JOIN Addresses a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582'	student_transcripts_tracking
SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon ORDER BY Title ASC	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'	tvshow
SELECT Cartoon.Title, Cartoon.Directed_by  FROM Cartoon  ORDER BY Cartoon.Original_air_date	tvshow
SELECT Title, Directed_by  FROM Cartoon  ORDER BY Original_air_date	tvshow
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')	tvshow
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')	tvshow
SELECT Country, COUNT(id) AS Number_of_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_Channels DESC LIMIT 1	tvshow
SELECT Country, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Country ORDER BY Number_of_Channels DESC LIMIT 1	tvshow
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel	tvshow
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT content)  FROM TV_Channel	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'	tvshow
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'	tvshow
SELECT COUNT(*)  FROM TV_Channel  WHERE Language = 'English'	tvshow
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language ORDER BY Number_of_Channels ASC LIMIT 1	tvshow
SELECT Language, COUNT(*) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1	tvshow
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language	tvshow
SELECT Language, COUNT(*) AS Number_of_Channels FROM TV_Channel GROUP BY Language	tvshow
SELECT TC.Name, TS.Episode FROM Cartoon C JOIN TV_Channel TC ON C.Channel = TC.id JOIN TV_series TS ON TC.id = TS.Channel WHERE C.Title = 'The Rise of the Blue Beetle!'	tvshow
SELECT TV_Channel.Name  FROM Cartoon  JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id  WHERE Cartoon.Title = 'The Rise of the Blue Beetle'	tvshow
SELECT c.Title FROM Cartoon c JOIN TV_Channel tc ON c.Channel = tc.id WHERE tc.Name = 'Sky Radio'	tvshow
SELECT C.Title  FROM Cartoon AS C JOIN TV_Channel AS TC ON C.Channel = TC.id WHERE TC.name = 'Sky Radio'	tvshow
SELECT Episode  FROM TV_series  ORDER BY Rating	tvshow
SELECT Episode FROM TV_series ORDER BY Rating	tvshow
SELECT Episode, Rating  FROM TV_series  ORDER BY Rating DESC  LIMIT 3	tvshow
SELECT Episode, Rating  FROM TV_series  ORDER BY Rating DESC  LIMIT 3	tvshow
SELECT MIN(Share) AS Min_Share, MAX(Share) AS Max_Share FROM TV_series	tvshow
SELECT MAX(Share) AS Max_Share, MIN(Share) AS Min_Share FROM TV_series	tvshow
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Air_Date FROM Cartoon WHERE Title = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank  FROM TV_series  WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT TV_Channel.series_name  FROM TV_series  JOIN TV_Channel ON TV_series.Channel = TV_Channel.id  WHERE TV_series.Episode = 'A Love of a Lifetime'	tvshow
SELECT Title FROM Cartoon WHERE Episode = 'A Love of a Lifetime'	tvshow
SELECT T1.Episode  FROM TV_series AS T1  JOIN TV_Channel AS T2 ON T1.Channel = T2.id  WHERE T2.name = 'Sky Radio'	tvshow
SELECT Episode FROM TV_series WHERE Title = 'Sky Radio'	tvshow
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon WHERE Directed_by IN ('Director1', 'Director2', 'Director3') GROUP BY Directed_by	tvshow
SELECT Directed_by, COUNT(id) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by	tvshow
SELECT Production_code, Channel  FROM Cartoon  ORDER BY Original_air_date DESC  LIMIT 1	tvshow
SELECT Production_code, Channel  FROM Cartoon  ORDER BY Original_air_date DESC  LIMIT 1	tvshow
SELECT TV_Channel.Package_Option, TV_Channel.series_name  FROM TV_Channel  WHERE TV_Channel.Hight_definition_TV = 'Yes'	tvshow
SELECT TV_Channel.Package_Option, TV_series.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_Channel.Hight_definition_TV = 'Yes'	tvshow
SELECT DISTINCT TV_Channel.Country FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE Cartoon.Written_by = 'Todd Casey'	tvshow
SELECT DISTINCT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by = 'Todd Casey'	tvshow
SELECT T2.Country FROM TV_Channel AS T1 LEFT JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by != 'Todd Casey' GROUP BY T2.Country HAVING COUNT(T2.id) = 0	tvshow
SELECT DISTINCT Country  FROM TV_Channel  WHERE id NOT IN (     SELECT Channel      FROM Cartoon      WHERE Written_by = 'Todd Casey' )	tvshow
SELECT      TV_series.Title AS Series_Name,     TV_Channel.Country FROM      Cartoon JOIN      TV_series ON Cartoon.Channel = TV_series.Channel JOIN      TV_Channel ON TV_series.Channel = TV_Channel.id WHERE      Cartoon.Directed_by IN ('Ben Jones', 'Michael Chang') GROUP BY      TV_series.Title, TV_Channel.Country	tvshow
SELECT DISTINCT c.Title, tc.Country FROM Cartoon c JOIN TV_Channel tc ON c.Channel = tc.id WHERE c.Directed_by IN ('Ben Jones', 'Michael Chang')	tvshow
SELECT Pixel_aspect_ratio_PAR, Country  FROM TV_Channel  WHERE Language != 'English'	tvshow
SELECT Pixel_aspect_ratio_PAR, Country  FROM TV_Channel  WHERE Language != 'English'	tvshow
SELECT id  FROM TV_Channel  WHERE Country IN (     SELECT Country      FROM TV_Channel      GROUP BY Country      HAVING COUNT(id) > 2 )	tvshow
SELECT Channel  FROM TV_series  GROUP BY Channel  HAVING COUNT(Channel) > 2	tvshow
SELECT id  FROM TV_Channel  WHERE id NOT IN (     SELECT Channel      FROM Cartoon      WHERE Directed_by = 'Ben Jones' )	tvshow
SELECT id  FROM TV_Channel  WHERE id NOT IN (     SELECT DISTINCT channel      FROM Cartoon      WHERE Directed_by = 'Ben Jones' )	tvshow
SELECT Package_Option  FROM TV_Channel  WHERE id NOT IN (     SELECT Channel      FROM Cartoon      WHERE Directed_by = 'Ben Jones' )	tvshow
SELECT DISTINCT Package_Option  FROM TV_Channel  WHERE id NOT IN (     SELECT Channel      FROM Cartoon      WHERE Directed_by = 'Ben Jones' )	tvshow
SELECT COUNT(*) AS Total_Poker_Players FROM poker_player	poker_player
SELECT COUNT(*) FROM poker_player	poker_player
SELECT Earnings  FROM poker_player  ORDER BY Earnings DESC	poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC	poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player	poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player	poker_player
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player	poker_player
SELECT AVG(Earnings) AS Average_Earnings FROM poker_player	poker_player
SELECT Money_Rank  FROM poker_player  ORDER BY Earnings DESC  LIMIT 1	poker_player
SELECT Money_Rank  FROM poker_player  ORDER BY Earnings DESC  LIMIT 1	poker_player
SELECT MAX(Final_Table_Made) AS Max_Final_Tables FROM poker_player WHERE Earnings < 200000	poker_player
SELECT MAX(Final_Table_Made) AS Max_Final_Tables_Made FROM poker_player WHERE Earnings < 200000	poker_player
SELECT p.Name  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID	poker_player
SELECT p.Name  FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID	poker_player
SELECT p.Name  FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000	poker_player
SELECT p.Name  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  WHERE pp.Earnings > 300000	poker_player
SELECT p.Name  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  ORDER BY pp.Final_Table_Made ASC	poker_player
SELECT p.Name  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  ORDER BY pp.Final_Table_Made ASC	poker_player
SELECT p.Birth_Date  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  ORDER BY pp.Earnings ASC  LIMIT 1	poker_player
SELECT p.Birth_Date  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  ORDER BY pp.Earnings ASC  LIMIT 1	poker_player
SELECT p.Money_Rank FROM poker_player p JOIN people pe ON p.People_ID = pe.People_ID ORDER BY pe.Height DESC LIMIT 1	poker_player
SELECT p.Money_Rank  FROM poker_player p  JOIN people pe ON p.People_ID = pe.People_ID  ORDER BY pe.Height DESC  LIMIT 1	poker_player
SELECT AVG(poker_player.Earnings) AS Average_Earnings FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200	poker_player
SELECT AVG(poker_player.Earnings) AS Average_Earnings FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200	poker_player
SELECT p.Name  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  ORDER BY pp.Earnings DESC	poker_player
SELECT p.Name  FROM poker_player pp  JOIN people p ON pp.People_ID = p.People_ID  ORDER BY pp.Earnings DESC	poker_player
SELECT Nationality, COUNT(*) AS Number_of_People FROM people GROUP BY Nationality	poker_player
SELECT Nationality, COUNT(*) AS Number_of_People FROM people GROUP BY Nationality	poker_player
SELECT Nationality, COUNT(*) AS Count FROM people GROUP BY Nationality ORDER BY Count DESC LIMIT 1	poker_player
SELECT Nationality, COUNT(*) AS Count FROM people GROUP BY Nationality ORDER BY Count DESC LIMIT 1	poker_player
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2	poker_player
SELECT Nationality  FROM people  GROUP BY Nationality  HAVING COUNT(*) >= 2	poker_player
SELECT Name, Birth_Date  FROM people  ORDER BY Name ASC	poker_player
SELECT Name, Birth_Date  FROM people  ORDER BY Name ASC	poker_player
SELECT Name FROM people WHERE Nationality != 'Russia'	poker_player
SELECT Name FROM people WHERE Nationality != 'Russia'	poker_player
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT Name  FROM people  WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)	poker_player
SELECT COUNT(DISTINCT Nationality) FROM people	poker_player
SELECT COUNT(DISTINCT Nationality) FROM people	poker_player
SELECT COUNT(DISTINCT state) AS number_of_states FROM AREA_CODE_STATE	voter_1
SELECT c.contestant_number, c.contestant_name FROM CONTESTANTS c ORDER BY c.contestant_name DESC	voter_1
SELECT vote_id, phone_number, state FROM VOTES	voter_1
SELECT MAX(area_code) AS max_area_code, MIN(area_code) AS min_area_code FROM AREA_CODE_STATE	voter_1
SELECT MAX(created) AS last_vote_date FROM VOTES WHERE state = 'CA'	voter_1
SELECT contestant_name  FROM CONTESTANTS  WHERE contestant_name != 'Jessie Alloway'	voter_1
SELECT DISTINCT state, created FROM VOTES	voter_1
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS C JOIN VOTES V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name HAVING COUNT(V.vote_id) >= 2	voter_1
SELECT c.contestant_number, c.contestant_name, COUNT(v.vote_id) AS vote_count FROM CONTESTANTS c JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name ORDER BY vote_count ASC LIMIT 1	voter_1
SELECT COUNT(*)  FROM VOTES  WHERE state IN ('NY', 'CA')	voter_1
SELECT COUNT(*) AS no_votes_count FROM CONTESTANTS c LEFT JOIN VOTES v ON c.contestant_number = v.contestant_number WHERE v.vote_id IS NULL	voter_1
SELECT a.area_code, COUNT(v.vote_id) AS vote_count FROM VOTES v JOIN AREA_CODE_STATE a ON v.state = a.state GROUP BY a.area_code ORDER BY vote_count DESC LIMIT 1	voter_1
SELECT V.created, V.state, V.phone_number FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling'	voter_1
SELECT DISTINCT a.state FROM VOTES v JOIN CONTESTANTS c ON v.contestant_number = c.contestant_number JOIN AREA_CODE_STATE a ON v.state = a.state WHERE c.contestant_name IN ('Tabatha Gehling', 'Kelly Clauss') GROUP BY a.state HAVING COUNT(DISTINCT c.contestant_name) = 2	voter_1
SELECT c.contestant_name FROM CONTESTANTS c WHERE c.contestant_name LIKE '%Al%'	voter_1
SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT Name FROM country WHERE IndepYear > 1950	world_1
SELECT COUNT(*)  FROM country  WHERE GovernmentForm = 'Republic'	world_1
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'	world_1
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Region = 'Caribbean'	world_1
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent = 'Caribbean'	world_1
SELECT Continent FROM country WHERE Name = 'Anguilla'	world_1
SELECT Continent FROM country WHERE Name = 'Anguilla'	world_1
SELECT c.Region FROM country AS c JOIN city AS ci ON c.Code = ci.CountryCode WHERE ci.Name = 'Kabul'	world_1
SELECT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.Capital = 'Kabul'	world_1
SELECT Language, MAX(Percentage) AS MaxPercentage FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba'	world_1
SELECT Language  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.Name = 'Aruba' AND IsOfficial = 1	world_1
SELECT LifeExpectancy, Population FROM country WHERE Name = 'Brazil'	world_1
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'	world_1
SELECT T1.Region, SUM(T2.Population) AS TotalPopulation FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Angola' GROUP BY T1.Region	world_1
SELECT T1.Region, SUM(T2.Population) AS TotalPopulation FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T1.Name = 'Angola' GROUP BY T1.Region	world_1
SELECT AVG(LifeExpectancy)  FROM country  WHERE Region = 'Central Africa'	world_1
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Continent = 'Central Africa'	world_1
SELECT c.Name  FROM country c  WHERE c.Continent = 'Asia'  ORDER BY c.LifeExpectancy ASC  LIMIT 1	world_1
SELECT Name  FROM country  WHERE Continent = 'Asia'  ORDER BY LifeExpectancy ASC  LIMIT 1	world_1
SELECT SUM(Population), MAX(GNP)  FROM country  WHERE Continent = 'Asia'	world_1
SELECT SUM(Population) AS TotalPopulation, MAX(GNP) AS MaxGNP FROM country WHERE Continent = 'Asia'	world_1
SELECT AVG(LifeExpectancy)  FROM country  WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT AVG(LifeExpectancy)  FROM country  WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'	world_1
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent IN ('Asia', 'Europe')	world_1
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent IN ('Asia', 'Europe')	world_1
SELECT SUM(Population) AS TotalPopulation FROM city WHERE District = 'Gelderland'	world_1
SELECT SUM(Population) AS TotalPopulation FROM city WHERE District = 'Gelderland'	world_1
SELECT AVG(GNP), SUM(Population)  FROM country  WHERE GovernmentForm = 'US Territory'	world_1
SELECT AVG(T1.GNP) AS MeanGNP, SUM(T1.Population) AS TotalPopulation FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' AND T2.IsOfficial = 1	world_1
SELECT COUNT(DISTINCT Language) AS UniqueLanguages FROM countrylanguage	world_1
SELECT COUNT(DISTINCT Language) AS NumberOfDistinctLanguages FROM countrylanguage	world_1
SELECT COUNT(DISTINCT GovernmentForm) AS NumberOfGovernmentTypes FROM country WHERE Continent = 'Africa'	world_1
SELECT COUNT(DISTINCT GovernmentForm)  FROM country  WHERE Continent = 'Africa'	world_1
SELECT COUNT(Language) AS TotalLanguages FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba'	world_1
SELECT COUNT(*)  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.Name = 'Aruba'	world_1
SELECT COUNT(*)  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE country.Name = 'Afghanistan' AND IsOfficial = TRUE	world_1
SELECT COUNT(*)  FROM countrylanguage  JOIN country ON country.Code = countrylanguage.CountryCode  WHERE country.Name = 'Afghanistan' AND IsOfficial = 1	world_1
SELECT c.Name FROM country c JOIN (     SELECT CountryCode, COUNT(Language) AS LanguageCount     FROM countrylanguage     GROUP BY CountryCode     ORDER BY LanguageCount DESC     LIMIT 1 ) cl ON c.Code = cl.CountryCode	world_1
SELECT c.Name FROM country c JOIN (     SELECT CountryCode, COUNT(Language) AS LanguageCount     FROM countrylanguage     GROUP BY CountryCode     ORDER BY LanguageCount DESC     LIMIT 1 ) cl ON c.Code = cl.CountryCode	world_1
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS LanguageCount FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1	world_1
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS LanguageCount FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1	world_1
SELECT COUNT(*)  FROM countrylanguage  WHERE Language = 'English'  INTERSECT  SELECT COUNT(*)  FROM countrylanguage  WHERE Language = 'Dutch'	world_1
SELECT COUNT(*)  FROM countrylanguage  WHERE Language IN ('English', 'Dutch')  GROUP BY CountryCode  HAVING COUNT(DISTINCT Language) = 2	world_1
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'French') GROUP BY c.Name HAVING COUNT(DISTINCT cl.Language) = 2	world_1
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'French') GROUP BY c.Name HAVING COUNT(DISTINCT cl.Language) = 2	world_1
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 1 JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 1	world_1
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE (cl.Language = 'English' AND cl.IsOfficial = 1) AND EXISTS (     SELECT 1     FROM countrylanguage cl2     WHERE cl2.CountryCode = c.Code AND cl2.Language = 'French' AND cl2.IsOfficial = 1 )	world_1
SELECT COUNT(DISTINCT c.Continent)  FROM countrylanguage cl  JOIN country c ON cl.CountryCode = c.Code  WHERE cl.Language = 'Chinese'	world_1
SELECT COUNT(DISTINCT c.Continent) AS NumberOfContinents FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE cl.Language = 'Chinese'	world_1
SELECT DISTINCT T1.Region  FROM country AS T1  JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode  WHERE T2.Language IN ('English', 'Dutch')	world_1
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('Dutch', 'English') AND T2.IsOfficial = TRUE	world_1
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE (cl.Language = 'English' AND cl.IsOfficial = 1)    OR (cl.Language = 'Dutch' AND cl.IsOfficial = 1)	world_1
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch') AND cl.IsOfficial = 1	world_1
SELECT cl.Language, SUM(cl.Percentage) AS TotalPercentage FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.Continent = 'Asia' GROUP BY cl.Language ORDER BY TotalPercentage DESC LIMIT 1	world_1
SELECT Language, SUM(Percentage) AS TotalPercentage FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE Continent = 'Asia' GROUP BY Language ORDER BY TotalPercentage DESC LIMIT 1	world_1
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' GROUP BY cl.Language HAVING COUNT(cl.CountryCode) = 1	world_1
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' GROUP BY cl.Language HAVING COUNT(cl.CountryCode) = 1	world_1
SELECT c.Name, c.Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1	world_1
SELECT c.Name, c.Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1	world_1
SELECT c.Name, c.Population, c.LifeExpectancy FROM country c WHERE c.Continent = 'Asia' ORDER BY c.SurfaceArea DESC LIMIT 1	world_1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1	world_1
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'English' AND IsOfficial = 1 )	world_1
SELECT AVG(LifeExpectancy) AS MeanLifeExpectancy FROM country WHERE Code NOT IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'English' AND IsOfficial = 1 )	world_1
SELECT SUM(Population) AS TotalPopulation FROM country WHERE Code NOT IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'English' )	world_1
SELECT SUM(Population) AS TotalPopulation FROM city WHERE CountryCode NOT IN (     SELECT CountryCode     FROM countrylanguage     WHERE Language = 'English' )	world_1
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.HeadOfState = 'Beatrix' AND cl.IsOfficial = 1	world_1
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.HeadOfState = 'Beatrix' AND cl.IsOfficial = 1	world_1
SELECT COUNT(DISTINCT Language)  FROM countrylanguage  JOIN country ON countrylanguage.CountryCode = country.Code  WHERE IsOfficial = 'T' AND IndepYear < 1930	world_1
SELECT COUNT(DISTINCT cl.Language) AS TotalDistinctOfficialLanguages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE c.IndepYear < 1930 AND cl.IsOfficial = 'T'	world_1
SELECT Name  FROM country  WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')	world_1
SELECT Name  FROM country  WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')	world_1
SELECT c.Name FROM country c JOIN (     SELECT MIN(Population) AS MinPopAsia     FROM country     WHERE Continent = 'Asia' ) sub ON 1=1 WHERE c.Continent = 'Africa' AND c.Population < sub.MinPopAsia	world_1
SELECT c.Name FROM country c WHERE c.Continent = 'Africa' AND c.Population < (     SELECT MIN(Population)     FROM country     WHERE Continent = 'Asia' )	world_1
SELECT c.Name FROM country c WHERE c.Continent = 'Asia' AND c.Population > (     SELECT MAX(Population)     FROM country     WHERE Continent = 'Africa' )	world_1
SELECT c.Name FROM country c JOIN (     SELECT MAX(Population) AS MaxPopAfricanCountry     FROM country     WHERE Continent = 'Africa' ) sub ON 1=1 WHERE c.Continent = 'Asia' AND c.Population > sub.MaxPopAfricanCountry	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'	world_1
SELECT c.Code FROM country c WHERE NOT EXISTS (     SELECT 1     FROM countrylanguage cl     WHERE cl.CountryCode = c.Code AND cl.Language = 'English' ) AND c.GovernmentForm != 'Republic'	world_1
SELECT c.Code FROM country c WHERE NOT EXISTS (     SELECT 1     FROM countrylanguage cl     WHERE cl.CountryCode = c.Code AND cl.Language = 'English' ) AND c.GovernmentForm != 'Republic'	world_1
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Code IN (     SELECT cl.CountryCode     FROM countrylanguage cl     WHERE cl.Language = 'English' AND cl.IsOfficial = 0 )	world_1
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Region = 'Europe' AND NOT EXISTS (     SELECT 1     FROM countrylanguage cl     WHERE cl.CountryCode = co.Code     AND cl.Language = 'English'     AND cl.IsOfficial = TRUE )	world_1
SELECT DISTINCT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE cl.Language = 'Chinese' AND cl.IsOfficial = TRUE AND co.Continent = 'Asia'	world_1
SELECT DISTINCT c.Name FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'Chinese' AND cl.IsOfficial = 1	world_1
SELECT Name, IndepYear, SurfaceArea  FROM country  ORDER BY Population ASC  LIMIT 1	world_1
SELECT Name, IndepYear, SurfaceArea  FROM country  ORDER BY Population ASC  LIMIT 1	world_1
SELECT c.Population, c.Name, c.HeadOfState  FROM country c  ORDER BY c.SurfaceArea DESC  LIMIT 1	world_1
SELECT c.Name, c.Population, c.HeadOfState FROM country c ORDER BY c.SurfaceArea DESC LIMIT 1	world_1
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING COUNT(cl.Language) >= 3	world_1
SELECT c.Name, COUNT(cl.Language) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING COUNT(cl.Language) > 2	world_1
SELECT District, COUNT(*) AS CityCount FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District	world_1
SELECT District, COUNT(*) AS CityCount FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District	world_1
SELECT c.GovernmentForm, SUM(c.Population) AS TotalPopulation FROM country c GROUP BY c.GovernmentForm HAVING AVG(c.LifeExpectancy) > 72	world_1
SELECT c.GovernmentForm, SUM(c.Population) AS TotalPopulation FROM country c JOIN city ci ON c.Code = ci.CountryCode GROUP BY c.GovernmentForm HAVING AVG(c.LifeExpectancy) > 72	world_1
SELECT c.Continent, AVG(c.LifeExpectancy) AS AvgLifeExpectancy, SUM(c.Population) AS TotalPopulation FROM country c GROUP BY c.Continent HAVING AVG(c.LifeExpectancy) < 72	world_1
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72	world_1
SELECT Name, SurfaceArea  FROM country  ORDER BY SurfaceArea DESC  LIMIT 5	world_1
SELECT Name, SurfaceArea  FROM country  ORDER BY SurfaceArea DESC  LIMIT 5	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population DESC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT Name FROM country ORDER BY Population ASC LIMIT 3	world_1
SELECT COUNT(*)  FROM country  WHERE Continent = 'Asia'	world_1
SELECT COUNT(*)  FROM country  WHERE Continent = 'Asia'	world_1
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000	world_1
SELECT c.Name FROM country c WHERE c.Continent = 'Europe' AND c.Population = 80000	world_1
SELECT SUM(Population) AS TotalPopulation, AVG(SurfaceArea) AS AverageArea FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000	world_1
SELECT SUM(Population) AS TotalPopulation, AVG(SurfaceArea) AS AverageSurfaceArea FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000	world_1
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000	world_1
SELECT Language  FROM countrylanguage  GROUP BY Language  ORDER BY COUNT(CountryCode) DESC  LIMIT 1	world_1
SELECT Language  FROM countrylanguage  GROUP BY Language  ORDER BY COUNT(DISTINCT CountryCode) DESC  LIMIT 1	world_1
SELECT c.Name, cl.Language, MAX(cl.Percentage) AS MaxPercentage FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name	world_1
SELECT c.Code AS CountryCode, cl.Language AS Language FROM countrylanguage cl JOIN (     SELECT CountryCode, MAX(Percentage) AS MaxPercentage     FROM countrylanguage     GROUP BY CountryCode ) max_cl ON cl.CountryCode = max_cl.CountryCode AND cl.Percentage = max_cl.MaxPercentage	world_1
SELECT COUNT(*)  FROM countrylanguage  WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')	world_1
SELECT COUNT(*)  FROM countrylanguage  WHERE Language = 'Spanish' AND IsOfficial = 1	world_1
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1	world_1
SELECT c.Code FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Spanish' AND cl.Percentage > 50	world_1
SELECT COUNT(*) FROM conductor	orchestra
SELECT COUNT(*) FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Age ASC	orchestra
SELECT Name FROM conductor ORDER BY Age	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Name FROM conductor WHERE Nationality != 'USA'	orchestra
SELECT Record_Company  FROM orchestra  ORDER BY Year_of_Founded DESC	orchestra
SELECT Record_Company  FROM orchestra  ORDER BY Year_of_Founded DESC	orchestra
SELECT AVG(Attendance) AS Average_Attendance FROM show	orchestra
SELECT AVG(Attendance) AS Average_Attendance FROM show	orchestra
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'	orchestra
SELECT MAX(Share) AS Max_Share, MIN(Share) AS Min_Share FROM performance WHERE Type != 'Live final'	orchestra
SELECT COUNT(DISTINCT Nationality) FROM conductor	orchestra
SELECT COUNT(DISTINCT Nationality) FROM conductor	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC	orchestra
SELECT c.Name, COUNT(o.Orchestra_ID) AS Years_Worked FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID, c.Name ORDER BY Years_Worked DESC	orchestra
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1	orchestra
SELECT c.Name  FROM conductor c ORDER BY c.Year_of_Work DESC LIMIT 1	orchestra
SELECT c.Name, o.Orchestra FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID	orchestra
SELECT c.Name, o.Orchestra FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID	orchestra
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID, c.Name HAVING COUNT(o.Orchestra_ID) > 1	orchestra
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID, c.Name HAVING COUNT(o.Orchestra) > 1	orchestra
SELECT c.Conductor, COUNT(o.Orchestra) AS Number_of_Orchestras FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor ORDER BY Number_of_Orchestras DESC LIMIT 1	orchestra
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID, c.Name ORDER BY COUNT(o.Orchestra_ID) DESC LIMIT 1	orchestra
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008	orchestra
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008	orchestra
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company	orchestra
SELECT Record_Company, COUNT(Orchestra_ID) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company	orchestra
SELECT Major_Record_Format, COUNT(*) AS Count FROM orchestra GROUP BY Major_Record_Format ORDER BY Count ASC	orchestra
SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC	orchestra
SELECT Record_Company, COUNT(*) AS Shared_Orchestras FROM orchestra GROUP BY Record_Company ORDER BY Shared_Orchestras DESC LIMIT 1	orchestra
SELECT Record_Company, COUNT(*) AS Number_of_Orchestras FROM orchestra GROUP BY Record_Company ORDER BY Number_of_Orchestras DESC LIMIT 1	orchestra
SELECT Orchestra  FROM orchestra  WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)	orchestra
SELECT Orchestra  FROM orchestra  WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003	orchestra
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003	orchestra
SELECT COUNT(*)  FROM orchestra  WHERE Major_Record_Format IN ('CD', 'DVD')	orchestra
SELECT COUNT(*)  FROM orchestra  WHERE Major_Record_Format IN ('CD', 'DVD')	orchestra
SELECT o.Year_of_Founded FROM orchestra o JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID GROUP BY o.Orchestra_ID, o.Year_of_Founded HAVING COUNT(p.Performance_ID) > 1	orchestra
SELECT o.Year_of_Founded FROM orchestra o JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID GROUP BY o.Orchestra_ID, o.Year_of_Founded HAVING COUNT(p.Performance_ID) > 1	orchestra
SELECT COUNT(*) FROM Highschooler	network_1
SELECT COUNT(*) FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT DISTINCT grade FROM Highschooler	network_1
SELECT name, grade FROM Highschooler	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT grade FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT name FROM Highschooler WHERE grade = 10	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT ID FROM Highschooler WHERE name = 'Kyle'	network_1
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)	network_1
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)	network_1
SELECT grade, COUNT(*) AS num_highschoolers FROM Highschooler GROUP BY grade	network_1
SELECT grade, COUNT(*) AS number_of_students FROM Highschooler GROUP BY grade	network_1
SELECT grade  FROM Highschooler  GROUP BY grade  ORDER BY COUNT(*) DESC  LIMIT 1	network_1
SELECT grade  FROM Highschooler  GROUP BY grade  ORDER BY COUNT(*) DESC  LIMIT 1	network_1
SELECT grade  FROM Highschooler  GROUP BY grade  HAVING COUNT(ID) >= 4	network_1
SELECT grade  FROM Highschooler  GROUP BY grade  HAVING COUNT(*) >= 4	network_1
SELECT student_id, COUNT(friend_id) AS number_of_friends FROM Friend GROUP BY student_id	network_1
SELECT student_id, COUNT(friend_id) AS friend_count FROM Friend GROUP BY student_id	network_1
SELECT h.name, COUNT(f.friend_id) AS num_friends FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID	network_1
SELECT h.name, COUNT(f.friend_id) AS friend_count FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID	network_1
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name ORDER BY COUNT(f.friend_id) DESC LIMIT 1	network_1
SELECT h1.name FROM Highschooler h1 JOIN Friend f ON h1.ID = f.student_id GROUP BY h1.ID, h1.name ORDER BY COUNT(f.friend_id) DESC LIMIT 1	network_1
SELECT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id GROUP BY h.ID, h.name HAVING COUNT(f.friend_id) >= 3	network_1
SELECT h1.name FROM Highschooler h1 JOIN Friend f ON h1.ID = f.student_id GROUP BY h1.ID, h1.name HAVING COUNT(f.friend_id) >= 3	network_1
SELECT H2.name FROM Highschooler AS H1 JOIN Friend AS F ON H1.ID = F.student_id JOIN Highschooler AS H2 ON F.friend_id = H2.ID WHERE H1.name = 'Kyle'	network_1
SELECT H1.name  FROM Highschooler AS H1  JOIN Friend AS F ON H1.ID = F.student_id  JOIN Highschooler AS H2 ON F.friend_id = H2.ID  WHERE H1.name = 'Kyle'	network_1
SELECT COUNT(*) AS friend_count FROM Friend f JOIN Highschooler h ON f.student_id = h.ID WHERE h.name = 'Kyle'	network_1
SELECT COUNT(*)  FROM Friend f JOIN Highschooler h ON f.student_id = h.ID WHERE h.name = 'Kyle'	network_1
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)	network_1
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)	network_1
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)	network_1
SELECT name  FROM Highschooler  WHERE ID NOT IN (SELECT student_id FROM Friend)	network_1
SELECT student_id FROM Friend WHERE student_id IN (     SELECT friend_id     FROM Friend ) AND student_id IN (     SELECT liker_id     FROM Likes )	network_1
SELECT student_id FROM Friend INTERSECT SELECT student_id FROM Likes	network_1
SELECT H1.name  FROM Highschooler AS H1 JOIN Friend AS F ON H1.id = F.student_id JOIN Likes AS L ON H1.id = L.student_id	network_1
SELECT h1.name  FROM Highschooler h1 JOIN Friend f ON h1.id = f.student_id JOIN Likes l ON h1.id = l.student_id GROUP BY h1.id, h1.name HAVING COUNT(DISTINCT f.friend_id) > 0 AND COUNT(DISTINCT l.liked_id) > 0	network_1
SELECT student_id, COUNT(*) AS like_count FROM Likes GROUP BY student_id	network_1
SELECT student_id, COUNT(*) AS like_count FROM Likes GROUP BY student_id	network_1
SELECT H1.name, COUNT(L.student_id) AS number_of_likes FROM Highschooler H1 JOIN Likes L ON H1.ID = L.student_id GROUP BY H1.ID	network_1
SELECT H1.name, COUNT(L.student_id) AS like_count FROM Highschooler H1 JOIN Likes L ON H1.ID = L.student_id GROUP BY H1.ID	network_1
SELECT H.name FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.ID, H.name ORDER BY COUNT(L.liked_id) DESC LIMIT 1	network_1
SELECT h.name  FROM Highschooler h  JOIN Likes l ON h.ID = l.student_id  GROUP BY h.ID, h.name  ORDER BY COUNT(l.liked_id) DESC  LIMIT 1	network_1
SELECT H1.name FROM Highschooler H1 JOIN Likes L ON H1.ID = L.student_id GROUP BY H1.ID, H1.name HAVING COUNT(L.liked_id) >= 2	network_1
SELECT H1.name  FROM Highschooler H1  JOIN Likes L ON H1.ID = L.student_id  GROUP BY H1.ID, H1.name  HAVING COUNT(L.liked_id) >= 2	network_1
SELECT h1.name FROM Highschooler h1 JOIN Friend f ON h1.ID = f.student_id WHERE h1.grade > 5 GROUP BY h1.ID, h1.name HAVING COUNT(f.friend_id) >= 2	network_1
SELECT h1.name FROM Highschooler h1 JOIN Friend f ON h1.ID = f.student_id WHERE h1.grade > 5 GROUP BY h1.ID, h1.name HAVING COUNT(f.friend_id) >= 2	network_1
SELECT COUNT(*)  FROM Likes L JOIN Highschooler H ON L.student_id = H.ID WHERE H.name = 'Kyle'	network_1
SELECT COUNT(*)  FROM Likes L JOIN Highschooler H ON L.student_id = H.ID WHERE H.name = 'Kyle'	network_1
SELECT AVG(H.grade)  FROM Highschooler H  JOIN Friend F ON H.ID = F.student_id	network_1
SELECT AVG(H.grade)  FROM Highschooler H JOIN Friend F ON H.ID = F.student_id	network_1
SELECT MIN(grade)  FROM Highschooler  WHERE ID NOT IN (SELECT student_id FROM Friend)	network_1
SELECT MIN(grade)  FROM Highschooler  WHERE ID NOT IN (SELECT student_id FROM Friend)	network_1
SELECT DISTINCT o.state AS shared_state FROM Owners o JOIN Professionals p ON o.state = p.state	dog_kennels
SELECT DISTINCT o.state AS common_state FROM Owners o JOIN Professionals p ON o.state = p.state	dog_kennels
SELECT AVG(age) AS average_age FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)	dog_kennels
SELECT AVG(Dogs.age) AS average_age FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id	dog_kennels
SELECT DISTINCT p.professional_id, p.last_name, p.cell_phone FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (p.state != 'Indiana' AND t.treatment_id IN (     SELECT treatment_id     FROM Treatments     GROUP BY professional_id     HAVING COUNT(treatment_id) > 2 ))	dog_kennels
SELECT DISTINCT p.professional_id, p.last_name, p.cell_phone FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE p.state = 'Indiana' OR (     SELECT COUNT(*)      FROM Treatments      WHERE professional_id = p.professional_id ) > 2	dog_kennels
SELECT d.name FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY d.dog_id, d.name HAVING SUM(t.cost_of_treatment) <= 1000	dog_kennels
SELECT D.name  FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.name HAVING SUM(T.cost_of_treatment) > 1000	dog_kennels
SELECT DISTINCT o.first_name FROM Owners o WHERE EXISTS (     SELECT 1     FROM Dogs d     WHERE d.owner_id = o.owner_id ) AND NOT EXISTS (     SELECT 1     FROM Dogs d2     WHERE d2.name = o.first_name )	dog_kennels
SELECT DISTINCT o.first_name FROM Owners o WHERE EXISTS (     SELECT 1     FROM Dogs d     WHERE d.owner_id = o.owner_id ) AND NOT EXISTS (     SELECT 1     FROM Dogs d2     WHERE d2.name = o.first_name )	dog_kennels
SELECT p.professional_id, p.role, o.email FROM Professionals p LEFT JOIN Treatments t ON p.professional_id = t.professional_id JOIN Owners o ON p.owner_id = o.owner_id WHERE t.treatment_id IS NULL	dog_kennels
SELECT p.professional_id, p.role, p.email FROM Professionals p LEFT JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.treatment_id IS NULL	dog_kennels
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1	dog_kennels
SELECT o.owner_id, o.first_name, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1	dog_kennels
SELECT p.professional_id, p.role, d.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id JOIN Dogs d ON t.dog_id = d.dog_id GROUP BY p.professional_id, p.role, d.first_name HAVING COUNT(t.treatment_id) >= 2	dog_kennels
SELECT p.professional_id, p.role, d.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id JOIN Dogs d ON t.dog_id = d.dog_id GROUP BY p.professional_id, p.role, d.first_name HAVING COUNT(t.treatment_id) >= 2	dog_kennels
SELECT B.breed_name, COUNT(D.dog_id) AS dog_count FROM Breeds B JOIN Dogs D ON B.breed_code = D.breed_code GROUP BY B.breed_name ORDER BY dog_count DESC LIMIT 1	dog_kennels
SELECT b.breed_name FROM Breeds b JOIN Dogs d ON b.breed_code = d.breed_code GROUP BY b.breed_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1	dog_kennels
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1	dog_kennels
SELECT tt.treatment_type_description FROM Treatment_Types tt JOIN Treatments t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_code, tt.treatment_type_description ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1	dog_kennels
SELECT tt.treatment_type_description FROM Treatment_Types tt JOIN Treatments t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_code, tt.treatment_type_description ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1	dog_kennels
SELECT o.owner_id, o.zip_code, SUM(d.date_adopted - d.date_arrived) AS total_amount_paid FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.zip_code ORDER BY total_amount_paid DESC LIMIT 1	dog_kennels
SELECT o.owner_id, o.zip_code, SUM(d.weight * 10) AS total_spent FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.zip_code ORDER BY total_spent DESC LIMIT 1	dog_kennels
SELECT p.professional_id, p.cell_phone FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_phone HAVING COUNT(DISTINCT t.treatment_type_code) >= 2	dog_kennels
SELECT p.professional_id, p.cell_phone FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_phone HAVING COUNT(DISTINCT t.treatment_type_code) >= 2	dog_kennels
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)	dog_kennels
SELECT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)	dog_kennels
SELECT      T1.date_of_treatment,     P.first_name FROM      Treatments AS T1 JOIN      Professionals AS P ON T1.professional_id = P.professional_id	dog_kennels
SELECT      T1.date_of_treatment,      P.first_name FROM      Treatments AS T1 JOIN      Professionals AS P ON T1.professional_id = P.professional_id	dog_kennels
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code	dog_kennels
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code	dog_kennels
SELECT O.first_name, O.last_name, S.size_description FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Sizes S ON D.size_code = S.size_code	dog_kennels
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Dogs JOIN Owners ON Dogs.owner_id = Owners.owner_id JOIN Sizes ON Dogs.size_code = Sizes.size_code	dog_kennels
SELECT Owners.first_name, Dogs.name FROM Dogs JOIN Owners ON Dogs.owner_id = Owners.owner_id	dog_kennels
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id	dog_kennels
SELECT d.dog_name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE d.breed_code IN (     SELECT breed_code     FROM Breeds     GROUP BY breed_code     HAVING COUNT(*) = 1 )	dog_kennels
SELECT d.dog_name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE d.breed_code IN (     SELECT breed_code     FROM Breeds     WHERE breed_name NOT IN (         SELECT breed_name         FROM Breeds         GROUP BY breed_name         HAVING COUNT(*) > 1     ) ) ORDER BY t.date_of_treatment	dog_kennels
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Owners.state = 'Virginia'	dog_kennels
SELECT O.first_name, D.name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia'	dog_kennels
SELECT d.date_arrived, d.date_departed FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id	dog_kennels
SELECT D.date_arrived, D.date_departed FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id	dog_kennels
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.date_of_birth DESC LIMIT 1	dog_kennels
SELECT o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id ORDER BY d.date_of_birth DESC LIMIT 1	dog_kennels
SELECT email_address  FROM Professionals  WHERE state IN ('Hawaii', 'Wisconsin')	dog_kennels
SELECT email_address  FROM Professionals  WHERE state IN ('Hawaii', 'Wisconsin')	dog_kennels
SELECT date_arrived, date_departed FROM Dogs	dog_kennels
SELECT date_arrived, date_departed FROM Dogs	dog_kennels
SELECT COUNT(DISTINCT dog_id) AS number_of_dogs_with_treatments FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT dog_id) AS number_of_dogs_with_treatments FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments	dog_kennels
SELECT COUNT(DISTINCT professional_id) AS number_of_professionals FROM Treatments	dog_kennels
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'	dog_kennels
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'	dog_kennels
SELECT first_name, last_name, email_address  FROM Owners  WHERE state LIKE '%North%'	dog_kennels
SELECT first_name, last_name, email_address  FROM Owners  WHERE state LIKE '%North%'	dog_kennels
SELECT COUNT(*)  FROM Dogs  WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT COUNT(*)  FROM Dogs  WHERE age < (SELECT AVG(age) FROM Dogs)	dog_kennels
SELECT MAX(cost_of_treatment) AS most_recent_treatment_cost FROM Treatments	dog_kennels
SELECT cost_of_treatment  FROM Treatments  ORDER BY date_of_treatment DESC  LIMIT 1	dog_kennels
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)	dog_kennels
SELECT COUNT(DISTINCT dog_id) AS number_of_dogs_with_treatments FROM Treatments	dog_kennels
SELECT COUNT(owner_id) AS temp_owner_count FROM Owners WHERE owner_id NOT IN (SELECT DISTINCT owner_id FROM Dogs WHERE abandoned_yn = 'N')	dog_kennels
SELECT COUNT(owner_id) AS num_owners_without_dogs FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE abandoned_yn = 'N' AND date_departed IS NULL)	dog_kennels
SELECT COUNT(professional_id) AS professional_count FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT COUNT(professional_id) AS num_professionals_without_treatments FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)	dog_kennels
SELECT name, age, weight  FROM Dogs  WHERE abandoned_yn = 1	dog_kennels
SELECT name, age, weight  FROM Dogs  WHERE abandoned_yn = 1	dog_kennels
SELECT AVG(age) AS average_age FROM Dogs	dog_kennels
SELECT AVG(age) AS average_age FROM Dogs	dog_kennels
SELECT MAX(age) AS oldest_dog_age FROM Dogs	dog_kennels
SELECT MAX(age) AS oldest_dog_age FROM Dogs	dog_kennels
SELECT charge_type, charge_amount FROM Charges	dog_kennels
SELECT charge_type, charge_amount FROM Charges	dog_kennels
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges	dog_kennels
SELECT MAX(charge_amount) AS max_charge_amount FROM Charges	dog_kennels
SELECT email_address, cell_number, home_phone FROM Professionals	dog_kennels
SELECT email_address, cell_number, home_phone FROM Professionals	dog_kennels
SELECT DISTINCT B.breed_name, S.size_description FROM Breeds B JOIN Dogs D ON B.breed_code = D.breed_code JOIN Sizes S ON D.size_code = S.size_code	dog_kennels
SELECT DISTINCT breed_name, size_code  FROM Dogs  JOIN Breeds ON Dogs.breed_code = Breeds.breed_code	dog_kennels
SELECT P.first_name, T.treatment_type_description FROM Professionals P JOIN Treatments TR ON P.professional_id = TR.professional_id JOIN Treatment_Types T ON TR.treatment_type_code = T.treatment_type_code	dog_kennels
SELECT p.first_name, tt.treatment_type_description FROM Professionals p JOIN Treatment_Types tt ON p.role_code = tt.treatment_type_code	dog_kennels
SELECT COUNT(*) FROM singer	singer
SELECT COUNT(*) FROM singer	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC	singer
SELECT Birth_Year, Citizenship FROM singer	singer
SELECT Birth_Year, Citizenship FROM singer	singer
SELECT Name FROM singer WHERE Citizenship != 'France'	singer
SELECT Name FROM singer WHERE Citizenship != 'French'	singer
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)	singer
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1	singer
SELECT Citizenship, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Citizenship	singer
SELECT Citizenship, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Citizenship	singer
SELECT Citizenship, COUNT(*) AS Count FROM singer GROUP BY Citizenship ORDER BY Count DESC LIMIT 1	singer
SELECT Citizenship  FROM singer  GROUP BY Citizenship  ORDER BY COUNT(*) DESC  LIMIT 1	singer
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship	singer
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship	singer
SELECT song.Title, singer.Name  FROM song  JOIN singer ON song.Singer_ID = singer.Singer_ID	singer
SELECT s.Title, si.Name FROM song s JOIN singer si ON s.Singer_ID = si.Singer_ID	singer
SELECT DISTINCT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000	singer
SELECT DISTINCT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000	singer
SELECT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Singer_ID, s.Name HAVING COUNT(sg.Song_ID) > 1	singer
SELECT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Singer_ID, s.Name HAVING COUNT(sg.Song_ID) > 1	singer
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name	singer
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)	singer
SELECT Citizenship  FROM singer  WHERE Birth_Year < 1945  INTERSECT  SELECT Citizenship  FROM singer  WHERE Birth_Year > 1955	singer
SELECT Citizenship  FROM singer  WHERE Birth_Year < 1945  INTERSECT  SELECT Citizenship  FROM singer  WHERE Birth_Year > 1955	singer
SELECT COUNT(*) AS total_available_features FROM Other_Available_Features	real_estate_properties
SELECT rft.feature_type_name FROM Ref_Feature_Types rft JOIN Other_Available_Features oaf ON rft.feature_type_code = oaf.feature_type_code WHERE oaf.feature_name = 'AirCon'	real_estate_properties
SELECT property_type_description  FROM Ref_Property_Types  WHERE property_type_code = 'desired_property_type_code'	real_estate_properties
SELECT p.property_name FROM Properties p JOIN Ref_Property_Types r ON p.property_type_code = r.property_type_code WHERE (r.property_type_description = 'House' OR r.property_type_description = 'Apartment') AND p.room_count > 1	real_estate_properties
