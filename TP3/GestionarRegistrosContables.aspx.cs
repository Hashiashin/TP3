using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3
{
    public partial class Gestionar_Registros_Contables : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                actualizarTabla();
            }
        }

        protected void actualizarTabla()
        {

            Table1.Rows.Clear();

            TableRow encabezado = new TableRow();
            TableCell encabezado1 = new TableCell();
            TableCell encabezado2 = new TableCell();
            TableCell encabezado3 = new TableCell();
            TableCell encabezado4 = new TableCell();
            encabezado1.Text = "N°Reg";
            encabezado2.Text = "Monto";
            encabezado3.Text = "Descripcion";
            encabezado4.Text = "Tipo";
            encabezado.Cells.Add(encabezado1);
            encabezado.Cells.Add(encabezado2);
            encabezado.Cells.Add(encabezado3);
            encabezado.Cells.Add(encabezado4);
            Table1.Rows.Add(encabezado);

            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

            foreach (DataRowView dr in dv)
            {
                DataRow row = dr.Row;
                TableRow newRow = new TableRow();

                TableCell cell1 = new TableCell();
                TableCell cell2 = new TableCell();  
                TableCell cell3 = new TableCell();
                TableCell cell4 = new TableCell();  

                cell1.Text = row["id"].ToString();
                cell2.Text = row["monto"].ToString();
                cell3.Text = row["descripcion"].ToString();    
                cell4.Text = row["tipo"].ToString();   
                
                newRow.Cells.Add(cell1);
                newRow.Cells.Add(cell2);    
                newRow.Cells.Add(cell3);
                newRow.Cells.Add(cell4);
                Table1.Rows.Add(newRow);
                
                  
                
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        
            {
            if (string.IsNullOrWhiteSpace(TextBox1.Text) || DropDownList1.SelectedValue == "" || !RadioButtonList1.Items.Cast<ListItem>().Any(item => item.Selected))
            {

                Label1.Text = "Complete los Campos.";
            }
            else
            {
           
                       
            
            int result = SqlDataSource1.Insert();
                if (result != 0)
                {
                    Label1.Text = "Se ha agregado " + result.ToString() + " Cuenta.";
                    actualizarTabla();
                    TextBox1.Text = "";
                }
                else
                {
                    Label1.Text = "No se Agrego Cuenta.";
                    actualizarTabla();

                }

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextBox1.Text) || DropDownList1.SelectedValue == "" || !RadioButtonList1.Items.Cast<ListItem>().Any(item => item.Selected))
            {

                Label1.Text = "Complete los Campos.";
                
            }
            else
            {

                int result = SqlDataSource1.Update();
                if (result != 0)
                {
                    Label1.Text = "Se ha modificado " + result.ToString() + ".";
                    actualizarTabla();
                    TextBox1.Text = "";
                }
                else
                {
                    Label1.Text = "No se Agrego Cuenta.";

                }

            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Delete();
            if (result != 0)
            {
                Label1.Text = "Se ha Eliminado " + result.ToString() + " registro.";
                actualizarTabla();
                TextBox1.Text = "";
            }
            else
            {
                Label1.Text = "No se Elimino Registro.";

            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            actualizarTabla();
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            actualizarTabla();
        }
    }
}