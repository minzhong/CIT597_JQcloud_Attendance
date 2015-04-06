Feature: add a course page
    
	Scenario: Add a course 
           Given I am on 'create new course page'
            When I add a new course 
            Then I should see a new course page

    Scenario: Add another course 
           Given I am on the 'create new course page'
           When I add another new course 
           Then I should see another new course page

    Scenario: Add a blank name for a course 
           Given I am adding a course with a blank name
           When I add a the course
           Then it should still see a new course page
    
   

    