using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace GreenSlate.Models
{
    public class GreenSlateContext : DbContext
    {
        public GreenSlateContext()
            : base("DefaultCon")
        {

        }
        public DbSet<User> Users { set; get; }
        public DbSet<UserProject> UserProjects { set; get; }
        public DbSet<Project> Projects { set; get; }
    }
}