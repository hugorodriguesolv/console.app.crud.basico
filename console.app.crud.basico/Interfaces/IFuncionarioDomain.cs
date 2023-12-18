using console.app.crud.basico.Entity;

namespace console.app.crud.basico.Interfaces
{
    public interface IFuncionarioDomain
    {
        IList<Funcionario> ListarTodosFuncionarios();

        IList<FuncionarioEstado> ObterFuncionariosDeUmEstado(Guid idEstado);
    }
}