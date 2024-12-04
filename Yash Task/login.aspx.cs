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

public partial class login : System.Web.UI.Page
{
    string ConnStr = ConfigurationManager.ConnectionStrings["ConnDb"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            divAlert.InnerHtml = "";
            Session.Abandon();
        }
    }
    protected void alertmsg(string msg, string bgcolor)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<div class=\"alert ");
        sb.Append(bgcolor);
        sb.Append(" alert-dismissible fade show\" role=\"alert\">");
        sb.Append(msg);
        sb.Append("<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"> ");
        //sb.Append("<span aria-hidden=\"true\">&times;</span>");
        sb.Append("</button>");
        sb.Append("</div> ");
        divAlert.InnerHtml += sb.ToString();

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            string email = TxtEmail.Text;
            string password = TxtPassword.Text;

            DataSet ds = new DataSet();
            using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("USP_LoginUser", ConnStr))
            {
                sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Email", email);
                sqlDataAdapter.SelectCommand.Parameters.AddWithValue("@Password", password);
                sqlDataAdapter.Fill(ds);
            }

            if (ds.Tables.Count > 1)
            {

                if (ds.Tables[0].Rows[0]["Password"].ToString() == password)
                {
                    Session["Userid"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                    Session["Name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                    Session["Email"] = ds.Tables[0].Rows[0]["Email"];
                    Response.Redirect("DashboardPage.aspx");
                }
                else
                {
                    alertmsg("Wrong Password <br/> Blocked By Server<br/>" + ds.Tables[0].Rows[0]["Password"], "bg-warning");
                }
            }
            else if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), "bg-warning");

                }
            }
            else
            {
                alertmsg("Somthing went wrong", "bg-warning");
            }

           
        }
    }
}