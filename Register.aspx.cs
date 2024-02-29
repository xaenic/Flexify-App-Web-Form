using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flexify_App
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["LoggedIn"] != null && (bool)Session["LoggedIn"])
            {
                Response.Redirect("~/Home.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "All fields are required.";
                lblError.Visible = true;
                return;
            }
            if (!IsValidEmail(email))
            {
                lblError.Text = "Invalid email format.";
                lblError.Visible = true;
                return;
            }
            if (IsEmailExists(email))
            {

                lblError.Text = "Email already exists";
                lblError.Visible = true;
                return;
            }
            string connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRING");
            string query = "INSERT INTO [user] (firstName, lastName, email, [password]) VALUES (@firstName, @lastName, @email, @password)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblError.Text = "Registration successful!";
                            lblError.ForeColor = System.Drawing.Color.Green;
                            lblError.Visible = true;
                        }
                        else
                        {
                            lblError.Text = "Failed to register user.";
                            lblError.ForeColor = System.Drawing.Color.Red;
                            lblError.Visible = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "An error occurred: " + ex.Message;
                        lblError.ForeColor = System.Drawing.Color.Red;
                        lblError.Visible = true;
                    }
                }
            }
        }
        private bool IsEmailExists(string email)
        {
            string connectionString = Environment.GetEnvironmentVariable("CONNECTION_STRING");
            string query = "SELECT COUNT(*) FROM [user] WHERE email = @Email";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }
            private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

    }
}