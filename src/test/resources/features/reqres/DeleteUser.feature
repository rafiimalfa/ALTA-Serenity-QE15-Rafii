Feature: Delete a user
  @Tugas
  Scenario: Delete user with valid parameter id
    Given Delete user with id 2
    When Send request delete user
    Then Status code should be 204

  @Tugas
  Scenario: Delete user with invalid id
    Given Delete user with id 999999
    When Send request delete user
    Then Status code should be 404

  @Tugas
  Scenario: Delete user with special character
    Given Delete user with id "&^*(&*"
    When Send request delete user
    Then Status code should be 400