namespace test_tg.Entities;

public class BotMessage
{
    public int Id { get; set; }
    public string MessageText { get; set; }
    public int BotCommandId { get; set; }
    public bool IsActive { get; set; }

    public BotMessage(int id, string messageText, int botCommandId, bool isActive)
    {
        Id = id;
        MessageText = messageText;
        BotCommandId = botCommandId;
        IsActive = isActive;
    }
}