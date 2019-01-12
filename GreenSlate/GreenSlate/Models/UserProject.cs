using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace GreenSlate.Models
{
    public class UserProject
    {
        public int Id { set; get; }

        [Required]
        public int ProjectId { set; get; }

        [Required]
        public int UserId { set; get; }

        [Required]
        public Boolean IsActive { set; get; }

        [Required]
        public DateTime AssignedDate { set; get; }

        [ForeignKey("UserId")]
        public User User { set; get; }

        [ForeignKey("ProjectId")]
        public Project Project { set; get; }




    }
}