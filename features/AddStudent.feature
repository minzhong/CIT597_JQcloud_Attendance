Feature: new user signup and create a course

  Scenario: Creating a new account
    Given I am not authenticated
    When I go to register
    Then I should see "have signed up successfully."

    Given I am on 'create new student page'
    When I add a new student 
    Then I should see a new student page 


  Scenario: Creating a new account
    Given I am not authenticated neither
    When I go to register again
    Then I should also see "have signed up successfully."

    Given I am adding a student with a blank last name
    When I add a student with a blank name
    Then I should see a page indicating error    
