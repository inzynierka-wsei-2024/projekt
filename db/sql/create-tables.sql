USE japan;
GO

CREATE TABLE dbo.Stations (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO 

CREATE TABLE dbo.Districts (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO 

CREATE TABLE dbo.Cities (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO 

CREATE TABLE dbo.Regions (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO 

CREATE TABLE dbo.RealEstateTypes (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Type NVARCHAR(255)
)
GO 

CREATE TABLE dbo.Prefectures (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO 


CREATE TABLE dbo.PlanningTypes (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Type NVARCHAR(255)
)
GO 

CREATE TABLE dbo.FrontageRoadTypes (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Type NVARCHAR(255)
)
GO 

CREATE TABLE dbo.Directions (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO

CREATE TABLE dbo.UsageTypes (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Type NVARCHAR(255)
)
GO 

CREATE TABLE dbo.Structures (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO

CREATE TABLE dbo.LandShapes (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Name NVARCHAR(255)
)
GO

CREATE TABLE dbo.FloorPlans (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Type NVARCHAR(255)
)
GO 


CREATE TABLE dbo.Transactions (
	ID INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	RealEstateType INT,
	Region INT,
	Prefecture INT,
	City INT,
	District INT,
	NearestStation INT,
	MinTimeToNearestStation INT,
	MaxTimeToNearestStation INT,
	Price MONEY,
	UnitPrice MONEY,
	FloorPlan INT,
	Area DECIMAL,
	GreatArea BIT,
	FloorArea DECIMAL,
	GreatFloorArea BIT,
	FrontageRoadType INT,
	FrontageRoadDirection INT,
	FrontageRoadBreadth DECIMAL,
	LandShape INT,
	BuildingYear INT,
	PrewarBuilding BIT,
	Structure INT,
	CurrentUsage INT,
	PostTransactionUsage INT,
	PlanningType INT,
	MaximumBuildingCoverageRatio DECIMAL,
	TransactionYear INT,
	TransactionQuarter INT,
	FOREIGN KEY (RealEstateType) REFERENCES RealEstateTypes(ID),
	FOREIGN KEY (Region) REFERENCES Regions(ID),
	FOREIGN KEY (Prefecture) REFERENCES Prefectures(ID),
	FOREIGN KEY (City) REFERENCES Cities(ID),
	FOREIGN KEY (District) REFERENCES Districts(ID),
	FOREIGN KEY (NearestStation) REFERENCES Stations(ID),
	FOREIGN KEY (FloorPlan) REFERENCES FloorPlans(ID),
	FOREIGN KEY (FrontageRoadType) REFERENCES FrontageRoadTypes(ID),
	FOREIGN KEY (FrontageRoadDirection) REFERENCES Directions(ID),
	FOREIGN KEY (LandShape) REFERENCES LandShapes(ID),
	FOREIGN KEY (Structure) REFERENCES Structures(ID),
	FOREIGN KEY (CurrentUsage) REFERENCES UsageTypes(ID),
	FOREIGN KEY (PostTransactionUsage) REFERENCES UsageTypes(ID),
	FOREIGN KEY (PlanningType) REFERENCES PlanningTypes(ID)
)
GO