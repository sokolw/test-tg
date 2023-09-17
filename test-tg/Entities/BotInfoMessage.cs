namespace test_tg.Entities;

public class BotInfoMessage
{
    public int Id { get; set; }
    public string MessageText { get; set; }
    public int SurveyId { get; set; }
    public bool IsActive { get; set; }

    public BotInfoMessage(int id, string messageText, int surveyId, bool isActive)
    {
        Id = id;
        MessageText = messageText;
        SurveyId = surveyId;
        IsActive = isActive;
    }
}