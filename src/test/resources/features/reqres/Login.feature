
Feature: Login User

  @Tugas
  Scenario Outline: Validate login success with valid Account
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 200
    And Validate json schema "login_success_json_schema.json"
    Examples:
    | fileName            |
    | login_success.json  |
    | login_success2.json |

#    Negative test case
  @Tugas
  Scenario Outline: Login with unregistered account
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "<error>"
    And Validate json schema "login_error_json_schema.json"
    Examples:
      | fileName                     |  error           |
      | login_unregisteredacc1.json  |  user not found  |
      | login_unregisteredacc2.json  |  user not found  |

  @Tugas
  Scenario Outline: Login with empty email
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "Missing email or username"
    And Validate json schema "login_error_json_schema.json"
    Examples:
      | fileName               |
      | login_emptyemail.json  |
      | login_emptyemail1.json |



  @Tugas
  Scenario Outline: Login with empty password
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "Missing password"
    And Validate json schema "login_error_json_schema.json"
    Examples:
      | fileName              |
      | login_emptypass.json  |
      | login_emptypass1.json |

    @Tugas
    Scenario Outline: login with empty email and password
      Given Input user with file json "<fileName>"
      When Send request post login user
      Then Status code should be 400
      And Response body error should be "Missing email or username"
      And Validate json schema "login_error_json_schema.json"
      Examples:
        | fileName                     |
        | login_emptypassandemail.json |
        | login_emptypassandemail1.json|
  @Tugas
  Scenario Outline: Login with special character
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "user not found"
    And Validate json schema "login_error_json_schema.json"
    Examples:
      | fileName                     |
      | login_specialcharacter.json  |