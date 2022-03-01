using System.Collections.Generic;
using RecommendationEngine.Models;

namespace RecommendationEngine.DTO
{
    public class ReadQuestionsDTO
    {
        public int QuestionId { get; set; }
        public string QuestionText { get; set; }
        public List<Option> Options{get;set;}
    }
}