<<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SampleApp.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="margin-left:30px">
<head runat="server">
    <title>List of Cars</title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    <script src="scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <p>1.Click the button to get the <span class="auto-style1"><strong>Newest vechicles</strong></span> in order&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Newest Vehicles" OnClick="Button1_Click" /></p>
        
        <p>2. Click the button to get <span class="auto-style1"><strong>Alphabetized List of vehicles</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button2" class="btn btn-success" runat="server" Text="Alphabetized List" OnClick="Button2_Click" /></p>
        
        <p>3.Click the button to get <strong><span class="auto-style1">Ordered List of vehicles by Price</span>&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" class="btn btn-info" runat="server" Text="Ordered List By Price" OnClick="Button3_Click" /></p>
        
        <p>4. Click the button to <strong><span class="auto-style1">Get the best value vehicle with Low Price &amp; Good mpg</span>&nbsp; </strong>&nbsp; <asp:Button ID="Button4" runat="server" class="btn btn-warning" Text="Best Value Car" OnClick="Button4_Click" /></p>
        
        <p>5. <span class="auto-style1"><strong>Fuel consumption based on vehicle</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter number of Miles"></asp:TextBox>
            <asp:Button ID="Button7" runat="server"  class="btn btn-info" Text="Fuel Consumption" OnClick="Button7_Click" />
            &nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
        </p>
        
        <p>6. Click the button to <strong><span class="auto-style1">Get a Random car from the List</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;<asp:Button ID="Button5" runat="server" class="btn btn-success" Text="Random car" OnClick="Button5_Click" /></p>
        
        <p>7. <strong><span class="auto-style1">Average mpg based on year</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>&nbsp;<asp:TextBox ID="TextBox1" runat="server" placeholder="Enter year"></asp:TextBox><asp:Button ID="Button6" class="btn btn-primary" runat="server" Text="Get Average mpg" OnClick="Button6_Click" />
            &nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label><asp:Label ID="Label2" runat="server" ForeColor="#339966"></asp:Label>
        </p>
        <p style="color:purple"><strong>List of Cars:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></p>
        <div>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="657px">
            <AlternatingRowStyle BackColor="lightpink" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
       <div>
           <span style="color:purple"><strong>Ordered List o/p:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label4" runat="server" ForeColor="#003366" Text="Label"></asp:Label>
           <br />
           </strong></span><br />
           <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="656px">
            <AlternatingRowStyle BackColor="lightblue" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
       </div>
       </form>
</body>
</html>
