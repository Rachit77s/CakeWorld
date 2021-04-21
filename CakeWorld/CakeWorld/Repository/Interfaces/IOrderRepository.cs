using CakeWorld.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.Repository.Interfaces
{
    public interface IOrderRepository
    {
        void CreateOrder(Order order);
    }
}
