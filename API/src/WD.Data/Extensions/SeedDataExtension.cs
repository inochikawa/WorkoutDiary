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
            SeedTraining(
                modelBuilder,
                new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"),
                new[]
                {
                    new Tuple<Guid, Guid[]>(
                        new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"),
                        new[]
                        {
                            new Guid("ee960fd4-ea2c-41a1-939d-4a2804fd584d"),
                            new Guid("710d6b69-2031-40cb-b945-6324edb9ecf7"),
                            new Guid("bc4f3d1b-f667-413a-ab8e-5afa752468ee"),
                            new Guid("4eb17c7d-4e2f-45c9-9cff-e6fdd028e95a"),
                            new Guid("dd2f825f-7cec-4c0a-a3f4-67fc217a609c"),
                            new Guid("523e640b-634c-4ec6-9308-7f77a36eb06b")
                        }
                    ),
                    new Tuple<Guid, Guid[]>(
                        new Guid("09216d1f-f8d9-4a87-a0b3-49254ade77b3"),
                        new[]
                        {
                            new Guid("72595bd4-55c2-4dad-9ba4-3d884f3514e6"),
                            new Guid("5295eccd-abd0-49a0-a451-3fc5c367903e"),
                            new Guid("63950351-628f-4a19-a51f-276186d56411"),
                        }
                    ),
                    new Tuple<Guid, Guid[]>(
                        new Guid("09216d1f-f8d9-4a87-a0b3-49224ade77b3"),
                        new[]
                        {
                            new Guid("72595bd4-55c2-4dad-9ba4-1d884f3514e6"),
                            new Guid("5295eccd-abd0-49a0-a451-2fc5c367903e"),
                            new Guid("63950351-628f-4a19-a51f-376186d56411"),
                        }
                    ),
                });
            
            SeedTraining(
                modelBuilder,
                new Guid("1e3f3264-f4ee-481a-bcb0-0aaa78a30d46"),
                new[]
                {
                    new Tuple<Guid, Guid[]>(
                        new Guid("437e855a-5daf-4114-8215-753bee4591f1"),
                        new[]
                        {
                            new Guid("9a2f60ea-a051-403a-854f-5ffa4029dc1d"),
                            new Guid("334ac162-6b25-40c7-a8e1-bdb682081077"),
                            new Guid("c0717ff7-85f8-44fb-8f75-b3f30046ada3"),
                            new Guid("6efc49ab-74cb-4b2c-84d4-8e18ca50787d"),
                            new Guid("f1d9cad4-ba78-43e9-8d86-5d6a7900c55a"),
                            new Guid("393daabc-47b3-4c8b-86e2-7a0c11140223")
                        }
                    ),
                    new Tuple<Guid, Guid[]>(
                        new Guid("09416d1f-f8d9-4a87-a0b3-49254ade77b3"),
                        new[]
                        {
                            new Guid("74595bd4-55c2-4dad-9ba4-3d884f3514e6"),
                            new Guid("5195eccd-abd0-49a0-a451-3fc5c367903e"),
                            new Guid("62950351-628f-4a19-a51f-276186d56411"),
                        }
                    ),
                });
            
            SeedTraining(
                modelBuilder,
                new Guid("c1370344-1e97-45ce-983d-6d56039d2869"),
                new[]
                {
                    new Tuple<Guid, Guid[]>(
                        new Guid("76dc09f3-3b13-4e6a-ba89-d8eefafc9899"),
                        new[]
                        {
                            new Guid("194df448-0cb2-4ca0-9023-ce5e65b235e8"),
                            new Guid("e5d07022-a17f-424a-b4e8-84c5dd32b76b"),
                            new Guid("d606b989-afa2-43d1-aebb-d17ce2834107"),
                        }
                    ),
                    new Tuple<Guid, Guid[]>(
                        new Guid("77987c9d-090d-4403-b384-d202f2cd205e"),
                        new[]
                        {
                            new Guid("09b2de47-2bfb-41d3-845b-48fecf06f8c7"),
                            new Guid("6a3be7ec-5e05-41d7-bdef-575abd3b9d76"),
                            new Guid("10df8645-19fc-4ada-825c-7ad4b429c4ff"),
                        }
                    ),
                });
        }

        private static void SeedTraining(ModelBuilder modelBuilder, Guid traingId, Tuple<Guid, Guid[]>[] exerciseIds)
        {
            var training = new Training()
            {
                Id = traingId,
                CreatedDate = new DateTimeOffset(2019, 5, 23, 12, 0, 0, TimeSpan.Zero),
            };

            modelBuilder.Entity<Training>().HasData(training);

            foreach (var (exerciseId, loopIds) in exerciseIds)
            {
                var exercise = new Exercise
                {
                    Id = exerciseId,
                    Name = "Test name",
                    TrainingId = traingId
                };

                modelBuilder.Entity<Exercise>().HasData(exercise);

                foreach (var loopId in loopIds)
                {
                    var loop = new ExerciseLoop
                    {
                        Id = loopId,
                        ExerciseId = exerciseId,
                        Repeats = 8,
                        Weight = 12
                    };
                    modelBuilder.Entity<ExerciseLoop>().HasData(loop);
                }
            }
        }
    }
}