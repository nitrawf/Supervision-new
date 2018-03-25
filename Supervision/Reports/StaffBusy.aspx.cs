using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports_StaffBusy : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void DownloadStaffBusy_Click(object sender, EventArgs e)
	{
		string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
		SqlConnection con = new SqlConnection(constring);

		string query = "SELECT * FROM StaffBusy";
		con.Open();
		SqlCommand cmd = new SqlCommand(query, con);

		var wb = new XLWorkbook();

        DataTable table = new DataTable
        {
            TableName = "StaffBusy"
        };

        table.Load(cmd.ExecuteReader());

		con.Close();

		wb.Worksheets.Add(table);

		HttpResponse httpResponse = Response;
		httpResponse.Clear();
		httpResponse.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
		httpResponse.AddHeader("content-disposition", "attachment;filename=\"Staff busy.xlsx\"");

		// Flush the workbook to the Response.OutputStream
		using (MemoryStream memoryStream = new MemoryStream())
		{
			wb.SaveAs(memoryStream);
			memoryStream.WriteTo(httpResponse.OutputStream);
		}

		httpResponse.End();
	}
}