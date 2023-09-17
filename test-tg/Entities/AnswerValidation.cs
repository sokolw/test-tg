namespace test_tg.Entities;

public class AnswerValidation
{
    public int Id { get; set; }
    public int QuestionId { get; set; }
    public int CorrectAnswerId { get; set; }
    public bool IsActive { get; set; }

    public AnswerValidation(int id, int questionId, int correctAnswerId, bool isActive)
    {
        Id = id;
        QuestionId = questionId;
        CorrectAnswerId = correctAnswerId;
        IsActive = isActive;
    }
}