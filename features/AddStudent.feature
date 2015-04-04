Feature: add a student page

	Scenario: Add a student
           Given I am on 'create new student page'
            When I add a new student
            Then I should see a new student page
