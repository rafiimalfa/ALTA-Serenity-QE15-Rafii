
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
    And Validate json schema "login_emptypass_json_schema.json"
    Examples:
      | fileName                     |  error           |
      | login_unregisteredacc1.json  |  user not found  |
      | login_unregisteredacc2.json  |  user not found  |

  @Tugas
  Scenario Outline: Login with empty email
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "<error>"
    And Validate json schema "login_emptypass_json_schema.json"
    Examples:
      | fileName               |  error                               |
      | login_emptyemail.json  |  Missing email or username           |



  @Tugas
  Scenario Outline: Login with empty password
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "<error>"
    And Validate json schema "login_emptypass_json_schema.json"
    Examples:
      | fileName              |  error                      |
      | login_emptypass.json  |  Missing password           |

    @Tugas
    Scenario Outline: login with empty email and password
      Given Input user with file json "<fileName>"
      When Send request post login user
      Then Status code should be 400
      And Response body error should be "<error>"
      And Validate json schema "login_emptypass_json_schema.json"
      Examples:
        | fileName                    |  error                       |
        | login_emptypassandemail.json|  Missing email or username   |

  @Tugas
  Scenario Outline: Login with special character
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "<error>"
    And Validate json schema "login_emptypass_json_schema.json"
    Examples:
      | fileName                     |  error                 |
      | login_specialcharacter.json  |  user not found        |