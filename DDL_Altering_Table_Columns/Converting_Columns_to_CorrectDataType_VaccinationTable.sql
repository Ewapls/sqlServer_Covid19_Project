-- Converting the columna date varchar(50), ejemplo "24/02/2020" to date
-- Paso 1: Verifica el formato actual de la columna
SELECT * FROM dbo.CovidVaccinations WHERE ISDATE(date) = 0;

-- Paso 2: Convierte el formato de cadena a un formato de fecha reconocido por SQL Server
-- Suponiendo que el formato actual de la columna es "dd/mm/yyyy"
UPDATE dbo.CovidVaccinations
SET date = CONVERT(date, date, 103);

-- Paso 3: Actualiza la columna para convertirla al tipo de datos date
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN date DATE;

-- total_tests varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN total_tests float;

-- new_tests varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_tests float;

-- total_tests_per_thousand varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN total_tests_per_thousand float;

-- new_tests_per_thousand varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_tests_per_thousand float;

-- new_tests_smoothed varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_tests_smoothed float;

-- new_tests_smoothed_per_thousand varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_tests_smoothed_per_thousand float;

-- positive_rate varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN positive_rate float;

-- tests_per_case varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN tests_per_case float;

-- total_vaccinations varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN total_vaccinations float;

-- people_vaccinated varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN people_vaccinated float;

-- people_fully_vaccinated varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN people_fully_vaccinated float;

-- total_boosters varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN total_boosters float;

-- new_vaccinations varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_vaccinations float;

-- new_vaccinations_smoothed varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_vaccinations_smoothed float;

-- total_vaccinations_per_hundred varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN total_vaccinations_per_hundred float;

-- people_vaccinated_per_hundred varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN people_vaccinated_per_hundred float;

-- people_fully_vaccinated_per_hundred varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN people_fully_vaccinated_per_hundred float;

-- total_boosters_per_hundred varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN total_boosters_per_hundred float;

-- new_vaccinations_smoothed_per_million varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_vaccinations_smoothed_per_million float;

-- new_people_vaccinated_smoothed varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_people_vaccinated_smoothed float;

-- new_people_vaccinated_smoothed_per_hundred varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN new_people_vaccinated_smoothed_per_hundred float;

-- stringency_index varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN stringency_index float;

-- population_density varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN population_density float;

-- median_age varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN median_age float;

-- aged_65_older varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN aged_65_older float;

-- aged_70_older varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN aged_70_older float;

-- gdp_per_capita varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN gdp_per_capita float;

-- extreme_poverty varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN extreme_poverty float;

-- cardiovasc_death_rate varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN cardiovasc_death_rate float;

-- diabetes_prevalence varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN diabetes_prevalence float;

-- female_smokers varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN female_smokers float;

-- male_smokers varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN male_smokers float;

-- handwashing_facilities varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN handwashing_facilities float;

-- hospital_beds_per_thousand varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN hospital_beds_per_thousand float;

-- life_expectancy varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN life_expectancy float;

-- human_development_index varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN human_development_index float;

-- excess_mortality_cumulative_absolute varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN excess_mortality_cumulative_absolute float;

-- excess_mortality_cumulative varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN excess_mortality_cumulative float;

-- excess_mortality varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN excess_mortality float;

-- life_expectancy varchar(50) to float
ALTER TABLE dbo.CovidVaccinations
ALTER COLUMN excess_mortality_cumulative_per_million float;