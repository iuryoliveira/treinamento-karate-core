Feature: Gestão de usuários
  Como um gestor 
  Desejo ter acesso ao sistema
  para gerenciar os usuários cadastros

# Background: 
#   * url baseUrl
#   * path "users"

@ignore
Scenario: Consultar dados de um usuário
  Given url "https://crud-api-academy.herokuapp.com/api/v1/users/7bbf90e6-cd63-4374-a16b-351da416f1f4"
  When method get
  Then status 200

@ignore
Scenario: Consultar dados de um usuário
  When method get
  Then status 200
  * def userId = response[0].id
  * def userData = response[0]  

  Given path userId 
  When method get
  Then status 200
  # And match response == { id: "b7925122-8b01-451f-8226-f67c302bddd5", name: "Moloid Clov", email: "loidmo@volc.com", createdAt: "2022-01-09T01:58:46.883Z", updatedAt: "2022-01-09T01:58:46.883Z" }
  # And match response == { id: "#(userId)", name: "#string", email: "loidmo@volc.com", createdAt: "2022-01-09T01:58:46.883Z", updatedAt: "2022-01-09T01:58:46.883Z" }
  And match response == userData

@ignore
Scenario Outline: Verificar dados do usuário <id>
  Given path id
  When method get
  Then status 200
  And match response contains { id: "#(id)", name: "#(name)", email: "#(email)" }
  Examples:
      | id                                   | name         | email            |
      | b7925122-8b01-451f-8226-f67c302bddd5 | Moloid Clov  | loidmo@volc.com  |
      | 26cbb00d-a7a5-473f-a535-1d5a20002194 | Name Surname | user@example.com |

@ignore
Scenario: Deve ser possível cadastrar um usuário
  * def timestamp = new Date().getTime()
  * def userName = "Iury Oliveira"
  * def email = "iury"+timestamp+"@example.com"
  And request 
  """
    {
      "name": "#(userName)",
      "email": "#(email)"
    }
  """
  When method post
  Then status 201
  And match response == read("data/users/response/createdUserResponse.json")

Scenario: Não deve ser possível consultar usuários sem enviar token
  Given url baseUrl + "/users"
  When method get
  Then status 401
  And match response == { status: 401, message: "Required X-JWT-Token header not found." }

Scenario: Não deve ser possível consultar usuários sem ter um token válido
  Given url baseUrl + "/users"
  And header X-JWT-Token = "11231293819203132"
  When method get
  Then status 401
  And match response == { status: 401, message: "Invalid token." }

Scenario: Deve ser possível consultar um cliente estando logado
    * def loginResponse = call read("classpath:features/login/login.feature@loginToken")
    * print loginResponse
    Given url baseUrl + "/users"
    And header X-JWT-Token = loginResponse.token
    When method get
    Then status 200