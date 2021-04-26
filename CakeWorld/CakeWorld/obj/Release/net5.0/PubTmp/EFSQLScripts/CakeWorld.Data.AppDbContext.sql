IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419184843_InitialMigration')
BEGIN
    CREATE TABLE [Categories] (
        [CategoryId] int NOT NULL IDENTITY,
        [CategoryName] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        CONSTRAINT [PK_Categories] PRIMARY KEY ([CategoryId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419184843_InitialMigration')
BEGIN
    CREATE TABLE [Cakes] (
        [CakeId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [ShortDescription] nvarchar(max) NULL,
        [LongDescription] nvarchar(max) NULL,
        [AllergyInformation] nvarchar(max) NULL,
        [Price] decimal(18,2) NOT NULL,
        [ImageUrl] nvarchar(max) NULL,
        [ImageThumbnailUrl] nvarchar(max) NULL,
        [IsCakeOfTheWeek] bit NOT NULL,
        [InStock] bit NOT NULL,
        [CategoryId] int NOT NULL,
        CONSTRAINT [PK_Cakes] PRIMARY KEY ([CakeId]),
        CONSTRAINT [FK_Cakes_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([CategoryId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419184843_InitialMigration')
BEGIN
    CREATE INDEX [IX_Cakes_CategoryId] ON [Cakes] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419184843_InitialMigration')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210419184843_InitialMigration', N'5.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419185617_SeedDataAdded')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'CategoryName', N'Description') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] ON;
    EXEC(N'INSERT INTO [Categories] ([CategoryId], [CategoryName], [Description])
    VALUES (1, N''Fruit Cakes'', NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'CategoryName', N'Description') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419185617_SeedDataAdded')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'CategoryName', N'Description') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] ON;
    EXEC(N'INSERT INTO [Categories] ([CategoryId], [CategoryName], [Description])
    VALUES (2, N''Cheese cakes'', NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'CategoryName', N'Description') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419185617_SeedDataAdded')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'CategoryName', N'Description') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] ON;
    EXEC(N'INSERT INTO [Categories] ([CategoryId], [CategoryName], [Description])
    VALUES (3, N''Seasonal Cakes'', NULL)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CategoryId', N'CategoryName', N'Description') AND [object_id] = OBJECT_ID(N'[Categories]'))
        SET IDENTITY_INSERT [Categories] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419185617_SeedDataAdded')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CakeId', N'AllergyInformation', N'CategoryId', N'ImageThumbnailUrl', N'ImageUrl', N'InStock', N'IsCakeOfTheWeek', N'LongDescription', N'Name', N'Price', N'ShortDescription') AND [object_id] = OBJECT_ID(N'[Cakes]'))
        SET IDENTITY_INSERT [Cakes] ON;
    EXEC(N'INSERT INTO [Cakes] ([CakeId], [AllergyInformation], [CategoryId], [ImageThumbnailUrl], [ImageUrl], [InStock], [IsCakeOfTheWeek], [LongDescription], [Name], [Price], [ShortDescription])
    VALUES (1, N'''', 1, N''https://gillcleerenpluralsight.blob.core.windows.net/files/appleCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/appleCake.jpg'', CAST(1 AS bit), CAST(1 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Apple Cake'', 12.95, N''Our famous apple Cakes!''),
    (4, N'''', 1, N''https://gillcleerenpluralsight.blob.core.windows.net/files/cherryCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/cherryCake.jpg'', CAST(1 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Cherry Cake'', 15.95, N''A summer classic!''),
    (7, N'''', 1, N''https://gillcleerenpluralsight.blob.core.windows.net/files/peachCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/peachCake.jpg'', CAST(0 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Peach Cake'', 15.95, N''Sweet as peach''),
    (9, N'''', 1, N''https://gillcleerenpluralsight.blob.core.windows.net/files/rhubarbCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/rhubarbCake.jpg'', CAST(1 AS bit), CAST(1 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Rhubarb Cake'', 15.95, N''My God, so sweet!''),
    (10, N'''', 1, N''https://gillcleerenpluralsight.blob.core.windows.net/files/strawberryCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/strawberryCake.jpg'', CAST(1 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Strawberry Cake'', 15.95, N''Our delicious strawberry Cake!''),
    (2, N'''', 2, N''https://gillcleerenpluralsight.blob.core.windows.net/files/blueberrycheesecakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/blueberrycheesecake.jpg'', CAST(1 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Blueberry Cheese Cake'', 18.95, N''You''''ll love it!''),
    (3, N'''', 2, N''https://gillcleerenpluralsight.blob.core.windows.net/files/cheesecakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/cheesecake.jpg'', CAST(1 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Cheese Cake'', 18.95, N''Plain cheese cake. Plain pleasure.''),
    (11, N'''', 2, N''https://gillcleerenpluralsight.blob.core.windows.net/files/strawberrycheesecakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/strawberrycheesecake.jpg'', CAST(0 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Strawberry Cheese Cake'', 18.95, N''You''''ll love it!''),
    (5, N'''', 3, N''https://gillcleerenpluralsight.blob.core.windows.net/files/christmasappleCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/christmasappleCake.jpg'', CAST(1 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Christmas Apple Cake'', 13.95, N''Happy holidays with this Cake!''),
    (6, N'''', 3, N''https://gillcleerenpluralsight.blob.core.windows.net/files/cranberryCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/cranberryCake.jpg'', CAST(1 AS bit), CAST(0 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Cranberry Cake'', 17.95, N''A Christmas favorite''),
    (8, N'''', 3, N''https://gillcleerenpluralsight.blob.core.windows.net/files/pumpkinCakesmall.jpg'', N''https://gillcleerenpluralsight.blob.core.windows.net/files/pumpkinCake.jpg'', CAST(1 AS bit), CAST(1 AS bit), N''Icing carrot cake jelly-o cheesecake. Sweet roll marzipan marshmallow toffee brownie brownie candy tootsie roll. Chocolate cake gingerbread tootsie roll oat cake Cake chocolate bar cookie dragée brownie. Lollipop cotton candy cake bear claw oat cake. Dragée candy canes dessert tart. Marzipan dragée gummies lollipop jujubes chocolate bar candy canes. Icing gingerbread chupa chups cotton candy cookie sweet icing bonbon gummies. Gummies lollipop brownie biscuit danish chocolate cake. Danish powder cookie macaroon chocolate donut tart. Carrot cake dragée croissant lemon drops liquorice lemon drops cookie lollipop toffee. Carrot cake carrot cake liquorice sugar plum topping bonbon Cake muffin jujubes. Jelly pastry wafer tart caramels bear claw. Tiramisu tart Cake cake danish lemon drops. Brownie cupcake dragée gummies.'', N''Pumpkin Cake'', 12.95, N''Our Halloween favorite'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'CakeId', N'AllergyInformation', N'CategoryId', N'ImageThumbnailUrl', N'ImageUrl', N'InStock', N'IsCakeOfTheWeek', N'LongDescription', N'Name', N'Price', N'ShortDescription') AND [object_id] = OBJECT_ID(N'[Cakes]'))
        SET IDENTITY_INSERT [Cakes] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210419185617_SeedDataAdded')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210419185617_SeedDataAdded', N'5.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421112343_ShoppingCartAdded')
BEGIN
    CREATE TABLE [ShoppingCartItems] (
        [ShoppingCartItemId] int NOT NULL IDENTITY,
        [CakeId] int NULL,
        [Amount] int NOT NULL,
        [ShoppingCartId] nvarchar(max) NULL,
        CONSTRAINT [PK_ShoppingCartItems] PRIMARY KEY ([ShoppingCartItemId]),
        CONSTRAINT [FK_ShoppingCartItems_Cakes_CakeId] FOREIGN KEY ([CakeId]) REFERENCES [Cakes] ([CakeId]) ON DELETE NO ACTION
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421112343_ShoppingCartAdded')
BEGIN
    CREATE INDEX [IX_ShoppingCartItems_CakeId] ON [ShoppingCartItems] ([CakeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421112343_ShoppingCartAdded')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210421112343_ShoppingCartAdded', N'5.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421183827_OrdersAdded')
BEGIN
    CREATE TABLE [Orders] (
        [OrderId] int NOT NULL IDENTITY,
        [FirstName] nvarchar(50) NOT NULL,
        [LastName] nvarchar(50) NOT NULL,
        [AddressLine1] nvarchar(100) NOT NULL,
        [AddressLine2] nvarchar(max) NULL,
        [ZipCode] nvarchar(10) NOT NULL,
        [City] nvarchar(50) NOT NULL,
        [State] nvarchar(10) NULL,
        [Country] nvarchar(50) NOT NULL,
        [PhoneNumber] nvarchar(25) NOT NULL,
        [Email] nvarchar(50) NOT NULL,
        [OrderTotal] decimal(18,2) NOT NULL,
        [OrderPlaced] datetime2 NOT NULL,
        CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421183827_OrdersAdded')
BEGIN
    CREATE TABLE [OrderDetails] (
        [OrderDetailId] int NOT NULL IDENTITY,
        [OrderId] int NOT NULL,
        [CakeId] int NOT NULL,
        [Amount] int NOT NULL,
        [Price] decimal(18,2) NOT NULL,
        CONSTRAINT [PK_OrderDetails] PRIMARY KEY ([OrderDetailId]),
        CONSTRAINT [FK_OrderDetails_Cakes_CakeId] FOREIGN KEY ([CakeId]) REFERENCES [Cakes] ([CakeId]) ON DELETE CASCADE,
        CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421183827_OrdersAdded')
BEGIN
    CREATE INDEX [IX_OrderDetails_CakeId] ON [OrderDetails] ([CakeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421183827_OrdersAdded')
BEGIN
    CREATE INDEX [IX_OrderDetails_OrderId] ON [OrderDetails] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210421183827_OrdersAdded')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210421183827_OrdersAdded', N'5.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20210423163725_IdentityAdded')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20210423163725_IdentityAdded', N'5.0.4');
END;
GO

COMMIT;
GO

