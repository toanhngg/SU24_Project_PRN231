using Microsoft.AspNetCore.Mvc;

namespace Project_API.Controllers
{
	public class TestController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
