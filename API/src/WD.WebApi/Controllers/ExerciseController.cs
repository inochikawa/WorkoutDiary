using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WD.Data;

namespace WD.WebApi.Controllers
{
    [ApiController]
    [Route("api/v1/exercise")]
    public class ExerciseController : Controller
    {
        private readonly WdDbContext _dbContext;

        public ExerciseController(WdDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        [HttpGet("")]
        public async Task<IActionResult> GetAll()
        {
            var result = await _dbContext.Exercises
                .Include(i => i.Loops)
                .AsNoTracking()
                .ToListAsync();

            return Ok(result);
        }
        
        [HttpGet("byTrainingId/{trainingId}")]
        public async Task<IActionResult> GetByTrainingId(Guid trainingId)
        {
            if (trainingId == Guid.Empty)
            {
                return BadRequest("Training ID is empty");
            }
            
            var result = await _dbContext.Exercises
                .Where(i => i.TrainingId == trainingId)
                .Include(i => i.Loops)
                .AsNoTracking()
                .ToListAsync();

            return Ok(result);
        }
    }
}