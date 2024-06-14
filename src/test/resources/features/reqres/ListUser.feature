Feature: Get List User API
  Scenario Outline: Get list users with valid parameter page
    Given Get list users with parameter <page>
    When Send request get list users
    Then Status code should be 200
    And Response body page should be <page>
    And Validate json schema "list_users_json_schema.json"
  Examples:
    | page  |
    | 1     |
    | 2     |