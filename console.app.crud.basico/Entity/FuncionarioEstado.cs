namespace console.app.crud.basico.Entity
{
    public class FuncionarioEstado : Entidade
    {
        public string? NomeFuncionario { get; set; }

        public string? EnderecoFuncionario { get; set; }

        public Estado Estado { get; set; } = new Estado();
    }
}