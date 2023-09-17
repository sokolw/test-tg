namespace test_tg.Entities;

public class BotErrorMessage
{
    public int Id { get; set; }
    public string ErrorMessageText { get; set; }
    public int BotCommandId { get; set; }
    public bool IsActive { get; set; }

    public BotErrorMessage(int id, string errorMessageText, int botCommandId, bool isActive)
    {
        Id = id;
        ErrorMessageText = errorMessageText;
        BotCommandId = botCommandId;
        IsActive = isActive;
    }
}