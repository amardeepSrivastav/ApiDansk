using System.ComponentModel.DataAnnotations;

namespace RecommendationEngine.Models
{
    public class SubOption
    {
        [Key]
        public int SubOptionId { get; set; }
        [Required]
        public string SubOptionText { get; set; }
        [Required]
        public int OptionId { get; set; }
    }
}