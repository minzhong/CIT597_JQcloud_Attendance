Feature: add a course page

	Scenario: Add a course 
           Given I am on 'create new course page'
            When I add a new course 
            Then I should see a new course page
