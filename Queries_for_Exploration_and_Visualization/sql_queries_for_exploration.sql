-- Select the data that I'm going to use
Select 
	location,
	date,
	total_cases,
	new_cases,
	total_deaths,
	population
From dbo.CovidDeaths
Order by  1, 2

Select *
From dbo.CovidDeaths

Select *
From dbo.CovidVaccinations


Select 
	min(dea.date) as min_date,
	max(dea.date) as max_date
From dbo.CovidDeaths as dea 
Join dbo.CovidVaccinations as vac
	on dea.location = vac.location 
	and dea.date = vac.date
Where dea.continent != ''



Select 
	location,
	max(total_cases) as total_cases,
	max(total_deaths) as total_deaths
From dbo.CovidDeaths
Group by location
Order by 2 desc

-- Looking at Total Cases vs Total deaths
-- Shows the likelihood of dying if you contract covid in your country
Select 
	location,
	date,
	total_cases,
	total_deaths,
	(cast(total_deaths as float)/total_cases)*100 as DeathPercentage
From dbo.CovidDeaths
Where total_cases != 0 and continent != '' --and date > '2022-06-01'
      --and location = 'Peru'
Order by 1, 2

-- Looking at the Total Cases vs Population
-- Shows what percentage of population got Covid
Select 
	location,
	date,
	population,
	total_cases,
	(cast(total_cases as float)/population)*100 as InfectedPercentage
From dbo.CovidDeaths
Where total_cases != 0 and continent != '' 
	  --and location = 'Peru'


-- Country with the hightests infection rates due to its population
Select 
	location,
	population,
	max(total_cases) as total_infection_cases,
	(max(cast(total_cases as float))/population)*100 as InfectedPercentage
From dbo.CovidDeaths
Where total_cases != 0 and continent != ''
Group by location, population
Order by InfectedPercentage desc


-- Country with the hightests death rates due to its population
Select 
	location,
	population,
	max(total_deaths) as hightest_DeathCount,
	(max(cast(total_deaths as float))/population)*100 as DeathPercentage
From dbo.CovidDeaths
Where total_cases != 0 and continent != ''                           
Group by location, population
Order by DeathPercentage desc

Select 
	location,
	max(total_deaths) as hightest_DeathCount
From dbo.CovidDeaths
Where continent != ''  --This is getting rid of the continents or anything that is not a country
Group by location 
Order by hightest_DeathCount desc


--Lest's break things down by continent 
Select 
	location as continent,
	max(total_deaths) as DeathCount
From dbo.CovidDeaths
Where continent = '' and location in ('North America', 'South America', 'Asia', 'Europe', 'Africa', 'Oceania') 
Group by location
Order by DeathCount desc


--Showing the Continents with the hightest death count per population
Select 
	location as continent,
	population,
	max(total_deaths) as DeathCount,
	max((cast(total_deaths as float) / population)) * 100 as DeathPercentage_ByPopulation
From dbo.CovidDeaths
Where continent = '' and location in ('North America', 'South America', 'Asia', 'Europe', 'Africa', 'Oceania') 
Group by location, population
Order by DeathPercentage_ByPopulation desc


-- Global Numbers
Select	
	date,
	sum(new_cases) as new_cases,
	sum(new_deaths) as new_deaths,
	(sum(cast(new_deaths as float)) / sum(new_cases))*100 as DeathPercentage 
From dbo.CovidDeaths
Where continent != '' and new_cases != 0
Group by date
Order by 1

Select	
	-- date,
	sum(new_cases) as total_cases,
	sum(new_deaths) as new_deaths,
	(sum(cast(new_deaths as float)) / sum(new_cases))*100 as DeathPercentage 
From dbo.CovidDeaths
Where continent != '' and new_cases != 0
-- Group by date
-- Order by 1


-- ==================================================================================
Select *
From dbo.CovidVaccinations
Order by 3, 4

-- Looking at Total Population vs Vaccination
Select 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	sum(vac.new_vaccinations) over (Partition by dea.location Order by dea.location, dea.date) as Rolling_People_Vaccinated
From dbo.CovidDeaths as dea 
Join dbo.CovidVaccinations as vac
	on dea.location = vac.location 
	and dea.date = vac.date
Where dea.continent != ''
Order by 2, 3

-- Using a CTE PopvsVac
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, Rolling_People_Vaccinated) 
as
(
Select 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	sum(vac.new_vaccinations) over (Partition by dea.location Order by dea.location, dea.date) as Rolling_People_Vaccinated
From dbo.CovidDeaths as dea 
Join dbo.CovidVaccinations as vac
	on dea.location = vac.location 
	and dea.date = vac.date
Where dea.continent != ''
--Order by 2, 3
)
Select 
	*,
	(Rolling_People_Vaccinated / Population)*100 as People_Vaccinated_Percentage
From PopvsVac


