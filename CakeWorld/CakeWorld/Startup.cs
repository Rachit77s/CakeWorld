using CakeWorld.Data;
using CakeWorld.Repository.Interfaces;
using CakeWorld.Repository.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CakeWorld
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            // Rachit: Add SQL Connection
            services.AddDbContextPool<AppDbContext>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection"));
            });

            services.AddScoped<ICategoryRepository, CategoryRepository>();
            services.AddScoped<ICakeRepository, CakeRepository>();

            // Rachit: 
            // This is required because when the user visits the site we are going to create the scoped shopping cart using the GetCart(),
            // this gives us the ability to check if the CartId is already in the session, if not, we will pass it into the session and
            // return the ShoppingCart itself down here.
            // Hence this way we are sure that when the user comes to the site, a shopping cart will be associated with that request.

            // Invoke the GetCart() for the user
            services.AddScoped<ShoppingCartService>(sp => ShoppingCartService.GetCart(sp));

            services.AddHttpContextAccessor();
            services.AddSession();

            // Rachit: Adds support for MVC in our application
            services.AddControllersWithViews();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            // Rachit: Redirects HTTP request to HTTPS
            app.UseHttpsRedirection();

            app.UseStaticFiles();
            app.UseSession();
            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}" );                                
            });
        }
    }
}
