using CakeWorld.Repository.Interfaces;
using CakeWorld.Repository.Services;
using CakeWorld.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly ICakeRepository _cakeRepository;
        private readonly ShoppingCartService _shoppingCart;

        public ShoppingCartController(ICakeRepository cakeRepository, ShoppingCartService shoppingCart)
        {
            _cakeRepository = cakeRepository;
            _shoppingCart = shoppingCart;
        }

        public ViewResult Index()
        {
            var items = _shoppingCart.GetShoppingCartItems();
            _shoppingCart.ShoppingCartItems = items;

            var shoppingCartViewModel = new ShoppingCartViewModel
            {
                ShoppingCart = _shoppingCart,
                ShoppingCartTotal = _shoppingCart.GetShoppingCartTotal()
            };

            return View(shoppingCartViewModel);
        }

        public RedirectToActionResult AddToShoppingCart(int cakeId)
        {
            var selectedCake = _cakeRepository.AllCakes.FirstOrDefault(p => p.CakeId == cakeId);

            if (selectedCake != null)
            {
                _shoppingCart.AddToCart(selectedCake, 1);
            }
            return RedirectToAction("Index");
        }

        public RedirectToActionResult RemoveFromShoppingCart(int cakeId)
        {
            var selectedCake = _cakeRepository.AllCakes.FirstOrDefault(p => p.CakeId == cakeId);

            if (selectedCake != null)
            {
                _shoppingCart.RemoveFromCart(selectedCake);
            }
            return RedirectToAction("Index");
        }
    }
}
