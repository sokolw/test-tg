using Dapper;
using Microsoft.Data.SqlClient;
using test_tg.Entities;
using test_tg.Interfaces;

namespace test_tg.Repository;

public class TelegramUserRepository: ITelegramUserRepository
{
    private readonly IConfiguration _configuration;
    
    public TelegramUserRepository(IConfiguration configuration)
    {
        this._configuration = configuration;
    }

    public async Task<TelegramUser> GetByIdAsync(int id)
    {
        throw new NotImplementedException();
    }
    
    public async Task<TelegramUser> GetByTelegramUserIdAsync(int telegramUserId)
    {
        const string sql = "SELECT * FROM TelegramUsers WHERE TelegramUserId = @TelegramUserId";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.QuerySingleOrDefaultAsync<TelegramUser>(sql, new { TelegramUserId = telegramUserId });
            return result;
        }
    }

    public async Task<IReadOnlyList<TelegramUser>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public async Task<int> AddAsync(TelegramUser entity)
    {
        const string sql = "INSERT INTO TelegramUsers (Username, FirstName, LastName, IsActive, GroupId, TelegramUserId, ChatId) " +
                           "VALUES (@Username, @FirstName, @LastName, @IsActive, @GroupId, @TelegramUserId, @ChatId)";
        using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
        {
            connection.Open();
            var result = await connection.ExecuteAsync(sql, entity);
            return result;
        }
    }

    public async Task<int> UpdateAsync(TelegramUser entity)
    {
        throw new NotImplementedException();
    }

    public async Task<int> DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }
}