<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarRegistrosContables.aspx.cs" Inherits="TP3.Gestionar_Registros_Contables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 234px">
    <form id="form1" runat="server">
        <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/FormPrincipal.aspx">Menu</asp:HyperLink>
        </div>
        Monto: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" Height="26px" />
        <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label> <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Value="1">Tipo 1</asp:ListItem>
            <asp:ListItem Value="0">Tipo 0</asp:ListItem>
        </asp:RadioButtonList><br />
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="id" DataValueField="id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:Button ID="Button3" runat="server" Text="Eliminar Registro" OnClick="Button3_Click" /><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT [id], [descripcion] FROM [Cuentas]" InsertCommand="INSERT INTO [RegistrosContables] ([monto], [tipo],[idCuenta])
VALUES (@monto, @tipo, @id);" UpdateCommand="UPDATE [RegistrosContables] 
SET [monto] = @monto, [tipo] = @tipo, [idCuenta] = @idCuenta 
WHERE [id] = @id
" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" />
                <asp:ControlParameter ControlID="RadioButtonList1" Name="tipo" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" />
                <asp:ControlParameter ControlID="RadioButtonList1" Name="tipo" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT        dbo.RegistrosContables.id, dbo.RegistrosContables.monto, dbo.RegistrosContables.tipo, dbo.Cuentas.descripcion
FROM            dbo.RegistrosContables INNER JOIN
                         dbo.Cuentas ON dbo.RegistrosContables.idCuenta = dbo.Cuentas.id"></asp:SqlDataSource>
        <br /><asp:Table ID="Table1" runat="server" BorderColor="Black" BorderStyle="Solid" ForeColor="Black" GridLines="Both">
        </asp:Table>
    </form>
</body>
</html>
