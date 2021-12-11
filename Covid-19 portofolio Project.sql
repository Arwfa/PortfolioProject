--PROJECT EXPLORING DATA COVID-19  


Select *
From PortofolioProject..CovidDeaths$
where continent is not null
Order by 3, 4


--Select Data starting with
Select location, date, total_cases, new_cases, total_deaths, population
From PortofolioProject..CovidDeaths$
where continent is not null
order by 1,2


--Looking at Total Cases vs Total Deaths
Select location, date, convert(float,total_cases) as total_cases, convert(float,total_deaths) as total_deaths, 
(convert(float,total_deaths)/convert(float,total_cases))*100 as DeathsPercentage
From PortofolioProject..CovidDeaths$
Where location like '%Indonesia%'
order by 1, 2


--looking at Total Cases vs Population
--Shows what percentage of population infected with Covid
Select location, date, convert(float,total_cases) as total_cases, convert(float,population) as population, 
(convert(float,total_cases)/convert(float,population))*100 as DeathsPercentage
From PortofolioProject..CovidDeaths$
Where location like '%Indonesia%'
order by 1, 2

--looking at Countries with Higest Infection Rate compared to Population
Select location, convert(float,max(population)) as Population, convert(float,max(total_cases)) as HighestInfectionCount, convert(float,max(total_cases)/convert(float,max(population)))*100 as PercentPopulationInfected
from PortofolioProject..CovidDeaths$
--Where location like '%Indonesia%'
group by location, population
order by PercentPopulationInfected desc

--Showing Countries with Higest Death Count per Population 
Select location, MAX(convert(float,total_deaths)) as TotalDeathCount
from PortofolioProject..CovidDeaths$
where continent is not null 
Group by location
order by TotalDeathCount desc

--BREAKING THINGS DOWN BY CONTINENT 
--showing continents with the highest death count per population
Select continent, MAX(convert(float,total_deaths)) as TotalDeathCount
From PortofolioProject..CovidDeaths$
where continent is not null
group by continent 
order by TotalDeathCount desc

--GLOBAL NUMBERS
Select SUM(convert(float,new_cases)) as total_cases, SUM(convert(float,new_deaths)) as total_deaths, SUM(convert(float,new_deaths))/SUM(convert(float,new_cases))*100 as DeathPercentage
From PortofolioProject..CovidDeaths$
where continent is null
order by 1,2

--Total Population vs Vaccinations
--Shows Percentage of Population that has recieved at least one Covid Vaccine
--Select convert(float,dea.continent), convert(float,dea.location), convert(float,dea.date), convert(float,dea.population), convert(float,vac.new_vaccinations),
--SUM(convert(float,vac.new_vaccinations)) OVER (Partition by convert(float,dea.Location) Order by convert(float,dea.location), convert(float,dea.Date)) as RollingPeopleVaccinated
--From PortofolioProject..CovidDeaths$ dea
--Join PortofolioProject..CovidDeaths$ vac
--	on convert(float,dea.location) = convert(float,vac.location)
--	and convert(float,dea.date) = convert(float,vac.date)
--where dea.continent is not null
--order by 2,3

