<!--#include virtual="/webhooks/classes/aspJSON1.17.asp"-->
<!--#include virtual="/webhooks/classes/pp_charge.asp"-->
<!--#include virtual="/webhooks/classes/customer.asp"-->
<!--#include virtual="/webhooks/classes/address.asp"-->
<!--#include virtual="/webhooks/classes/c_card.asp"-->
<!--#include virtual="/webhooks/includes/functions.inc"-->
<%
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0

' Set conn = Server.CreateObject("ADODB.Connection")
' conn.ConnectionString = Application.COntnts("DbConnString")
' conn.Open

Dim objFSO, Err
Set objFSO=CreateObject("Scripting.FileSystemObject")

If Request.TotalBytes > 0 Then
  bytes = Request.TotalBytes
  sJson = BytesToStr(Request.BinaryRead(bytes))
  Set ojReq = new aspJSON
  ojReq.loadJSON(sJson)

'// Parse response
  Set newCharge = New PPCharge
  Set newCustomer = New Customer
  Set newCard = New CCard
  Set newAddress = New Address

  newAddress.AddrName = "Billing"
  newAddress.Line1 = ojReq.data("data")("card")("address_line1")
  newAddress.Line2 = ojReq.data("data")("card")("address_line2")
  newAddress.City = ojReq.data("data")("card")("address_city")
  newAddress.Zip = ojReq.data("data")("card")("address_postcode")
  newAddress.State = ojReq.data("data")("card")("address_state")
  newAddress.CountryIso = ojReq.data("data")("card")("address_country")
  Set newCustomer.BillingAddress = newAddress
  Set newAddress = Nothing

  newCard.Token = ojReq.data("data")("card")("token")
  newCard.Scheme = ojReq.data("data")("card")("scheme")
  newCard.CardString = ojReq.data("data")("card")("display_number")
  newCard.CardName = ojReq.data("data")("card")("name")
  newCard.ExpiryMM = Pad(ojReq.data("data")("card")("expiry_month"), "start", "0", 2)
  newCard.ExpiryYYYY = ojReq.data("data")("card")("expiry_year")
  Set newCustomer.Card = newCard
  Set newCard = Nothing

  newCustomer.ID = ojReq.data("data")("metadata")("customer")
  newCustomer.Invoice = ojReq.data("data")("metadata")("invoice")
  newCustomer.Email = ojReq.data("data")("email")
  newCustomer.IpAddress = ojReq.data("data")("ip_address")
  Set newCharge.Customer = newCustomer
  Set newCustomer = Nothing

  newCharge.ID = ojReq.data("data")("token")
  newCharge.Success = ojReq.data("data")("success")
  newCharge.Status = ojReq.data("data")("status_message")
  newCharge.Amount = ojReq.data("data")("amount")
  newCharge.Curency = ojReq.data("data")("currency")
  newCharge.DateTime = ojReq.data("data")("created_at")
  newCharge.Description = ojReq.data("data")("description")
  newCharge.EventId = ojReq.data("token")
  newCharge.EventType = ojReq.data("type")
  newCharge.JSON = ojReq.JSONoutput()

  Set ojReq = Nothing

'// Write raw response to log
  outF = "/webhooks/log/" & Left(LogDt(Now), 8) & "_ChargeLog.txt"
  outFile=Server.MapPath(outF)

  Set objFile = objFSO.OpenTextFile(outFile, ForAppending, True, TristateTrue)
  objFile.WriteLine "-- " & FormatDtTime(Now) & " | WEBHOOK" & vbCrLf &  newCharge.JSON  & vbCrLf

'// Create SQL statement(s) for database
  sql = "INSERT INTO dbo.pp_transactions (eventId, eventType, customer_id, invoice_id, " & vbCrlf
  sql = sql & "pay_id, pay_status, pay_currency, pay_amount, pay_notes, created_at) VALUES (" & vbCrlf
  sql = sql & "'" & newCharge.EventId & "', " & vbCrlf
  sql = sql & "'" & newCharge.EventType & "', " & vbCrlf
  sql = sql & "'" & newCharge.Customer.ID & "', " & vbCrlf
  sql = sql & "'" & newCharge.Customer.Invoice & "', " & vbCrlf
  sql = sql & "'" & newCharge.ID & "', " & vbCrlf
  sql = sql & "'" & UCase(newCharge.Status) & "', " & vbCrlf
  sql = sql & "'" & newCharge.Curency & "', " & vbCrlf
  sql = sql & "'" & FormatNumber(newCharge.Amount / 100, 2) & "', " & vbCrlf
  sql = sql & "'" & newCharge.Description & "', " & vbCrlf
  sql = sql & "'" & FormatDtTime(newCharge.DateTime) & "');"
  objFile.WriteLine "-- " & FormatDtTime(Now) & " | SQL:TRANS" & vbCrLf &  sql  & vbCrLf
  ' conn.Execute(sql)

  sql = "UPDATE dbo.invoices SET "
  sql = sql & "pay_status = '" & newCharge.Status & "', " & vbCrLf
  sql = sql & "pay_amount = '" & FormatNumber(newCharge.Amount / 100, 2) & "', " & vbCrLf
  sql = sql & "pay_ref = '" & newCharge.ID & "', " & vbCrLf
  sql = sql & "pay_card = '" & newCharge.Customer.Card.CardString & "', " & vbCrLf
  sql = sql & "updated_at = '" & FormatDtTime(newCharge.DateTime) & "', " & vbCrLf
  sql = sql & "WHERE invoice = '" & newCharge.Customer.Invoice & "', " & vbCrLf
  sql = sql & "AND customerId = '" & newCharge.Customer.ID & "';"
  objFile.WriteLine "-- " & FormatDtTime(Now) & " | SQL:INVOICE" & vbCrLf &  sql  & vbCrLf
  ' conn.Execute(sql)

  objFile.Close
  Set objFile = Nothing

End If
Set objFSO = Nothing
Set newCharge = Nothing
' Set conn = Nothing

Response.Status = "200 OK"
response.Write(Response.Status)
Response.End
%>

