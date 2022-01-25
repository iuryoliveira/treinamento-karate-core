Feature: Login

@loginToken
Scenario: Login com dados de autenticação válidos
    * def credentials = { email: "admin@treinamento.com", password: "1234" }
    Given url baseUrl + "/auth/login"
    And form fields credentials
    When method post
    Then status 200
    And match response ==
    """
    {
        "auth": true,
        "session": {
            "token": "#string",
            "issued": "#number",
            "expires": "#number"
        }
    }
    """
    * def token = response.session.token