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
           When I add a the course with blank name
           Then I should see a page indicating the blank name
    
    
     Scenario: Add a course with invalid term
           Given I am adding a course with an invalid term
           When I add a the coursewith invalid term
           Then it should see error page for invalid term

     Scenario: Add a course with invalid year
           Given I am adding a course with an invalid year
           When I add a the course with invalid year
           Then it should see error page for invalid year
    