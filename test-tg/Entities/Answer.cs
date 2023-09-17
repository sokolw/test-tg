namespace test_tg.Entities;

public class Answer
{
    public int Id { get; set; }
    public string AnswerText { get; set; }
    public bool IsActive { get; set; }

    public Answer(int id, string answerText, bool isActive)
    {
        Id = id;
        AnswerText = answerText;
        IsActive = isActive;
    }
}