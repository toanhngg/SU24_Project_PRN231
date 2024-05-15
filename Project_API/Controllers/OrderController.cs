using BusinessObject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Project_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        PizzaLabContext context = new PizzaLabContext();
        [HttpPost]
        public IActionResult createOrder([FromBody] Order or)
        {
            try
            {
                Order order = new Order()
                {
                    OrderDate = DateTime.Now,
                    UserId = 1,
                    Status = or.Status,
                    RequiredDate = or.RequiredDate,
                    ShippedDate = or.ShippedDate,
                    Freight = or.Freight,
                    ShipAddress = or.ShipAddress,
                    IsCart = or.IsCart,
                };
                context.Orders.Add(order);
                context.SaveChanges();
                return Ok();

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
          
        }
    }
}
