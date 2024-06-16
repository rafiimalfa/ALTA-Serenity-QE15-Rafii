Feature: Get Single User

  @Tugas
  Scenario Outline: Get single user with valid id
    Given Get single user with parameter <id>
    When  Send request get single user
    Then  Status code should be 200
    And Response body id should be <id> and email should be "<email>"
    And Validate json schema "single_user_json_schema.json"
    Examples:
    | id | email                  |
    | 1  | george.bluth@reqres.in |
    | 2  | janet.weaver@reqres.in |
    | 3  | emma.wong@reqres.in    |


#  Negative test case
  @Tugas
  Scenario Outline: Get single user with invalid id
    Given Get single user with parameter <id>
    When  Send request get single user
    Then  Status code should be 404
    And Response body notfound should be "{}"
    And Validate json schema "not_found_json_schema.json"
    Examples:
      | id |
      | 99  |
      | 999 |
      | 390 |

  @Tugas
  Scenario Outline: Get single user with special character
    Given Get single user with parameter "<id>"
    When  Send request get single user
    Then  Status code should be 400
    Examples:
    | id     |
    | $%$    |
    | &&*&   |
    | !@#$   |



