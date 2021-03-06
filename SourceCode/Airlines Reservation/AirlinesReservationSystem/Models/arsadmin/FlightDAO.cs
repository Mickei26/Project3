using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AirlinesReservationSystem.Models.arsadmin
{
    public class FlightDAO
    {
        static AirlineDBEntities db = new AirlineDBEntities();

        public static Flight GetFlight(string FNo)
        {
            db = new AirlineDBEntities();
            return db.Flight.Where(r => r.FNo == FNo).FirstOrDefault();
        }

        public static IEnumerable<Flight> GetFlightList()
        {
            db = new AirlineDBEntities(); //refresh cache
            return db.Flight;
        }

        public static bool IsExistInTicket(string FNo)
        {
            return (db.Ticket.FirstOrDefault(t => t.FNo == FNo) != null);
        }

        public static bool DeleteFlight(string FNo)
        {
            var f = GetFlight(FNo);
            if (f != null)
            {
                if (db.Ticket.FirstOrDefault(t => t.FNo == FNo) == null)
                {
                    db.Flight.Remove(f);
                    db.SaveChanges();
                    return true;
                }
            }
            return false;
        }

        public static bool AddFlight(Flight newF)
        {
            try
            {
                var f = GetFlight(newF.FNo);
                if (f == null)
                {
                    db.Flight.Add(newF);
                    db.SaveChanges();
                    return true;
                }
                return false;
            }
            catch (Exception) { return false; }
        }

        public static string UpdateFlight(Flight updateF)
        {
            try
            {
                string s = "";
                var f = GetFlight(updateF.FNo);

                if (GetFlight(updateF.FNo) == null)
                {
                    throw new Exception("This flight number is not exists! Please refresh page and try again.");
                }

                if (db.Ticket.FirstOrDefault(t => t.FNo == updateF.FNo) == null)
                {
                    var route = db.Route.FirstOrDefault(r => r.RNo == updateF.RNo);
                    if (route == null)
                    {
                        if (s != "")
                            s += ", ";

                        s += "Route";
                    }
                    else
                    {
                        f.RNo = updateF.RNo;
                        f.AvailSeatsF = route.Aircraft.FirstClassSeats;
                        f.AvailSeatsB = route.Aircraft.BussinessSeats;
                        f.AvailSeatsE = route.Aircraft.EconomySeats;
                    }
                }

                if (updateF.DepartureTime > updateF.ArrivalTime)
                {
                    if (s != "")
                        s += ", ";

                    s += "Departure Time and Arrival Time";
                }
                else
                {
                    updateF.FlightTime = (updateF.ArrivalTime - updateF.DepartureTime).TotalHours;
                    f.DepartureTime = updateF.DepartureTime;
                    f.ArrivalTime = updateF.ArrivalTime;
                    f.FlightTime = updateF.FlightTime;
                }

                if (s != "")
                {
                    throw new Exception("Please choose valid " + s + ".");
                }
                f.BasePrice = updateF.BasePrice;
                db.SaveChanges();
                return "ok";
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
    }
}