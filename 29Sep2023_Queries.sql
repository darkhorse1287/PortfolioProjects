select * from [dbo].[EmployeeDemographics];

select * from [dbo].[EmployeeSalary];

SELECT TOP 5 * FROM EMPLOYEESALARY;

SELECT TOP 8 * FROM EMPLOYEEDEMOGRAPHICS;

SELECT AVG(AGE) FROM EmployeeDemographics;

SELECT MAX(AGE) FROM EmployeeDemographics WHERE Gender = 'MALE';
SELECT MIN(AGE) FROM EmployeeDemographics WHERE Gender = 'MALE';
SELECT AVG(AGE) FROM EmployeeDemographics WHERE Gender = 'MALE';

SELECT MAX(AGE) FROM EmployeeDemographics WHERE Gender = 'FEMALE';
SELECT MIN(AGE) FROM EmployeeDemographics WHERE Gender = 'FEMALE';
SELECT AVG(AGE) FROM EmployeeDemographics WHERE Gender = 'FEMALE';

SELECT AVG(SALARY) FROM EmployeeSalary;
SELECT MAX(SALARY) FROM EmployeeSalary;
SELECT MIN(SALARY) FROM EmployeeSalary;

SELECT * FROM EmployeeDemographics WHERE FirstName IS null;

SELECT DISTINCT(GENDER), COUNT(GENDER) AS COUNTGENDER
FROM EmployeeDemographics 
WHERE AGE > 40
GROUP BY GENDER
ORDER BY COUNTGENDER;

SELECT *
FROM EmployeeDemographics
ORDER BY AGE, GENDER;

/*INNER JOIN, FULL OUTER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN*/
SELECT *
FROM EmployeeDemographics A 
INNER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

SELECT *
FROM EmployeeDemographics A 
FULL OUTER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

SELECT *
FROM EmployeeDemographics A 
LEFT OUTER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

SELECT JobTitle, AVG (Salary)
FROM EmployeeDemographics A 
INNER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID
WHERE JobTitle = 'HR'
GROUP BY JobTitle

/*INNER JOIN, FULL OUTER JOIN, LETOUTER JOIN, RIGHT OUTER JOIN*/

/*UNION, UNION ALL*/
SELECT *
FROM [dbo].[EmployeeDemographics]

SELECT *
FROM [dbo].[WarehouseEmployeeDemographics]
ORDER BY EmployeeID;


SELECT * FROM [dbo].[EmployeeDemographics] A
FULL OUTER JOIN [dbo].[WarehouseEmployeeDemographics] B
ON A.EmployeeID = B.EMPLOYEEID;

SELECT EmployeeID, FirstName, Age
FROM [dbo].[EmployeeDemographics]
UNION
SELECT EmployeeID, JobTitle, Salary
FROM [dbo].[EmployeeSalary];
/*UNION, UNION ALL*/

/*CASE STATEMENTS*/
SELECT FirstName, LastName, Age,
CASE
WHEN AGE>45 THEN 'OLD'
WHEN AGE BETWEEN 40 AND 45 THEN 'YOUNG'
ELSE 'BABY'
END
FROM [dbo].[EmployeeDemographics]
WHERE Age IS NOT NULL
ORDER BY AGE;

SELECT FirstName, LastName, JobTitle, Salary,
CASE
WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM [dbo].[EmployeeDemographics] A
JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

/*CASE STATEMENTS*/

/*HAVING CLAUSE*/

SELECT JobTitle, AVG(Salary)
FROM [dbo].[EmployeeDemographics] A
JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary);

/*HAVING CLAUSE*/

/* PARTITION BY*/

SELECT *
FROM EmployeeDemographics;

SELECT *
FROM EmployeeSalary; 

SELECT FirstName, LastName,  Gender, Salary,
COUNT(GENDER) OVER (PARTITION BY GENDER) AS TotalGender
FROM EmployeeDemographics DEM 
JOIN EmployeeSalary SAL
ON DEM.EmployeeID = SAL.EmployeeID;

SELECT Gender,  COUNT(GENDER)
FROM EmployeeDemographics DEM 
JOIN EmployeeSalary SAL
ON DEM.EmployeeID = SAL.EmployeeID
GROUP BY Gender;

select * from [dbo].[EmployeeDemographics];

select * from [dbo].[EmployeeSalary];

SELECT TOP 5 * FROM EMPLOYEESALARY;

SELECT TOP 8 * FROM EMPLOYEEDEMOGRAPHICS;

SELECT AVG(AGE) FROM EmployeeDemographics;

