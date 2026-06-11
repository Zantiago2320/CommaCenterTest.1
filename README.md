# Command Center

Plataforma empresarial modular construida en **.NET 9**.

## Arquitectura

```
Portal → (APIM) → CommanCenter.API → SQL Server
					   ↓
			  Notification API (SendGrid)
			  Key Vault · Storage · App Insights
```

## Proyectos

| Proyecto | Descripción |
|---|---|
| `CommanCenter.API` | Web API REST .NET 9 — Clean Architecture |
| `CommanCenter.Portal` | Razor Pages .NET 9 — UI de administración |
| `CommanCenter.SQL` | Scripts T-SQL puros — tablas, SPs, vistas, seeds |

## Módulos

- **DataTeam** — Gestión de consultores, células y organigrama

## Capas del API

```
Domain/
  ├── Common/BaseEntity.cs
  ├── Entities/
  └── Interfaces/

Application/
  ├── DTOs/
  ├── Interfaces/
  └── Services/

Infrastructure/
  ├── Data/AppDbContext.cs
  ├── Repositories/
  └── Services/

Controllers/
Middleware/
Extensions/
```

## Stack técnico

- .NET 9 · ASP.NET Core · Entity Framework Core
- ASP.NET Identity · JWT Bearer
- Hangfire (background jobs)
- SendGrid (notificaciones)
- Serilog (logging estructurado)
- Azure Key Vault · Application Insights
- SQL Server

## Configuración rápida

### API
1. Copiar `appsettings.Development.json` y completar:
   - `ConnectionStrings:DefaultConnection` → SQL Server
   - `JwtSettings:SecretKey` → clave de 32+ caracteres
   - `SendGrid:ApiKey` → API Key de SendGrid
2. `dotnet ef database update` en `CommanCenter.API/`
3. `dotnet run`

### Portal
1. Ajustar `ApiSettings:BaseUrl` apuntando al API
2. `dotnet run`

### SQL (manual / backup)
Ejecutar en orden: `Tables/` → `Views/` → `StoredProcedures/` → `Seeds/`

## Credenciales iniciales (seed)

```
Email:    admin@commancenter.com
Password: Admin@12345!
```
> ⚠️ Cambiar inmediatamente en producción.
