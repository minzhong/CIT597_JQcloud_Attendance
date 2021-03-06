Given(/^I am on 'create new student page'$/) do
 visit(new_student_path) 
end

When(/^I add a new student$/) do
  fill_in 'First name', :with => "Min"
  fill_in 'Last name', :with => "Zhong"
  fill_in 'Pennid', :with => "1234"
  fill_in 'Email', :with => "mzhong@asc.upenn.edu"
  fill_in 'Note', :with => "Perfect Attendance"
  click_button 'Create Student' 
end

Then(/^I should see a new student page$/) do
 assert page.has_content?("Student was successfully created")
end

Given(/^I am adding a student with a blank last name$/) do
  visit(new_student_path) 
end

When(/^I add a student with a blank name$/) do
  fill_in 'Last name', :with => "Elliot"
  fill_in 'Pennid', :with => "12345"
  fill_in 'Email', :with => "x@y.edu"
  fill_in 'Note', :with => "Perfect Attendance"
  click_button 'Create Student' 
end

Then(/^I should see a page indicating error$/) do
   assert page.has_css?('div.field_with_errors')
end





