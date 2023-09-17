using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using Telegram.Bot;
using Telegram.Bot.Types;
using Telegram.Bot.Types.ReplyMarkups;
using test_tg.Entities;
using test_tg.Repository;


namespace test_tg;

public class TelegramBot
{
    private TelegramBotClient BotClient { get; set; }
    private readonly IConfiguration _configuration;
    private readonly BotCommandRepository _botCommandRepository;
    private readonly BotMessageRepository _botMessageRepository;
    private readonly TelegramUserRepository _telegramUserRepository;

    public TelegramBot(IConfiguration configuration)
    {
        this._configuration = configuration;
        this.BotClient = new TelegramBotClient(this._configuration.GetSection("Secrets")["TelegramBotToken"]!);
        this._botCommandRepository = new BotCommandRepository(this._configuration);
        this._botMessageRepository = new BotMessageRepository(this._configuration);
        this._telegramUserRepository = new TelegramUserRepository(this._configuration);
    }

    public async void Run()
    {
        SurveyRepository surveyRepository = new SurveyRepository(this._configuration);
        QuestionRepository questionRepository = new QuestionRepository(this._configuration);

        var botCommands = (await this._botCommandRepository.GetAllAsync()).Select(item =>
        {
            return new Telegram.Bot.Types.BotCommand() { Command = item.CommandName, Description = item.Description };
        }).ToArray();

        await this.BotClient.SetMyCommandsAsync(botCommands);
        this.BotClient.StartReceiving(Update, Error);
    }

    private async Task Update(ITelegramBotClient botClient, Update update, CancellationToken token)
    {
        Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(update));

        if (update.Type == Telegram.Bot.Types.Enums.UpdateType.Message)
        {
            var message = update.Message;
            
            if (message.Text != null && message.Text.ToLower().Contains("/start"))
            {
                var botCommand = await this._botCommandRepository.GetByCommandAsync(message.Text.ToLower());
                if (botCommand != null)
                {
                    if (await this._telegramUserRepository.GetByTelegramUserIdAsync((int)message.From.Id) == null)
                    {
                        await this._telegramUserRepository.AddAsync(new TelegramUser()
                        {
                            Id = default,
                            GroupId = 1,
                            IsActive = true,
                            Username = message.From.Username!,
                            FirstName = message.From.FirstName!,
                            LastName = message.From.LastName,
                            TelegramBotUserId = (int)message.From.Id,
                            ChatId = (int)message.Chat.Id
                        });
                    }
                    
                    var botMessage = await this._botMessageRepository.GetByBotCommandIdAsync(botCommand.Id);
                    await botClient.SendTextMessageAsync(message.Chat.Id, botMessage.MessageText);
                    return;
                }
            }

            if (message.Text != null && message.Text.ToLower().Contains("/test"))
            {
                Console.WriteLine("test");
                await botClient.SendTextMessageAsync(message.Chat.Id, "test");
            }

            if (message.Text != null && message.Text.ToLower().Contains("/createform"))
            {
                await botClient.SendTextMessageAsync(message.Chat.Id, "Начинаем создавать анкету");
            }
        }
    }

    private Task Error(ITelegramBotClient botClient, Exception exception, CancellationToken token)
    {
        Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(exception));
        return Task.CompletedTask;
    }
}