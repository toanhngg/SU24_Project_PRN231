using BusinessObject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Project_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        PizzaLabContext context = new PizzaLabContext();
        [HttpGet]
        public IActionResult getCategory()
        {
            var category = context.Categories.ToList();
            return Ok(category);
        }

    }
}
