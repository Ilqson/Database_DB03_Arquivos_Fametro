using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using petshop.api.model;
using petshop.api.services;

namespace petshop.api.Controllers
{
    [Route("api[controller]")]
    [ApiController]
    public class AnimalController : Controller
    {
        public readonly MongoDbService _mongoDbService;

        public AnimalController(){
            _mongoDbService = new MongoDbService("AnimalDatabase", "Animal", "mongodb://localhost:27017");
        }

        [HttpPost]
        public async Task Cadastrar([FromBody] Animal animal){
            await _mongoDbService.Insere(animal);
        }
    }

}