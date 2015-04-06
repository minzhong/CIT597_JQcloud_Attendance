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


