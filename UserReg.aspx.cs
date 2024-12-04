using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserReg : System.Web.UI.Page
{

    string ConnStr = ConfigurationManager.ConnectionStrings["ConnDb"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            ClearFields();
        }
    }
    protected void ClearFields()
    {
        txtPhone.Text = "";
        txtEmail.Text = "";
        txtFName.Text = "";
        txtAdd.Text = "";
        txtPass.Text = "";
        txtCnfPass.Text = "";
    }
    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");
        sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml += sb.ToString();
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string name = txtFName.Text;
            string email = txtEmail.Text;
            string mobileNumber = txtPhone.Text;
            string address = txtAdd.Text;
            string password = txtPass.Text;
            string confirmPassword = txtCnfPass.Text;

            if (password != confirmPassword)
            {
                alertmsg("Passwords do not match", "bg-Warning");
                return;
            }
            DataSet ds = new DataSet();
            using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("USP_InsertUser", ConnStr))
            {
                sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Name", name);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Email", email);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Mobile", mobileNumber);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Address", address);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Password", password);
                sqlDataAdapter.Fill(ds);
                ClearFields();
            }
            if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-success");
                }
                else
                {
                    //alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-danger");
                }

            }

        }

    }
}