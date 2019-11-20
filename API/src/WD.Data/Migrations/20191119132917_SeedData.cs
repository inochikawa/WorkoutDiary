using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WD.Data.Migrations
{
    public partial class SeedData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Trainings",
                columns: new[] { "Id", "CreatedDate", "UpdatedDate" },
                values: new object[] { new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(2019, 1, 1, 12, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) });

            migrationBuilder.InsertData(
                table: "Exercises",
                columns: new[] { "Id", "CreatedDate", "Name", "TrainingId", "UpdatedDate" },
                values: new object[] { new Guid("cb0c7136-3d85-4d5c-a4be-620b4d35f575"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Pull up", new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) });

            migrationBuilder.InsertData(
                table: "Exercises",
                columns: new[] { "Id", "CreatedDate", "Name", "TrainingId", "UpdatedDate" },
                values: new object[] { new Guid("063b89bd-d12a-489f-83d0-a4b86aa3afc0"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Press", new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) });

            migrationBuilder.InsertData(
                table: "ExerciseLoops",
                columns: new[] { "Id", "CreatedDate", "ExerciseId", "Repeats", "UpdatedDate" },
                values: new object[] { new Guid("76f2ce65-3232-4e89-99db-20123eeeb7d0"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("cb0c7136-3d85-4d5c-a4be-620b4d35f575"), 12, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) });

            migrationBuilder.InsertData(
                table: "ExerciseLoops",
                columns: new[] { "Id", "CreatedDate", "ExerciseId", "Repeats", "UpdatedDate" },
                values: new object[] { new Guid("6819675e-9e0a-4263-8c8f-bb42ef00f7d8"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("063b89bd-d12a-489f-83d0-a4b86aa3afc0"), 12, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("6819675e-9e0a-4263-8c8f-bb42ef00f7d8"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("76f2ce65-3232-4e89-99db-20123eeeb7d0"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("063b89bd-d12a-489f-83d0-a4b86aa3afc0"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("cb0c7136-3d85-4d5c-a4be-620b4d35f575"));

            migrationBuilder.DeleteData(
                table: "Trainings",
                keyColumn: "Id",
                keyValue: new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"));
        }
    }
}
