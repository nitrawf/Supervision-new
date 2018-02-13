using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AssignDesignation : System.Web.UI.Page
{
    static List<Designation> dateRangesUsed { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            SetDateRangesWhichCannotBeUsed();
        }

    }

    private void SetDateRangesWhichCannotBeUsed()
    {
        DropDownList RoleDownList = FormView1.FindControl("RoleDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;
        using (var db = new SupervisionDBDataContext())
        {
            List<DateTime> startDates = new List<DateTime>();
            List<DateTime> endDates = new List<DateTime>();

            dateRangesUsed = db.Designations.Where(
            x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                    x.Role == RoleDownList.SelectedValue).ToList();

        }
    }

    protected void ServerValidation(object source, ServerValidateEventArgs arguments)
    {
        //Makes sure that the date range is valid.
        Calendar Calendar1 = FormView1.FindControl("Calendar1") as Calendar;
        Calendar Calendar2 = FormView1.FindControl("Calendar2") as Calendar;
        if (Calendar1.SelectedDate != new DateTime() && Calendar2.SelectedDate != null && Calendar1.SelectedDate<= Calendar2.SelectedDate)
        {
                arguments.IsValid = true;
        }
        else
        {

            arguments.IsValid = false;
        }

    }
    protected void ServerValidationFilled(object source, ServerValidateEventArgs arguments)
    {
        //Makes sure that the date range has not already been filled for this time period/position/slot.
        DropDownList RoleDownList = FormView1.FindControl("RoleDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;


        Calendar Calendar1 = FormView1.FindControl("Calendar1") as Calendar;
        Calendar Calendar2 = FormView1.FindControl("Calendar2") as Calendar;

        if (Calendar1.SelectedDate != new DateTime() && Calendar2.SelectedDate != null && Calendar1.SelectedDate <= Calendar2.SelectedDate)
        {
            using (var db = new SupervisionDBDataContext())
            {

                arguments.IsValid = !db.Designations.Any(
                    x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                            x.Role == RoleDownList.SelectedValue &&
                            (x.EndDate >= Calendar1.SelectedDate &&
                            x.StartDate <= Calendar2.SelectedDate)//Making sure ranges do not overlap
                );
            }
        }
        else
        {
            arguments.IsValid = true;
        }

    }
    protected void ServerValidationStaff(object source, ServerValidateEventArgs arguments)
    {
        //Makes sure that the staff member is not busy for this time period/position/slot.
        //TODO : Once the exception tables are ready
        arguments.IsValid = true;

    }
    protected void DesignationDataSource_OnInserted(Object sender, SqlDataSourceStatusEventArgs e)
    {
        System.Data.Common.DbCommand command = e.Command;
        
        GridView GridView1Code = UpdatePanel2.FindControl("GridView1") as GridView;
        GridView1Code.DataBind();
        ScriptManager.RegisterClientScriptBlock(GridView1Code, this.GetType(), "AlertMsg", "<script language='javascript'>$('html, body').animate({ scrollTop: $(document).height() }, 1000);</script>", false);
        SetDateRangesWhichCannotBeUsed();
        
        UpdatePanel2.Update();
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
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


        if (dateRangesUsed.Any(
                x => x.EndDate >= e.Day.Date &&
                        x.StartDate <= e.Day.Date))
        {
            e.Cell.Enabled = false;
            e.Day.IsSelectable = false;
            e.Cell.ForeColor = Color.DarkGray;
        }
    }

    protected void FreeDatesChanged(object sender, EventArgs e)
    {
        DropDownList RoleDownList = FormView1.FindControl("RoleDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;
            using (var db = new SupervisionDBDataContext())
            {
                List<DateTime> startDates = new List<DateTime>();
                List<DateTime> endDates = new List<DateTime>();

                dateRangesUsed = db.Designations.Where(
                x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                        x.Role == RoleDownList.SelectedValue).ToList();

            }
        
    }
    
}