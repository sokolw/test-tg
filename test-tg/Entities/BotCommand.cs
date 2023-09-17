namespace test_tg.Entities;

public class BotCommand
{
    public int Id { get; set; }
    public string CommandName { get; set; }
    public bool IsActive { get; set; }
    public int GroupId { get; set; }
    public int RoleId { get; set; }
    public string Description { get; set; }

    public BotCommand(int id, string commandName, bool isActive, int groupId, int roleId, string description)
    {
        Id = id;
        CommandName = commandName;
        IsActive = isActive;
        GroupId = groupId;
        RoleId = roleId;
        Description = description;
    }
}