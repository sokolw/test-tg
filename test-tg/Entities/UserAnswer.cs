namespace test_tg.Entities;

public class UserAnswer
{
    public int Id { get; set; }
    public int TelegramUserId { get; set; }
    public int QuestionId { get; set; }
    public int AnswerId { get; set; }

    public UserAnswer(int id, int telegramUserId, int questionId, int answerId)
    {
        Id = id;
        TelegramUserId = telegramUserId;
        QuestionId = questionId;
        AnswerId = answerId;
    }
}