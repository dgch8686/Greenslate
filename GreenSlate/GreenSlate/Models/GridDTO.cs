using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GreenSlate.Models
{
    public class GridDTO
    {
        public int userID { set; get; }
        public int projectID { set; get; }
        public DateTime startDate { set; get; }
        public string timeToStart { set; get; }
        public DateTime endDate { set; get; }
        public int credits { set; get; }
        public string status { set; get; }
    }
}