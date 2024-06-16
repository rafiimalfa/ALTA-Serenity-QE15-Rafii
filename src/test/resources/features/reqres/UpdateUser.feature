Feature: Update User API
  @Latihan
  Scenario: Update user with valid parameter id and valid json with method put
    Given Update user with parameter id 2 and valid json "update_user.json"
    When Send request put update user
    Then Status code should be 200
    And Response body name should be "Rafii Malfa Edit" and job should be "QA Engineer Edit"

  @Tugas
  Scenario Outline: Update user with valid parameter id and valid json with method patch
    Given Update user with parameter id <id> and valid json "<fileName>"
    When Send request patch update user
    Then Status code should be 200
    And Response body name should be "<name>" and job should be "<job>"
    Then Validate json schema "update_user_json_schema.json"
    Examples:
    |id| fileName         | name              | job               |
    |2 | update_user.json | Rafii Malfa Edit  | QA Engineer Edit  |
    |3 | update_user1.json| Rafii Malfa Edit 1| QA Engineer Edit 1|

#    Negative test case
    @Tugas
    Scenario: Update user with invalid parameter id
      Given Update user with parameter id "!@#$" and valid json "update_user.json"
      When Send request patch update user
      Then Status code should be 400
