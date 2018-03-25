using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddBlock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ServerValidation(object source, ServerValidateEventArgs arguments)
    {
        //Makes sure that the room number is valid.
        if (FormView1.FindControl("RoomNumberTextBox") is TextBox RoomNumberTextBox)
        {
            if (!String.IsNullOrWhiteSpace(RoomNumberTextBox.Text))
            {
                arguments.IsValid = true;
            }
            else
            {
                arguments.IsValid = false;
            }
        }
        else
        {
            arguments.IsValid = false;
        }

    }
}