using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebSite.Models;

namespace WebSite.Repository
{
    public class CategoryRepository : ICategoryRepository
    {
        private DBWatchEntities dbwatch = new DBWatchEntities();

        public Category find(int id)
        {
            return dbwatch.Categories.Find(id);
        }

        public List<Category> findAll()
        {
            return dbwatch.Categories.ToList();
        }
    }
}