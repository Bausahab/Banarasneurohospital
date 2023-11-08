<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="addExpenses.aspx.cs" Inherits="OIPD.addExpenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<div class="w3-row w3-center">
<div class="w3-col s3"><br /></div>
<div class="w3-col s6 w3-padding w3-card-4 w3-round w3-border w3-center w3-border-teal w3-sand">
<div class="w3-purple w3-padding">
<asp:Label ID="Label1" runat="server" CssClass="w3-xlarge"><b>Add Expenses</b></asp:Label>
<asp:Label ID="lblMsg" runat="server"></asp:Label>
</div>
<br />
<div class="w3-padding  w3-row">
    <asp:Label ID="lblExpDt" runat="server" CssClass="w3-col s3"><b>Date of Expense</b></asp:Label>
    <div class="w3-col s1">&nbsp;</div>
    <asp:TextBox ID="txtDate" runat="server" placeholder="Enter Expense Date" CssClass="w3-input w3-col s8 w3-pale-red"></asp:TextBox>
</div>
<div class="w3-padding w3-row">
    <asp:Label ID="lblExpName" runat="server" CssClass="w3-col s3"><b>Name of Expense</b></asp:Label>
    <div class="w3-col s1">&nbsp;</div>
    <asp:TextBox ID="txtExpName" runat="server" placeholder="Enter Expense Name" CssClass="w3-input w3-col s8 w3-pale-red"></asp:TextBox>
</div>
<div class="w3-padding w3-row">
    <asp:Label ID="lblExpAmt" runat="server" CssClass="w3-col s3"><b>Amount</b></asp:Label>
    <div class="w3-col s1">&nbsp;</div>
    <asp:TextBox ID="txtExpAmt" runat="server" placeholder="Enter Expense Amount" CssClass="w3-input w3-col s8 w3-pale-red"></asp:TextBox>
</div>
<asp:Button ID="bttnAddChrg" runat="server" CssClass="w3-purple w3-round-xlarge w3-large w3-card-2" Text="Add Charge" onclick="bttnAddChrg_Click" />
<br /><br />
<div class="w3-center">
<asp:GridView runat="server" ID="GridView" AutoGenerateColumns="False" DataKeyNames="receiptno" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ShowFooter="true" FooterStyle-BackColor="#000000">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="Patient No">
            <ItemTemplate>
                <%# IOPD.DataManager.RegistrationUtilities.GetRegistrationNo(Convert.ToInt32("patientno")) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="comments" HeaderText="Particulars" SortExpression="comments" />
        <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
        <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
                <%# IOPD.DataManager.DateUtilities.dateFormat("dateofexpense") %>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IODatabaseConnectionString %>" 
        SelectCommand="SELECT * FROM [expenses] WHERE ([patientno] = @patientno)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="patientno" QueryStringField="patientno" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<br />
</div>
</div>
<br />
<script type="text/javascript">
    $(function () {
        $(function () {
            var currentYear = (new Date).getFullYear();
            var currentMonth = (new Date).getMonth() + 1;
            var currentDay = (new Date).getDate();
            $("#datepicker").datepicker({ minDate: new Date((currentYear - 1), 12, 1), dateFormat: 'dd/mm/yy', maxDate: new Date(currentYear, 11, 31) });

            $("#ContentPlaceHolder1_txtDate").datepicker({

                changeMonth: true,
                changeYear: true,
                yearRange: '1950:currentYear',
                maxDate: '0',
                dateFormat: 'dd-M-yy',
                defaultDate: 'currentdate'
            });
        });
    });
</script>
</asp:Content>
