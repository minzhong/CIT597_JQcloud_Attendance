Given(/^I am on the create attendance page$/) do
  visit(new_attendance_path)
end

When(/^I add a new attendance with valid student id$/) do
  fill_in 'Att date', :with => '05/04/2015'
  fill_in 'Att time', :with => '16:40'
  fill_in 'Note', :with => 'excused'
  fill_in 'Course', :with => 'CIT597'
  fill_in 'Student', :with => '12345678'
  click_button 'Create Attendance'
end

Then(/^I should see a new attendance page$/) do
  assert page.has_content?('Attendance was successfully created.')
end

When(/^I add a new attendance without student id$/) do
  fill_in 'Att date', :with => '05/04/2015'
  fill_in 'Att time', :with => '16:40'
  fill_in 'Note', :with => 'excused'
  fill_in 'Course', :with => 'CIT597'
  click_button 'Create Attendance'
end

Then(/^I should see a page indicating the incomplete fields$/) do
  assert page.has_css?('div.field_with_errors')
end

When(/^I add a new attendance without valid student id$/) do
  fill_in 'Att date', :with => '05/04/2015'
  fill_in 'Att time', :with => '16:40'
  fill_in 'Note', :with => 'excused'
  fill_in 'Course', :with => 'CIT597'
  fill_in 'Student', :with => /\d{7}/
  click_button 'Create Attendance'
end

Then(/^I should see a page indicating the invalid penn id$/) do
  assert page.has_css?('div.field_with_errors')
end


When(/^I add a new attendance without valid time format$/) do
  fill_in 'Att date', :with => '05/04/2015'
  fill_in 'Att time', :with => '1600'
  fill_in 'Note', :with => 'excused'
  fill_in 'Course', :with => 'CIT597'
  fill_in 'Student', :with => /\d{8}/
  click_button 'Create Attendance'
end

Then(/^I should see a page indicating the invalid time$/) do
   assert page.has_css?('div.field_with_errors')
end