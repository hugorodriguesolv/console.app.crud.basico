using console.app.crud.basico.Entity;

namespace console.app.crud.basico.Interfaces
{
    public interface IFuncionarioRespository
    {
        IList<Funcionario> ObterTodosFuncionarios();

        IList<FuncionarioEstado> ObterFuncionariosEstado(Guid idEstado);
    }
}