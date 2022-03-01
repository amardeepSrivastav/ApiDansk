using System.Collections.Generic;
using RecommendationEngine.DTO;
using RecommendationEngine.Models;

namespace RecommendationEngine.Data
{
    public interface IQuestionRepository
    {
        IEnumerable<Question> GetAllQuestions();

        IEnumerable<SubOption> GetSubQuestions(int selectedCategory);
        int[] GetAnswers(int[] qIDs);
    }
}