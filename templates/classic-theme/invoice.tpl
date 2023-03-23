<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>{INVOICE_NO} Invoice</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>
  <style>
    body {
      font-family: 'Times New Roman', Times, serif;
      font-size: 12pt;
      font-weight: 400;
      line-height: 1.15;
    }

    .leftAlign {
      text-align: left;
      justify-content: left;
      justify-items: left;
      float: left;
      padding-left: 5px;
    }

    .rightAlign {
      text-align: right;
      justify-content: right;
      justify-items: right;
      float: right;
      padding-right: 5px;
    }

    .centerAlign {
      text-align: center;
      justify-content: center;
      justify-items: center;
    }

    .invoiceheading {
      font-size: 18pt;
      font-weight: bolder;
    }

    .border-bottom-black {
      border-bottom: 2px solid black;
    }

    .bold-font {
      font-weight: 600;
    }

    .customerInfo {
      margin-left: 70px;
    }

    th {
      text-align: center;
      justify-content: center;
      font-weight: 600;
      padding: 5px;
      border: 1px solid black;
      background-color: lightgrey;
    }

    .nostyle {
      all: unset;
      border: none;
    }

    .borderAll {
      border: 1px solid black;
    }

    table {
      border-collapse: collapse;
    }

    .paidInvoice {
      color: red;
      font-size: 16pt;
      font-style: italic;
      font-weight: bolder;
    }

    .lineHeight {
      line-height: 0.5;
    }

    .lineBottom {
      height: 2px;
      border-width: 0;
      color: black;
      background-color: black;
    }

    #content {
      margin-top: 20px;
    }
  </style>
</head>

<body class="container-fluid body">
  <h1 style="display:none;">JOBTOTOP</h1>
  <table width="100%">
    <tr>
      <td>
        <div class="leftAlign "><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt="{SITE_TITLE}"></div>
      </td>
      <td>
        <div class="rightAlign invoiceheading">Invoice</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign bold-font">&nbsp;</div>
      </td>
      <td>
        <div class="rightAlign">Invoice #: {INVOICE_NO}</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign ">&nbsp;</div>
      </td>
      <td>
        <div class="rightAlign">Date: {TRANSACTION_TIME}</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign ">&nbsp;</div>
      </td>
      <td>
        <div class="rightAlign">Due Date: {TRANSACTION_TIME}</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign ">&nbsp;</div>
      </td>
      <td>
        <div class="rightAlign">Payment Status: <span class="bold-font">{STATUS}</span>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign ">&nbsp;</div>
      </td>
      <td>
        <div class="rightAlign"> </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign ">‎</div>
      </td>
      <td>
        <div class="rightAlign">‎</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign bold-font">&nbsp;&nbsp;&nbsp;Bill to:</div>
      </td>
      <td>
        <div class="rightAlign">Total Amount: {AMOUNT} USD</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign customerInfo">{NAME}</div>
      </td>
      <td class="border-bottom-black">
        <div class="rightAlign">‎</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign customerInfo">{CITY}</div>
      </td>
      <td>
        <div class="rightAlign bold-font">Total Due: IF('{STATUS}' != "success"){ {AMOUNT} USD {ELSE} 0.00 USD {:IF}
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign customerInfo">{COUNTRY}</div>
      </td>
      <td>
        <div class="rightAlign"></div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="leftAlign customerInfo">{EMAIL}</div>
      </td>
      <td>
        <div class="rightAlign"></div>
      </td>
    </tr>
  </table>
  <table id="content" width="100%">
    <th>Description / Memo</th>
    <th>Amount</th>
    <th class="nostyle"></th>
    <tr>
      <td class="borderAll">
        <div class="leftAlign">{TRANSACTION_DESCRIPTION} </div>
      </td>
      <td width="200px" class="borderAll">
        <div class="rightAlign">{AMOUNT} USD</div>
      </td>
      <td width="200px" class="borderAll">
        <div class="rightAlign">{AMOUNT} USD</div>
      </td>
    </tr>
    <tr>
      <td class="borderAll">
        <div class="leftAlign">VAT @ 5% included</div>
      </td>
      <td class="borderAll" width="200px">
        <div id="vatamount" class="rightAlign">0.00 USD</div>
      </td>
      <td class="borderAll" width="200px">
        <div id="vatamount2" class="rightAlign">0.00 USD</div>
      </td>
    </tr>
    <tr>
      <td>
        <div class="rightAlign bold-font">Total Amount</div>
      </td>
      <td class="borderAll" width="200px">
        <div id="totalamount" class="bold-font rightAlign">{AMOUNT} USD</div>
      </td>
      <td class="nostyle"></td>
    </tr>
  </table>
  <div class=" lineHeight">
    <p>The recipent of this service will account for VAT on the reverse charge basis, if applicable</p>
    <p class="centerAlign paidInvoice lineHeight">PAID INVOICE</p>
    <p class="centerAlign paidInvoice lineHeight">THIS INVOICE IS FOR YOUR RECORD</p>
  </div>
  <hr class="lineBottom">
  <table width="100%">
    <tr>
      <td class="centerAlign bold-font">Date: {TRANSACTION_TIME}</td>
      <td class="centerAlign bold-font">Terms: Due upon receipt</td>
      <td class="centerAlign bold-font">Due Date: {TRANSACTION_TIME}</td>
    </tr>
  </table>
  <script>
var amount = {AMOUNT};
var vatamount = document.getElementById("vatamount");
var vatamount2 = document.getElementById("vatamount2");
var totalamount = document.getElementById("totalamount");
var vat = amount * 0.05;
vat = parseFloat(vat.toFixed(2));
vatamount.innerHTML = vat + " USD";
vatamount2.innerHTML = vat + " USD";
totalamount.innerHTML = (amount + vat).toFixed(2) + " USD";

  </script>
</body>

</html>