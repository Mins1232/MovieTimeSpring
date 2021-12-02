Create Database BDMovieTime;
use BDMovieTime;
go
DROP DATABASE BDMovieTime
-------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[Usuario][nvarchar](50) NULL,
	[Contrasena][nvarchar](9) NULL,
	[Dni][nvarchar](8 )NULL,
	[Nombres][nvarchar](50) NULL,
	[ApellidoPat][nvarchar](50)NULL,
	[ApellidoMat][nvarchar](50)NULL,
	[Direccion][nvarchar](max) NULL,
	[Telefono][nvarchar](9)NULL,
	[Correo][nvarchar](50)NULL
	CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED
		(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--------------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE[dbo].[Distrito](
	[Id][int] IDENTITY(1,1)NOT NULL,
	[Distrito][nvarchar](50)NOT NULL,
	CONSTRAINT [PK_Distrito] PRIMARY KEY CLUSTERED
	(
	[Id]ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO
-----------------------------------------------------------------------------------------------------------

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cine](
	[Id][int] IDENTITY(1,1) NOT NULL,
	[IdDistrito][int]NOT NULL,
	[Nombre][nvarchar](25) NOT NULL,
	[Telefono][nvarchar](9) NOT NULL,
	[Direccion][nvarchar](max) NOT NULL,
	[Imagen][nvarchar](max) NOT NULL,
	[Estado][Bit]NOT NULL,
	CONSTRAINT [PK_Cines] PRIMARY KEY CLUSTERED
	(
	[Id]ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	
-----------------------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[Id][int]IDENTITY(1,1) NOT NULL,
	[Nombre][nvarchar](25) NOT NULL,
	[IdCine][int] NOT NULL,
	[Capacidad][int] NOT NULL,
	CONSTRAINT [PK_Sala]PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	
----------------------------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asientos](
	[Id][int]IDENTITY(1,1) NOT NULL,
	[IdSala][int] NOT NULL,
	[Nombre][nvarchar](5) NOT NULL,
	[Estado][bit] NOT NULL,
	CONSTRAINT [PK_Asientos] PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	
-----------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartelera](
	[Id][int]IDENTITY(1,1)NOT NULL,
	[Titulo][nvarchar](50)NOT NULL,
	[Genero][nvarchar](20) NOT NULL,
	[Duracion][nvarchar](10) NOT NULL,
	[Director][nvarchar](25) NOT NULL,
	[Clasificacion][nvarchar](20) NOT NULL,
	[Imagen][varchar](max) NOT NULL
	CONSTRAINT[PK_Cartelera]PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	
-------------------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[ID][int] IDENTITY(1,1)NOT NULL,
	[Dia][Date]NOT NULL,
	[Hora][Time]NOT NULL,
	[Descripcion][nvarchar](20)NOT NULL,
	CONSTRAINT[PK_Horario]PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	

-------------------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funciones](
	[Id][int]IDENTITY(1,1)NOT NULL,
	[IdCartelera][int]NOT NULL,
	[IdCine][int]NOT NULL,
	[IdHorario][int] NOT NULL,
	[TipoFuncion][nvarchar] (15) NOT NULL,
	[PrecioUnitario][decimal] NOT NULL,
	[Estado][bit] NOT NULL
	CONSTRAINT[PK_Funciones]PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	
-----------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE[dbo].[VentaEntradas](

	[Id][int]IDENTITY(1,1)NOT NULL,
	[IdUsuario][int] NOT NULL,
	[Fecha][datetime] NOT NULL,
	[IdFunciones][int] NOT NULL,
	[CantidadEntradas][int] NOT NULL,
	[MontoTotal][decimal] NOT NULL,
	CONSTRAINT[PK_VentaEntradas]PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	
--------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[Precio](
	[Id][int]IDENTITY(1,1) NOT NULL,
	[Precio][Money] NOT NULL,
	[DescripcionPrecio][nvarchar](50) NOT NULL,
	CONSTRAINT[PK_Precio]PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	
-------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[CarteleraPelicula](
	[Id][int]IDENTITY(1,1) NOT NULL,
	[Titulo][nvarchar](50) NOT NULL,
	[Descripcion][nvarchar](max) NOT NULL,
	[Precio][Money] NOT NULL,
	[IdCine][int]NOT NULL,
	[IdHorario][int]NOT NULL,
	[IdPrecio][int]NOT NULL,
	CONSTRAINT[PK_CarteleraPelicula]PRIMARY KEY CLUSTERED
	(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON[PRIMARY]
GO	

----------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Asientos] WITH CHECK ADD CONSTRAINT [FK_Sala_Asientos]FOREIGN KEY([IdSala])
REFERENCES [dbo].[Sala] ([Id])
GO
ALTER TABLE [dbo].[Asientos] CHECK CONSTRAINT [FK_Sala_Asientos]
GO
----------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Sala] WITH CHECK ADD CONSTRAINT [FK_Cine_Sala]FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([Id])
GO
ALTER TABLE [dbo].[Sala] CHECK CONSTRAINT [FK_Cine_Sala]
GO
----------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Cine] WITH CHECK ADD CONSTRAINT [FK_Distrito_Cine]FOREIGN KEY([IdDistrito])
REFERENCES [dbo].[Distrito] ([Id])
GO
ALTER TABLE [dbo].[Cine] CHECK CONSTRAINT [FK_Distrito_Cine]
GO
----------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Funciones] WITH CHECK ADD CONSTRAINT [FK_Cine_Funciones]FOREIGN KEY([IdCine])
REFERENCES [dbo].[Cine] ([Id])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [FK_Cine_Funciones]
GO
---------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Funciones] WITH CHECK ADD CONSTRAINT [FK_Cartelera_Funciones]FOREIGN KEY([IdCartelera])
REFERENCES [dbo].[Cartelera] ([Id])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [FK_Cartelera_Funciones]
GO
---------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[Funciones] WITH CHECK ADD CONSTRAINT [FK_Horario_Funciones]FOREIGN KEY([IdHorario])
REFERENCES [dbo].[Horario] ([Id])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [FK_Horario_Funciones]
GO
--------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[VentaEntradas] WITH CHECK ADD CONSTRAINT [FK_Funciones_VentaEntradas]FOREIGN KEY([IdFunciones])
REFERENCES [dbo].[Funciones] ([Id])
GO
ALTER TABLE [dbo].[VentaEntradas] CHECK CONSTRAINT [FK_Funciones_VentaEntradas]
GO
---------------------------------------------------------------------------------------------------------------------
ALTER TABLE [dbo].[VentaEntradas] WITH CHECK ADD CONSTRAINT [FK_Usuario_VentaEntradas]FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[VentaEntradas] CHECK CONSTRAINT [FK_Usuario_VentaEntradas]
GO