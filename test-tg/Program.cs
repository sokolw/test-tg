using test_tg;

var configurationBuilder = new ConfigurationBuilder();
configurationBuilder.AddJsonFile("appsettings.json").AddEnvironmentVariables();
var configuration = configurationBuilder.Build();

var tgBot = new TelegramBot(configuration);
tgBot.Run();

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.Run();

