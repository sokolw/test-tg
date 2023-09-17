using Dapper;
using Microsoft.Data.SqlClient;
using test_tg.Entities;
using test_tg.Interfaces;

namespace test_tg.Repository;

public class QuestionRepository: IQuestionRepository
{
    private readonly IConfiguration _configuration;
    
    public QuestionRepository(IConfiguration configuration)
    {
        this._configuration = configuration;
    }

    public async Task<Question> GetByIdAsync(int id)
    {
        const string sql = "SELECT * FROM Questions WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QuerySingleOrDefaultAsync<Question>(sql, new { Id = id });
            return result;
        }
    }

    public async Task<IReadOnlyList<Question>> GetAllAsync()
    {
        const string sql = "SELECT * FROM Questions";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QueryAsync<Question>(sql);
            return result.ToList();
        }
    }

    public async Task<int> AddAsync(Question entity)
    {
        const string sql = "INSERT INTO Questions (SurveyId, QuestionText, QuestionOrder, IsActive) VALUES (@SurveyId, @QuestionText, @QuestionOrder, @IsActive)";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.ExecuteAsync(sql, entity);
            return result;
        }
    }

    public async Task<int> UpdateAsync(Question entity)
    {
        
        const string sql = "UPDATE Questions SET SurveyId = @SurveyId, QuestionText = @QuestionText, QuestionOrder = @QuestionOrder, IsActive = @IsActive WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.ExecuteAsync(sql, entity);
            return result;
        }
    }

    public async Task<int> DeleteAsync(int id)
    {
        const string sql = "DELETE FROM Questions WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.ExecuteAsync(sql, new { Id = id });
            return result;
        }
    }
}