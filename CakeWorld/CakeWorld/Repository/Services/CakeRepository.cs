using CakeWorld.Data;
using CakeWorld.Models;
using CakeWorld.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.Repository.Services
{
    public class CakeRepository : ICakeRepository
    {
        private readonly AppDbContext _appDbContext;

        public CakeRepository(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public IEnumerable<Cake> AllCakes
        {
            get
                {
                     return _appDbContext.Cakes.Include(c => c.Category);
                }          
        }
        

        public IEnumerable<Cake> CakesOfTheWeek
        {
            get
                {
                    return _appDbContext.Cakes.Include(c => c.Category).Where(x => x.IsCakeOfTheWeek);
                }            
        }

        public Cake GetCakeById(int cakeId)
        {
            return _appDbContext.Cakes.Find(cakeId);
        }
    }
}
