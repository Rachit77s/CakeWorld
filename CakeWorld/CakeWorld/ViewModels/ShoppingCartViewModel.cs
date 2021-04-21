using CakeWorld.Repository.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.ViewModels
{
    public class ShoppingCartViewModel
    {
        public ShoppingCartService ShoppingCart { get; set; }
        public decimal ShoppingCartTotal { get; set; }
    }
}
