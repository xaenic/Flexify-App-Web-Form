<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Flexify_App.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w-full gap-10 h-screen">
        <div class="flex grid grid-cols-1 md:grid-cols-12 h-full">
            <div class="col-span-8 h-full grid grid-cols-1 md:grid-cols-4 relative overflow-hidden">
                <div class="p-10 pb-0">
                    <a href="/" class="text-xl font-bold ">Flexify</a>
                </div>
                <div class="w-full h-full absolute -z-10 grid grid-cols-12" id="grid-container"></div>
                <div class="md:pt-10 flex-col flex items-center col-span-2 md:mt-20 ">
                    <div class="flex-col flex gap-4 ">
                        <h1 class="text-4xl font-bold text-center">Join Flexify</h1>
                        <p class="text-center text-slate-600">Sign up for free</p>
                    </div>
                    <asp:ValidationSummary ID="valSummary" runat="server" ValidationGroup="RegisterValidation" CssClass="text-red-600" />

                    <div class="md:mt-10 w-full flex flex-col gap-7 p-2">
                        <div class="grid grid-cols-2 gap-4">
                            <div style="position: relative;">
                                <img src="Images/user.svg" alt="User Icon" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);">
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="w-full bg-zinc-200 outline-none border border-gray-300 rounded-lg p-4 pl-10" placeholder="First Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required." Display="Dynamic" CssClass="text-red-600" ValidationGroup="RegisterValidation" />
                            </div>

                           <div style="position: relative;">
                                <img src="Images/user.svg" alt="User Icon" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);">
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="w-full bg-zinc-200 outline-none border border-gray-300 rounded-lg p-4 pl-10" placeholder="Last Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required." Display="Dynamic" CssClass="text-red-600" ValidationGroup="RegisterValidation" />
                            </div>
                        </div>

                        <div style="position: relative;">
                            <img src="Images/user.svg" alt="User Icon" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full bg-zinc-200 outline-none border border-gray-300 rounded-lg p-4 pl-10 pl-10" placeholder="Email Address"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" CssClass="text-red-600" ValidationGroup="RegisterValidation" />
                        </div>

                        <div style="position: relative;">
                            <img src="Images/user.svg" alt="User Icon" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-full bg-zinc-200 outline-none border border-gray-300 rounded-lg p-4 pl-10" placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." Display="Dynamic" CssClass="text-red-600" ValidationGroup="RegisterValidation" />
                        </div>

                        <div>
                            <a href="/" class="text-blue-500 font-semibold">Forgot Password?</a>
                        </div>

                        <div>
                            <asp:Button ID="btnRegister" runat="server" Text="Create an account" CssClass="w-full h-20 cursor-pointer bg-gradient-to-r from-[#DB4C40] to-[#3C153B] rounded-lg text-white font-bold" ValidationGroup="RegisterValidation" OnClick="btnRegister_Click" />
                            <asp:Label ID="lblError" runat="server" CssClass="text-red-600" Visible="false"></asp:Label>
                        </div>
                    </div>

                    <div class="flex flex-col items-center">
                        <span>Or</span>
                        <a class="text-blue-600" href="/Login">You Have an Account Already ? </a>
                    </div>
                </div>
            </div>
            <div class="bg-black hidden md:grid text-white col-span-4 bg-gray-900 grid-cols-3">
                <div class="h-full bg-[#DB4C40]"></div>
                <div class="h-full bg-[#3C153B]"></div>
                <div class="h-full bg-[#090C02]"></div>
            </div>
        </div>
    </div>
</asp:Content>
