namespace test_tg.Entities;

public class TelegramUser
{
    public int Id { get; set; }
    public string Username { get; set; }
    public string? FirstName { get; set; }
    public string? LastName { get; set; }
    public bool IsActive { get; set; }
    public int GroupId { get; set; }
    public int TelegramBotUserId { get; set; }
    public int ChatId { get; set; }

    public TelegramUser()
    {
        
    }

    public TelegramUser(int id, string username, string firstName, string lastName, bool isActive, int groupId, int telegramBotUserId, int chatId)
    {
        Id = id;
        Username = username;
        FirstName = firstName;
        LastName = lastName;
        IsActive = isActive;
        GroupId = groupId;
        TelegramBotUserId = telegramBotUserId;
        ChatId = chatId;
    }
}