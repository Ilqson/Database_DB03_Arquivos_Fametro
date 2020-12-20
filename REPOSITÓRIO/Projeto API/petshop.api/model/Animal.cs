using System;

namespace petshop.api.model
{
    public class Animal
    {
        
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string Nome { get; set; }
        public string Idade { get; set; }
        public string Cor { get; set; }

    }
}