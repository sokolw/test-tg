using Dapper;
using Microsoft.Data.SqlClient;
using test_tg.Entities;
using test_tg.Interfaces;

namespace test_tg.Repository;

public class BotCommandRepository: IBotCommandRepository
{
    private readonly IConfiguration _configuration;
    
    public BotCommandRepository(IConfiguration configuration)
    {
        this._configuration = configuration;
    }
    
    public async Task<BotCommand> GetByIdAsync(int id)
    {
        const string sql = "SELECT * FROM BotCommands WHERE Id = @Id";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QuerySingleOrDefaultAsync<BotCommand>(sql, new { Id = id });
            return result;
        }
    }

    public async Task<IReadOnlyList<BotCommand>> GetAllAsync()
    {
        const string sql = "SELECT * FROM BotCommands";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QueryAsync<BotCommand>(sql);
            return result.ToList();
        }
    }
    
    public async Task<BotCommand?> GetByCommandAsync(string commandName)
    {
        const string sql = "SELECT * FROM BotCommands WHERE CommandName = @CommandName";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QuerySingleOrDefaultAsync<BotCommand>(sql, new { CommandName = commandName });
            return result;
        }
    }

    public async Task<int> AddAsync(BotCommand entity)
    {
        throw new NotImplementedException();
    }

    public async Task<int> UpdateAsync(BotCommand entity)
    {
        throw new NotImplementedException();
    }

    public async Task<int> DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }
}