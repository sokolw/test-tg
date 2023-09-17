namespace test_tg.Entities;

public class UserSessionState
{
    public int Id { get; set; }
    public int SurveyId { get; set; }
    public int QuestionId { get; set; }
    public int CurrentQuestionId { get; set; }
    public int TotalAnswered { get; set; }
    public int TotalCorrectAnswers { get; set; }
    public int TelegramUserId { get; set; }

    public UserSessionState(int id, int surveyId, int questionId, int currentQuestionId, int totalAnswered, int totalCorrectAnswers, int telegramUserId)
    {
        Id = id;
        SurveyId = surveyId;
        QuestionId = questionId;
        CurrentQuestionId = currentQuestionId;
        TotalAnswered = totalAnswered;
        TotalCorrectAnswers = totalCorrectAnswers;
        TelegramUserId = telegramUserId;
    }
}