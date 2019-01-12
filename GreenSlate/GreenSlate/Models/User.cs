using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GreenSlate.Models
{
    public class User
    {
        public int Id { set; get; }

        [Required]
        [StringLength(50)]
        public String FirstName { set; get; }

        [Required]
        [StringLength(50)]
        public String LastName { set; get; }

        public List<UserProject> UserProjects { set; get; }
    }
}