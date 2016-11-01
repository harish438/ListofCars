using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace SampleApp
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var carsList = GetAllCars();
                GridView1.DataSource = carsList;
                GridView1.DataBind();
                DropDownList1.DataTextField = "Make";
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataSource = carsList;
                DropDownList1.DataBind();
            }

        }

        private IList<CarModal> GetAllCars()
        {
            CarModal car1 = new CarModal
            {
                Id = 1,
                Make = "Honda",
                Model = "CRV",
                Color = "green",
                Year = 2016,
                Price = 23845,
                TCCRating = 8,
                HwyMPG = 33
            };
            CarModal car2 = new CarModal
            {
                Id = 2,
                Make = "Ford",
                Model = "Escape",
                Color = "Red",
                Year = 2017,
                Price = 23590,
                TCCRating = 7.8,
                HwyMPG = 32
            };
            CarModal car3 = new CarModal
            {
                Id = 3,
                Make = "Hyundai",
                Model = "Santa Fe",
                Color = "Grey",
                Year = 2016,
                Price = 24950,
                TCCRating = 8,
                HwyMPG = 27
            };
            CarModal car4 = new CarModal
            {
                Id = 4,
                Make = "Mazda",
                Model = "CX-5",
                Color = "Red",
                Year = 2017,
                Price = 21795,
                TCCRating = 8,
                HwyMPG = 35
            };

            CarModal car5 = new CarModal
            {
                Id = 5,
                Make = "Subaru",
                Model = "Forester",
                Color = "Blue",
                Year = 2016,
                Price = 22395,
                TCCRating = 8.4,
                HwyMPG = 32
            };
            return new List<CarModal> { car1, car2, car3, car4, car5 };
        }

        private class CarModal
        {
            public int Id { get; set; }
            public string Make { get; set; }
            public string Model { get; set; }
            public string Color { get; set; }
            public int Year { get; set; }
            public int Price { get; set; }
            public double TCCRating { get; set; }
            public int HwyMPG { get; set; }
        }

        // To get the Newest vehicles in order from the list of cars //

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cars = GetAllCars();
            GridView2.DataSource = cars.OrderByDescending(x => x.Year);
            GridView2.DataBind();
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = "Below is the list of new vehicles as per year.";
        }

        // To get the Alphabetized vehicles in order from A-Z //

        protected void Button2_Click(object sender, EventArgs e)
        {
            var cars = GetAllCars();
            GridView2.DataSource = cars.OrderBy(x => x.Make);
            GridView2.DataBind();
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = "Below is the list of vehicles in Alphabetized order from A-Z.";
        }

        // To get the List of vehicles from higher price to lower price //

        protected void Button3_Click(object sender, EventArgs e)
        {
            var cars = GetAllCars();
            GridView2.DataSource = cars.OrderByDescending(x => x.Price);
            GridView2.DataBind();
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = "Below is the list of vehicles from higher price to lower price.";
        }

        // To get the Best vehicles in order from the list of cars //

        protected void Button4_Click(object sender, EventArgs e)
        {
            var cars = GetAllCars();
            GridView2.DataSource = cars.OrderByDescending(x => x.HwyMPG).ThenByDescending(x => x.TCCRating).OrderBy(x => x.Price);
            GridView2.DataBind();
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = "Below is the ordered list of vehicles with best value. The Top 1 is the best car with low cost, high mpg and good rating.";
        }

        // To get the Random car from the list of cars //

        protected void Button5_Click(object sender, EventArgs e)
        {
            var cars = GetAllCars();
            Random rnd = new Random();
            var randomIndex = rnd.Next(1, cars.Count);
            GridView2.DataSource = cars.Where(x => x.Id == randomIndex);
            GridView2.DataBind();
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = " Random car from the List of cars";
        }

        // To get the average mpg of vehicles for each year from the list //

        protected void Button6_Click(object sender, EventArgs e)
        {
            Label4.Text = "";
            Label3.Text = "";
            var getYear = TextBox1.Text;
            var cars = GetAllCars();
            int x = 0;
            if (Int32.TryParse(getYear, out x))
            {
                Label2.Text = "";
                Label1.Text = "";
                if (cars.Any(y => y.Year == x))
                {
                    double miles = cars.Where(r => r.Year == x).Average(r => r.HwyMPG);
                    Label2.Text = "Average MPG of year " + x + " is: <b style='color:red'>" + miles + "</b>";
                }
                else
                    Label1.Text = "We don't find any cars in the inventory matching the year " + x;
            }
            else
            {
                Label2.Text = "";
                Label1.Text = "Please enter years as 2016 (or) 2017";
            }

        }

        // To get the Fuel Consumption of each vehicle for a given distance in textbox //

        protected void Button7_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            Label2.Text = "";
            Label4.Text = "";
            var getDistance = TextBox2.Text;
            double x = 0;
            if (double.TryParse(getDistance, out x))
            {
                Label3.Text = "";
                var car = GetAllCars().FirstOrDefault(y => y.Id == int.Parse(DropDownList1.SelectedValue));
                var d = x / car?.HwyMPG;
                if (d != null)
                {
                    double mpg = (double)d;
                    Label3.Text = "Fuel consumption of <b style='color:red'>" + DropDownList1.SelectedItem + "</b> for a given distance is <b style='color:red'>" + mpg + " galon(s)</b>";
                }
                Label3.ForeColor = Color.Green;
            }
            else
            {
                Label3.Text = "Please enter distance in numbers";
                Label3.ForeColor = Color.Red;
            }
        }
    }
}
