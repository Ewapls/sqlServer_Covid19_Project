-- Queries used for vizualition


-- 1. Global Numbers

Select 
	SUM(new_cases) as total_cases, 
	SUM(new_deaths) as total_deaths, 
	SUM(cast(new_deaths as float))/SUM(New_Cases)*100 as DeathPercentage
From dbo.CovidDeaths
where continent != '' 



-- 2. Total Deaths Per Continent

Select 
	location, 
	SUM(new_deaths) as TotalDeathCount
From dbo.CovidDeaths
--Where location like '%states%'
Where continent = '' 
and location not in ('World', 'European Union', 'International', 'High income', 'Upper middle income', 'Lower middle income', 'Low income')
Group by location
order by TotalDeathCount desc



-- 3. Max Percentage Population Infected per Country

Select 
	Location, 
	Population, 
	MAX(total_cases) as HighestInfectionCount,  
	Max((cast(total_cases as float)/population))*100 as PercentPopulationInfected
From dbo.CovidDeaths
Where location != ''
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc



-- 4. Percentage of infected population over time

Select 
	Location, 
	Population,
	date, 
	MAX(total_cases) as HighestInfectionCount,  
	Max((cast(total_cases as float)/population))*100 as PercentPopulationInfected
From dbo.CovidDeaths
Where date < '2024-04-01'
Group by Location, Population, date
Order by date