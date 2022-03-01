using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using RecommendationEngine.DTO;
using RecommendationEngine.Models;


namespace RecommendationEngine.Data
{
    public class QuestionRepository : IQuestionRepository
    {
        private readonly RecommendationDbContext _context;

        public QuestionRepository(RecommendationDbContext context)
        {
            _context = context;
        }
        public IEnumerable<Question> GetAllQuestions()
        {
            //var options = _context.Options.ToList();
           return _context.Questions
            .Include(x=>x.Options)
            .ToList();
                             
               
        }

        public int[] GetAnswers(int[] qIDs)
        {
            return  null;
        }

        public IEnumerable<SubOption> GetSubQuestions(int optionSelected)
        {
           return _context.SubOptions.Where(x=>x.OptionId == optionSelected).ToList();
        }
    }
}