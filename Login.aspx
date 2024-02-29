<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Flexify_App.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class=" w-full  gap-10 h-screen">
  
    <div class="flex grid grid-cols-1 md:grid-cols-12 h-full">
        <div class="col-span-8 h-full grid grid-cols-1 md:grid-cols-4 relative overflow-hidden">
            <div class="p-10 pb-0">
                <a href="/" class="text-xl font-bold ">Flexify</a>
            </div>
            <div class="w-full h-full absolute -z-10 grid grid-cols-12" id="grid-container"></div>
            <div class="md:pt-10 flex-col flex items-center col-span-2 md:mt-20">
              <div class="flex-col flex gap-4 ">
                    <h1 class="text-4xl font-bold text-center">Welcome Back</h1>
                    <p class="text-center text-slate-600">Login to your Flexify</p>
              </div>

                <div class="md:mt-10 w-full flex flex-col gap-4 p-2">
                        <asp:Label ID="lblError" runat="server" CssClass="text-red-600" Visible="false"></asp:Label>
                    <div>
                       
                        <div class="bg-zinc-300 p-4 rounded-lg text-black flex gap-3">
                            <img src="Images/user.svg"/>
                          

                             <asp:TextBox TextMode="Email" ID="txtEmail" runat="server" CssClass="w-full bg-transparent  outline-none border-none" placeholder="Email"></asp:TextBox>
                        </div>

                    </div>
                    <div>
                       
                        <div class="bg-zinc-300 p-4 rounded-lg text-black  flex gap-3">
                            <img src="Images/lock.svg" />
                             <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="w-full bg-transparent  outline-none border-none" placeholder="Password"></asp:TextBox>
                        </div>

                    </div>
                    <div>
                            <a href="/" class="text-blue-500 font-semibold">Forgot Password?</a>

                    </div>
                    <div>

                        <div class="bg-gradient-to-r from-[#DB4C40] to-[#090C02] p-4 rounded-lg text-white font-bold">
               
                                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="cursor-pointer w-full bg-transparent  outline-none border-none" ValidationGroup="LoginValidation" OnClick="btnLogin_Click" />
 
                        </div>
                       
                      
                    </div>
                </div>
                <div class="flex flex-col items-center">
                    <span>Or</span>
                    <a class="text-blue-600" href="/register">Don't Have an Account ? </a>
                </div>
            </div>
        </div>
        <div class="bg-black hidden md:grid text-white col-span-4  bg-gray-900  grid-cols-3">

             <div class="h-full bg-[#DB4C40]"></div>
            <div class="h-full bg-[#090C02]"></div>
           
            <div class="h-full bg-[#3C153B]"></div>

        </div>
    </div>
  
</div>

</asp:Content>
