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

    @Tugas
    Scenario Outline: User register with empty email
      Given Input user with file json "<fileName>"
      When Send request post register user
      Then  Status code should be 400
      And Response body error should be "Missing email or username"
      And Validate json schema "register_error_json_schema.json"
      Examples:
      |  fileName                |
      | register_emptyemail.json |
      | register_emptyemail1.json|

      @Tugas
      Scenario Outline: User register with empty password
      Given Input user with file json "<fileName>"
      When  Send request post register user
      Then Status code should be 400
      And Response body error should be "Missing password"
      And Validate json schema "register_error_json_schema.json"
      Examples:
      | fileName                |
      | register_emptypass.json |
      | register_emptypass1.json|
        
      @Tugas
      Scenario Outline: User register with empty email and password
        Given Input user with file json "<fileName>"
        When Send request post register user
        Then Status code should be 400
        And Response body error should be "Missing email or username"
        And Validate json schema "register_error_json_schema.json"
        Examples:
        | fileName                        |
        | register_emptyemailandpass.json |
        | register_emptyemailandpass1.json|
        
        @Tugas
        Scenario Outline: Input with undefined account
          Given Input user with file json "<fileName>"
          When Send request post register user
          Then Status code should be 400
          And Response body error should be "Note: Only defined users succeed registration"
          And Validate json schema "register_error_json_schema.json"
          Examples:
          | fileName                |
          | register_undefined.json |
          | register_undefined1.json|


      
