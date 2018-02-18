<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestException.aspx.cs" Inherits="Admin_RequestException" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


    <div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="StaffID" DataSourceID="StaffDataSource" DefaultMode="Insert" Height="508px" Width="804px">
            <InsertItemTemplate>
                The staff member to be exempted :<br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSource='<%# Bind("aggreate") %>' SelectedValue='<%# Bind("aggreate") %>' DataSourceID="StaffDataSource" DataTextField="aggreate" DataValueField="aggreate">
                </asp:DropDownList>
                <br />
                Start date of exemption :<asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("StartDate") %>'></asp:Calendar>
                End date of exemption :<asp:Calendar ID="Calendar2" runat="server" SelectedDate='<%# Bind("EndDate") %>'></asp:Calendar>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />

            </ItemTemplate>
        </asp:FormView>
    </div>
    <asp:SqlDataSource ID="ExceptionsDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Exceptions] WHERE [ExpectionID] = @original_ExpectionID AND (([BreifReason] = @original_BreifReason) OR ([BreifReason] IS NULL AND @original_BreifReason IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([GrantedByUserName] = @original_GrantedByUserName) OR ([GrantedByUserName] IS NULL AND @original_GrantedByUserName IS NULL)) AND (([GrantedDate] = @original_GrantedDate) OR ([GrantedDate] IS NULL AND @original_GrantedDate IS NULL))" InsertCommand="INSERT INTO [Exceptions] ([BreifReason], [StartDate], [EndDate], [Description], [MorningSlot], [StaffID], [GrantedByUserName], [GrantedDate]) VALUES (@BreifReason, @StartDate, @EndDate, @Description, @MorningSlot, @StaffID, @GrantedByUserName, @GrantedDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Exceptions] ORDER BY [StaffID]" UpdateCommand="UPDATE [Exceptions] SET [BreifReason] = @BreifReason, [StartDate] = @StartDate, [EndDate] = @EndDate, [Description] = @Description, [MorningSlot] = @MorningSlot, [StaffID] = @StaffID, [GrantedByUserName] = @GrantedByUserName, [GrantedDate] = @GrantedDate WHERE [ExpectionID] = @original_ExpectionID AND (([BreifReason] = @original_BreifReason) OR ([BreifReason] IS NULL AND @original_BreifReason IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([GrantedByUserName] = @original_GrantedByUserName) OR ([GrantedByUserName] IS NULL AND @original_GrantedByUserName IS NULL)) AND (([GrantedDate] = @original_GrantedDate) OR ([GrantedDate] IS NULL AND @original_GrantedDate IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ExpectionID" Type="Int32" />
            <asp:Parameter Name="original_BreifReason" Type="String" />
            <asp:Parameter DbType="Date" Name="original_StartDate" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
            <asp:Parameter Name="original_GrantedByUserName" Type="String" />
            <asp:Parameter DbType="Date" Name="original_GrantedDate" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BreifReason" Type="String" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="GrantedByUserName" Type="String" />
            <asp:Parameter DbType="Date" Name="GrantedDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BreifReason" Type="String" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="MorningSlot" Type="Boolean" />
            <asp:Parameter Name="StaffID" Type="Int32" />
            <asp:Parameter Name="GrantedByUserName" Type="String" />
            <asp:Parameter DbType="Date" Name="GrantedDate" />
            <asp:Parameter Name="original_ExpectionID" Type="Int32" />
            <asp:Parameter Name="original_BreifReason" Type="String" />
            <asp:Parameter DbType="Date" Name="original_StartDate" />
            <asp:Parameter DbType="Date" Name="original_EndDate" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
            <asp:Parameter Name="original_StaffID" Type="Int32" />
            <asp:Parameter Name="original_GrantedByUserName" Type="String" />
            <asp:Parameter DbType="Date" Name="original_GrantedDate" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="StaffDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select 
        StaffID,
[EmployeeCode]
           ,[TypeOfStaff]
           ,[FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[Department]
           ,[Designation],
		   concat([EmployeeCode],' ',[FirstName],' ',[LastName], ' - ',[Department], ',',[Designation], ' | ',[TypeOfStaff]) as aggreate

 from [darezik].[Staff]
           order by firstname"></asp:SqlDataSource>
    <br />
    
</asp:Content>