SELECT MAX(AGE) FROM EmployeeDemographics WHERE Gender = 'MALE';
SELECT MIN(AGE) FROM EmployeeDemographics WHERE Gender = 'MALE';
SELECT AVG(AGE) FROM EmployeeDemographics WHERE Gender = 'MALE';

SELECT MAX(AGE) FROM EmployeeDemographics WHERE Gender = 'FEMALE';
SELECT MIN(AGE) FROM EmployeeDemographics WHERE Gender = 'FEMALE';
SELECT AVG(AGE) FROM EmployeeDemographics WHERE Gender = 'FEMALE';

SELECT AVG(SALARY) FROM EmployeeSalary;
SELECT MAX(SALARY) FROM EmployeeSalary;
SELECT MIN(SALARY) FROM EmployeeSalary;

SELECT * FROM EmployeeDemographics WHERE FirstName IS null;

SELECT DISTINCT(GENDER), COUNT(GENDER) AS COUNTGENDER
FROM EmployeeDemographics 
WHERE AGE > 40
GROUP BY GENDER
ORDER BY COUNTGENDER;

SELECT *
FROM EmployeeDemographics
ORDER BY AGE, GENDER;

/*INNER JOIN, FULL OUTER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN*/
SELECT *
FROM EmployeeDemographics A 
INNER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

SELECT *
FROM EmployeeDemographics A 
FULL OUTER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

SELECT *
FROM EmployeeDemographics A 
LEFT OUTER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

SELECT JobTitle, AVG (Salary)
FROM EmployeeDemographics A 
INNER JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID
WHERE JobTitle = 'HR'
GROUP BY JobTitle

/*INNER JOIN, FULL OUTER JOIN, LETOUTER JOIN, RIGHT OUTER JOIN*/

/*UNION, UNION ALL*/
SELECT *
FROM [dbo].[EmployeeDemographics]

SELECT *
FROM [dbo].[WarehouseEmployeeDemographics]
ORDER BY EmployeeID;


SELECT * FROM [dbo].[EmployeeDemographics] A
FULL OUTER JOIN [dbo].[WarehouseEmployeeDemographics] B
ON A.EmployeeID = B.EMPLOYEEID;

SELECT EmployeeID, FirstName, Age
FROM [dbo].[EmployeeDemographics]
UNION
SELECT EmployeeID, JobTitle, Salary
FROM [dbo].[EmployeeSalary];
/*UNION, UNION ALL*/

/*CASE STATEMENTS*/
SELECT FirstName, LastName, Age,
CASE
WHEN AGE>45 THEN 'OLD'
WHEN AGE BETWEEN 40 AND 45 THEN 'YOUNG'
ELSE 'BABY'
END
FROM [dbo].[EmployeeDemographics]
WHERE Age IS NOT NULL
ORDER BY AGE;

SELECT FirstName, LastName, JobTitle, Salary,
CASE
WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM [dbo].[EmployeeDemographics] A
JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID;

/*CASE STATEMENTS*/

/*HAVING CLAUSE*/

SELECT JobTitle, AVG(Salary)
FROM [dbo].[EmployeeDemographics] A
JOIN EmployeeSalary B
ON A.EmployeeID = B.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary);

/*HAVING CLAUSE*/

/* PARTITION BY*/

SELECT *
FROM EmployeeDemographics;

SELECT *
FROM EmployeeSalary; 

SELECT FirstName, LastName,  Gender, Salary,
COUNT(GENDER) OVER (PARTITION BY GENDER) AS TotalGender
FROM EmployeeDemographics DEM 
JOIN EmployeeSalary SAL
ON DEM.EmployeeID = SAL.EmployeeID;

SELECT Gender,  COUNT(GENDER)
FROM EmployeeDemographics DEM 
JOIN EmployeeSalary SAL
ON DEM.EmployeeID = SAL.EmployeeID
GROUP BY Gender;

SELECT *
FROM EmployeeDemographics;

SELECT *
FROM EmployeeSalary; 

SELECT FirstName, LastName,  Gender, Salary,
COUNT(GENDER) OVER (PARTITION BY GENDER) AS TotalGender
FROM EmployeeDemographics DEM 
JOIN EmployeeSalary SAL
ON DEM.EmployeeID = SAL.EmployeeID;

SELECT Gender,  COUNT(GENDER)
FROM EmployeeDemographics DEM 
JOIN EmployeeSalary SAL
ON DEM.EmployeeID = SAL.EmployeeID
GROUP BY Gender;

/*CTE*/

