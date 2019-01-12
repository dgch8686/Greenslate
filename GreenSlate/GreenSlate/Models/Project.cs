using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace GreenSlate.Models
{
    public class Project
    {
        public int Id { set; get; }

        [Required]
        public DateTime StartDate { set; get; }

        [Required]
        public DateTime EndDate { set; get; }

        [Required]
        public  int Credits { set; get; }

        public List<UserProject> UserProjects { set; get; }
    }
}