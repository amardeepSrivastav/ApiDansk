using Microsoft.EntityFrameworkCore.Migrations;

namespace RecommendationEngine.Migrations
{
    public partial class Initial_Migrations : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Questions",
                columns: table => new
                {
                    QuestionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    QuestionText = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Questions", x => x.QuestionId);
                });

            migrationBuilder.CreateTable(
                name: "Options",
                columns: table => new
                {
                    OptionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    OptionName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    QuestionId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Options", x => x.OptionId);
                    table.ForeignKey(
                        name: "FK_Options_Questions_QuestionId",
                        column: x => x.QuestionId,
                        principalTable: "Questions",
                        principalColumn: "QuestionId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SubOptions",
                columns: table => new
                {
                    SubOptionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SubOptionText = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OptionId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubOptions", x => x.SubOptionId);
                    table.ForeignKey(
                        name: "FK_SubOptions_Options_OptionId",
                        column: x => x.OptionId,
                        principalTable: "Options",
                        principalColumn: "OptionId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Questions",
                columns: new[] { "QuestionId", "QuestionText" },
                values: new object[] { 1, "What can we help you with?" });

            migrationBuilder.InsertData(
                table: "Options",
                columns: new[] { "OptionId", "OptionName", "QuestionId" },
                values: new object[,]
                {
                    { 1, "Mutual Fund Investments", 1 },
                    { 2, "Payments", 1 },
                    { 3, "Portfolio", 1 },
                    { 4, "Link Bank Account", 1 },
                    { 5, "KYC", 1 },
                    { 6, "Investment Readiness", 1 },
                    { 7, "Investment Options", 1 },
                    { 8, "Account Statements", 1 },
                    { 9, "User Profile", 1 },
                    { 10, "Privacy & Security", 1 }
                });

            migrationBuilder.InsertData(
                table: "SubOptions",
                columns: new[] { "SubOptionId", "OptionId", "SubOptionText" },
                values: new object[,]
                {
                    { 1, 1, "Investment/Buy" },
                    { 2, 1, "Sell/Withdraw" },
                    { 3, 1, "In-Progress Transactions" },
                    { 4, 1, "Failed Transactions" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Options_QuestionId",
                table: "Options",
                column: "QuestionId");

            migrationBuilder.CreateIndex(
                name: "IX_SubOptions_OptionId",
                table: "SubOptions",
                column: "OptionId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SubOptions");

            migrationBuilder.DropTable(
                name: "Options");

            migrationBuilder.DropTable(
                name: "Questions");
        }
    }
}
