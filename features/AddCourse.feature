Feature: new user signup and create a course

  Scenario: Creating a new account
    Given I am not authenticated
    When I go to register
    Then I should see "have signed up successfully."

    Given I am on 'create new course page'
    When I add a new course
    Then I should see a new course page


  Scenario: Creating a new account
    Given I am not authenticated neither
    When I go to register again
    Then I should also see "have signed up successfully."

    Given I am adding a course with a blank name
    When I add a new course with a blank name
    Then I should see a page indicating the blank name    
