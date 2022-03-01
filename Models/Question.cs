using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RecommendationEngine.Models
{
    public class Question
    {
        [Key]
        public int QuestionId { get; set; }
        [Required]
        public string QuestionText { get; set; }
        public List<Option> Options { get; set; }
    }
}