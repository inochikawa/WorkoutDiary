using Microsoft.EntityFrameworkCore;
using WD.Data.Entities;
using WD.Data.Extensions;

namespace WD.Data
{
    public class WdDbContext : DbContext
    {
        public DbSet<Training> Trainings { get; set; }
        public DbSet<Exercise> Exercises { get; set; }
        public DbSet<ExerciseLoop> ExerciseLoops { get; set; }

        public WdDbContext(DbContextOptions<WdDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            
            modelBuilder.SeedData();
        }
    }
}