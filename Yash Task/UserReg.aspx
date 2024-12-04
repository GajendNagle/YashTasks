<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserReg.aspx.cs" Inherits="UserReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        th {
            background-color: cornsilk !important;
            color: brown;
        }

        .container-fluid {
            background: linear-gradient(60deg, rgb(46, 51, 248, 0.64), rgb(46, 203, 203, 0.60));
        }

        .card-header {
            background-image: linear-gradient(45deg, #e1c8c8, transparent, #d74545), url("Assets/img/College-Admission-Background.jpg");
            background-size: auto 100%;
            background-repeat: no-repeat;
            width: 100%;
            background-size: cover;
        }

        .card-body {
            background: linear-gradient(50deg, #d74545, transparent, #e1c8c8);
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">
        <div runat="server" id="divAlert" clientidmode="Static"></div>
        <div class="container-fluid align-items-center d-flex justify-content-center" style="min-height: 100vh">
            <asp:Label runat="server" ID="lblShow"></asp:Label>
            <div class="card  w-75" style="height: fit-content">
                <div class="card-header text-center">
                    <u>REGISTRATION FORM</u>
                </div>
                <div class="card-body">
                    <div class="row align-items-end">
                        <div class="col-md-3 mt-3">
                            <label for="txtFName">Name </label>
                            <span>*</span>
                            <asp:TextBox runat="server" ID="txtFName" AutoComplete="off" CssClass="form-control" MaxLength="20" placeholder="Enter first name"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="*First name required" ControlToValidate="txtFName" runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="valid"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ErrorMessage="should contain only alphabets" ValidationExpression="[a-zA-Z ]*" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFName" ValidationGroup="valid" runat="server"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-3 mt-3">
                            <label for="txtPhone">Phone No.</label><span>*</span>
                            <asp:TextBox runat="server" ID="txtPhone" AutoComplete="off" CssClass="form-control" MaxLength="10" placeholder="XXXXXXXXXX"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="*Phone no. required" ControlToValidate="txtPhone" ForeColor="Red" Display="Dynamic" ValidationGroup="valid" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ErrorMessage="Number should be valid" ValidationExpression="^[6-9]{1}[0-9]{9}$" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPhone" ValidationGroup="valid" runat="server"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-3 mt-3">
                            <label for="txtAdd">Address</label>
                            <span>*</span>
                            <asp:TextBox runat="server" ID="txtAdd" TextMode="MultiLine" Rows="1" AutoComplete="off" CssClass="form-control" MaxLength="50" placeholder="Enter your address"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="*Address is required" ControlToValidate="txtAdd" runat="server" Display="Dynamic" ForeColor="Red" ValidationGroup="valid"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-3 mt-3">
                            <label for="txtEmail">Email Address </label>
                            <span>*</span>
                            <asp:TextBox runat="server" ID="txtEmail" AutoComplete="off" CssClass="form-control" MaxLength="100" placeholder="ex: jsmith@example.com"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="*Student's email id is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" ValidationGroup="valid" runat="server"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ErrorMessage="Email is not valid" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ForeColor="Red" Display="Dynamic" ControlToValidate="txtEmail" ValidationGroup="valid" runat="server"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-3 mt-3">
                            <label for="txtPass">Password</label><span>*</span>

                            <div class="input-group">
                                <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" AutoComplete="off" MaxLength="50" placeholder="Create Password" TextMode="Password" />
                                <div class="input-group-append">
                                    <i class="fas fa-eye-slash toggle-password m-2" onclick="togglePasswordVisibility()"></i>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator ErrorMessage="Create password" ControlToValidate="txtPass" ValidationGroup="valid" ForeColor="Red" Display="Dynamic" runat="server" />
                            <asp:RegularExpressionValidator ErrorMessage="Eg: Adam@250" ForeColor="#666666" Display="Dynamic" ValidationGroup="valid" ValidationExpression="\w+[@#]+[0-9]+" ControlToValidate="txtPass" runat="server" />
                        </div>
                        <div class="col-md-3 mt-3">
                            <label for="txtCnfPass">Confirm Password</label><span>*</span>
                            <div class="input-group">
                                <asp:TextBox runat="server" ID="txtCnfPass" CssClass="form-control" AutoComplete="off" MaxLength="50" placeholder="Confirm Password" TextMode="Password" />
                                <div class="input-group-append">

                                    <i class="fas fa-eye-slash toggle-password m-2" onclick="togglePasswardVisibility()"></i>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator ErrorMessage="Confirm password" ControlToValidate="txtCnfPass" ValidationGroup="valid" ForeColor="Red" Display="Dynamic" runat="server" />

                            <asp:CompareValidator ErrorMessage="Password doesn't match" ControlToValidate="txtCnfPass" ControlToCompare="txtPass" ForeColor="Red" Display="Dynamic" ValidationGroup="valid" runat="server" />
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-12 text-center">
                                <asp:Button Text="Register" runat="server" ValidationGroup="valid" ID="btnRegister" OnClick="btnRegister_Click" CssClass="btn btn-outline-success" />
                                <%--<a class="btn btn-outline-warning" href="login.aspx">Login</a>--%>
                                <label>Already having account??</label>
                                <a href="login.aspx">Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

        <script>
            $(function () {
                $(".datepicker").datepicker();
            });
        </script>

    </form>
</body>
</html>
