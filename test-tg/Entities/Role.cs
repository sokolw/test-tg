namespace test_tg.Entities;

public class Role
{
    public int Id { get; set; }
    public string RoleName { get; set; }
    public bool IsActive { get; set; }
    public int GroupId { get; set; }

    public Role(int id, string roleName, bool isActive, int groupId)
    {
        Id = id;
        RoleName = roleName;
        IsActive = isActive;
        GroupId = groupId;
    }
}