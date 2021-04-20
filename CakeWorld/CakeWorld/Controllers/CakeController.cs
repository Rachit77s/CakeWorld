using CakeWorld.Repository.Interfaces;
using CakeWorld.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.Controllers
{
    public class CakeController : Controller
    {
        private readonly ICakeRepository _cakeRepository;
        private readonly ICategoryRepository _categoryRepository;

        public CakeController(ICakeRepository cakeRepository, ICategoryRepository categoryRepository)
        {
            _cakeRepository = cakeRepository;
            _categoryRepository = categoryRepository;
        }

        // GET: /<controller>/
        public IActionResult List()
        {
            ViewBag.CurrentCategory = "Cheese cakes";

            //return View(_cakeRepository.AllCakes);
            CakesListViewModel cakesListViewModel = new CakesListViewModel();
            cakesListViewModel.Cakes = _cakeRepository.AllCakes;
            cakesListViewModel.CurrentCategory = "Cheese cakes";

            return View(cakesListViewModel);
        }

        public IActionResult Details(int id)
        {
            var pie = _cakeRepository.GetCakeById(id);
            if (pie == null)
                return NotFound();

            return View(pie);
        }
    }
}
