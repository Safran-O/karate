Feature: Get API Demo
  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

#Simple Get Request
  Scenario: Get Demo 1

    #Given url 'https://reqres.in/api/users?page=2'
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #GET: Veri çekmek için kullanılır.
  #POST:Yeni bir kayıt oluşturmak için kullanılır.
  #PUT: Varolan bir kayıtı güncellemek için kullanılır.
  #PATCH: Varolan bir kayıtta belirli bir parça üzerinde güncelleme yapılacaksa kullanılabilir.
  # Bu işlem istek yerine tüm güncellemeler için PUT kullanımı da yaygındır.
  #DELETE: Varolan bir kayıtı silmek için kullanılır.

#Simple Get with Background
  Scenario: Get Demo 2

    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

#Get with Path, Params
  Scenario: Get Demo 3

    Given path '/users?page=2'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

#Get with Assertions
  Scenario: Get Demo 4

    Given path '/users?page=2'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].name != null
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].pantone_value == '14-0848'