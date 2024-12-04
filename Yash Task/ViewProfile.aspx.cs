using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Userid"] != null)
            {
                int userId = Convert.ToInt32(Session["Userid"]);

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnDb"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_regUsers WHERE UserID = @id", conn);
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@id", userId);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        TxtName.Text = dt.Rows[0]["name"].ToString();
                        TxtEmail.Text = dt.Rows[0]["email"].ToString();
                        TxtMoNumber.Text = dt.Rows[0]["Mobile"].ToString();
                        TxtAddress.Text = dt.Rows[0]["address"].ToString();

                    }
                }

            }
            else
            {

                Response.Redirect("Login.aspx");
            }
            TxtName.ReadOnly = true;
            TxtEmail.ReadOnly = true;
            TxtMoNumber.ReadOnly = true;
            TxtAddress.ReadOnly = true;
        }
    }
    protected void ClearFields()
    {
        TxtName.Text = "";
        TxtEmail.Text = "";
        TxtMoNumber.Text = "";
        TxtAddress.Text = "";
    }
    protected void BtnEdit_Click(object sender, EventArgs e)
    {
        if (BtnEdit.Text == "Edit Profile")
        {
            TxtName.ReadOnly = false;
            TxtEmail.ReadOnly = false;
            TxtMoNumber.ReadOnly = false;
            TxtAddress.ReadOnly = false;
            BtnEdit.Text = "Update Profile";
        }
        else if (BtnEdit.Text == "Update Profile")
        {

            if (Session["Userid"] != null)
            {
                int userId = Convert.ToInt32(Session["Userid"]);

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnDb"].ConnectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_regUsers SET name = @name, email = @email, Mobile = @mobile, address = @address WHERE UserID = @id", conn);
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@id", userId);
                    cmd.Parameters.AddWithValue("@name", TxtName.Text);
                    cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                    cmd.Parameters.AddWithValue("@mobile", TxtMoNumber.Text);
                    cmd.Parameters.AddWithValue("@address", TxtAddress.Text);
                    cmd.ExecuteNonQuery();
                    Session["Name"] = TxtName.Text;
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Data updated successfully!');", true);
                    ClearFields();
                    BtnEdit.Text = "Edit Profile";
                }
            }
            //Response.Redirect(Request.Url.AbsoluteUri);
        }


    }
}