using console.app.crud.basico.Entity;
using console.app.crud.basico.Interfaces;
using Microsoft.Data.SqlClient;
using System.Text;

namespace console.app.crud.basico.Repository
{
    public class FuncionarioRespository : IFuncionarioRespository
    {
        private SqlConnection _sqlConnection;
        private SqlCommand _sqlCommand;

        public FuncionarioRespository()
        {
            _sqlConnection = new SqlConnection("Data Source=sql-server, 1433;Initial Catalog=Dojo;Integrated Security=False;User ID=sa;Password=DojoS665;TrustServerCertificate=true");
            _sqlConnection.Open();
        }

        public IList<FuncionarioEstado> ObterFuncionariosEstado(Guid idEstado)
        {
            var idEstadoTexto = idEstado.ToString();

            var sql = new StringBuilder();
            sql.Append("SELECT ");
            sql.Append("    FUN.Id AS IdFuncionario,");
            sql.Append("    FUN.Nome AS NomeFuncionario,");
            sql.Append("    FUN.Endereco AS EnderecoCliente,");
            sql.Append("    EST.Id AS IdEstado,");
            sql.Append("    EST.Nome AS NomeEstado,");
            sql.Append("    EST.DataCriacao AS DataCriacaoEstado");
            sql.Append(" FROM ");
            sql.Append("    Funcionario AS FUN");
            sql.Append("    INNER JOIN Ambiente AS AMB ON(FUN.IdAmbiente = AMB.Id)");
            sql.Append("    INNER JOIN Cidade AS CID ON(AMB.IdCidade = CID.Id)");
            sql.Append("    INNER JOIN Estado AS EST ON(CID.IdEstado = EST.Id)");
            sql.Append(" WHERE ");
            sql.Append($"    EST.Id = '{idEstadoTexto}'");

            _sqlCommand = new SqlCommand(sql.ToString(), _sqlConnection);
            var reader = _sqlCommand.ExecuteReader();

            var funcionarios = new List<FuncionarioEstado>();

            while (reader.Read())
            {
                funcionarios.Add(new FuncionarioEstado()
                {
                    Id = (Guid)reader["IdFuncionario"],
                    NomeFuncionario = reader["NomeFuncionario"].ToString(),
                    EnderecoFuncionario = reader["EnderecoCliente"].ToString(),
                    Estado = new Estado()
                    {
                        Id = (Guid)reader["IdEstado"],
                        Nome = reader["NomeEstado"].ToString(),
                        DataCriacao = (DateTime)reader["DataCriacaoEstado"]
                    }
                });
            }

            return funcionarios;
        }

        public IList<Funcionario> ObterTodosFuncionarios()
        {
            var sql = "SELECT Id, Nome, Endereco, DataCriacao FROM Funcionario";

            _sqlCommand = new SqlCommand(sql, _sqlConnection);
            var reader = _sqlCommand.ExecuteReader();

            var funcionarios = new List<Funcionario>();

            while (reader.Read())
            {
                funcionarios.Add(new Funcionario()
                {
                    Id = (Guid)reader["Id"],
                    Nome = reader["Nome"].ToString(),
                    Endereco = reader["Endereco"].ToString(),
                    DataCriacao = (DateTime)reader["DataCriacao"]
                });
            }

            return funcionarios;
        }
    }
}