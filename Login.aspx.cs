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

                Response.Redirect("~/Home.aspx");
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connecting"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM [user] WHERE email = @email AND password = @password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        string firstNameQuery = "SELECT firstname FROM [user] WHERE email = @Email";
                        using (SqlCommand firstNameCommand = new SqlCommand(firstNameQuery, connection))
                        {
                            firstNameCommand.Parameters.AddWithValue("@Email", email);
                            string firstname = (string)firstNameCommand.ExecuteScalar();
                            Session["LoggedIn"] = true;
                            Session["firstName"] = firstname;
                            Response.Redirect("~/Home.aspx");
                        }
                    }
                    else
                    {
                        lblErrorMessage.Text = "Invalid email address or password. Please try again.";
                        lblErrorMessage.Visible = true;
                    }
                }
            }
        }
    }
}
