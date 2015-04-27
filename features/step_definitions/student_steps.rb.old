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

Then(/^I should see Student was successfully created\.$/) do
 assert page.has_content?("Student was successfully created")
end

# Given(/^I am on 'create new student page'$/) do
#  visit(new_student_path) 
# end

When(/^I add a new student with blank first name$/) do
 
  fill_in 'Last name', :with => "Elliot"
  fill_in 'Pennid', :with => "12345"
  fill_in 'Email', :with => "x@y.edu"
  fill_in 'Note', :with => "Perfect Attendance"
  click_button 'Create Student' 
end

Then(/^I should see a page indicating the blank first name$/) do
   assert page.has_css?('div.field_with_errors')
end




# Given(/^I am on 'create new student page'$/) do
#  visit(new_student_path) 
# end

When(/^I add a new student with blank email$/) do
  fill_in 'First name', :with => "C.S."
  fill_in 'Last name', :with => "Louis"
  fill_in 'Pennid', :with => "123457"
  fill_in 'Note', :with => "Perfect Attendance"
  click_button 'Create Student' 
end

Then(/^I should see a page indicating the blank email id$/) do
  assert page.has_css?('div.field_with_errors')
end





# Given(/^I am on 'create new student page'$/) do
#  visit(new_student_path) 
# end

When(/^I add a new student with invalid email id$/) do
  fill_in 'First name', :with => "C.S."
  fill_in 'Last name', :with => "Louis"
  fill_in 'Pennid', :with => "1234578"
  fill_in 'Email', :with => "abcd.com"
  fill_in 'Note', :with => "Perfect Attendance"
  click_button 'Create Student' 
end

Then(/^I should see a page indicating the invalid email id$/) do
  assert page.has_css?('div.field_with_errors')
end







Given(/^I am on the 'create new student page'$/) do
   visit(new_student_path) 
end

When(/^I add a new student without valid student id$/) do
  fill_in 'First name', :with => "C.S."
  fill_in 'Last name', :with => "Louis"
  fill_in 'Pennid', :with => "123457"
  fill_in 'Email', :with => "c@d.com"
  fill_in 'Note', :with => "Perfect Attendance"
  click_button 'Create Student' 
end

Then(/^I should see a page indicating the invalid student id$/) do
  assert page.has_css?('div.field_with_errors')
end
