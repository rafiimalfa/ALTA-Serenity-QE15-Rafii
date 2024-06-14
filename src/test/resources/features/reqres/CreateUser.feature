Feature: Create user API
  @Latihan
  Scenario Outline: Create new user with valid json
    Given Create new user with file json "<fileName>"
    When Send request post create user
    Then Status code should be 201
    And Response body name should be "<name>" and job should be "<job>"
    Examples:
    |   fileName         |     name       |     job        |
    | create_user1.json  | Rafii Malfa 1  | QA Engineer 1  |
    | create_user2.json  | Rafii Malfa 2  | QA Engineer 2  |
