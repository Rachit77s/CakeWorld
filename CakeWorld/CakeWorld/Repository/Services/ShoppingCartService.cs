using CakeWorld.Data;
using CakeWorld.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld.Repository.Services
{
    public class ShoppingCartService
    {
        private readonly AppDbContext _appDbContext;

        public string ShoppingCartId { get; set; }

        public List<ShoppingCartItem> ShoppingCartItems { get; set; }

        private ShoppingCartService(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        // Rachit
        // How shopping cart service would work
        // When a user visits the website we are going to check if the user already has an active shopping cart.
        // A shopping cart that we are going to represent in memory using a GUID, and this GUID string we will store in the session.
        // In other words, when the use visits our site, we are going to check if there is already an active session containing a CartId, If not, we will create it.  
        // Then we will create the instance of the Shopping cart by passing that CartId


        //IHttpContextAccessor -> helps in the session management in .NET Core.
        //In .NET Core, We have access to sessions directly in the controller, but we do not have access in a regular class therefore we are using IHttpContextAccessor 
        //And through IHttpContextAccessor we have access to HttpContext.Session and all the information about the request

        public static ShoppingCartService GetCart(IServiceProvider services)
        {
           
            ISession session = services.GetRequiredService<IHttpContextAccessor>()?
                                       .HttpContext.Session;

            //Ask the services collection for the AppDbContext
            var context = services.GetService<AppDbContext>();

            //When the user comes to shopping site, check if there is already an active session containing a cart Id.
            //If not, create a new one. Then create an instance of a shopping cart, passing that cart Id. And that's what exactly we are doing in this function GetCart().  
            //Check the session to see if it already has a string with the ID called cartId. If not, create a new GUID and that will then be the cartId it has set in the session.
            string cartId = session.GetString("CartId") ?? Guid.NewGuid().ToString();

            session.SetString("CartId", cartId);

            // Create a new shopping cart passing the AppDbContext with ShoppingCartId as the cartId.
            return new ShoppingCartService(context) { ShoppingCartId = cartId };
        }

        public void AddToCart(Cake cake, int amount)
        {
            // Check if CakeId is found for that shopping cart 
            var shoppingCartItem = _appDbContext.ShoppingCartItems.SingleOrDefault(s => s.Cake.CakeId == cake.CakeId && s.ShoppingCartId == ShoppingCartId);

            // If Cake was not in the ShoppingCart then create new ShoppingCartItem and set the Cake as passed-in Cake
            if (shoppingCartItem == null)
            {
                shoppingCartItem = new ShoppingCartItem
                {
                    ShoppingCartId = ShoppingCartId,
                    Cake = cake,
                    Amount = 1
                };

                // Add the ShoppingCartItem to the list currently managed by AppDbContext in its DBSet.
                _appDbContext.ShoppingCartItems.Add(shoppingCartItem);
            }
            else
            {
                shoppingCartItem.Amount++;
            }

            // Add the ShoppingCartItem to the database
            _appDbContext.SaveChanges();
        }

        public int RemoveFromCart(Cake cake)
        {
            var shoppingCartItem = _appDbContext.ShoppingCartItems.SingleOrDefault(s => s.Cake.CakeId == cake.CakeId && s.ShoppingCartId == ShoppingCartId);

            var localAmount = 0;

            if (shoppingCartItem != null)
            {
                if (shoppingCartItem.Amount > 1)
                {
                    shoppingCartItem.Amount--;
                    localAmount = shoppingCartItem.Amount;
                }
                else
                {
                    _appDbContext.ShoppingCartItems.Remove(shoppingCartItem);
                }
            }

            _appDbContext.SaveChanges();

            return localAmount;
        }

        // GetShoppingCartItems will look if the ShoppingCartItems were already previously retrieved in this current ShoppingCart instance
        public List<ShoppingCartItem> GetShoppingCartItems()
        {
            // If ShoppingCartItems list is null then go to AppDbContext and retrieve the ShoppingCartItems where the ShoppingCartId is the given ShoppingCartId that is currently  associated with the Session of the user.

            return ShoppingCartItems ?? (ShoppingCartItems = _appDbContext.ShoppingCartItems.Where(c => c.ShoppingCartId == ShoppingCartId)
                                                                                            .Include(s => s.Cake)
                                                                                            .ToList()
                                        );
        }

        // Removes all the shopping cart items that are associated with the ShoppingCartId
        public void ClearCart()
        {
            var cartItems = _appDbContext
                            .ShoppingCartItems
                            .Where(cart => cart.ShoppingCartId == ShoppingCartId);

            _appDbContext.ShoppingCartItems.RemoveRange(cartItems);

            _appDbContext.SaveChanges();
        }

        // Get the sum of all the ShoppingCartItems in the ShoppingCart and return the total. 
        public decimal GetShoppingCartTotal()
        {
            var total = _appDbContext.ShoppingCartItems.Where(c => c.ShoppingCartId == ShoppingCartId)
                                                       .Select(c => c.Cake.Price * c.Amount).Sum();
            return total;
        }
    }
}
