Feature: Prueba Técnica API PetStore - Gestión de Usuarios

  Background:
    * url 'https://petstore.swagger.io/v2'
    * def timestamp = function(){ return java.lang.System.currentTimeMillis() }
    * def username = 'testuser' + timestamp()
    * def userData = 
      """
      {
        "id": 12345,
        "username": "#(username)",
        "firstName": "Carlos",
        "lastName": "Meneses",
        "email": "#(username + '@test.com')",
        "password": "password123",
        "phone": "593999999999",
        "userStatus": 1
      }
      """

  @id:CasoDePrueba1
  Scenario: Crear un nuevo usuario
    Given path '/user'
    And request userData
    When method POST
    Then status 200
    And print 'Usuario creado:', username

  @id:CasoDePrueba2
  Scenario: Buscar el usuario creado
    Given path '/user'
    And request userData
    When method POST
    Then status 200
    
    Given path '/user/' + username
    When method GET
    Then status 200
    And match response.username == username
    And print 'Usuario encontrado:', response

  @id:CasoDePrueba3
  Scenario: Actualizar el nombre y el correo del usuario
    Given path '/user'
    And request userData
    When method POST
    Then status 200
    
    * def updatedData = 
      """
      {
        "id": 12345,
        "username": "#(username)",
        "firstName": "CarlosActualizado",
        "lastName": "MenesesActualizado",
        "email": "actualizado#(timestamp())@test.com",
        "password": "password123",
        "phone": "593999999999",
        "userStatus": 1
      }
      """
    
    Given path '/user/' + username
    And request updatedData
    When method PUT
    Then status 200
    And print 'Usuario actualizado:', response

  @id:CasoDePrueba4
  Scenario: Buscar el usuario actualizado
    Given path '/user'
    And request userData
    When method POST
    Then status 200
    
    * def updatedData = 
      """
      {
        "id": 12345,
        "username": "#(username)",
        "firstName": "CarlosActualizado",
        "lastName": "MenesesActualizado",
        "email": "actualizado#(timestamp())@test.com",
        "password": "password123",
        "phone": "593999999999",
        "userStatus": 1
      }
      """
    
    Given path '/user/' + username
    And request updatedData
    When method PUT
    Then status 200
    
    Given path '/user/' + username
    When method GET
    Then status 200
    And match response.firstName == 'CarlosActualizado'
    And print 'Usuario actualizado encontrado:', response

  @id:CasoDePrueba5
  Scenario: Eliminar el usuario
    Given path '/user'
    And request userData
    When method POST
    Then status 200
    
    Given path '/user/' + username
    When method DELETE
    Then status 200
    And print 'Usuario eliminado:', username