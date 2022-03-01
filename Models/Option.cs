using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RecommendationEngine.Models
{
    public class Option
    {
        [Key]
        public int OptionId { get; set; }
        [Required]
        public string OptionName { get; set; }
        [Required]
        public int QuestionId { get; set; }
        public virtual List<SubOption> SubOptions { get; set; }
    }
}