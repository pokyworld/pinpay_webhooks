<%
Class Customer
  Public Card
  Public BillingAddress
  Private m_ID
  Private m_Invoice
  Private m_Email
  Private m_IpAddress

  Public Property Let ID(p_Data)
      m_ID = p_Data
  End Property

  Public Property Get ID()
     ID = m_ID
  End Property

  Public Property Let Invoice(p_Data)
      m_Invoice = p_Data
  End Property

  Public Property Get Invoice()
     Invoice = m_Invoice
  End Property

  Public Property Let Email(p_Data)
      m_Email = p_Data
  End Property

  Public Property Get Email()
     Email = m_Email
  End Property

  Public Property Let IpAddress(p_Data)
      m_IpAddress = p_Data
  End Property

  Public Property Get IpAddress()
     IpAddress = m_IpAddress
  End Property

End Class
%>