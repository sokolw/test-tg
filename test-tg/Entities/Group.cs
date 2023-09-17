namespace test_tg.Entities;

public class Group
{
    public int Id { get; set; }
    public string GroupName { get; set; }
    public bool IsActive { get; set; }

    public Group(int id, string groupName, bool isActive)
    {
        Id = id;
        GroupName = groupName;
        IsActive = isActive;
    }
}