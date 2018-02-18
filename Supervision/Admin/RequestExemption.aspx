<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestExemption.aspx.cs" Inherits="Admin_RequestExemption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="jumbotron">
        <h1>Request Exemption</h1>
    </div>

    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ExceptionID" DataSourceID="ExemptionsDataSource" DefaultMode="Insert">
        <InsertItemTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The staff member to be exempted :</div>
                        <div class="col-md-6">
                            
                            <asp:DropDownList ID="StaffDownList" runat="server" DataSourceID="StaffDataSource" DataTextField="aggregate" DataValueField="StaffID" SelectedValue='<%# Bind("StaffID", "{0}") %>'>
                            </asp:DropDownList>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="StaffValidator" runat="server" ErrorMessage="The staff member cannot be exempted for the date range " OnServerValidate="ServerValidationStaff"></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        
                            The brief reason for exemption :</div>
                        <div class="col-md-6">
                            
                            <asp:TextBox ID="ReasonTextBox" runat="server" Text='<%# Bind("BreifReason", "{0}") %>'></asp:TextBox>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="ReasonValidator" runat="server" ErrorMessage="Enter the brief reason for exemption." OnServerValidate="ServerValidationReason"></asp:CustomValidator>
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
                        <div class="col-md-12" style="color: red;">
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="End date should be after the start date." OnServerValidate="ServerValidation"></asp:CustomValidator>
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
    <asp:SqlDataSource ID="ExemptionsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" OnInserted="ExemptionsDataSource_OnInserted" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Exemptions] ORDER BY [ExpectionID]">
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
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ExpectionID" DataSourceID="ExemptionsDataSource">
                <Columns>
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    </asp:Content>

