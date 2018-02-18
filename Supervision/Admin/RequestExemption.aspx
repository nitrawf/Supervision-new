<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestExemption.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>Request Exemption</h1>
    </div>

    <br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ExceptionsDataSource" DefaultMode="Insert">
        <InsertItemTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The staff member to be exempted :</div>
                        <div class="col-md-6">
                            
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="StaffDataSource" DataTextField="aggregate" DataValueField="StaffID">
                            </asp:DropDownList>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The brief reason for exemption :</div>
                        <div class="col-md-6">
                            
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BreifReason", "{0}") %>'></asp:TextBox>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The whole reason for exemption :</div>
                        <div class="col-md-6">
                            
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description", "{0}") %>'></asp:TextBox>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The slot for which exemption is requested - Morning(checked)/Evening(unchecked):
                        
                        </div>
                        <div class="col-md-6">
                            
                            <asp:CheckBox ID="MorningSlotCheckBox" runat="server" Checked='<%# Bind("MorningSlot") %>' />
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The start date of exemption :</div>
                        <div class="col-md-6">
                            
                            <asp:Calendar ID="Calendar1" runat="server" SelectedDate='<%# Bind("StartDate") %>'></asp:Calendar>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The end date of exemption :</div>
                        <div class="col-md-6">

                            <asp:Calendar ID="Calendar2" runat="server" SelectedDate='<%# Bind("EndDate") %>'></asp:Calendar>
                            
                        </div>
                    </div>
                    
                    


                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">

                <ContentTemplate>

                    <div class="row">
                        <div class="col-md-6">
                        
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary btn-lg" Text="Insert" /></div>
                        <div class="col-md-6">
                            
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary btn-lg" />
                            
                        </div>
                    </div>

                    
                </ContentTemplate>

            </asp:UpdatePanel>
            <br />
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="ExceptionsDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Exceptions] WHERE [ExpectionID] = @original_ExpectionID AND (([BreifReason] = @original_BreifReason) OR ([BreifReason] IS NULL AND @original_BreifReason IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([GrantedByUserName] = @original_GrantedByUserName) OR ([GrantedByUserName] IS NULL AND @original_GrantedByUserName IS NULL)) AND (([GrantedDate] = @original_GrantedDate) OR ([GrantedDate] IS NULL AND @original_GrantedDate IS NULL))" InsertCommand="INSERT INTO [Exceptions] ([BreifReason], [StartDate], [EndDate], [Description], [MorningSlot], [StaffID], [GrantedByUserName], [GrantedDate]) VALUES (@BreifReason, @StartDate, @EndDate, @Description, @MorningSlot, @StaffID, @GrantedByUserName, @GrantedDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Exceptions] ORDER BY [ExpectionID]" UpdateCommand="UPDATE [Exceptions] SET [BreifReason] = @BreifReason, [StartDate] = @StartDate, [EndDate] = @EndDate, [Description] = @Description, [MorningSlot] = @MorningSlot, [StaffID] = @StaffID, [GrantedByUserName] = @GrantedByUserName, [GrantedDate] = @GrantedDate WHERE [ExpectionID] = @original_ExpectionID AND (([BreifReason] = @original_BreifReason) OR ([BreifReason] IS NULL AND @original_BreifReason IS NULL)) AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([MorningSlot] = @original_MorningSlot) OR ([MorningSlot] IS NULL AND @original_MorningSlot IS NULL)) AND (([StaffID] = @original_StaffID) OR ([StaffID] IS NULL AND @original_StaffID IS NULL)) AND (([GrantedByUserName] = @original_GrantedByUserName) OR ([GrantedByUserName] IS NULL AND @original_GrantedByUserName IS NULL)) AND (([GrantedDate] = @original_GrantedDate) OR ([GrantedDate] IS NULL AND @original_GrantedDate IS NULL))">
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
    <asp:SqlDataSource ID="StaffBusyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [StaffBusy] ORDER BY [StaffID]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ExpectionID" DataSourceID="ExceptionsDataSource">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="ExpectionID" HeaderText="ExpectionID" InsertVisible="False" ReadOnly="True" SortExpression="ExpectionID" />
            <asp:BoundField DataField="BreifReason" HeaderText="BreifReason" SortExpression="BreifReason" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CheckBoxField DataField="MorningSlot" HeaderText="MorningSlot" SortExpression="MorningSlot" />
            <asp:BoundField DataField="StaffID" HeaderText="StaffID" SortExpression="StaffID" />
            <asp:BoundField DataField="GrantedByUserName" HeaderText="GrantedByUserName" SortExpression="GrantedByUserName" />
            <asp:BoundField DataField="GrantedDate" HeaderText="GrantedDate" SortExpression="GrantedDate" />
        </Columns>
    </asp:GridView>
</asp:Content>