WITH CTE_Employee AS (SELECT FIRSTNAME, LASTNAME, GENDER, SALARY,
COUNT(GENDER) OVER (PARTITION BY GENDER) AS TOTALGENDER,
AVG(SALARY) OVER (PARTITION BY GENDER) AS AVGSALARY
FROM EMPLOYEEDEMOGRAPHICS EMP
JOIN EmployeeSalary SAL
ON EMP.EmployeeID = SAL.EmployeeID
WHERE Salary > '45000'
)
SELECT FirstName, AVGSALARY FROM CTE_Employee;

/*CTE*/

/*TEMP TABLES*/

CREATE TABLE #TEMP_EMPLOYEE2 (
JOBTITLE varchar(50),
EMPLOYEESPERJOB INT,
AVGAGE INT,
AVGSALARY INT
)

select * from #TEMP_EMPLOYEE2;

INSERT INTO #TEMP_EMPLOYEE2
SELECT JOBTITLE, COUNT(JOBTITLE), AVG(AGE), AVG(SALARY)
FROM EmployeeDemographics DEM
JOIN EmployeeSalary SAL
ON DEM.EmployeeID = SAL.EmployeeID
GROUP BY JOBTITLE

/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(employeeID) AS IDTRIM
FROM EmployeeErrors 

Select EmployeeID, RTRIM(employeeID) as IDRTRIM
FROM EmployeeErrors 

Select EmployeeID, LTRIM(employeeID) as IDLTRIM
FROM EmployeeErrors 

	



-- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors


-- Using Substring

Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)

SELECT SUBSTRING(FIRSTNAME,3,3)
FROM EmployeeErrors


-- Using UPPER and lower

Select firstname, LOWER(firstname)
from EmployeeErrors

Select Firstname, UPPER(FirstName)
from EmployeeErrors


SELECT * FROM [dbo].[CovidDeaths] 
WHERE continent is not null
ORDER BY 3,4;

--SELECT * FROM [dbo].[CovidVaccinations] ORDER BY 3,4;

-- Select Data that we are going to be using


Select location, date, total_cases, new_cases, total_deaths, population
FROM [dbo].[CovidDeaths]
ORDER BY 1,2;

-- Looking at total cases vs total deaths

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM [dbo].[CovidDeaths]
WHERE LOCATION LIKE '%india%'
and total_deaths is not null
ORDER BY 1,2;

-- Looking at total cases vs population

Select location, date, population, total_cases, (total_cases/population)*100 as DeathPercentage
FROM [dbo].[CovidDeaths]
--WHERE LOCATION LIKE '%india%'
WHERE total_deaths is not null
ORDER BY 1,2;

--Looking at countries with highest infection rate
Select location, population, max(total_cases) as HighesInfectionCount, MAX(total_cases/population)*100 as PercentPopInfected
FROM [dbo].[CovidDeaths]
--WHERE LOCATION LIKE '%india%'
WHERE total_deaths is not null
group by location, population
ORDER BY 4 desc;

--Looking at highest death count per population
Select location,  max(cast(total_deaths as int)) as HighestDeathCount--, population, MAX(total_deaths/population)*100 as PercentPopDead
FROM [dbo].[CovidDeaths]
WHERE total_deaths is not null
and continent is not null
group by location, population
ORDER BY 2 desc;

--CONTINENT WISE

Select location,  max(cast(total_deaths as int)) as TotalDeathCount--, population, MAX(total_deaths/population)*100 as PercentPopDead
FROM [dbo].[CovidDeaths]
WHERE continent is not null
group by location, population
ORDER BY TotalDeathCount desc;

-- GLOBAL NUMBERS

Select --date, 
SUM(new_cases) as TotalCases,
sum(cast(new_deaths as int)) as TotalDeaths,
sum(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM [dbo].[CovidDeaths]
--WHERE LOCATION LIKE '%india%'
WHERE continent is not null
--group by date
ORDER BY 1,2;

--looking at total population vs vaccination


SELECT dea.continent, 
dea.location, 
dea.date, 
dea. population, 
vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPplVaccinated
FROM [dbo].CovidDeaths dea
JOIN [dbo].[CovidVaccinations] vac
ON dea.location =vac.location
and dea.date = vac.date
and dea.continent is not null
order by 2,3;


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
    where dea.continent is not null
)
SELECT *, (RollingPplVaccinated/population)*100
FROM PopvsVac

-- TEMP TABLE

DROP TABLE  #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
RollingPplVaccinated numeric
)
Insert into #PercentPopulationVaccinated
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
    --where dea.continent is not null

SELECT *, (RollingPplVaccinated/population)*100
FROM #PercentPopulationVaccinated

-- Crating View to Store Data for Later Visualisations

Create View PercentPopulationVaccinated
AS
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
    where dea.continent is not null


select * from VW_PercentPopulationVaccinated