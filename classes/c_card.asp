<%
Class CCard
  Public BillingAddress
  Private m_Token
  Private m_Scheme
  Private m_CardString
  Private m_CardName
  Private m_ExpiryMM
  Private m_ExpiryYYYY

  Public Property Let Token(p_Data)
      m_Token = p_Data
  End Property

  Public Property Get Token()
     Token = m_Token
  End Property

  Public Property Let Scheme(p_Data)
      m_Scheme = p_Data
  End Property

  Public Property Get Scheme()
     Scheme = m_Scheme
  End Property

  Public Property Let CardString(p_Data)
      m_CardString = p_Data
  End Property

  Public Property Get CardString()
     CardString = m_CardString
  End Property

  Public Property Let CardName(p_Data)
      m_CardName = p_Data
  End Property

  Public Property Get CardName()
     CardName = m_CardName
  End Property

  Public Property Let ExpiryMM(p_Data)
      m_ExpiryMM = p_Data
  End Property

  Public Property Get ExpiryMM()
     ExpiryMM = m_ExpiryMM
  End Property

  Public Property Let ExpiryYYYY(p_Data)
      m_ExpiryYYYY = p_Data
  End Property

  Public Property Get ExpiryYYYY()
     ExpiryYYYY = m_ExpiryYYYY
  End Property

End Class
%>