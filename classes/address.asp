<%
Class Address
  Private m_ID
  Private m_AddrName
  Private m_Contact
  Private m_Company
  Private m_Email
  Private m_Phone
  Private m_Phone2
  Private m_Line1
  Private m_Line2
  Private m_Locality
  Private m_City
  Private m_State
  Private m_Zip
  Private m_Country
  Private m_CountryISO


  Public Property Let ID(p_Data)
      m_ID = p_Data
  End Property

  Public Property Get ID()
     ID = m_ID
  End Property

  Public Property Let AddrName(p_Data)
      m_AddrName = p_Data
  End Property

  Public Property Get AddrName()
     AddrName = m_AddrName
  End Property

  Public Property Let Contact(p_Data)
      m_Contact = p_Data
  End Property

  Public Property Get Contact()
     Contact = m_Contact
  End Property

  Public Property Let Company(p_Data)
      m_Company = p_Data
  End Property

  Public Property Get Company()
     Company = m_Company
  End Property

  Public Property Let Email(p_Data)
      m_Email = p_Data
  End Property

  Public Property Get Email()
     Email = m_Email
  End Property

  Public Property Let Phone(p_Data)
      m_Phone = p_Data
  End Property

  Public Property Get Phone()
     Phone = m_Phone
  End Property

  Public Property Let Phone2(p_Data)
      m_Phone2 = p_Data
  End Property

  Public Property Get Phone2()
     Phone2 = m_Phone2
  End Property

  Public Property Let Line1(p_Data)
      m_Line1 = p_Data
  End Property

  Public Property Get Line1()
     Line1 = m_Line1
  End Property

  Public Property Let Line2(p_Data)
      m_Line2 = p_Data
  End Property

  Public Property Get Line2()
      Line2 = m_Line2
  End Property

  Public Property Let City(p_Data)
      m_City = p_Data
  End Property

  Public Property Get City()
     City = m_City
  End Property

  Public Property Let State(p_Data)
      m_State = p_Data
  End Property

  Public Property Get State()
     State = m_State
  End Property

  Public Property Let Zip(p_Data)
      m_Zip = p_Data
  End Property

  Public Property Get Zip()
     Zip = m_Zip
  End Property

  Public Property Let Country(p_Data)
      m_Country = p_Data
  End Property

  Public Property Get Country()
    Country = m_Country
  End Property

  Public Property Let CountryISO(p_Data)
      m_CountryISO = p_Data
  End Property

  Public Property Get CountryISO()
    CountryISO = m_CountryISO
  End Property

End Class

%>