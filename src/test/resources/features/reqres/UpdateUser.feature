Feature: Update User API
  @Latihan
  Scenario: Update user with valid parameter id and valid json with method put
    Given Update user with parameter id 2 and valid json "update_user.json"
    When Send request put update user
    Then Status code should be 200
    And Response body name should be "Rafii Malfa Edit" and job should be "QA Engineer Edit"

  @Tugas
  Scenario: Update user with valid parameter id and valid json with method patch
    Given Update user with parameter id 2 and valid json "update_user.json"
    When Send request patch update user
    Then Status code should be 200
    And Response body name should be "Rafii Malfa Edit" and job should be "QA Engineer Edit"