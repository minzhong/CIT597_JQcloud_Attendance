Feature: add a student page

	Scenario: Add a student
           Given I am on 'create new student page'
            When I add a new student
            Then I should see Student was successfully created.

	Scenario: Add a student without a first_name
           Given I am on 'create new student page'
            When I add a new student with blank first name
            Then I should see Student was successfully created.with blank first name. 

	Scenario: Add a student without an email
           Given I am on 'create new student page'
            When I add a new student with blank email
            Then I should see Student was successfully created. with blank email. 
