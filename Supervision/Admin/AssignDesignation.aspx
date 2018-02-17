<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssignDesignation.aspx.cs" Inherits="Admin_AssignDesignation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="jumbotron">
        <h1>Assign Designation</h1>
    </div>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="DesignationID" DataSourceID="DesignationDataSource" DefaultMode="Insert" >
                <InsertItemTemplate>
                    
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" >
        <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                            Designation to be assigned:
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="RoleDownList" SelectedValue='<%# Bind("Role") %>' DataSourceID="RolesDataSource" DataTextField="RoleName" DataValueField="RoleName" runat="server" Width="100%" OnSelectedIndexChanged="FreeDatesChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Morning(checked)/Evening(unchecked):
                        </div>
                        <div class="col-md-6">
                            <asp:CheckBox ID="MorningSlotCheckBox" runat="server" Checked='<%# Bind("MorningSlot") %>' AutoPostBack="true" OnCheckedChanged="FreeDatesChanged"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            Start date of the assignment:
                        </div>
                        <div class="col-md-6">
                            <asp:Calendar ID="Calendar1" SelectedDate='<%# Bind("StartDate") %>' runat="server" OnDayRender="Calendar1_DayRender" ></asp:Calendar>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="End date should be after the start date." OnServerValidate="ServerValidation"></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            End date of the assignment:
                        </div>
                        <div class="col-md-6">
                            <asp:Calendar ID="Calendar2" SelectedDate='<%# Bind("EndDate") %>' runat="server" OnDayRender="Calendar1_DayRender"></asp:Calendar>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="The designation has already been filled for that date range and slot (overlap)." OnServerValidate="ServerValidationFilled"></asp:CustomValidator>
                        </div>
                    </div>
            
                    <div class="row">
                        <div class="col-md-6">
                            The staff member to be assigned:
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="StaffDropDownList" SelectedValue='<%# Bind("StaffID") %>' DataSourceID="StaffDataSource" DataTextField="aggreate" DataValueField="StaffID" runat="server" Width="100%"></asp:DropDownList>
                        </div>
                    </div>
            
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="StaffValidator" runat="server" ErrorMessage="The staff member is unavailiable for the date range." OnServerValidate="ServerValidationStaff"></asp:CustomValidator>
                        </div>
                    </div>
                    </ContentTemplate>
        </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            </div>
                        <div class="col-md-3">
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-lg"  />
                    <br />
                    <br />
                        </div>
                        <div class="col-md-3">
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary btn-lg" />
                    <br />
                    <br />
                             </div>
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="RolesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Roles]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DesignationDataSource" runat="server" OnInserted="DesignationDataSource_OnInserted" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Designations]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Designations] WHERE [DesignationID] = @original_DesignationID AND (([Role] = @original_Role) OR ([Role] IS NULL AND @original_Role IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL))" InsertCommand="INSERT INTO [Designations] ([Role], [MorningSlot], [StartDate], [EndDate], [StaffID]) VALUES (@Role, @MorningSlot, @StartDate, @EndDate, @StaffID)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Designations] SET [Role] = @Role, [MorningSlot] = @MorningSlot, [StartDate] = @StartDate, [EndDate] = @EndDate, [StaffID] = @StaffID WHERE [DesignationID] = @original_DesignationID AND (([Role] = @original_Role) OR ([Role] IS NULL AND @original_Role IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_DesignationID" Type="Int32" />
                    <asp:Parameter Name="original_Role" Type="String" />
                    <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="original_StartDate" />
                    <asp:Parameter DbType="Date" Name="original_EndDate" />
                    <asp:Parameter Name="original_StaffID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Role" Type="String" />
                    <asp:Parameter Name="MorningSlot" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="StaffID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Role" Type="String" />
                    <asp:Parameter Name="MorningSlot" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="StaffID" Type="Int32" />
                    <asp:Parameter Name="original_DesignationID" Type="Int32" />
                    <asp:Parameter Name="original_Role" Type="String" />
                    <asp:Parameter Name="original_MorningSlot" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="original_StartDate" />
                    <asp:Parameter DbType="Date" Name="original_EndDate" />
                    <asp:Parameter Name="original_StaffID" Type="Int32" />
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
		   concat([FirstName],' ',[LastName], ' - ',[Department], ',',[Designation], ' | ',[TypeOfStaff]) as aggreate

 from [darezik].[Staff]
           order by firstname"></asp:SqlDataSource>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="JoinedDataSource" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" DataKeyNames="DesignationID" Width="100%">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:CheckBoxField DataField="MorningSlot" HeaderText="MorningSlot" SortExpression="MorningSlot" />
                    <asp:TemplateField HeaderText="Slot" SortExpression="MorningSlot" >
                        <ItemTemplate><%# (Boolean.Parse(Eval("MorningSlot").ToString())) ? "Morning" : "Evening" %></ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString = "{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString = "{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="StaffDetails" HeaderText="StaffDetails" ReadOnly="True" SortExpression="StaffDetails" />
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
                            </div>
                        </div>
            <asp:SqlDataSource ID="JoinedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [DesignationID]
      ,[Role]
      ,[MorningSlot]
      ,[StartDate]
      ,[EndDate]
      ,[Designations].[StaffID]
	  ,concat([FirstName],' ',[LastName], ' - ',[Department], ',',[Designation], ' | ',[TypeOfStaff]) as StaffDetails
  FROM [SupervisionDB].[darezik].[Designations]
  inner join [SupervisionDB].[darezik].Staff 
  on [Designations].StaffID = Staff.StaffID" DeleteCommand="DELETE FROM Designations WHERE (DesignationID = @DesignationID)">
                <DeleteParameters>
                    <asp:Parameter Name="DesignationID" />
                </DeleteParameters>
            </asp:SqlDataSource>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

