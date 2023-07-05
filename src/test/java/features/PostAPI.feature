Feature: Create user using post api

  Background:
    * url 'https://gorest.co.in'
    * def tokenID = 'ae18ae79708914ecf239011d55f986690eca3453798e694c05402874da0e18e8'

    * def requestPayload =
	"""
	{
        "name": "tom",
        "email": "tom24@gmail.com",
        "gender": "male",
        "status": "active"
    }

	"""
  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'tom'
    And match $.data.email == 'tom24@gmail.com'