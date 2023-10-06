using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP3
{
    public partial class GestionarCuentas : System.Web.UI.Page
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

            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            foreach (DataRowView dr in dv)
            {
                DataRow row = dr.Row;
               TableRow newRow = new TableRow();
                          
                TableCell cell1 = new TableCell();
                cell1.Text = row["descripcion"].ToString(); 
                newRow.Cells.Add(cell1);
                Table1.Rows.Add(newRow);
            }
        }
        protected void actualizarLabel()
        {
            Label2.Text = "";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in dv)
            {
                DataRow row = dr.Row;
                Label2.Text += row["descripcion"].ToString() + " - ";
            }
                

        }
        protected void Button1_Click(object sender, EventArgs e)
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
                    
            }
            
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            actualizarTabla();
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            
            {
                TextBox2.Text = reader["descripcion"].ToString();   
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DeleteParameters["id"].DefaultValue = ListBox1.SelectedValue.ToString(); 
            int result = SqlDataSource1.Delete();
            if (result != 0)
            {
                Label1.Text = "Se ha eliminado " + result.ToString() + " Cuenta.";
                actualizarTabla();
                TextBox2.Text = "";
            }
            else
            {
                Label1.Text = "No se elimino Cuenta.";

            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue.ToString();
            SqlDataSource1.UpdateParameters["descripcion"].DefaultValue = TextBox2.Text;
            int result = SqlDataSource1.Update();
            if (result != 0)
            {
                
                Label1.Text = "Se ha Modificado " + result.ToString() + " Cuenta.";
                actualizarTabla();
                TextBox2.Text = "";
            }
            else
            {
                Label1.Text = "No se Modifico Cuenta.";

            }

        }
    }
}