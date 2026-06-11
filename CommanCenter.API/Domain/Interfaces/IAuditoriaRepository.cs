using CommanCenter.API.Domain.Entities;

namespace CommanCenter.API.Domain.Interfaces;

public interface IAuditoriaRepository : IRepository<AuditoriaLog>
{
    Task<IEnumerable<AuditoriaLog>> GetByModuloAsync(string modulo);
    Task<IEnumerable<AuditoriaLog>> GetByUsuarioAsync(string usuarioId);
    Task<IEnumerable<AuditoriaLog>> GetByFechaAsync(DateTime desde, DateTime hasta);
    Task<IEnumerable<AuditoriaLog>> GetRecientesAsync(int top = 100);
    Task RegistrarAsync(string modulo, string accion, string entidad,
        string? entidadId, string? valorAnterior, string? valorNuevo,
        string? usuarioId, string? usuarioEmail, string? ip, bool exitoso = true, string? error = null);
}
