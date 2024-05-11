using BusinessObject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Project_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        PizzaLabContext context = new PizzaLabContext();
        [HttpGet]
        public IActionResult getAllUser()
        {

            return Ok();

        }

    }
}
