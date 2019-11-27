using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace WD.Data.Migrations
{
    public partial class Seed_More_Data : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.InsertData(
                table: "Exercises",
                columns: new[] { "Id", "CreatedDate", "Name", "TrainingId", "UpdatedDate" },
                values: new object[,]
                {
                    { new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Test name", new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) },
                    { new Guid("09216d1f-f8d9-4a87-a0b3-49254ade77b3"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Test name", new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) },
                    { new Guid("09216d1f-f8d9-4a87-a0b3-49224ade77b3"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Test name", new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) }
                });

            migrationBuilder.UpdateData(
                table: "Trainings",
                keyColumn: "Id",
                keyValue: new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"),
                column: "CreatedDate",
                value: new DateTimeOffset(new DateTime(2019, 5, 23, 12, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)));

            migrationBuilder.InsertData(
                table: "Trainings",
                columns: new[] { "Id", "CreatedDate", "UpdatedDate" },
                values: new object[,]
                {
                    { new Guid("1e3f3264-f4ee-481a-bcb0-0aaa78a30d46"), new DateTimeOffset(new DateTime(2019, 5, 23, 12, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) },
                    { new Guid("c1370344-1e97-45ce-983d-6d56039d2869"), new DateTimeOffset(new DateTime(2019, 5, 23, 12, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) }
                });

            migrationBuilder.InsertData(
                table: "ExerciseLoops",
                columns: new[] { "Id", "CreatedDate", "ExerciseId", "Repeats", "UpdatedDate", "Weight" },
                values: new object[,]
                {
                    { new Guid("ee960fd4-ea2c-41a1-939d-4a2804fd584d"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("710d6b69-2031-40cb-b945-6324edb9ecf7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("bc4f3d1b-f667-413a-ab8e-5afa752468ee"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("4eb17c7d-4e2f-45c9-9cff-e6fdd028e95a"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("dd2f825f-7cec-4c0a-a3f4-67fc217a609c"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("523e640b-634c-4ec6-9308-7f77a36eb06b"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("72595bd4-55c2-4dad-9ba4-3d884f3514e6"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09216d1f-f8d9-4a87-a0b3-49254ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("5295eccd-abd0-49a0-a451-3fc5c367903e"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09216d1f-f8d9-4a87-a0b3-49254ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("63950351-628f-4a19-a51f-276186d56411"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09216d1f-f8d9-4a87-a0b3-49254ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("72595bd4-55c2-4dad-9ba4-1d884f3514e6"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09216d1f-f8d9-4a87-a0b3-49224ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("5295eccd-abd0-49a0-a451-2fc5c367903e"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09216d1f-f8d9-4a87-a0b3-49224ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("63950351-628f-4a19-a51f-376186d56411"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09216d1f-f8d9-4a87-a0b3-49224ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 }
                });

            migrationBuilder.InsertData(
                table: "Exercises",
                columns: new[] { "Id", "CreatedDate", "Name", "TrainingId", "UpdatedDate" },
                values: new object[,]
                {
                    { new Guid("437e855a-5daf-4114-8215-753bee4591f1"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Test name", new Guid("1e3f3264-f4ee-481a-bcb0-0aaa78a30d46"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) },
                    { new Guid("09416d1f-f8d9-4a87-a0b3-49254ade77b3"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Test name", new Guid("1e3f3264-f4ee-481a-bcb0-0aaa78a30d46"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) },
                    { new Guid("76dc09f3-3b13-4e6a-ba89-d8eefafc9899"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Test name", new Guid("c1370344-1e97-45ce-983d-6d56039d2869"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) },
                    { new Guid("77987c9d-090d-4403-b384-d202f2cd205e"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Test name", new Guid("c1370344-1e97-45ce-983d-6d56039d2869"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) }
                });

            migrationBuilder.InsertData(
                table: "ExerciseLoops",
                columns: new[] { "Id", "CreatedDate", "ExerciseId", "Repeats", "UpdatedDate", "Weight" },
                values: new object[,]
                {
                    { new Guid("9a2f60ea-a051-403a-854f-5ffa4029dc1d"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("437e855a-5daf-4114-8215-753bee4591f1"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("334ac162-6b25-40c7-a8e1-bdb682081077"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("437e855a-5daf-4114-8215-753bee4591f1"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("c0717ff7-85f8-44fb-8f75-b3f30046ada3"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("437e855a-5daf-4114-8215-753bee4591f1"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("6efc49ab-74cb-4b2c-84d4-8e18ca50787d"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("437e855a-5daf-4114-8215-753bee4591f1"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("f1d9cad4-ba78-43e9-8d86-5d6a7900c55a"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("437e855a-5daf-4114-8215-753bee4591f1"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("393daabc-47b3-4c8b-86e2-7a0c11140223"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("437e855a-5daf-4114-8215-753bee4591f1"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("74595bd4-55c2-4dad-9ba4-3d884f3514e6"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09416d1f-f8d9-4a87-a0b3-49254ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("5195eccd-abd0-49a0-a451-3fc5c367903e"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09416d1f-f8d9-4a87-a0b3-49254ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("62950351-628f-4a19-a51f-276186d56411"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("09416d1f-f8d9-4a87-a0b3-49254ade77b3"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("194df448-0cb2-4ca0-9023-ce5e65b235e8"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("76dc09f3-3b13-4e6a-ba89-d8eefafc9899"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("e5d07022-a17f-424a-b4e8-84c5dd32b76b"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("76dc09f3-3b13-4e6a-ba89-d8eefafc9899"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("d606b989-afa2-43d1-aebb-d17ce2834107"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("76dc09f3-3b13-4e6a-ba89-d8eefafc9899"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("09b2de47-2bfb-41d3-845b-48fecf06f8c7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("77987c9d-090d-4403-b384-d202f2cd205e"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("6a3be7ec-5e05-41d7-bdef-575abd3b9d76"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("77987c9d-090d-4403-b384-d202f2cd205e"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 },
                    { new Guid("10df8645-19fc-4ada-825c-7ad4b429c4ff"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("77987c9d-090d-4403-b384-d202f2cd205e"), 8, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 12 }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("09b2de47-2bfb-41d3-845b-48fecf06f8c7"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("10df8645-19fc-4ada-825c-7ad4b429c4ff"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("194df448-0cb2-4ca0-9023-ce5e65b235e8"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("334ac162-6b25-40c7-a8e1-bdb682081077"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("393daabc-47b3-4c8b-86e2-7a0c11140223"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("4eb17c7d-4e2f-45c9-9cff-e6fdd028e95a"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("5195eccd-abd0-49a0-a451-3fc5c367903e"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("523e640b-634c-4ec6-9308-7f77a36eb06b"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("5295eccd-abd0-49a0-a451-2fc5c367903e"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("5295eccd-abd0-49a0-a451-3fc5c367903e"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("62950351-628f-4a19-a51f-276186d56411"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("63950351-628f-4a19-a51f-276186d56411"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("63950351-628f-4a19-a51f-376186d56411"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("6a3be7ec-5e05-41d7-bdef-575abd3b9d76"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("6efc49ab-74cb-4b2c-84d4-8e18ca50787d"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("710d6b69-2031-40cb-b945-6324edb9ecf7"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("72595bd4-55c2-4dad-9ba4-1d884f3514e6"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("72595bd4-55c2-4dad-9ba4-3d884f3514e6"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("74595bd4-55c2-4dad-9ba4-3d884f3514e6"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("9a2f60ea-a051-403a-854f-5ffa4029dc1d"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("bc4f3d1b-f667-413a-ab8e-5afa752468ee"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("c0717ff7-85f8-44fb-8f75-b3f30046ada3"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("d606b989-afa2-43d1-aebb-d17ce2834107"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("dd2f825f-7cec-4c0a-a3f4-67fc217a609c"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("e5d07022-a17f-424a-b4e8-84c5dd32b76b"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("ee960fd4-ea2c-41a1-939d-4a2804fd584d"));

            migrationBuilder.DeleteData(
                table: "ExerciseLoops",
                keyColumn: "Id",
                keyValue: new Guid("f1d9cad4-ba78-43e9-8d86-5d6a7900c55a"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("09216d1f-f8d9-4a87-a0b3-49224ade77b3"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("09216d1f-f8d9-4a87-a0b3-49254ade77b3"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("09416d1f-f8d9-4a87-a0b3-49254ade77b3"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("437e855a-5daf-4114-8215-753bee4591f1"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("76dc09f3-3b13-4e6a-ba89-d8eefafc9899"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("77987c9d-090d-4403-b384-d202f2cd205e"));

            migrationBuilder.DeleteData(
                table: "Exercises",
                keyColumn: "Id",
                keyValue: new Guid("adfffa73-931e-4d9a-a8ff-2c81b5f14bc8"));

            migrationBuilder.DeleteData(
                table: "Trainings",
                keyColumn: "Id",
                keyValue: new Guid("1e3f3264-f4ee-481a-bcb0-0aaa78a30d46"));

            migrationBuilder.DeleteData(
                table: "Trainings",
                keyColumn: "Id",
                keyValue: new Guid("c1370344-1e97-45ce-983d-6d56039d2869"));

            migrationBuilder.InsertData(
                table: "Exercises",
                columns: new[] { "Id", "CreatedDate", "Name", "TrainingId", "UpdatedDate" },
                values: new object[] { new Guid("cb0c7136-3d85-4d5c-a4be-620b4d35f575"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Pull up", new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) });

            migrationBuilder.InsertData(
                table: "Exercises",
                columns: new[] { "Id", "CreatedDate", "Name", "TrainingId", "UpdatedDate" },
                values: new object[] { new Guid("063b89bd-d12a-489f-83d0-a4b86aa3afc0"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), "Press", new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)) });

            migrationBuilder.UpdateData(
                table: "Trainings",
                keyColumn: "Id",
                keyValue: new Guid("6e03b328-c3ae-41f8-a33e-9c56ed5964b7"),
                column: "CreatedDate",
                value: new DateTimeOffset(new DateTime(2019, 1, 1, 12, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)));

            migrationBuilder.InsertData(
                table: "ExerciseLoops",
                columns: new[] { "Id", "CreatedDate", "ExerciseId", "Repeats", "UpdatedDate", "Weight" },
                values: new object[] { new Guid("76f2ce65-3232-4e89-99db-20123eeeb7d0"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("cb0c7136-3d85-4d5c-a4be-620b4d35f575"), 12, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 0 });

            migrationBuilder.InsertData(
                table: "ExerciseLoops",
                columns: new[] { "Id", "CreatedDate", "ExerciseId", "Repeats", "UpdatedDate", "Weight" },
                values: new object[] { new Guid("6819675e-9e0a-4263-8c8f-bb42ef00f7d8"), new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), new Guid("063b89bd-d12a-489f-83d0-a4b86aa3afc0"), 12, new DateTimeOffset(new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified), new TimeSpan(0, 0, 0, 0, 0)), 0 });
        }
    }
}
