using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RequestExemption : System.Web.UI.Page
{ 
    protected void Page_Load(object sender, EventArgs e)
    {
        static List<Exceptions> dateRangesUsed { get; set; }
        if (!IsPostBack)
        {
            SetDateRangesWhichCannotBeUsed();
        }
    }

    private void SetDateRangesWhichCannotBeUsed()
    {
        DropDownList StaffDownList = FormView1.FindControl("StaffDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;
        if (StaffDownList != null && MorningSlotCheckBox != null)
            using (var db = new SupervisionDBDataContext())
            {
                List<DateTime> startDates = new List<DateTime>();
                List<DateTime> endDates = new List<DateTime>();

                dateRangesUsed = db.Exceptions.Where(
                x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                        x.Role == StaffDownList.SelectedValue).ToList();

            }
    }

    protected void ServerValidation(object source, ServerValidateEventArgs arguments)
    {
        //Makes sure that the date range is valid.
        Calendar Calendar1 = FormView1.FindControl("Calendar1") as Calendar;
        Calendar Calendar2 = FormView1.FindControl("Calendar2") as Calendar;
        if (Calendar1.SelectedDate != new DateTime() && Calendar2.SelectedDate != null && Calendar1.SelectedDate <= Calendar2.SelectedDate)
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
        DropDownList StaffDownList = FormView1.FindControl("StaffDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;


        Calendar Calendar1 = FormView1.FindControl("Calendar1") as Calendar;
        Calendar Calendar2 = FormView1.FindControl("Calendar2") as Calendar;

        if (Calendar1.SelectedDate != new DateTime() && Calendar2.SelectedDate != null && Calendar1.SelectedDate <= Calendar2.SelectedDate)
        {
            using (var db = new SupervisionDBDataContext())
            {

                arguments.IsValid = !db.Exceptions.Any(
                    x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                            x.Role == StaffDownList.SelectedValue &&
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

    protected void ExceptionsDataSource_OnInserted(Object sender, SqlDataSourceStatusEventArgs e)
    {
        System.Data.Common.DbCommand command = e.Command;

        GridView GridView1Code = UpdatePanel3.FindControl("GridView1") as GridView;
        GridView1Code.DataBind();
        ScriptManager.RegisterClientScriptBlock(GridView1Code, this.GetType(), "AlertMsg", "<script language='javascript'>$('html, body').animate({ scrollTop: $(document).height() }, 1000);</script>", false);
        SetDateRangesWhichCannotBeUsed();

        UpdatePanel3.Update();
    }

    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        EnableOrDisableDay(e);
    }

    private static void EnableOrDisableDay(DayRenderEventArgs e)
    {
        if (e.Day.Date < DateTime.Now.AddDays(-1))
        {
            e.Day.IsSelectable = false;
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
        DropDownList StaffDownList = FormView1.FindControl("StaffDownList") as DropDownList;
        CheckBox MorningSlotCheckBox = FormView1.FindControl("MorningSlotCheckBox") as CheckBox;
        using (var db = new SupervisionDBDataContext())
        {
            List<DateTime> startDates = new List<DateTime>();
            List<DateTime> endDates = new List<DateTime>();

            dateRangesUsed = db.Designations.Where(
            x => x.MorningSlot == MorningSlotCheckBox.Checked &&
                    x.Role == StaffDownList.SelectedValue).ToList();

        }

    }

    protected static void ExceptionGranted()
    {
        string userName = "";
        if (!IsPost)
        {
            userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            DateTime today = DateTime.Today;
            var db = Database.Open("Exceptions");
            var insertCommand = "INSERT INTO Exceptions (GrantedByUserName,GrantedDate) VALUES(@0,@1)";
            db.Execute(insertCommand, userName, today);
        }
    }
}
