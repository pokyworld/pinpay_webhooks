<%
Class PPCharge
  Public Customer
  Private m_ID
  Private m_Success
  Private m_Status
  Private m_Amount
  Private m_Curency '// Typo deliberate: reserved word in ASP
  Private m_Description
  Private m_EventId
  Private m_EventType
  Private m_JSON

  Public Property Let ID(p_Data)
      m_ID = p_Data
  End Property

  Public Property Get ID()
     ID = m_ID
  End Property

  Public Property Let Success(p_Data)
      m_Success = p_Data
  End Property

  Public Property Get Success()
     Success = m_Success
  End Property

  Public Property Let Status(p_Data)
      m_Status = p_Data
  End Property

  Public Property Get Status()
     Status = m_Status
  End Property

  Public Property Let Amount(p_Data)
      m_Amount = p_Data
  End Property

  Public Property Get Amount()
     Amount = m_Amount
  End Property

  Public Property Let Curency(p_Data)
      m_Curency = p_Data
  End Property

  Public Property Get Curency()
     Curency = m_Curency
  End Property

  Public Property Let Description(p_Data)
      m_Description = p_Data
  End Property

  Public Property Get Description()
     Description = m_Description
  End Property

  Public Property Let EventId(p_Data)
      m_EventId = p_Data
  End Property

  Public Property Get EventId()
     EventId = m_EventId
  End Property

  Public Property Let EventType(p_Data)
      m_EventType = p_Data
  End Property

  Public Property Get EventType()
     EventType = m_EventType
  End Property

  Public Property Let JSON(p_Data)
      m_JSON = p_Data
  End Property

  Public Property Get JSON()
     JSON = m_JSON
  End Property

End Class
%>