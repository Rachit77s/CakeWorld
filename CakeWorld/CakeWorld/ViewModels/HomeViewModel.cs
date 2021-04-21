using CakeWorld.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.ViewModels
{
    public class HomeViewModel
    {
        public IEnumerable<Cake> CakesOfTheWeek { get; set; }
    }
}
