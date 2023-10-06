<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarCuentas.aspx.cs" Inherits="TP3.GestionarCuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 247px">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/FormPrincipal.aspx">Menu</asp:HyperLink>
            <br />
            <br />
            <asp:TextBox ID="TextBox1" runat="server" Width="248px"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Alta" OnClick="Button1_Click" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <br />
            <div>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label> <br />
                <asp:Table ID="Table1" runat="server" BorderStyle="Solid" BorderWidth="1px" GridLines="Both" BackColor="#CCFF99" BorderColor="Black">
                </asp:Table>
                <br />
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" AutoPostBack="True" Height="72px" Width="87px" style="margin-top: 0px"></asp:ListBox>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Height="16px" ></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Eliminar" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="Modificar" OnClick="Button3_Click" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES  (@descripcion)" SelectCommand="SELECT * FROM Cuentas" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
