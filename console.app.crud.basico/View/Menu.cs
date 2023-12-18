using console.app.crud.basico.Domain;

namespace console.app.crud.basico.View
{
    public class Menu
    {
        public enum MenuOpcoes
        {
            ListarTodosFuncionarios = 1,
            ListarFuncionariosEstado = 2,
            AtualizarInformacoesFuncionario = 3,
            Criar = 4,
            Excluir = 5
        };

        public static void ExibirMenu()
        {
            do
            {
                Console.WriteLine("Menu");
                Console.WriteLine("1 - Listar Todos os Funcionário");
                Console.WriteLine("2 - Listar Funcionários de um Estado");
                Console.WriteLine("3 - Atualizar Informações do Funcionário");
                Console.WriteLine("4 - Criar");
                Console.WriteLine("5 - Excluir");

                var opcaoEscolhida = (MenuOpcoes)Enum.Parse(typeof(MenuOpcoes), "2");

                Console.WriteLine($"A opção escolhida foi: {opcaoEscolhida}");

                switch (opcaoEscolhida)
                {
                    case MenuOpcoes.ListarTodosFuncionarios:

                        var domain = new FuncionarioDomain();
                        var funcionarios = domain.ListarTodosFuncionarios();

                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.WriteLine("*********************************");
                        Console.WriteLine("Lista de todos os funcionários");
                        Console.WriteLine("*********************************");

                        Console.ForegroundColor = ConsoleColor.Red;
                        foreach (var funcionario in funcionarios)
                        {
                            Console.WriteLine(
                                $"Fucionário: {funcionario.Id} - {funcionario.Nome}; " +
                                $"Endereço {funcionario.Endereco}; " +
                                $"Data de Cadastro: {funcionario.DataCriacao.ToString("dd/MM/yyyy hh:mm:ss")}");
                        }

                        break;

                    case MenuOpcoes.ListarFuncionariosEstado:

                        var idEstado = Guid.Parse("D39887B8-AD19-48B1-AB3A-341C6476A820");

                        var funcionarioDomain = new FuncionarioDomain();
                        var funcionariosEstado = funcionarioDomain.ObterFuncionariosDeUmEstado(idEstado);

                        Console.ForegroundColor = ConsoleColor.Green;
                        Console.WriteLine("**********************************************");
                        Console.WriteLine("Lista de todos os funcionários de um estado");
                        Console.WriteLine("**********************************************");

                        Console.ForegroundColor = ConsoleColor.Red;
                        foreach (var funcionario in funcionariosEstado)
                        {
                            Console.WriteLine(
                                $"Fucionário: {funcionario.Id} - {funcionario.NomeFuncionario} | " +
                                $"Endereço {funcionario.EnderecoFuncionario} | " +
                                $"Estado: {funcionario.Estado.Nome}");
                        }

                        break;

                    case MenuOpcoes.AtualizarInformacoesFuncionario:

                        break;

                    case MenuOpcoes.Criar:
                        break;

                    case MenuOpcoes.Excluir:
                        break;

                    default:
                        break;
                }
            } while (false);
        }

    }
}