-- Using a CTE PopvsVac2  This table per country, It is cleaner
With PopvsVac2 (Location, Population, New_Vaccinations, Rolling_People_Vaccinated) 
as
(
Select 
	dea.location,
	dea.population,
	vac.new_vaccinations,
	sum(vac.new_vaccinations) over (Partition by dea.location Order by dea.location, dea.date) as Rolling_People_Vaccinated
From dbo.CovidDeaths as dea 
Join dbo.CovidVaccinations as vac
	on dea.location = vac.location 
	and dea.date = vac.date
Where dea.continent != ''
--Order by 2, 3
)
Select 
	Location,
	Population,
	sum(New_Vaccinations) as sum_vaccinations,
	(sum(New_Vaccinations) / Population) * 100 as People_Vaccinated_Percentage
From PopvsVac2
Group by Location, Population
Order by 1


-- TEMP TABLE
Drop Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255), 
Location nvarchar(255), 
Date date, 
Population numeric, 
New_Vaccinations numeric,
Rolling_People_Vaccinated numeric
)
Insert Into #PercentPopulationVaccinated
Select 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	sum(vac.new_vaccinations) over (Partition by dea.location Order by dea.location, dea.date) as Rolling_People_Vaccinated
From dbo.CovidDeaths as dea 
Join dbo.CovidVaccinations as vac
	on dea.location = vac.location 
	and dea.date = vac.date
Where dea.continent != ''
--Order by 2, 3

Select 
	*,
	(Rolling_People_Vaccinated / Population)*100
From #PercentPopulationVaccinated

-- =======================================================================================

-- Creating View to stored data for later visualizations (1)
Create View PercentPopulationVaccinated as
Select 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	sum(vac.new_vaccinations) over (Partition by dea.location Order by dea.location, dea.date) as Rolling_People_Vaccinated
From dbo.CovidDeaths as dea 
Join dbo.CovidVaccinations as vac
	on dea.location = vac.location 
	and dea.date = vac.date
Where dea.continent != ''
--Order by 2, 3

Select *
From PercentPopulationVaccinated


-- Creating View to stored data for later visualizations (2)
-- Country with the hightests infection rates due to its population
Create View InfectedPercentage_vs_Population as
Select 
	location,
	population,
	max(total_cases) as total_infection_cases,
	(max(cast(total_cases as float))/population)*100 as InfectedPercentage
From dbo.CovidDeaths
Where total_cases != 0 and continent != ''
Group by location, population
--Order by InfectedPercentage desc

Select *
From InfectedPercentage_vs_Population
Order by 4 desc


-- Creating View to stored data for later visualizations (3)
-- Country with the hightests death rates due to its population
Create View DeathPercentage_vs_Population as
Select 
	location,
	population,
	max(total_deaths) as hightest_DeathCount,
	(max(cast(total_deaths as float))/population)*100 as DeathPercentage
From dbo.CovidDeaths
Where total_cases != 0 and continent != ''                           
Group by location, population
--Order by DeathPercentage desc

Select *
From DeathPercentage_vs_Population
Order by 4 desc


-- Creating View to stored data for later visualizations (4)
--Showing the Continents with the hightest death count per population
Create View DeathPercentage_vs_PopulationContinent as
Select 
	location as continent,
	population,
	max(total_deaths) as DeathCount,
	max((cast(total_deaths as float) / population)) * 100 as DeathPercentage_ByPopulation
From dbo.CovidDeaths
Where continent = '' and location in ('North America', 'South America', 'Asia', 'Europe', 'Africa', 'Oceania') 
Group by location, population
--Order by DeathPercentage_ByPopulation desc

Select *
From DeathPercentage_vs_PopulationContinent


-- Creating View to stored data for later visualizations (5)
-- Global Numbers in all the countries, DeathPercentageAllCountries_Cases_by_Deaths
Create View DeathPercentageAllCountries_Deaths_by_Cases as
Select
	date,
	sum(new_cases) as new_cases,
	sum(new_deaths) as new_deaths,
	(sum(cast(new_deaths as float)) / sum(new_cases))*100 as DeathPercentage 
From dbo.CovidDeaths
Where continent != '' and new_cases != 0
Group by date
--Order by 1

Select *
From DeathPercentageAllCountries_Deaths_by_Cases
Order by date


-- Creating View to stored data for later visualizations (6)
-- Using a CTE PopvsVac2  This table per country, It is cleaner
Create View PopulationVaccinatedPercentage_PerCountry as
Select 
	dea.location,
	dea.population,
	vac.new_vaccinations,
	sum(vac.new_vaccinations) over (Partition by dea.location Order by dea.location, dea.date) as Rolling_People_Vaccinated
From dbo.CovidDeaths as dea 
Join dbo.CovidVaccinations as vac	
	on dea.location = vac.location 
	and dea.date = vac.date
Where dea.continent != ''
--Order by 2, 3

Select 
	Location,
	Population,
	sum(New_Vaccinations) as sum_vaccinations,
	(sum(New_Vaccinations) / Population) * 100 as People_Vaccinated_Percentage
From PopulationVaccinatedPercentage_PerCountry
Group by Location, Population
Order by 1