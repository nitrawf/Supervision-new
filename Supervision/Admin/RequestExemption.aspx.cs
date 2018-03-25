using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RequestExemption : System.Web.UI.Page
{
    static List<StaffBusy> DateRangesUsed { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SetDateRangesWhichCannotBeUsed();

        }
        ShowUserAndDate();
    }

    private void ShowUserAndDate()
    {
        if (FormView1.FindControl("GrantedByUserName") is TextBox GrantedByUserName && FormView1.FindControl("GrantedDate") is TextBox GrantedDate)
        {
            GrantedByUserName.Text = User.Identity.Name;
            GrantedDate.Text = DateTime.Now.ToString();
        }
        if(FormView1.FindControl("UpdatePanel4") is UpdatePanel UpdatePanel4)
            UpdatePanel4.Update();
    }

    private void SetDateRangesWhichCannotBeUsed()
    {
        if (FormView1.FindControl("StaffDropDownList") is DropDownList StaffDropDownList && FormView1.FindControl("MorningSlotList") is DropDownList MorningSlotList)
            using (var db = new SupervisionDBDataContext())
            {
                DateRangesUsed = db.StaffBusies.Where(x =>
                        x.StaffID.ToString() == StaffDropDownList.SelectedValue).ToList();

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
        TextBox txtBriefReason = FormView1.FindControl("txtBriefReason") as TextBox;



        if (txtBriefReason.Text.Trim() != "")
        {
            arguments.IsValid = true;
        }
        else
        {
            arguments.IsValid = false;
        }

    }
    protected void ServerValidationStaff(object source, ServerValidateEventArgs arguments)
    {
        //Makes sure that the staff member is not busy for this time period/position/slot.

        DropDownList StaffDropDownList = FormView1.FindControl("StaffDropDownList") as DropDownList;
        DropDownList MorningSlotList = FormView1.FindControl("MorningSlotList") as DropDownList;

        Calendar Calendar1 = FormView1.FindControl("Calendar1") as Calendar;
        Calendar Calendar2 = FormView1.FindControl("Calendar2") as Calendar;

        if (Calendar1.SelectedDate != new DateTime() && Calendar2.SelectedDate != null && Calendar1.SelectedDate <= Calendar2.SelectedDate)
        {
            using (var db = new SupervisionDBDataContext())
            {

                var staffIsBusy = db.StaffBusies.Where(
                    x =>
                            x.StaffID.ToString() == StaffDropDownList.SelectedValue && x.MorningSlot.ToString() == MorningSlotList.SelectedValue &&
                            (x.EndDate >= Calendar1.SelectedDate &&
                            x.StartDate <= Calendar2.SelectedDate)).ToList();   //Making sure ranges do not overlap
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

    protected void ExceptionsDataSource_OnInserted(Object sender, SqlDataSourceStatusEventArgs e)
    {
        //System.Data.Common.DbCommand command = e.Command;

        GridView GridView1Code = UpdatePanel3.FindControl("GridView1") as GridView;
        GridView1Code.DataBind();
        ScriptManager.RegisterClientScriptBlock(GridView1Code, this.GetType(), "AlertMsg", "<script language='javascript'>$('html, body').animate({ scrollTop: $(document).height() }, 1000);</script>", false);
        SetDateRangesWhichCannotBeUsed();
        ShowUserAndDate();

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


        if (DateRangesUsed.Any(
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
        DropDownList StaffDropDownList = FormView1.FindControl("StaffDropDownList") as DropDownList;
        DropDownList MorningSlotList = FormView1.FindControl("MorningSlotList") as DropDownList;
        using (var db = new SupervisionDBDataContext())
        {
            List<DateTime> startDates = new List<DateTime>();
            List<DateTime> endDates = new List<DateTime>();

            DateRangesUsed = db.StaffBusies.Where(
            x => x.MorningSlot.ToString() == MorningSlotList.SelectedValue &&
                    x.StaffID.ToString() == StaffDropDownList.SelectedValue).ToList();

        }

    }

    protected static void ExceptionGranted()
    {
        /*
        string userName = "";
        if (!IsPost)
        {
            userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            DateTime today = DateTime.Today;
            var db = Database.Open("Exceptions");
            var insertCommand = "INSERT INTO Exceptions (GrantedByUserName,GrantedDate) VALUES(@0,@1)";
            db.Execute(insertCommand, userName, today);
        }
        */
    }
}
