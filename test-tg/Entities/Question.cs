namespace test_tg.Entities;

public class Question
{
    public int Id { get; set; }
    public int SurveyId{ get; set; }
    public string QuestionText { get; set; }
    public int QuestionOrder { get; set; }
    public bool IsActive { get; set; }

    public Question(int id, int surveyId, string questionText, int questionOrder, bool isActive)
    {
        SurveyId = surveyId;
        QuestionText = questionText;
        QuestionOrder = questionOrder;
        IsActive = isActive;
    }
}