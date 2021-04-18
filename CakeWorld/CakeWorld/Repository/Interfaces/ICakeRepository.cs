using CakeWorld.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.Repository.Interfaces
{
    public interface ICakeRepository
    {
        IEnumerable<Cake> AllCakes { get; }
        IEnumerable<Cake> CakesOfTheWeek { get; }
        Cake GetCakeById(int cakeId);
    }
}
