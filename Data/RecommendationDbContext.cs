using Microsoft.EntityFrameworkCore;
using RecommendationEngine.Models;

namespace RecommendationEngine.Data
{
    public class RecommendationDbContext: DbContext
    {
        public RecommendationDbContext(DbContextOptions<RecommendationDbContext> opt):base(opt)
        {

        }
        
        public DbSet<Question> Questions { get; set; }
        public DbSet<Option> Options { get; set; }

        public DbSet<SubOption> SubOptions{get;set;}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            
            modelBuilder.Entity<Question>().HasData(
                new Question
                {
                    QuestionId = 1,
                    QuestionText = "What can we help you with?",                    
                }
            );

            modelBuilder.Entity<Option>().HasData(
                        new Option
                        {
                            OptionId = 1,
                            OptionName = "Mutual Fund Investments",
                            QuestionId = 1
                        },
                        new Option { OptionId = 2, OptionName = "Payments", QuestionId = 1},
                        new Option { OptionId = 3, OptionName = "Portfolio", QuestionId = 1},
                        new Option { OptionId = 4, OptionName = "Link Bank Account", QuestionId = 1},
                        new Option { OptionId = 5, OptionName = "KYC", QuestionId = 1},
                        new Option { OptionId = 6, OptionName = "Investment Readiness", QuestionId = 1},
                        new Option { OptionId = 7, OptionName = "Investment Options", QuestionId = 1},
                        new Option { OptionId = 8, OptionName = "Account Statements", QuestionId = 1},
                        new Option { OptionId = 9, OptionName = "User Profile", QuestionId = 1},
                        new Option { OptionId = 10, OptionName = "Privacy & Security", QuestionId = 1}
                    );
            
            modelBuilder.Entity<SubOption>().HasData(
                                            new SubOption { SubOptionId = 1, OptionId = 1, SubOptionText = "Investment/Buy" },
                                            new SubOption { SubOptionId = 2, OptionId = 1, SubOptionText = "Sell/Withdraw" },
                                            new SubOption { SubOptionId = 3, OptionId = 1, SubOptionText = "In-Progress Transactions" },
                                            new SubOption { SubOptionId = 4, OptionId = 1, SubOptionText = "Failed Transactions" }
                                        );
            
        }
    }
}