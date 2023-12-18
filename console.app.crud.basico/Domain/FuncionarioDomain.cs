using console.app.crud.basico.Entity;
using console.app.crud.basico.Interfaces;
using console.app.crud.basico.Repository;

namespace console.app.crud.basico.Domain
{
    public class FuncionarioDomain : IFuncionarioDomain
    {
        public IList<Funcionario> ListarTodosFuncionarios()
        {
            var repository = new FuncionarioRespository();
            var todosFuncionarios = repository.ObterTodosFuncionarios();

            return todosFuncionarios;
        }

        public IList<FuncionarioEstado> ObterFuncionariosDeUmEstado(Guid idEstado)
        {
            var repository = new FuncionarioRespository();
            var funcionariosEstado = repository.ObterFuncionariosEstado(idEstado);

            return funcionariosEstado;
        }
    }
}