-- ALTEING THE DATA TYPE IN MY COLUMNS FROM THIS CovidDeathTable

-- Converting the columna date varchar(50), ejemplo "24/02/2020" to date
-- Paso 1: Verifica el formato actual de la columna
SELECT * FROM dbo.CovidDeaths WHERE ISDATE(date) = 0;

-- Paso 2: Convierte el formato de cadena a un formato de fecha reconocido por SQL Server
-- Suponiendo que el formato actual de la columna es "dd/mm/yyyy"
UPDATE dbo.CovidDeaths
SET date = CONVERT(date, date, 103);

-- Paso 3: Actualiza la columna para convertirla al tipo de datos date
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN date DATE;

-- Converting the population varchar(50) column to biginit
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN population BIGINT;

-- Converting the total_cases varchar(50) column to int
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN total_cases INT;

-- Converting the new_cases varchar(50) column to int
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_cases INT;

-- Converting the new_cases_smoothed varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_cases_smoothed FLOAT;

-- Converting the total_deaths varchar(50) column to int
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN total_deaths int;

-- Converting the new_deaths varchar(50) column to int
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_deaths int;

-- Converting the new_deaths_smoothed varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_deaths_smoothed float;

-- Converting the total_cases_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN total_cases_per_million float;

-- Converting the new_cases_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_cases_per_million float;

-- Converting the new_cases_smoothed_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_cases_smoothed_per_million float;

-- Converting the total_deaths_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN total_deaths_per_million float;

-- Converting the new_deaths_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_deaths_per_million float;

-- Converting the new_deaths_smoothed_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN new_deaths_smoothed_per_million float;

-- Converting the reproduction_rate varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN reproduction_rate float;

-- Converting the icu_patients varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN icu_patients float;

-- Converting the icu_patients_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN icu_patients_per_million float;

-- Converting the hosp_patients varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN hosp_patients float;

-- Converting the hosp_patients_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN hosp_patients_per_million float;

-- Converting the weekly_icu_admissions varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN weekly_icu_admissions float;

-- Converting the weekly_icu_admissions_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN weekly_icu_admissions_per_million float;

-- Converting the weekly_hosp_admissions varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN weekly_hosp_admissions float;

-- Converting the weekly_hosp_admissions_per_million varchar(50) column to float
ALTER TABLE dbo.CovidDeaths
ALTER COLUMN weekly_hosp_admissions_per_million float;
