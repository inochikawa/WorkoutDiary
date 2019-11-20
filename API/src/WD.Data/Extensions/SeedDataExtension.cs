using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using WD.Data.Entities;

namespace WD.Data.Extensions
{
    public static class SeedDataExtension
    {
        public static void SeedData(this ModelBuilder modelBuilder)
        {
            var training = new Training()
            {
                Id = new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"),
                CreatedDate = new DateTimeOffset(2019, 1, 1, 12, 0, 0, TimeSpan.Zero),
            };

            var exercise1 = new Exercise()
            {
                Id = new Guid("cb0c7136-3d85-4d5c-a4be-620b4d35f575"),
                Name = "Pull up",
                TrainingId = training.Id
            };

            var exercise2 = new Exercise()
            {
                Id = new Guid("063b89bd-d12a-489f-83d0-a4b86aa3afc0"),
                Name = "Press",
                TrainingId = training.Id
            };

            var loop1 = new ExerciseLoop
            {
                Id = new Guid("76f2ce65-3232-4e89-99db-20123eeeb7d0"),
                Repeats = 12,
                ExerciseId = exercise1.Id
            };

            var loop2 = new ExerciseLoop
            {
                Id = new Guid("6819675e-9e0a-4263-8c8f-bb42ef00f7d8"),
                Repeats = 12,
                ExerciseId = exercise2.Id
            };

            modelBuilder.Entity<Training>().HasData(training);
            modelBuilder.Entity<Exercise>().HasData(exercise1);
            modelBuilder.Entity<Exercise>().HasData(exercise2);
            modelBuilder.Entity<ExerciseLoop>().HasData(loop1);
            modelBuilder.Entity<ExerciseLoop>().HasData(loop2);
        }
    }
}