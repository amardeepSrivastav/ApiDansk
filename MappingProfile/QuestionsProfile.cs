using AutoMapper;
using RecommendationEngine.DTO;
using RecommendationEngine.Models;

namespace RecommendationEngine.MappingProfile
{
    public class QuestionsProfile:Profile
    {
        public QuestionsProfile()
        {
            CreateMap<Question,ReadQuestionsDTO>();
        }
    }
    
}