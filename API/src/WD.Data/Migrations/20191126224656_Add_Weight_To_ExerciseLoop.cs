using Microsoft.EntityFrameworkCore.Migrations;

namespace WD.Data.Migrations
{
    public partial class Add_Weight_To_ExerciseLoop : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Weight",
                table: "ExerciseLoops",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Weight",
                table: "ExerciseLoops");
        }
    }
}
