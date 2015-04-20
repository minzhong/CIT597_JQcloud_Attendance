Feature: add a student page

  Scenario: Creating a new account
    Given I am not authenticated
    When I go to register # define this path mapping in features/support/paths.rb, usually as '/users/sign_up'
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "logged in as <email>" # your work!


  Scenario: Willing to edit my account
    Given I am a new, authenticated user # beyond this step, your work!
    When I want to edit my account
    Then I should see the account initialization form
    And I should see "Your account has not been initialized yet. Do it now!"
    # And more view checking stuff



	Scenario: Add a student
           Given I am on 'create new student page'
            When I add a new student
            Then I should see Student was successfully created.

	Scenario: Add a student without a first_name
           Given I am on 'create new student page'
            When I add a new student with blank first name
            Then I should see a page indicating the blank first name

	Scenario: Add a student without an email
           Given I am on 'create new student page'
            When I add a new student with blank email
            Then I should see a page indicating the blank email id


  Scenario: Add a student with invalid email
           Given I am on 'create new student page'
            When I add a new student with invalid email id
            Then I should see a page indicating the invalid email id

  Scenario: Add a student with invalid student id
           Given I am on the 'create new student page'
            When I add a new student without valid student id
            Then I should see a page indicating the invalid student id
