<!--#include virtual="/webhooks/classes/aspJSON1.17.asp"-->
<!--#include virtual="/webhooks/includes/charge.captured.inc"-->
<!--#include virtual="/webhooks/includes/functions.inc"-->
<%

If Request.TotalBytes > 0 Then
  bytes = Request.TotalBytes
  sJson = BytesToStr(Request.BinaryRead(bytes))
  Set ojReq = new aspJSON
  ojReq.loadJSON(sJson)

  Select Case ojReq.data("type")
    Case "charge.captured"
      result = ProcessCharge(ojReq.JSONoutput())
    Case Else
      result = "403 Forbidden"
  End Select

End If

Response.Status = result
response.Write(Response.Status)
Response.End
%>

