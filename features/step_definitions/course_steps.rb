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



Given(/^I am on the 'create new course page'$/) do
   visit(new_course_path)
end

When(/^I add another new course$/) do
  fill_in 'Course code', :with => "CIS555"
  fill_in 'Course name', :with => "IWS"
  fill_in 'Term', :with => "Spring"
  fill_in 'Year', :with => "2015"
  fill_in 'Note', :with => "CIS course"
  click_button 'Create Course'
end

Then(/^I should see another new course page$/) do
  assert page.has_content?("Course was successfully created.")
end



Given(/^I am adding a course with a blank name$/) do
  visit(new_course_path)
end
When(/^I add a the course with blank name$/) do
  fill_in 'Course code', :with => "CIS573"
  fill_in 'Term', :with => "Fall"
  fill_in 'Year', :with => "2015"
  fill_in 'Note', :with => "CIS course"
  click_button 'Create Course'
end

Then(/^I should see a page indicating the blank name$/) do
  assert page.has_css?('div.field_with_errors')
end





Given(/^I am adding a course with an invalid term$/) do
  visit(new_course_path)
end
When(/^I add a the coursewith invalid term$/) do
  fill_in 'Course code', :with => "CIS573"
  fill_in 'Course name', :with => "Software Engineering "
  fill_in 'Term', :with => "Winter"
  fill_in 'Year', :with => "2015"
  fill_in 'Note', :with => "CIS course"
  click_button 'Create Course'
end

Then(/^it should see error page for invalid term$/) do
  assert page.has_css?('div.field_with_errors')
end





Given(/^I am adding a course with an invalid year$/) do
  visit(new_course_path)
end

When(/^I add a the course with invalid year$/) do
  fill_in 'Course code', :with => "CIS573"
  fill_in 'Course name', :with => "Software Engineering"
  fill_in 'Term', :with => "Fall"
  fill_in 'Year', :with => "3000"
  fill_in 'Note', :with => "CIS course"
  click_button 'Create Course'
end

Then(/^it should see error page for invalid year$/) do
  assert page.has_css?('div.field_with_errors')
end






