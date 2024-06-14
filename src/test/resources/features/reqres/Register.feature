Feature: Register

  @Tugas
  Scenario Outline: Validate user register successful
    Given User register with file json "<fileName>"
    When Send request post register user
    Then Status code should be 200
    And Validate json schema "register_success_json_schema.json"
    Examples:
    | fileName              |
    | register_success.json |