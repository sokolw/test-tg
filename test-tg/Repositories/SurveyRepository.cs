using Dapper;
using Microsoft.Data.SqlClient;
using test_tg.Entities;
using test_tg.Interfaces;

namespace test_tg.Repository;

public class SurveyRepository: ISurveyRepository
{
    private readonly IConfiguration _configuration;
    
    public SurveyRepository(IConfiguration configuration)
    {
        this._configuration = configuration;
    }
    
    public async Task<Survey> GetByIdAsync(int id)
    {
        const string sql = "SELECT * FROM Surveys WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QuerySingleOrDefaultAsync<Survey>(sql, new { Id = id });
            return result;
        }
    }

    public async Task<IReadOnlyList<Survey>> GetAllAsync()
    {
        const string sql = "SELECT * FROM Surveys";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QueryAsync<Survey>(sql);
            return result.ToList();
        }
    }

    public async Task<int> AddAsync(Survey entity)
    {
        const string sql = "INSERT INTO Surveys (Title, Description, IsActive) VALUES (@Title, @Description, @IsActive)";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.ExecuteAsync(sql, entity);
            return result;
        }
    }

    public async Task<int> UpdateAsync(Survey entity)
    {
        const string sql = "UPDATE Surveys SET Title = @Title, Description = @Description, IsActive = @IsActive WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.ExecuteAsync(sql, entity);
            return result;
        }
    }

    public async Task<int> DeleteAsync(int id)
    {
        const string sql = "DELETE FROM Surveys WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.ExecuteAsync(sql, new { Id = id });
            return result;
        }
    }
}