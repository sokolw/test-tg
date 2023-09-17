namespace test_tg.Entities;

public class Survey
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public bool IsActive { get; set; }

    public Survey(int id, string title, string description, bool isActive)
    {
        Id = id;
        Title = title;
        Description = description;
        IsActive = isActive;
    }

    public override string ToString()
    {
        return Newtonsoft.Json.JsonConvert.SerializeObject(this);
    }
}