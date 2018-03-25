<%@ Page Title="Exemptions" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestExemption.aspx.cs" Inherits="Admin_RequestExemption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>Request Exemption</h1>
    </div>

    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ExceptionID" DataSourceID="ExceptionsDataSource" DefaultMode="Insert" >
        <InsertItemTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The staff member to be exempted :</div>
                        <div class="col-md-6">
                            
                            <asp:DropDownList SelectedValue='<%# Bind("StaffID") %>' ID="StaffDropDownList" runat="server" DataSourceID="StaffDataSource" DataTextField="aggregate" DataValueField="StaffID" OnSelectedIndexChanged="FreeDatesChanged" AutoPostBack="true">
                            </asp:DropDownList>
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                        
                            The slot for which exemption is requested :
                        
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="MorningSlotList" runat="server" SelectedValue='<%# Bind("MorningSlot")  %>' OnSelectedIndexChanged="FreeDatesChanged"  AutoPostBack="true">
                                <asp:ListItem Value="true">Morning</asp:ListItem>
                                <asp:ListItem Value="false">Evening</asp:ListItem>
                                <asp:ListItem Value="">Both</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                        
                            The brief reason for exemption :</div>
                        <div class="col-md-6">
                            
                            <asp:TextBox Width="100%" ID="txtBriefReason" runat="server" Text='<%# Bind("BreifReason", "{0}") %>'></asp:TextBox>
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="You need to enter a Brief Reason at least." OnServerValidate="ServerValidationFilled"></asp:CustomValidator>
                        </div>
                    </div>
            
                    <div class="row">
                        <div class="col-md-6">
                        
                            The detailed reason for exemption :</div>
                        <div class="col-md-6">
                            
                            <asp:TextBox Width="100%" ID="TextBox2" runat="server" Text='<%# Bind("Description", "{0}") %>'></asp:TextBox>
                            
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="StaffValidator" runat="server" ErrorMessage="The staff member is unavailiable for the date range." OnServerValidate="ServerValidationStaff"></asp:CustomValidator>
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
                    
                </ContentTemplate>
                </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    
                    <div class="row">
                        <div class="col-md-6">
                            User granting the assignment : 
                        </div>
                        <div class="col-md-6">
                           <asp:TextBox Width="100%" ID="GrantedByUserName" runat="server" Text='<%# Bind("GrantedByUserName", "{0}") %>' ReadOnly="True" BackColor="LightGray"></asp:TextBox>
                                 </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            Date assignment was granted : 
                        </div>
                        <div class="col-md-6">
                          <asp:TextBox Width="100%" ID="GrantedDate" runat="server" Text='<%# Bind("GrantedDate") %>' ReadOnly="True" BackColor="LightGray"></asp:TextBox>
                              </div>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>

            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-default btn-sm" Width="100%"  />
                            <br />
                            <br />
                        </div>
                        <div class="col-md-3">
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default btn-sm" Width="100%" />
                            <br />
                            <br />
                        </div>
                    </div>
                </ContentTemplate>
             </asp:UpdatePanel>
            <br />
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="ExceptionsDataSource" runat="server" OnInserted="ExceptionsDataSource_OnInserted"  ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Exceptions] WHERE [ExpectionID] = @original_ExpectionID" InsertCommand="INSERT INTO [Exceptions] ([BreifReason], [StartDate], [EndDate], [Description], [MorningSlot], [StaffID], [GrantedByUserName], [GrantedDate]) VALUES (@BreifReason, @StartDate, @EndDate, @Description, @MorningSlot, @StaffID, @GrantedByUserName, @GrantedDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Exceptions] ORDER BY [ExpectionID]" UpdateCommand="UPDATE [Exceptions] SET [BreifReason] = @BreifReason, [StartDate] = @StartDate, [EndDate] = @EndDate, [Description] = @Description, [MorningSlot] = @MorningSlot, [StaffID] = @StaffID, [GrantedByUserName] = @GrantedByUserName, [GrantedDate] = @GrantedDate WHERE [ExpectionID] = @original_ExpectionID AND (([BreifReason] = @original_BreifReason) OR ([BreifReason] IS NULL AND @original_BreifReason IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([GrantedByUserName] = @original_GrantedByUserName) OR ([GrantedByUserName] IS NULL AND @original_GrantedByUserName IS NULL)) AND (([GrantedDate] = @original_GrantedDate) OR ([GrantedDate] IS NULL AND @original_GrantedDate IS NULL))">
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
		   concat([FirstName],' ',[LastName], ' - ',[Department], ',',[Designation], ' | ',[TypeOfStaff]) as aggregate

 from [darezik].[Staff]
           order by firstname"></asp:SqlDataSource>
    <asp:SqlDataSource ID="JoinedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Exceptions.ExpectionID, Exceptions.BreifReason, Exceptions.StartDate, Exceptions.EndDate, Exceptions.Description, Exceptions.MorningSlot, Exceptions.GrantedByUserName, Exceptions.GrantedDate, concat(Staff.FirstName,' ',Staff.LastName, ' - ',Staff.Department, ',',Staff.Designation, ' | ',Staff.TypeOfStaff) as aggregate  FROM Exceptions INNER JOIN Staff ON Exceptions.StaffID = Staff.StaffID"></asp:SqlDataSource>
    <asp:SqlDataSource ID="StaffBusyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [StaffBusy] ORDER BY [StaffID]"></asp:SqlDataSource>
    <br />
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                    <div class="row">
                        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ExpectionID" DataSourceID="JoinedDataSource" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"  Width="100%">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="ExpectionID" HeaderText="Exception ID" InsertVisible="False" ReadOnly="True" SortExpression="ExpectionID" />
                    <asp:BoundField DataField="BreifReason" HeaderText="Brief Reason" SortExpression="BreifReason" />
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString = "{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString = "{0:dd/MM/yyyy}"/>
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:TemplateField HeaderText="Slot" SortExpression="MorningSlot" >
                        <ItemTemplate><%#Eval("MorningSlot").ToString().Equals("")? "Both" :((Boolean.Parse(Eval("MorningSlot").ToString())) ? "Morning" : "Evening")  %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="GrantedByUserName" HeaderText="Granted By " SortExpression="GrantedByUserName" />
                    <asp:BoundField DataField="GrantedDate" HeaderText="Granted on Date" SortExpression="GrantedDate" DataFormatString = "{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="aggregate" HeaderText="Staff Details" ReadOnly="True" SortExpression="aggregate" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    </asp:Content>

