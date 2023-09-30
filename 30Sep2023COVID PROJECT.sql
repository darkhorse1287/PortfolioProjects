--Portfolio Project>> COVID PROJECT
SELECT 
  * 
FROM 
  [dbo].[CovidDeaths] 
WHERE 
  continent is not null 
ORDER BY 
  3, 
  4;
--SELECT * FROM [dbo].[CovidVaccinations] ORDER BY 3,4;
-- Select Data that we are going to be using
Select 
  location, 
  date, 
  total_cases, 
  new_cases, 
  total_deaths, 
  population 
FROM 
  [dbo].[CovidDeaths] 
ORDER BY 
  1, 
  2;

-- Looking at total cases vs total deaths
Select 
  location, 
  date, 
  total_cases, 
  total_deaths, 
  (total_deaths / total_cases)* 100 as DeathPercentage 
FROM 
  [dbo].[CovidDeaths] 
WHERE 
  LOCATION LIKE '%india%' 
  and total_deaths is not null 
ORDER BY 
  1, 
  2;

-- Looking at total cases vs population
Select 
  location, 
  date, 
  population, 
  total_cases, 
  (total_cases / population)* 100 as DeathPercentage 
FROM 
  [dbo].[CovidDeaths] --WHERE LOCATION LIKE '%india%'
WHERE 
  total_deaths is not null 
ORDER BY 
  1, 
  2;

--Looking at countries with highest infection rate
Select 
  location, 
  population, 
  max(total_cases) as HighesInfectionCount, 
  MAX(total_cases / population)* 100 as PercentPopInfected 
FROM 
  [dbo].[CovidDeaths] --WHERE LOCATION LIKE '%india%'
WHERE 
  total_deaths is not null 
group by 
  location, 
  population 
ORDER BY 
  4 desc;
--Looking at highest death count per population
Select 
  location, 
  max(
    cast(total_deaths as int)
  ) as HighestDeathCount --, population, MAX(total_deaths/population)*100 as PercentPopDead
FROM 
  [dbo].[CovidDeaths] 
WHERE 
  total_deaths is not null 
  and continent is not null 
group by 
  location, 
  population 
ORDER BY 
  2 desc;

--CONTINENT WISE
Select 
  location, 
  max(
    cast(total_deaths as int)
  ) as TotalDeathCount --, population, MAX(total_deaths/population)*100 as PercentPopDead
FROM 
  [dbo].[CovidDeaths] 
WHERE 
  continent is not null 
group by 
  location, 
  population 
ORDER BY 
  TotalDeathCount desc;

-- GLOBAL NUMBERS
Select 
  --date, 
  SUM(new_cases) as TotalCases, 
  sum(
    cast(new_deaths as int)
  ) as TotalDeaths, 
  sum(
    cast(new_deaths as int)
  )/ SUM(new_cases)* 100 as DeathPercentage 
FROM 
  [dbo].[CovidDeaths] --WHERE LOCATION LIKE '%india%'
WHERE 
  continent is not null --group by date
ORDER BY 
  1, 
  2;

--looking at total population vs vaccination
SELECT 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(
    cast(vac.new_vaccinations as int)
  ) over (
    partition by dea.location 
    order by 
      dea.location, 
      dea.date
  ) as RollingPplVaccinated 
FROM 
  [dbo].CovidDeaths dea 
  JOIN [dbo].[CovidVaccinations] vac ON dea.location = vac.location 
  and dea.date = vac.date 
  and dea.continent is not null 
order by 
  2, 
  3;

--CTE
WITH PopvsVac (
  continent, location, date, population, 
  new_vaccinations, RollingPplVaccinated
) as (
  SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations, 
    SUM(
      CONVERT(int, vac.new_vaccinations)
    ) over (
      partition by dea.location 
      order by 
        dea.location, 
        dea.date
    ) as RollingPplVaccinated 
  FROM 
    [dbo].CovidDeaths dea 
    JOIN [dbo].[CovidVaccinations] vac ON dea.location = vac.location 
    and dea.date = vac.date 
  where 
    dea.continent is not null
) 
SELECT 
  *, 
  (
    RollingPplVaccinated / population
  )* 100 
FROM 
  PopvsVac 

-- TEMP TABLE
DROP 
  TABLE #PercentPopulationVaccinated
  CREATE TABLE #PercentPopulationVaccinated
  (
    Continent nvarchar(255), 
    location nvarchar(255), 
    date datetime, 
    population numeric, 
    new_vaccinations numeric, 
    RollingPplVaccinated numeric
  ) Insert into #PercentPopulationVaccinated
SELECT 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(
    CONVERT(int, vac.new_vaccinations)
  ) over (
    partition by dea.location 
    order by 
      dea.location, 
      dea.date
  ) as RollingPplVaccinated 
FROM 
  [dbo].CovidDeaths dea 
  JOIN [dbo].[CovidVaccinations] vac ON dea.location = vac.location 
  and dea.date = vac.date --where dea.continent is not null
SELECT 
  *, 
  (
    RollingPplVaccinated / population
  )* 100 
FROM 
  #PercentPopulationVaccinated

  -- Crating View to Store Data for Later Visualisations
  Create View PercentPopulationVaccinated AS 
SELECT 
  dea.continent, 
  dea.location, 
  dea.date, 
  dea.population, 
  vac.new_vaccinations, 
  SUM(
    CONVERT(int, vac.new_vaccinations)
  ) over (
    partition by dea.location 
    order by 
      dea.location, 
      dea.date
  ) as RollingPplVaccinated 
FROM 
  [dbo].CovidDeaths dea 
  JOIN [dbo].[CovidVaccinations] vac ON dea.location = vac.location 
  and dea.date = vac.date 
where 
  dea.continent is not null 
select 
  * 
from 
  VW_PercentPopulationVaccinated
