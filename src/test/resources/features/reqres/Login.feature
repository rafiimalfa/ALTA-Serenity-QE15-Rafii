Feature: Login Success
  @Tugas
  Scenario Outline: Validate Login Success
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 200
    And Validate json schema "login_success_json_schema.json"
    Examples:
    | fileName          |
    | login_success.json|
    | login_success.json|

  @Tugas
  Scenario Outline: Login With Empty Password
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Validate json schema "login_success_json_schema.json"
    Examples:
      | fileName          |
      | login_success.json|
      | login_success.json|
