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
