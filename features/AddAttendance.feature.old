Feature: Record attendance records for instructors' reference

  Scenario: Add an attendance record for a student with valid student id
    Given I am on the create attendance page
     When I add a new attendance with valid student id
     Then I should see a new attendance page

  Scenario: Add an attendance record for a student without student id
    Given I am on the create attendance page
     When I add a new attendance without student id
     Then I should see a page indicating the incomplete fields

  Scenario: Add an attendance record for a student without valid student id
    Given I am on the create attendance page
     When I add a new attendance without valid student id
     Then I should see a page indicating the invalid penn id

  Scenario: Add an attendance record for a student without valid time
    Given I am on the create attendance page
     When I add a new attendance without valid time format
     Then I should see a page indicating the invalid time 

  