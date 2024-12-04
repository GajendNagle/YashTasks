<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>

    <div runat="server" id="divAlert" clientidmode="Static"></div>

    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
        <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <div class="d-flex align-items-center justify-content-center w-100">
                <div class="row justify-content-center w-100">
                    <div class="col-md-8 col-lg-6 col-xxl-3">
                        <div class="card mb-0">
                            <div class="card-header text-center fw-bold">Login</div>
                            <div class="card-body mt-4">
                                <div runat="server" id="div1" clientidmode="Static"></div>
                                <form id="form2" runat="server">
                                    <div class="mb-3">
                                        <div class="form-floating form-floating-custom mb-3">
                                            <asp:TextBox TextMode="Email" CssClass="form-control" placeholder="" runat="server" ID="TxtEmail" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                                ControlToValidate="TxtEmail" ErrorMessage="Email ID is required" ValidationGroup="valid" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                ControlToValidate="TxtEmail" ErrorMessage="Invalid email format" Display="Dynamic"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                            <label for="floatingInput">Email ID</label>
                                        </div>
                                    </div>
                                    <div class="mb-4">
                                        <div class="form-floating form-floating-custom mb-3">
                                            <asp:TextBox TextMode="Password" CssClass="form-control" Rows="2" runat="server" ID="TxtPassword" placeholder="" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                                                ControlToValidate="TxtPassword" ErrorMessage="Password is required" ValidationGroup="valid" />
                                            <label for="floatingInput">Password</label>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <asp:Button CssClass="btn btn-outline-primary" runat="server" ID="BtnSubmit" Text="Sign In" OnClick="BtnSubmit_Click" ValidationGroup="valid" />
                                        <label>Don't have account??</label><a href="UserReg.aspx">Create Account</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="/assets/js/core/bootstrap.min.js"></script>
</body>
</html>
