USE [mhl]
GO
/****** Object:  Schema [hardware_store]    Script Date: 14/07/2026 11:09:06 ******/
CREATE SCHEMA [hardware_store]
GO
/****** Object:  Table [dbo].[apparaat_exemplaar]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apparaat_exemplaar](
	[exemplaar_id] [int] IDENTITY(13,1) NOT NULL,
	[model_id] [int] NOT NULL,
	[serienummer] [nvarchar](100) NOT NULL,
	[aankoopdatum] [datetime] NOT NULL,
	[status] [nvarchar](12) NULL,
 CONSTRAINT [PK_apparaat_exemplaar_exemplaar_id] PRIMARY KEY CLUSTERED 
(
	[exemplaar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groep_kenmerk]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groep_kenmerk](
	[id] [int] IDENTITY(15,1) NOT NULL,
	[hardware_groep_id] [int] NOT NULL,
	[kenmerk_id] [int] NOT NULL,
	[is_verplicht] [smallint] NOT NULL,
 CONSTRAINT [PK_groep_kenmerk_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groep_kenmerk_kenmerk_opties_num]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groep_kenmerk_kenmerk_opties_num](
	[groep_kenmerk_id] [int] NOT NULL,
	[kenmerk_optie_num_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[groep_kenmerk_id] ASC,
	[kenmerk_optie_num_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groep_kenmerk_kenmerk_opties_string]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groep_kenmerk_kenmerk_opties_string](
	[groep_kenmerk_id] [int] NOT NULL,
	[kenmerk_optie_string_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[groep_kenmerk_id] ASC,
	[kenmerk_optie_string_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groep_tree]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groep_tree](
	[ancestor_id] [int] NOT NULL,
	[descendant_id] [int] NOT NULL,
	[depth] [int] NOT NULL,
 CONSTRAINT [PK_groep_tree_ancestor_id] PRIMARY KEY CLUSTERED 
(
	[ancestor_id] ASC,
	[descendant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hardware_groep]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hardware_groep](
	[groep_id] [int] IDENTITY(14,1) NOT NULL,
	[naam] [nvarchar](100) NOT NULL,
	[beschrijving] [nvarchar](255) NULL,
 CONSTRAINT [PK_hardware_groep_groep_id] PRIMARY KEY CLUSTERED 
(
	[groep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kenmerk]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kenmerk](
	[kenmerk_id] [int] IDENTITY(15,1) NOT NULL,
	[naam] [nvarchar](100) NOT NULL,
	[datatype] [nvarchar](10) NOT NULL,
	[eenheid] [nvarchar](20) NULL,
 CONSTRAINT [PK_kenmerk_kenmerk_id] PRIMARY KEY CLUSTERED 
(
	[kenmerk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kenmerken_opties_num]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kenmerken_opties_num](
	[kenmerk_optie_id] [int] IDENTITY(415,1) NOT NULL,
	[kenmerk_id] [int] NOT NULL,
	[min] [real] NULL,
	[max] [real] NULL,
 CONSTRAINT [PK_kenmerken_opties_num_kenmerk_optie_id] PRIMARY KEY CLUSTERED 
(
	[kenmerk_optie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kenmerken_opties_string]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kenmerken_opties_string](
	[kenmerk_optie_id] [int] IDENTITY(303,1) NOT NULL,
	[kenmerk_id] [int] NOT NULL,
	[waarde] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_kenmerken_opties_string_kenmerk_optie_id] PRIMARY KEY CLUSTERED 
(
	[kenmerk_optie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model_kenmerk_bool]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model_kenmerk_bool](
	[model_id] [int] NOT NULL,
	[kenmerk_id] [int] NOT NULL,
	[waarde] [smallint] NOT NULL,
 CONSTRAINT [PK_model_kenmerk_bool_model_id] PRIMARY KEY CLUSTERED 
(
	[model_id] ASC,
	[kenmerk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model_kenmerk_numeriek]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model_kenmerk_numeriek](
	[model_id] [int] NOT NULL,
	[kenmerk_id] [int] NOT NULL,
	[waarde] [int] NOT NULL,
 CONSTRAINT [PK_model_kenmerk_numeriek_model_id] PRIMARY KEY CLUSTERED 
(
	[model_id] ASC,
	[kenmerk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model_kenmerk_string]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model_kenmerk_string](
	[model_id] [int] NOT NULL,
	[kenmerk_id] [int] NOT NULL,
	[kenmerk_optie_id] [int] NOT NULL,
 CONSTRAINT [PK_model_kenmerk_string_model_id] PRIMARY KEY CLUSTERED 
(
	[model_id] ASC,
	[kenmerk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_model]    Script Date: 14/07/2026 11:09:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_model](
	[model_id] [int] IDENTITY(8,1) NOT NULL,
	[groep_id] [int] NOT NULL,
	[merk] [nvarchar](100) NOT NULL,
	[model_naam] [nvarchar](100) NOT NULL,
	[omschrijving] [nvarchar](max) NULL,
 CONSTRAINT [PK_product_model_model_id] PRIMARY KEY CLUSTERED 
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[apparaat_exemplaar] ON 

INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (1, 1, N'SN-DELL-001', CAST(N'2026-01-10T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (2, 1, N'SN-DELL-002', CAST(N'2026-01-10T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (3, 1, N'SN-DELL-003', CAST(N'2026-05-01T00:00:00.000' AS DateTime), N'In magazijn')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (4, 2, N'SN-LENO-999', CAST(N'2026-02-14T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (5, 3, N'SN-APPLE-X1', CAST(N'2026-03-20T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (6, 3, N'SN-APPLE-X2', CAST(N'2026-03-20T00:00:00.000' AS DateTime), N'In reparatie')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (7, 4, N'SN-HP-99281', CAST(N'2026-01-15T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (8, 5, N'SN-BR-00192', CAST(N'2026-03-10T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (9, 6, N'SN-AS-55411', CAST(N'2026-05-26T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (10, 7, N'SN-IPHONE-991', CAST(N'2026-05-10T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (11, 7, N'SN-IPHONE-992', CAST(N'2026-05-10T00:00:00.000' AS DateTime), N'In gebruik')
INSERT [dbo].[apparaat_exemplaar] ([exemplaar_id], [model_id], [serienummer], [aankoopdatum], [status]) VALUES (12, 7, N'SN-IPHONE-993', CAST(N'2026-05-26T00:00:00.000' AS DateTime), N'In magazijn')
SET IDENTITY_INSERT [dbo].[apparaat_exemplaar] OFF
GO
SET IDENTITY_INSERT [dbo].[groep_kenmerk] ON 

INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (1, 2, 1, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (2, 2, 2, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (3, 2, 3, 0)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (4, 5, 4, 0)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (5, 5, 5, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (6, 5, 6, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (7, 7, 7, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (8, 7, 8, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (9, 7, 9, 0)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (10, 10, 10, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (11, 9, 11, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (12, 12, 12, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (13, 13, 13, 1)
INSERT [dbo].[groep_kenmerk] ([id], [hardware_groep_id], [kenmerk_id], [is_verplicht]) VALUES (14, 13, 14, 0)
SET IDENTITY_INSERT [dbo].[groep_kenmerk] OFF
GO
INSERT [dbo].[groep_kenmerk_kenmerk_opties_num] ([groep_kenmerk_id], [kenmerk_optie_num_id]) VALUES (1, 401)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_num] ([groep_kenmerk_id], [kenmerk_optie_num_id]) VALUES (2, 402)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_num] ([groep_kenmerk_id], [kenmerk_optie_num_id]) VALUES (4, 404)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_num] ([groep_kenmerk_id], [kenmerk_optie_num_id]) VALUES (7, 407)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_num] ([groep_kenmerk_id], [kenmerk_optie_num_id]) VALUES (9, 409)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_num] ([groep_kenmerk_id], [kenmerk_optie_num_id]) VALUES (11, 411)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_num] ([groep_kenmerk_id], [kenmerk_optie_num_id]) VALUES (14, 414)
GO
INSERT [dbo].[groep_kenmerk_kenmerk_opties_string] ([groep_kenmerk_id], [kenmerk_optie_string_id]) VALUES (5, 101)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_string] ([groep_kenmerk_id], [kenmerk_optie_string_id]) VALUES (5, 102)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_string] ([groep_kenmerk_id], [kenmerk_optie_string_id]) VALUES (8, 201)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_string] ([groep_kenmerk_id], [kenmerk_optie_string_id]) VALUES (8, 202)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_string] ([groep_kenmerk_id], [kenmerk_optie_string_id]) VALUES (8, 203)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_string] ([groep_kenmerk_id], [kenmerk_optie_string_id]) VALUES (13, 301)
INSERT [dbo].[groep_kenmerk_kenmerk_opties_string] ([groep_kenmerk_id], [kenmerk_optie_string_id]) VALUES (13, 302)
GO
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (1, 1, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (1, 2, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (1, 3, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (1, 9, 2)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (1, 10, 2)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (1, 13, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (2, 2, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (2, 9, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (2, 10, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (3, 3, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (4, 4, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (4, 5, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (5, 5, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (6, 6, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (6, 7, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (6, 8, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (6, 11, 2)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (6, 12, 2)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (6, 13, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (7, 7, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (7, 11, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (7, 12, 1)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (8, 8, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (9, 9, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (10, 10, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (11, 11, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (12, 12, 0)
INSERT [dbo].[groep_tree] ([ancestor_id], [descendant_id], [depth]) VALUES (13, 13, 0)
GO
SET IDENTITY_INSERT [dbo].[hardware_groep] ON 

INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (1, N'Computers', N'Alle computergestuurde werkplekhardware')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (2, N'Laptops', N'Draagbare computers')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (3, N'Desktops', N'Vaste computerkasten')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (4, N'Printers', N'Afdrukapparatuur')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (5, N'Laserprinters', N'Printers werkend op toner')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (6, N'Netwerk', N'Netwerkcomponenten')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (7, N'Routers', N'Apparaten voor netwerkverkeer')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (8, N'Modems', N'Modulators/Demodulators voor internet')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (9, N'Ultrabooks', N'Lichte, dunne laptops voor onderweg')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (10, N'Mobile Workstations', N'Krachtige laptops voor CAD en development')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (11, N'Wired Routers', N'Core routers zonder ingebouwde Wi-Fi')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (12, N'Wireless Access Points', N'Apparaten voor draadloos netwerkbereik')
INSERT [dbo].[hardware_groep] ([groep_id], [naam], [beschrijving]) VALUES (13, N'Smartphones', N'Mobiele telefoons met computerfunctionaliteit')
SET IDENTITY_INSERT [dbo].[hardware_groep] OFF
GO
SET IDENTITY_INSERT [dbo].[kenmerk] ON 

INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (1, N'RAM Geheugen', N'numeriek', N'GB')
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (2, N'Opslagcapaciteit', N'numeriek', N'GB')
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (3, N'Processor', N'tekst', NULL)
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (4, N'Afdruksnelheid', N'numeriek', N'PPM')
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (5, N'Kleur/Zwart-Wit', N'keuzelijst', NULL)
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (6, N'Toner Type', N'tekst', NULL)
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (7, N'Aantal LAN-poorten', N'numeriek', N'Stuks')
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (8, N'Wi-Fi Standaard', N'keuzelijst', NULL)
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (9, N'Max Snelheid', N'numeriek', N'Mbps')
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (10, N'Dedicated GPU', N'boolean', NULL)
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (11, N'Gewicht', N'numeriek', N'kg')
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (12, N'PoE Ondersteuning', N'boolean', NULL)
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (13, N'Besturingssysteem', N'keuzelijst', NULL)
INSERT [dbo].[kenmerk] ([kenmerk_id], [naam], [datatype], [eenheid]) VALUES (14, N'Schermgrootte', N'numeriek', N'Inch')
SET IDENTITY_INSERT [dbo].[kenmerk] OFF
GO
SET IDENTITY_INSERT [dbo].[kenmerken_opties_num] ON 

INSERT [dbo].[kenmerken_opties_num] ([kenmerk_optie_id], [kenmerk_id], [min], [max]) VALUES (401, 1, 4, 128)
INSERT [dbo].[kenmerken_opties_num] ([kenmerk_optie_id], [kenmerk_id], [min], [max]) VALUES (402, 2, 128, 4096)
INSERT [dbo].[kenmerken_opties_num] ([kenmerk_optie_id], [kenmerk_id], [min], [max]) VALUES (404, 4, 10, 100)
INSERT [dbo].[kenmerken_opties_num] ([kenmerk_optie_id], [kenmerk_id], [min], [max]) VALUES (407, 7, 1, 48)
INSERT [dbo].[kenmerken_opties_num] ([kenmerk_optie_id], [kenmerk_id], [min], [max]) VALUES (409, 9, 100, 10000)
INSERT [dbo].[kenmerken_opties_num] ([kenmerk_optie_id], [kenmerk_id], [min], [max]) VALUES (411, 11, 0.5, 2.5)
INSERT [dbo].[kenmerken_opties_num] ([kenmerk_optie_id], [kenmerk_id], [min], [max]) VALUES (414, 14, 4, 7.5)
SET IDENTITY_INSERT [dbo].[kenmerken_opties_num] OFF
GO
SET IDENTITY_INSERT [dbo].[kenmerken_opties_string] ON 

INSERT [dbo].[kenmerken_opties_string] ([kenmerk_optie_id], [kenmerk_id], [waarde]) VALUES (101, 5, N'Kleur')
INSERT [dbo].[kenmerken_opties_string] ([kenmerk_optie_id], [kenmerk_id], [waarde]) VALUES (102, 5, N'Zwart-Wit')
INSERT [dbo].[kenmerken_opties_string] ([kenmerk_optie_id], [kenmerk_id], [waarde]) VALUES (201, 8, N'Wi-Fi 5')
INSERT [dbo].[kenmerken_opties_string] ([kenmerk_optie_id], [kenmerk_id], [waarde]) VALUES (202, 8, N'Wi-Fi 6')
INSERT [dbo].[kenmerken_opties_string] ([kenmerk_optie_id], [kenmerk_id], [waarde]) VALUES (203, 8, N'Wi-Fi 7')
INSERT [dbo].[kenmerken_opties_string] ([kenmerk_optie_id], [kenmerk_id], [waarde]) VALUES (301, 13, N'iOS')
INSERT [dbo].[kenmerken_opties_string] ([kenmerk_optie_id], [kenmerk_id], [waarde]) VALUES (302, 13, N'Android')
SET IDENTITY_INSERT [dbo].[kenmerken_opties_string] OFF
GO
INSERT [dbo].[model_kenmerk_bool] ([model_id], [kenmerk_id], [waarde]) VALUES (2, 10, 1)
GO
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (1, 1, 16)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (1, 11, 1)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (2, 1, 64)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (3, 1, 8)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (3, 14, 6)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (4, 1, 16)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (4, 2, 512)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (5, 4, 31)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (6, 7, 8)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (6, 9, 6000)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (7, 1, 8)
INSERT [dbo].[model_kenmerk_numeriek] ([model_id], [kenmerk_id], [waarde]) VALUES (7, 14, 6)
GO
INSERT [dbo].[model_kenmerk_string] ([model_id], [kenmerk_id], [kenmerk_optie_id]) VALUES (5, 5, 101)
INSERT [dbo].[model_kenmerk_string] ([model_id], [kenmerk_id], [kenmerk_optie_id]) VALUES (6, 8, 202)
INSERT [dbo].[model_kenmerk_string] ([model_id], [kenmerk_id], [kenmerk_optie_id]) VALUES (3, 13, 301)
INSERT [dbo].[model_kenmerk_string] ([model_id], [kenmerk_id], [kenmerk_optie_id]) VALUES (7, 13, 301)
GO
SET IDENTITY_INSERT [dbo].[product_model] ON 

INSERT [dbo].[product_model] ([model_id], [groep_id], [merk], [model_naam], [omschrijving]) VALUES (1, 9, N'Dell', N'XPS 13 9320', N'Standaard ultrabook voor consultancy')
INSERT [dbo].[product_model] ([model_id], [groep_id], [merk], [model_naam], [omschrijving]) VALUES (2, 10, N'Lenovo', N'ThinkPad P16 G2', N'Zware workstation voor developers')
INSERT [dbo].[product_model] ([model_id], [groep_id], [merk], [model_naam], [omschrijving]) VALUES (3, 13, N'Apple', N'iPhone 15 Pro', N'Standaard mobiel voor bereikbaarheidsdienst')
INSERT [dbo].[product_model] ([model_id], [groep_id], [merk], [model_naam], [omschrijving]) VALUES (4, 2, N'HP', N'EliteBook 840 G9', N'Standaard zakelijke laptop')
INSERT [dbo].[product_model] ([model_id], [groep_id], [merk], [model_naam], [omschrijving]) VALUES (5, 5, N'Brother', N'HL-L8260CDW', N'Professionele kleurenlaserprinter voor afdelingen')
INSERT [dbo].[product_model] ([model_id], [groep_id], [merk], [model_naam], [omschrijving]) VALUES (6, 7, N'ASUS', N'RT-AX88U', N'High-performance dual-band wifi-router')
INSERT [dbo].[product_model] ([model_id], [groep_id], [merk], [model_naam], [omschrijving]) VALUES (7, 13, N'Apple', N'iPhone 15 ', N'Smartphones voor de buitendienst en bereikbaarheidsdienst')
SET IDENTITY_INSERT [dbo].[product_model] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [apparaat_exemplaar$serienummer]    Script Date: 14/07/2026 11:09:06 ******/
ALTER TABLE [dbo].[apparaat_exemplaar] ADD  CONSTRAINT [apparaat_exemplaar$serienummer] UNIQUE NONCLUSTERED 
(
	[serienummer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[apparaat_exemplaar] ADD  DEFAULT (getdate()) FOR [aankoopdatum]
GO
ALTER TABLE [dbo].[apparaat_exemplaar] ADD  DEFAULT (N'In magazijn') FOR [status]
GO
ALTER TABLE [dbo].[hardware_groep] ADD  DEFAULT (NULL) FOR [beschrijving]
GO
ALTER TABLE [dbo].[kenmerk] ADD  DEFAULT (NULL) FOR [eenheid]
GO
ALTER TABLE [dbo].[kenmerken_opties_num] ADD  DEFAULT (NULL) FOR [min]
GO
ALTER TABLE [dbo].[kenmerken_opties_num] ADD  DEFAULT (NULL) FOR [max]
GO
ALTER TABLE [dbo].[product_model] ADD  DEFAULT (NULL) FOR [omschrijving]
GO
ALTER TABLE [dbo].[apparaat_exemplaar]  WITH NOCHECK ADD  CONSTRAINT [apparaat_exemplaar$apparaat_exemplaar_ibfk_1] FOREIGN KEY([model_id])
REFERENCES [dbo].[product_model] ([model_id])
GO
ALTER TABLE [dbo].[apparaat_exemplaar] CHECK CONSTRAINT [apparaat_exemplaar$apparaat_exemplaar_ibfk_1]
GO
ALTER TABLE [dbo].[groep_kenmerk]  WITH NOCHECK ADD  CONSTRAINT [groep_kenmerk$groep_kenmerk_ibfk_1] FOREIGN KEY([hardware_groep_id])
REFERENCES [dbo].[hardware_groep] ([groep_id])
GO
ALTER TABLE [dbo].[groep_kenmerk] CHECK CONSTRAINT [groep_kenmerk$groep_kenmerk_ibfk_1]
GO
ALTER TABLE [dbo].[groep_kenmerk]  WITH NOCHECK ADD  CONSTRAINT [groep_kenmerk$groep_kenmerk_ibfk_2] FOREIGN KEY([kenmerk_id])
REFERENCES [dbo].[kenmerk] ([kenmerk_id])
GO
ALTER TABLE [dbo].[groep_kenmerk] CHECK CONSTRAINT [groep_kenmerk$groep_kenmerk_ibfk_2]
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_num]  WITH CHECK ADD  CONSTRAINT [FK_gkon_to_groep_kenmerk] FOREIGN KEY([groep_kenmerk_id])
REFERENCES [dbo].[groep_kenmerk] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_num] CHECK CONSTRAINT [FK_gkon_to_groep_kenmerk]
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_num]  WITH CHECK ADD  CONSTRAINT [FK_gkon_to_opties_num] FOREIGN KEY([kenmerk_optie_num_id])
REFERENCES [dbo].[kenmerken_opties_num] ([kenmerk_optie_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_num] CHECK CONSTRAINT [FK_gkon_to_opties_num]
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_string]  WITH CHECK ADD  CONSTRAINT [FK_gkos_to_groep_kenmerk] FOREIGN KEY([groep_kenmerk_id])
REFERENCES [dbo].[groep_kenmerk] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_string] CHECK CONSTRAINT [FK_gkos_to_groep_kenmerk]
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_string]  WITH CHECK ADD  CONSTRAINT [FK_gkos_to_opties_string] FOREIGN KEY([kenmerk_optie_string_id])
REFERENCES [dbo].[kenmerken_opties_string] ([kenmerk_optie_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[groep_kenmerk_kenmerk_opties_string] CHECK CONSTRAINT [FK_gkos_to_opties_string]
GO
ALTER TABLE [dbo].[groep_tree]  WITH NOCHECK ADD  CONSTRAINT [groep_tree$groep_tree_ibfk_1] FOREIGN KEY([ancestor_id])
REFERENCES [dbo].[hardware_groep] ([groep_id])
GO
ALTER TABLE [dbo].[groep_tree] CHECK CONSTRAINT [groep_tree$groep_tree_ibfk_1]
GO
ALTER TABLE [dbo].[groep_tree]  WITH NOCHECK ADD  CONSTRAINT [groep_tree$groep_tree_ibfk_2] FOREIGN KEY([descendant_id])
REFERENCES [dbo].[hardware_groep] ([groep_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[groep_tree] CHECK CONSTRAINT [groep_tree$groep_tree_ibfk_2]
GO
ALTER TABLE [dbo].[kenmerken_opties_num]  WITH NOCHECK ADD  CONSTRAINT [kenmerken_opties_num$kenmerken_opties_num_ibfk_1] FOREIGN KEY([kenmerk_id])
REFERENCES [dbo].[kenmerk] ([kenmerk_id])
GO
ALTER TABLE [dbo].[kenmerken_opties_num] CHECK CONSTRAINT [kenmerken_opties_num$kenmerken_opties_num_ibfk_1]
GO
ALTER TABLE [dbo].[kenmerken_opties_string]  WITH NOCHECK ADD  CONSTRAINT [kenmerken_opties_string$kenmerken_opties_string_ibfk_1] FOREIGN KEY([kenmerk_id])
REFERENCES [dbo].[kenmerk] ([kenmerk_id])
GO
ALTER TABLE [dbo].[kenmerken_opties_string] CHECK CONSTRAINT [kenmerken_opties_string$kenmerken_opties_string_ibfk_1]
GO
ALTER TABLE [dbo].[model_kenmerk_bool]  WITH NOCHECK ADD  CONSTRAINT [model_kenmerk_bool$model_kenmerk_bool_ibfk_1] FOREIGN KEY([kenmerk_id])
REFERENCES [dbo].[kenmerk] ([kenmerk_id])
GO
ALTER TABLE [dbo].[model_kenmerk_bool] CHECK CONSTRAINT [model_kenmerk_bool$model_kenmerk_bool_ibfk_1]
GO
ALTER TABLE [dbo].[model_kenmerk_bool]  WITH NOCHECK ADD  CONSTRAINT [model_kenmerk_bool$model_kenmerk_bool_ibfk_2] FOREIGN KEY([model_id])
REFERENCES [dbo].[product_model] ([model_id])
GO
ALTER TABLE [dbo].[model_kenmerk_bool] CHECK CONSTRAINT [model_kenmerk_bool$model_kenmerk_bool_ibfk_2]
GO
ALTER TABLE [dbo].[model_kenmerk_numeriek]  WITH NOCHECK ADD  CONSTRAINT [model_kenmerk_numeriek$model_kenmerk_numeriek_ibfk_1] FOREIGN KEY([kenmerk_id])
REFERENCES [dbo].[kenmerk] ([kenmerk_id])
GO
ALTER TABLE [dbo].[model_kenmerk_numeriek] CHECK CONSTRAINT [model_kenmerk_numeriek$model_kenmerk_numeriek_ibfk_1]
GO
ALTER TABLE [dbo].[model_kenmerk_numeriek]  WITH NOCHECK ADD  CONSTRAINT [model_kenmerk_numeriek$model_kenmerk_numeriek_ibfk_2] FOREIGN KEY([model_id])
REFERENCES [dbo].[product_model] ([model_id])
GO
ALTER TABLE [dbo].[model_kenmerk_numeriek] CHECK CONSTRAINT [model_kenmerk_numeriek$model_kenmerk_numeriek_ibfk_2]
GO
ALTER TABLE [dbo].[model_kenmerk_string]  WITH NOCHECK ADD  CONSTRAINT [model_kenmerk_string$model_kenmerk_string_ibfk_1] FOREIGN KEY([model_id])
REFERENCES [dbo].[product_model] ([model_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[model_kenmerk_string] CHECK CONSTRAINT [model_kenmerk_string$model_kenmerk_string_ibfk_1]
GO
ALTER TABLE [dbo].[model_kenmerk_string]  WITH NOCHECK ADD  CONSTRAINT [model_kenmerk_string$model_kenmerk_string_ibfk_2] FOREIGN KEY([kenmerk_id])
REFERENCES [dbo].[kenmerk] ([kenmerk_id])
GO
ALTER TABLE [dbo].[model_kenmerk_string] CHECK CONSTRAINT [model_kenmerk_string$model_kenmerk_string_ibfk_2]
GO
ALTER TABLE [dbo].[model_kenmerk_string]  WITH NOCHECK ADD  CONSTRAINT [model_kenmerk_string$model_kenmerk_string_ibfk_3] FOREIGN KEY([kenmerk_optie_id])
REFERENCES [dbo].[kenmerken_opties_string] ([kenmerk_optie_id])
GO
ALTER TABLE [dbo].[model_kenmerk_string] CHECK CONSTRAINT [model_kenmerk_string$model_kenmerk_string_ibfk_3]
GO
ALTER TABLE [dbo].[product_model]  WITH NOCHECK ADD  CONSTRAINT [product_model$product_model_ibfk_1] FOREIGN KEY([groep_id])
REFERENCES [dbo].[hardware_groep] ([groep_id])
GO
ALTER TABLE [dbo].[product_model] CHECK CONSTRAINT [product_model$product_model_ibfk_1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.apparaat_exemplaar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'apparaat_exemplaar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.groep_kenmerk' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'groep_kenmerk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.groep_tree' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'groep_tree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.hardware_groep' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'hardware_groep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.kenmerk' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kenmerk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.kenmerken_opties_num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kenmerken_opties_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.kenmerken_opties_string' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'kenmerken_opties_string'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.model_kenmerk_bool' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'model_kenmerk_bool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.model_kenmerk_numeriek' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'model_kenmerk_numeriek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.model_kenmerk_string' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'model_kenmerk_string'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'hardware_store.product_model' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'product_model'
GO
