Public Function EP_sb_series_values(accessToken As String) As String

    Dim url As String
    Dim codes As String

   'Codes you want to get the prices for (separated by commas). If you do not know the codes you have access to, run the Intratec Energy Price References - Series Info API
    'Up to 40 codes can be requested at once by dividing the codes with commas

    'You can also add &c={Currency_ID} and/or &u={Unit_ID} after the codeto specify the currency and unit to display the data in

    '{Currency_ID} and {Unit_ID} can be found at the PDF documentation

    'Available units and currencies are found in the response of Intratec Energy Price References - Series Info API

    codes = "68520-8-1"
    
    'This is the URL to the Sandbox - Series Values - Energy Price References API:
    'To query actual values, simply remove sandbox/ from the URL
    url = "https://intratec.azure-api.net/energy_price/v1/sandbox/export/series-hist/" & codes

    'Set up the request
    Dim request As Object
    Set request = CreateObject("MSXML2.ServerXMLHTTP")
    
    'Make a GET request to the Energy Price References - Series Values History API
    request.Open "GET", url, False
    request.setTimeouts 15000, 130000, 130000, 130000
    request.setRequestHeader "Authorization", "Bearer " & accessToken
    request.send
    
    'Get the response
    EP_sb_series_values = request.responseText
    
End Function