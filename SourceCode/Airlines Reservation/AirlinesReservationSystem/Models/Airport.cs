
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace AirlinesReservationSystem.Models
{

using System;
    using System.Collections.Generic;
    
public partial class Airport
{

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Airport()
    {

        this.FlightDistance = new HashSet<FlightDistance>();

        this.FlightDistance1 = new HashSet<FlightDistance>();

        this.Route = new HashSet<Route>();

        this.Route1 = new HashSet<Route>();

    }


    public string AirportID { get; set; }

    public string AirportName { get; set; }

    public string CityName { get; set; }

    public string CountryID { get; set; }

    public double GMT { get; set; }



    public virtual Country Country { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<FlightDistance> FlightDistance { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<FlightDistance> FlightDistance1 { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Route> Route { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]

    public virtual ICollection<Route> Route1 { get; set; }

}

}
