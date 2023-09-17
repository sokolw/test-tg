using Dapper;
using Microsoft.Data.SqlClient;
using test_tg.Entities;
using test_tg.Interfaces;

namespace test_tg.Repository;

public class BotMessageRepository: IBotMessageRepository
{
    private readonly IConfiguration _configuration;
    
    public BotMessageRepository(IConfiguration configuration)
    {
        this._configuration = configuration;
    }
    
    public async Task<BotMessage> GetByIdAsync(int id)
    {
        const string sql = "SELECT * FROM BotMessages WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QuerySingleOrDefaultAsync<BotMessage>(sql, new { Id = id });
            return result;
        }
    }
    
    public async Task<BotMessage> GetByBotCommandIdAsync(int botCommandId)
    {
        const string sql = "SELECT * FROM BotMessages WHERE BotCommandId = @BotCommandId";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QuerySingleOrDefaultAsync<BotMessage>(sql, new { BotCommandId = botCommandId });
            return result;
        }
    }

    public async Task<IReadOnlyList<BotMessage>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public async Task<int> AddAsync(BotMessage entity)
    {
        throw new NotImplementedException();
    }

    public async Task<int> UpdateAsync(BotMessage entity)
    {
        throw new NotImplementedException();
    }

    public async Task<int> DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }
}