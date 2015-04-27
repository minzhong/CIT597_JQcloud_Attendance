Given(/^I am not authenticated$/) do
visit(new_user_registration_path)
end

When(/^I go to register$/) do
fill_in "Email", :with => "mx@my.edu"
  fill_in "Password", :with => 12345678
  fill_in "Password confirmation", :with => 12345678
  click_button "Sign up"
end

Then(/^I should see "(.*?)"$/) do |arg1|
assert page.has_content?("successfully")
end

Given(/^I am on 'create new course page'$/) do
visit(new_course_path)
end

When(/^I add a new course$/) do
fill_in 'Course code', :with => "CIT597"
  fill_in 'Course name', :with => "Programming & Technology"
  fill_in 'Term', :with => "Spring"
  fill_in 'Year', :with => "2015"
  fill_in 'Note', :with => "MCIT course"
  click_button 'Create Course'
end

Then(/^I should see a new course page$/) do
assert page.has_content?("Course was successfully created.")
end

Given(/^I am not authenticated neither$/) do
visit(new_user_registration_path)
end

When(/^I go to register again$/) do
fill_in "Email", :with => "mx@my.edu"
  fill_in "Password", :with => 12345678
  fill_in "Password confirmation", :with => 12345678
  click_button "Sign up"
end

Then(/^I should also see "(.*?)"$/) do |arg1|
assert page.has_content?("successfully")
end

Given(/^I am adding a course with a blank name$/) do
visit(new_course_path)
end

When(/^I add a new course with a blank name$/) do
fill_in 'Course code', :with => "CIS573"
  fill_in 'Term', :with => "Fall"
  fill_in 'Year', :with => "2015"
  fill_in 'Note', :with => "CIS course"
  click_button 'Create Course'
end

Then(/^I should see a page indicating the blank name$/) do
assert page.has_content?("error")
end






