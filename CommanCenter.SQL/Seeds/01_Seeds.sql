-- ============================================================
-- CommanCenter.SQL / Seeds / 01_RolesYAdmin.sql
-- Seed inicial: Roles y usuario SuperAdmin
-- ⚠️ SOLO ejecutar en entorno nuevo. NO en producción con datos.
-- ============================================================

-- Roles de Identity (si no existen)
IF NOT EXISTS (SELECT 1 FROM [dbo].[AspNetRoles] WHERE [Name] = 'SuperAdmin')
	INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
	VALUES (NEWID(), 'SuperAdmin', 'SUPERADMIN', NEWID());

IF NOT EXISTS (SELECT 1 FROM [dbo].[AspNetRoles] WHERE [Name] = 'Admin')
	INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
	VALUES (NEWID(), 'Admin', 'ADMIN', NEWID());

IF NOT EXISTS (SELECT 1 FROM [dbo].[AspNetRoles] WHERE [Name] = 'Lider')
	INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
	VALUES (NEWID(), 'Lider', 'LIDER', NEWID());

IF NOT EXISTS (SELECT 1 FROM [dbo].[AspNetRoles] WHERE [Name] = 'User')
	INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp])
	VALUES (NEWID(), 'User', 'USER', NEWID());

PRINT '✅ Roles insertados.';
GO

-- ============================================================
-- CommanCenter.SQL / Seeds / 02_CelulasBase.sql
-- Células iniciales del módulo DataTeam
-- (Solo falta asignar consultores a cada una.)
-- Idempotente: cada célula se inserta solo si no existe.
-- ============================================================

;WITH Base AS (
    SELECT Nombre FROM (VALUES
        ('Administrativo'),
        ('Aurora'),
        ('Bon Voyage'),
        ('Data Stargazers'),
        ('DEVSECOPS'),
        ('Dirección Desarrollo'),
        ('Enterprise Team'),
        ('Facturador'),
        ('Maya'),
        ('MindShift'),
        ('Nova'),
        ('Polaris Software Team'),
        ('Seguridad'),
        ('Sin asignación'),
        ('Transversal Calidad'),
        ('Wakanda')
    ) AS C(Nombre)
)
INSERT INTO [dbo].[Celulas] ([Nombre], [Color], [Activo], [FechaCreacion])
SELECT b.Nombre, '#28a745', 1, GETUTCDATE()
FROM Base b
WHERE NOT EXISTS (
    SELECT 1 FROM [dbo].[Celulas] c WHERE c.[Nombre] = b.Nombre
);

PRINT '✅ Células base insertadas/verificadas (16).';
GO

