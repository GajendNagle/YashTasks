<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="ViewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="card-title text-center"><u>User Profile</u> </div>
                </div>
                <div class="card-body mt-3">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row mt-3">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="form-floating form-floating-custom mb-3">
                                                <asp:TextBox CssClass="form-control" placeholder="Name" runat="server" ID="TxtName" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                    ControlToValidate="TxtName" ErrorMessage="Name is required" />
                                                <label for="floatingInput">Name</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4">
                                            <div class="form-floating form-floating-custom mb-3">
                                                <asp:TextBox TextMode="Email" CssClass="form-control" placeholder="Email ID" runat="server" ID="TxtEmail" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                                    ControlToValidate="TxtEmail" ErrorMessage="Email ID is required" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                    ControlToValidate="TxtEmail" ErrorMessage="Invalid email format" Display="Dynamic"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                <label for="floatingInput">Email ID</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4">
                                            <div class="form-floating form-floating-custom mb-3">
                                                <asp:TextBox CssClass="form-control" placeholder="Mobile Number" runat="server" ID="TxtMoNumber" MaxLength="15" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                                    ControlToValidate="TxtMoNumber" ErrorMessage="Mobile number is required" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic"
                                                    ControlToValidate="TxtMoNumber" ErrorMessage="Invalid mobile number format"
                                                    ValidationExpression="[0-9]{10,15}" />
                                                <label for="floatingInput">Mobile Number</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4">
                                            <div class="form-floating form-floating-custom mb-3">
                                                <asp:TextBox TextMode="MultiLine" CssClass="form-control" Rows="2" runat="server" ID="TxtAddress" placeholder="Address" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                                    ControlToValidate="TxtAddress" ErrorMessage="Address is required" />
                                                <label for="floatingInput">Address</label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <asp:Button CssClass="btn btn-primary" runat="server" ID="BtnEdit" Text="Edit Profile" OnClick="BtnEdit_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentFooter" runat="Server">
</asp:Content>

