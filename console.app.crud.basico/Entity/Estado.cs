using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace console.app.crud.basico.Entity
{
    public class Estado :  Entidade
    {
        public string? Nome { get; set; }

        public DateTime DataCriacao { get; set; }
    }
}
