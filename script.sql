USE [master]
GO
/****** Object:  Database [OP_Retail]    Script Date: 10/6/2020 8:39:45 PM ******/
CREATE DATABASE [OP_Retail]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OP_Retail', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OP_Retail.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OP_Retail_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\OP_Retail_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OP_Retail] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OP_Retail].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OP_Retail] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OP_Retail] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OP_Retail] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OP_Retail] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OP_Retail] SET ARITHABORT OFF 
GO
ALTER DATABASE [OP_Retail] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OP_Retail] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OP_Retail] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OP_Retail] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OP_Retail] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OP_Retail] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OP_Retail] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OP_Retail] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OP_Retail] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OP_Retail] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OP_Retail] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OP_Retail] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OP_Retail] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OP_Retail] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OP_Retail] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OP_Retail] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OP_Retail] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OP_Retail] SET RECOVERY FULL 
GO
ALTER DATABASE [OP_Retail] SET  MULTI_USER 
GO
ALTER DATABASE [OP_Retail] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OP_Retail] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OP_Retail] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OP_Retail] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OP_Retail] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OP_Retail', N'ON'
GO
ALTER DATABASE [OP_Retail] SET QUERY_STORE = OFF
GO
USE [OP_Retail]
GO
/****** Object:  Schema [Address]    Script Date: 10/6/2020 8:39:45 PM ******/
CREATE SCHEMA [Address]
GO
/****** Object:  Schema [HumanResources]    Script Date: 10/6/2020 8:39:45 PM ******/
CREATE SCHEMA [HumanResources]
GO
/****** Object:  Schema [Production]    Script Date: 10/6/2020 8:39:45 PM ******/
CREATE SCHEMA [Production]
GO
/****** Object:  Schema [Purchasing]    Script Date: 10/6/2020 8:39:45 PM ******/
CREATE SCHEMA [Purchasing]
GO
/****** Object:  Schema [Sale]    Script Date: 10/6/2020 8:39:45 PM ******/
CREATE SCHEMA [Sale]
GO
/****** Object:  Table [Address].[Address]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Address].[Address](
	[AddressID] [int] NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[District] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Address].[AddressType]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Address].[AddressType](
	[AddressTypeID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Address].[CountryRegion]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Address].[CountryRegion](
	[CountryRegionCode] [nvarchar](3) NULL,
	[Name] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Address].[District]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Address].[District](
	[DistrictID] [int] NULL,
	[StateProvinceCode] [nvarchar](3) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[IsOnlyStateProvinceFlag] [bit] NULL,
	[Name] [nvarchar](50) NULL,
	[TerritoryID] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Department]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Department](
	[DepartmentID] [smallint] NULL,
	[Name] [nvarchar](50) NULL,
	[GroupName] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Employee]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Employee](
	[BusinessEntityID] [int] NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](20) NULL,
	[MiddleName] [nvarchar](20) NULL,
	[Phone] [nvarchar](15) NULL,
	[Address] [nvarchar](256) NULL,
	[Region] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[LoginID] [nvarchar](256) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
	[VacationHours] [smallint] NULL,
	[SickLeaveHours] [smallint] NULL,
	[rowguid] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[EmployeeDepartmentHistory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[EmployeeDepartmentHistory](
	[BusinessEntityID] [int] NULL,
	[DepartmentID] [smallint] NULL,
	[ShiftID] [tinyint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[EmployeePayHistory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[EmployeePayHistory](
	[BusinessEntityID] [int] NULL,
	[RateChangeDate] [datetime] NULL,
	[Rate] [money] NULL,
	[PayFrequency] [tinyint] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[JobCandidate]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[JobCandidate](
	[JobCandidateID] [int] NULL,
	[BusinessEntityID] [int] NULL,
	[Resume] [nvarchar](256) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Manager]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Manager](
	[ManagerID] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[MiddleName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [varchar](30) NULL,
	[AddressID] [int] NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [bit] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [HumanResources].[Shift]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[Shift](
	[ShiftID] [tinyint] NULL,
	[Name] [nvarchar](50) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[Culture]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Culture](
	[CultureCode] [nvarchar](6) NULL,
	[Name] [nvarchar](30) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[Document]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Document](
	[DocumentNode] [int] NULL,
	[DocumentLevel] [smallint] NULL,
	[Title] [nvarchar](50) NULL,
	[OwnerID] [int] NULL,
	[FileName] [varchar](200) NULL,
	[FileExtension] [varchar](10) NULL,
	[Revision] [varchar](5) NULL,
	[Status] [tinyint] NULL,
	[Document] [varbinary](max) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Production].[Image]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Image](
	[ImageID] [int] NULL,
	[ThumbnailBase64] [varchar](max) NULL,
	[ThumbnailFileName] [varchar](255) NULL,
	[LargeImageBase64] [varchar](max) NULL,
	[LargeImageFileName] [varchar](255) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Production].[Location]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Location](
	[LocationID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[CostRate] [float] NULL,
	[Availability] [bit] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[Product]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[ProductNumber] [varchar](10) NULL,
	[ColorID] [int] NULL,
	[StockLevel] [int] NULL,
	[StandardCost] [float] NULL,
	[Price] [float] NULL,
	[Size] [int] NULL,
	[SizeUnitMeasureCode] [varchar](4) NULL,
	[Weight] [float] NULL,
	[WeightUnitMeasureCode] [varchar](4) NULL,
	[ProductCategoryID] [int] NULL,
	[ProductModelID] [int] NULL,
	[SellStartDate] [date] NULL,
	[SellEndDate] [date] NULL,
	[Discontinued] [bit] NULL,
	[DiscontinuedDate] [date] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductCategory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductCategory](
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductColor]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductColor](
	[ColorID] [int] NULL,
	[ColorCode] [varchar](6) NULL,
	[ColorName] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductCostHistory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductCostHistory](
	[CostHistoryID] [int] NULL,
	[ProductID] [int] NULL,
	[Cost] [float] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductCulture]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductCulture](
	[ProductID] [int] NULL,
	[CultureCode] [nvarchar](6) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductDescription]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductDescription](
	[DescriptionID] [int] NULL,
	[ProductID] [int] NULL,
	[Description] [text] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductDocument]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductDocument](
	[ProductID] [int] NULL,
	[DocumentNode] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductImage]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductImage](
	[ProductImageID] [int] NULL,
	[ProductID] [int] NULL,
	[ImageID] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductInventory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductInventory](
	[InventoryID] [int] NULL,
	[ProductID] [int] NULL,
	[LocationID] [int] NULL,
	[Shelf] [nvarchar](10) NULL,
	[Bin] [smallint] NULL,
	[Quantity] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductModel]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductModel](
	[ProductModelID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Catalog] [xml] NULL,
	[Instruction] [xml] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductPriceHistory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductPriceHistory](
	[PriceHistoryID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [float] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductReview]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductReview](
	[ProductReviewID] [int] NULL,
	[ProductID] [int] NULL,
	[ReviewerName] [nvarchar](100) NULL,
	[ReviewDate] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[Rating] [int] NULL,
	[Comment] [text] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Production].[ProductSubcategory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ProductSubcategory](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[ScrapReason]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[ScrapReason](
	[ScrapReasonID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[ScrapReason] [text] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Production].[TransactionHistory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[TransactionHistory](
	[TransactionID] [int] NULL,
	[ProductID] [int] NULL,
	[ReferenceOrderID] [int] NULL,
	[ReferenceOrderLineID] [int] NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionType] [varchar](1) NULL,
	[Quantity] [int] NULL,
	[ActualCost] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[UnitMeasure]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[UnitMeasure](
	[UnitMeasureCode] [varchar](4) NULL,
	[Name] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[WorkOrder]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[WorkOrder](
	[WorkOrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderQty] [int] NULL,
	[StockQty] [int] NULL,
	[ScrappedQty] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ScrapReasonID] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Production].[WorkOrderRouting]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[WorkOrderRouting](
	[WorkOrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OperationSeq] [smallint] NULL,
	[LocationID] [int] NULL,
	[ScheduledStartDate] [datetime] NULL,
	[ScheduledEndDate] [datetime] NULL,
	[ActualStartDate] [datetime] NULL,
	[ActualEndDate] [datetime] NULL,
	[ActualResourceHrs] [float] NULL,
	[PlannedCost] [float] NULL,
	[ActualCost] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Purchasing].[ShipMethod]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Purchasing].[ShipMethod](
	[ShipMethodID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[ShipBase] [float] NULL,
	[ShipRate] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Purchasing].[Supplier]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Purchasing].[Supplier](
	[SupplierID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[AccountNumber] [nvarchar](20) NULL,
	[PreferredSupplierStatus] [tinyint] NULL,
	[IsActive] [tinyint] NULL,
	[RegisteredDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Purchasing].[SupplierPurchaseOrder]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Purchasing].[SupplierPurchaseOrder](
	[PurchaseOrderID] [int] NULL,
	[RevisionNumber] [int] NULL,
	[Status] [tinyint] NULL,
	[SupplierID] [int] NULL,
	[ShipMethodID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Amount] [float] NULL,
	[TaxAmt] [float] NULL,
	[Freight] [float] NULL,
	[TotalAmount] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Purchasing].[SupplierPurchaseOrderDetail]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Purchasing].[SupplierPurchaseOrderDetail](
	[PurchaseOrderDetailID] [int] NULL,
	[PurchaseOrderID] [int] NULL,
	[DueDate] [datetime] NULL,
	[OrderQty] [int] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [float] NULL,
	[LineTotal] [float] NULL,
	[ReceivedQty] [int] NULL,
	[RejectedQty] [int] NULL,
	[StockedQty] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Purchasing].[SupplyProduct]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Purchasing].[SupplyProduct](
	[SupplierID] [int] NULL,
	[ProductID] [int] NULL,
	[AverageLeadTime] [int] NULL,
	[StandardPrice] [float] NULL,
	[LastReceiptCost] [float] NULL,
	[LastReceiptDate] [datetime] NULL,
	[MinOrderQty] [int] NULL,
	[MaxOrderQty] [int] NULL,
	[OnOrderQty] [int] NULL,
	[UnitMeasureCode] [nvarchar](20) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[CreditCard]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[CreditCard](
	[CreditCardID] [int] NULL,
	[CardType] [nvarchar](50) NULL,
	[CardNumber] [nvarchar](25) NULL,
	[ExpMonth] [int] NULL,
	[ExpYear] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[Customer]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[Customer](
	[CustomerID] [int] NULL,
	[PersonID] [int] NULL,
	[ShopID] [int] NULL,
	[TerritoryID] [int] NULL,
	[AccountNumber] [nvarchar](10) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[PersonCreditCard]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[PersonCreditCard](
	[BusinessEntityID] [int] NULL,
	[CreditCardID] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SaleOrderDetail]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SaleOrderDetail](
	[SalesOrderID] [int] NULL,
	[SalesOrderDetailID] [int] NULL,
	[CarrierTrackingNumber] [nvarchar](25) NULL,
	[OrderQty] [int] NULL,
	[ProductID] [int] NULL,
	[SpecialOfferID] [int] NULL,
	[UnitPrice] [float] NULL,
	[UnitPriceDiscount] [float] NULL,
	[TotalAmount] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SaleOrderHeader]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SaleOrderHeader](
	[SaleOrderID] [int] NULL,
	[RevisionNumber] [int] NULL,
	[OrderDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Status] [int] NULL,
	[OnlineOrderFlag] [bit] NULL,
	[SaleOrderNumber] [nvarchar](7) NULL,
	[PurchaseOrderNumber] [nvarchar](25) NULL,
	[AccountNumber] [nvarchar](15) NULL,
	[CustomerID] [int] NULL,
	[SalePersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[BillToAddressID] [int] NULL,
	[ShipToAddressID] [int] NULL,
	[ShipMethodID] [int] NULL,
	[CreditCardID] [int] NULL,
	[CreditCardApprovalCode] [varchar](15) NULL,
	[SubTotal] [float] NULL,
	[TaxAmt] [float] NULL,
	[Freight] [float] NULL,
	[TotalDue] [float] NULL,
	[Comment] [nvarchar](128) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SalePerson]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SalePerson](
	[BusinessEntityID] [int] NULL,
	[TerritoryID] [int] NULL,
	[SalesQuota] [float] NULL,
	[Bonus] [float] NULL,
	[CommissionPct] [float] NULL,
	[SalesYTD] [float] NULL,
	[SalesLastYear] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SaleReson]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SaleReson](
	[SalesReasonID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ReasonType] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SalesOrderHeaderSalesReason]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SalesOrderHeaderSalesReason](
	[SalesOrderID] [int] NULL,
	[SalesReasonID] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SalesPersonQuotaHistory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SalesPersonQuotaHistory](
	[BusinessEntityID] [int] NULL,
	[QuotaDate] [datetime] NULL,
	[SalesQuota] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SalesTaxRate]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SalesTaxRate](
	[SalesTaxRateID] [int] NULL,
	[StateProvinceID] [int] NULL,
	[TaxType] [int] NULL,
	[TaxRate] [float] NULL,
	[Name] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SaleTerritory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SaleTerritory](
	[TerritoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[Group] [nvarchar](50) NULL,
	[SalesYTD] [float] NULL,
	[SalesLastYear] [float] NULL,
	[CostYTD] [float] NULL,
	[CostLastYear] [float] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SaleTerritoryHistory]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SaleTerritoryHistory](
	[BusinessEntityID] [int] NULL,
	[TerritoryID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[Shop]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[Shop](
	[BusinessEntityID] [int] NULL,
	[ShopName] [nvarchar](50) NULL,
	[SalesPersonID] [int] NULL,
	[ManagerID] [nvarchar](50) NULL,
	[AddressID] [int] NULL,
	[Telephone] [nvarchar](15) NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SpecailOffer]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SpecailOffer](
	[SpecialOfferID] [int] NULL,
	[Description] [nvarchar](255) NULL,
	[DiscountPct] [float] NULL,
	[Type] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[MinQty] [int] NULL,
	[MaxQty] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Sale].[SpecailOfferProduct]    Script Date: 10/6/2020 8:39:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Sale].[SpecailOfferProduct](
	[SpecialOfferID] [int] NULL,
	[ProductID] [int] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [OP_Retail] SET  READ_WRITE 
GO
