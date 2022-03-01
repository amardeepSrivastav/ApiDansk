using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using AutoMapper;
using Microsoft.Extensions.Logging;
using RecommendationEngine.Data;
using RecommendationEngine.DTO;
using RecommendationEngine.Models;

namespace RecommendationEngine.Controllers
{
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly IQuestionRepository _questionRepository;
        private readonly IMapper _mapper;
        private readonly ILogger<QuestionController> _logger;

        public QuestionController(IQuestionRepository questionRepository,IMapper mapper, ILogger<QuestionController> logger)
        {
            _questionRepository = questionRepository;
            _mapper = mapper;
            _logger = logger;
        }
        [Route("api/questions")]
        [HttpGet]
        public ActionResult<IEnumerable<ReadQuestionsDTO>> GetAllQuestions()
        {
            var questions = _questionRepository.GetAllQuestions();
            return Ok(_mapper.Map<IEnumerable<ReadQuestionsDTO>>(questions));
        }

        [HttpGet]
        [Route("api/subQuestions")]
        public ActionResult<IEnumerable<SubOption>> GetSubQuestionByCategory(int selectedCategory)
        {
            return  Ok(_questionRepository.GetSubQuestions(selectedCategory));
        }

        [HttpPost]
        [Route("api/answers")]
        public ActionResult GetAnswers(int[] qIDs) {
             try{
                 var answers = _questionRepository.GetAnswers(qIDs);
            return Ok(answers);
            }
            catch(Exception ex)
            {
                _logger.LogError(ex.Message);
            }
            return null;
        }
    }
}