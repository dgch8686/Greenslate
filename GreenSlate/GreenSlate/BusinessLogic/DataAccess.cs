using GreenSlate.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace GreenSlate.BusinessLogic
{
    public class DataAccess
    {
        public GreenSlateContext db = new GreenSlateContext();

        public List<GridDTO> GetProjects(int userID)
        {

            var result = (from c in db.UserProjects
                          select new GridDTO
                          {
                              userID=c.UserId,
                              projectID = c.ProjectId,
                              startDate = c.Project.StartDate,
                              timeToStart = DbFunctions.DiffDays(c.Project.StartDate ,c.AssignedDate) > 0 ? "in " + DbFunctions.DiffDays(c.Project.StartDate, c.AssignedDate) + " Days" : "Started",
                              endDate = c.Project.EndDate,
                              credits = c.Project.Credits,
                              status = c.IsActive ? "Active" : "Inactive"
                          }).ToList();
            if (userID != 0)
              result=  result.Where(c => c.userID == userID).ToList();
            return result;
        }


        public List<DropDownDTO> GetUser()
        {
            var result = (from c in db.Users
                          select new DropDownDTO
                          {
                              Id = c.Id,
                              UserName = c.FirstName +" "+c.LastName
                          }).ToList();
            result.Add(new DropDownDTO { Id = 0, UserName = "--" });
            return result.OrderBy(c=>c.Id).ToList();
        }

    }
}