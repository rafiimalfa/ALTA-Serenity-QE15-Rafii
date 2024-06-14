
Feature: Login

  @Tugas
  Scenario Outline: Validate Login Success
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 200
    And Validate json schema "login_success_json_schema.json"
    Examples:
    | fileName            |
    | login_success.json  |
    | login_success2.json |

  @Tugas
  Scenario Outline: Login With Empty email
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "<error>"
    And Validate json schema "<jsonschema>"
    Examples:
      | fileName               |  error                               | jsonschema                        |
      | login_emptyemail.json  |  Missing email or username           | login_emptypass_json_schema.json  |

  @Tugas
  Scenario Outline: Login With Empty Password
    Given Input user with file json "<fileName>"
    When Send request post login user
    Then Status code should be 400
    And Response body error should be "<error>"
    And Validate json schema "<jsonschema>"
    Examples:
      | fileName              |  error                      | jsonschema                        |
      | login_emptypass.json  |  Missing password           | login_emptypass_json_schema.json  |

    @Tugas
    Scenario Outline: Login With Empty Email And Password
      Given Input user with file json "<fileName>"
      When Send request post login user
      Then Status code should be 400
      And Response body error should be "<error>"
      And Validate json schema "<jsonschema>"
      Examples:
        | fileName                    |  error                       | jsonschema                        |
        | login_emptypassandemail.json|  Missing email or username   | login_emptypass_json_schema.json  |
