using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WD.Data;

namespace WD.WebApi.Controllers
{
    [ApiController]
    [Route("api/v1/training")]
    public class TrainingController : Controller
    {
        private readonly WdDbContext _dbContext;

        public TrainingController(WdDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [HttpGet("")]
        public async Task<IActionResult> GetAll()
        {
            var result = await _dbContext.Trainings
                .Include(i => i.Exercises)
                .ThenInclude(i => i.Loops)
                .ToListAsync();

            return Ok(result);
        }
    }
}