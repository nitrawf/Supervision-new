using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Admin_AssignRoom : System.Web.UI.Page
{
    static List<RoomAssignment> datesUsed { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            SetDatesWhichCannotBeUsed();
        }

    }
    private void SetDatesWhichCannotBeUsed()
    {
        DropDownList RoomDownList = FormView1.FindControl("RoomDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;
        using (var db = new SupervisionDBDataContext())
        {
            List<DateTime> Date = new List<DateTime>();


            datesUsed = db.RoomAssignments.Where(
            x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                    x.RoomID == Int32.Parse(RoomDownList.SelectedValue)).ToList();

        }

    }

    protected void FreeDatesChanged(object sender, EventArgs e)
    {
        DropDownList RoomDownList = FormView1.FindControl("RoomDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;
        using (var db = new SupervisionDBDataContext())
        {
            List<DateTime> Date = new List<DateTime>();


            datesUsed = db.RoomAssignments.Where(
            x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                    x.RoomID == Int32.Parse(RoomDownList.SelectedValue)).ToList();

        }

    }

    protected void Calendar_DayRender(object sender, DayRenderEventArgs e)
    {
        EnableOrDisableDay(e);

    }

    private static void EnableOrDisableDay(DayRenderEventArgs e)
    {
        if (e.Day.Date < DateTime.Now)
        {
            e.Cell.Enabled = false;
            e.Cell.ForeColor = Color.DarkGray;
        }


        if (datesUsed.Any(
                x => x.AssignmentDate == e.Day.Date))
        {
            e.Cell.Enabled = false;
            e.Day.IsSelectable = false;
            e.Cell.ForeColor = Color.DarkGray;
        }
    }
    

    protected void AssignmentDataSource_OnInserted(Object sender, SqlDataSourceStatusEventArgs e)
    {
        System.Data.Common.DbCommand command = e.Command;

        GridView GridView1Code = UpdatePanel2.FindControl("GridView1") as GridView;
        GridView1Code.DataBind();
        ScriptManager.RegisterClientScriptBlock(GridView1Code, this.GetType(), "AlertMsg", "<script language='javascript'>$('html, body').animate({ scrollTop: $(document).height() }, 1000);</script>", false);
        SetDatesWhichCannotBeUsed();

        UpdatePanel2.Update();
    }

    protected void ServerValidationStaff(object source, ServerValidateEventArgs arguments)
    {
        //Makes sure that the staff member is not busy for this time period/position/slot.
        //TODO : Once the exception tables are ready

        DropDownList StaffDropDownList = FormView1.FindControl("StaffDropDownList") as DropDownList;


        Calendar Calendar1 = FormView1.FindControl("Calendar1") as Calendar;

        if (Calendar1.SelectedDate != new DateTime())
        { 
            using (var db = new SupervisionDBDataContext())
            {

                var staffIsBusy = db.StaffBusies.Where(
                    x =>
                            x.StaffID.ToString() == StaffDropDownList.SelectedValue &&
                            (x.EndDate >= Calendar1.SelectedDate &&
                            x.StartDate <= Calendar1.SelectedDate)).ToList();   //Making sure ranges do not overlap
                if (staffIsBusy.Count == 0)
                {
                    arguments.IsValid = true;
                }
                else
                {
                    arguments.IsValid = false;
                    var errorMessage = "The staff member is unavailiable for the date range.";
                    staffIsBusy.ForEach(x =>
                    {
                        errorMessage += String.Format("<br /> {0} from {1:dd/MM/yyyy} to {2:dd/MM/yyyy}", x.reason, x.StartDate, x.EndDate);
                    });
                    StaffValidator.ErrorMessage = errorMessage;
                }


            }
        }
        else
        {
            arguments.IsValid = true;
        }

    }

}
