﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printPaymentBill.aspx.cs" Inherits="OIPD.printPaymentBill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Print</title>
    <link rel="Stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font"/>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>

    <script type="text/javascript">
        function printpage() {
            var printButton = document.getElementById("printForm");
            printButton.style.visibility = 'hidden';
            window.print()
            printButton.style.visibility = 'visible';
        }
    </script>
    <style type="text/css">
    .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 20px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 14px;
        line-height: 20px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #333;
    }
    
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    
    .invoice-box table td {
        padding: 3px;
        vertical-align: top;
    }
    
    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }
    
    .invoice-box table tr.top table td {
        padding-bottom: 10px;
    }
    
    .invoice-box table tr.top table td.title {
        font-size: 40px;
        line-height: 40px;
        color: #333;
    }
    
    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }
    
    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }
    
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
    }
    
    .invoice-box table tr.item.last td {
        border-bottom: none;
    }
    
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }
        
        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }
    
    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    </style>
</head>
<body><br />
    <form id="form1" runat="server">
    <div class="w3-center invoice-box w3-card">
<table cellspacing="0" cellpadding="0">
<tr class="top">
    <td>
        <table width="100%">
        <tr>
        <td colspan="1" class="w3-left"><img src="Resources/geetanjaliLogo.png" alt="hospital_logo" height="100" width="100" /></td>
        <td colspan="2">
        <div>
        <center>
        <label style="font-size:2">Reged No. : RMEE2235763 </label><br/>
        <label class="w3-large w3-center title"><b>Banaras Neuro Hospital<br /></label>
        <!--<label class="w3-xlarge w3-center title"><b>गीतांजलि लाइफ केयर एंड सर्जिकल सेंटर ट्रामा एंड क्रिटिकल केयर</b></label>-->
        <br />
        <label class="w3-center">B37, 81-19 Ahilyabai Colony Bhogabir Lanka, Varanasi</label>
        
        <label class="w3-center">Uttar Pradesh 231305</label></center>
        </div>
        </td>
        <td colspan="1" class="w3-right"><b>Email -:</b><br/>geetanjalihospitalvns@gmail.com<br/>
        <b>Phone -:</b><br/>8299208005 , 9369074109<br />
        </td>
        </tr>
        </table>
        <asp:Label CssClass="w3-border-bottom w3-border-black" Width="100%" ID="ksjd" runat="server" Text=""/>
    </td>
</tr>
<tr>
    <td>
        <table width="100%" border="0">
        <tr>
            <td colspan="6"><center><label class="w3-large w3-center w3-xlarge w3-border w3-border-black" id="billHead" runat="server"><b>&nbsp;&nbsp;PAYMENT RECEIPT&nbsp;&nbsp;</b></label></center></td>
        </tr>
        <tr>
            <td class="w3-left heading"><b>Patient No -:</b></td>
            <td><asp:label ID="regNumber" CssClass="w3-left details" runat="server"/></td>
            <td></td>
            <td></td>
            <td class="w3-left heading"><b>Date -:</b></td>
            <td><asp:label ID="dateOfEntry" runat="server" CssClass="w3-left details"/></td>
        </tr>
        <tr>
            <td class="w3-left heading"><b>First Name -: </b></td>
            <td><asp:label ID="lblfirstname" CssClass="w3-left details" runat="server"/></td>
            <td class="w3-left heading"><b>Last Name-: </b></td>
            <td><asp:label ID="lbllastname" CssClass="w3-left details" runat="server"/></td>
            <td class="w3-left heading"><b>Father/Husband-: </b></td>
            <td><asp:label ID="lblfather_w_o" runat="server" CssClass="w3-left details"/></td>
        </tr>
        <tr>
        <td colspan="6" class="heading w3-center"><asp:Label ID="lblTotalExp" CssClass="w3-gray" Width="100%" runat="server"><b>Total Expenses</b></asp:Label></td>
        </tr>
        <tr>
        <td colspan="6">
            <asp:GridView ID="gvExpenses" CssClass="w3-table w3-center w3-centered" runat="server" Width="100%" ShowFooter="true"></asp:GridView>
        </td>
        </tr>
        <tr>
        <td colspan="6" class="heading w3-center"><asp:Label ID="lblTotalPay" CssClass="w3-gray" Width="100%" runat="server"><b>Total Payments</b></asp:Label></td>
        </tr>
        <tr>
        <td colspan="6">
            <table id="payTable" style="border-spacing:0px" runat="server" width="100%" border="1">
            <tr>
                <td><asp:Label ID="lblpydt" CssClass="w3-left" runat="server"><b>Date</b></asp:Label></td>
                <td colspan="4"><asp:Label CssClass="w3-left" ID="Label2py" runat="server"><b>Particulars</b></asp:Label></td>
                <td><asp:Label ID="Label3py" runat="server" CssClass="w3-left"><b>Amount</b></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblpyDate" CssClass="w3-left" runat="server"></asp:Label></td>
                <td colspan="4"><asp:Label CssClass="w3-left" ID="lblpyPart" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblpyAmt" runat="server" CssClass="w3-left"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblpyNone" CssClass="w3-left" runat="server"></asp:Label></td>
                <td colspan="4"><asp:Label CssClass="w3-left" ID="lblpyTotal" runat="server"><b>Total</b></asp:Label></td>
                <td><asp:Label ID="lblpyTotalAmt" runat="server" CssClass="w3-left"></asp:Label></td>
            </tr>
            </table>
        </td>
        </tr>
        <tr>
            <td colspan="3"><asp:Label ID="lblDueExtra" runat="server" CssClass="w3-right"></asp:Label></td>
            <td colspan="3"><asp:Label ID="lblDueExtraAmount" runat="server" CssClass="w3-left"></asp:Label></td>
        </tr>
        </table>
        <asp:Label CssClass="w3-border-bottom w3-border-black" Width="100%" ID="Label1" runat="server" Text=""/>
    </td>
</tr>
<tr><td></td></tr>
<tr><td></td></tr>
</table>
<input type="button" value="Print" id="printForm" onclick="printpage()" />
</div>
    </form>
</body>
</html>