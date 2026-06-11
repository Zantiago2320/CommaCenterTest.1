using CommanCenter.API.Domain.Entities;

namespace CommanCenter.API.Domain.Interfaces;

public interface ICelulaRepository : IRepository<Celula>
{
    Task<IEnumerable<Celula>> GetActivasAsync();
    Task<Celula?> GetWithMiembrosAsync(int celulaId);
    Task<IEnumerable<Celula>> GetByLiderAsync(int consultorId);
}
