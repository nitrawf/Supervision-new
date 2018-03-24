<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StaffBusy.aspx.cs" Inherits="Reports_StaffBusy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>Busy staff report</h1>
		<p class="lead">Get the list of staff members, what they're doing, and when. </p>
    </div>
    <div class ="row">
        <div class="col-md-12" style="color: red;">
            <asp:GridView ID="GridView1" Width = "100%" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="StaffBusySql" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="reason" HeaderText="Reason" SortExpression="reason" >

                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Slot" SortExpression="MorningSlot" >
                        <ItemTemplate><%#Eval("MorningSlot").ToString().Equals("")? "Both" :((Boolean.Parse(Eval("MorningSlot").ToString())) ? "Morning" : "Evening")  %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="StaffID" HeaderText="Staff ID" SortExpression="StaffID" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="StaffBusySql" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [StaffBusy]"></asp:SqlDataSource>
         </div>
         <br />
    </div>
    <br />
    <asp:Button class="btn btn-default btn-primary" ID="downloadStaffBusy" runat="server" OnClick="downloadStaffBusy_Click" Text="Download as Excel" />
</asp:Content>

