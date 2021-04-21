using CakeWorld.Repository.Interfaces;
using CakeWorld.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.Controllers
{
    public class HomeController : Controller
    {
        private readonly ICakeRepository _cakeRepository;

        public HomeController(ICakeRepository CakeRepository)
        {
            _cakeRepository = CakeRepository;
        }

        public IActionResult Index()
        {
            var homeViewModel = new HomeViewModel
            {
                CakesOfTheWeek = _cakeRepository.CakesOfTheWeek
            };

            return View(homeViewModel);
        }
    }
}
