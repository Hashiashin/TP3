<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormPrincipal.aspx.cs" Inherits="TP3.FormPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GestionarRegistrosContables.aspx">Gestionar Registros Contables</asp:HyperLink>
        </div><br />
        <div>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/GestionarCuentas.aspx">Gestionar Cuentas</asp:HyperLink>
        </div>
        
    </form>
</body>
</html>
