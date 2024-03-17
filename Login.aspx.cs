using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flexify_App
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {

                Response.Redirect("~/App/Dashboard.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRING");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM [user] WHERE email = @email AND password = @password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string firstName = reader.GetString(reader.GetOrdinal("firstName"));
                            Session["LoggedIn"] = true;
                            Session["firstName"] = firstName;
                            Session["email"] = email;
                            Response.Redirect("~/App/Dashboard.aspx");
                        }
                        else
                        {
                            lblError.Text = "Invalid email address or password. Please try again.";
                            lblError.Visible = true;
                        }
                    }
                }
            }
        }
    }
}
