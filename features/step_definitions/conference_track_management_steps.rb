require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am on the (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I upload a conference file$/ do
  attach_file('file', File.join(Rails.root, 'test', 'fixtures', 'files', 'input.txt'))
  click_button "Submit"
  #expect(page).to have_css(".status", text: "09:00AM", count: 10)
end

Then(/^Morning session talks must start at (\d+:\d+\w\w)$/) do |time|
  page.has_selector?('tr td:nth-child(0)', text: time)
  page.has_selector?('tr td:nth-child(13)', text: time)
end

Then(/^I should see (\d) tracks$/) do |number|
  tracks = Regexp.new(/Track \d:/)
  page.has_content?(tracks, :count => number)
end

Then(/^Afternoon session talks must start at (\d+:\d+\w\w)$/) do |time|
  page.has_selector?('tr td:nth-child(5)', text: time)
  page.has_selector?('tr td:nth-child(16)', text: time)
end

Then(/^(\w+) must start at (\d+:\d+\w\w)$/) do |event, time|
  event_lower = event.downcase
  page.has_xpath?('.//tr[@class="'+event_lower+'"]//td', :text => time, :count => 2)
  page.has_xpath?('.//tr[@class="'+event_lower+'"]//td//td', :text => event, :count => 2)
end

Then(/^(\w+) event must start at (\d+:\d+\w\w)$/) do |event, time|
  event_lower = event.downcase
  page.has_xpath?('.//tr[@class="'+event_lower+'"]//td', :text => time, :count => 2)
  page.has_xpath?('.//tr[@class="'+event_lower+'"]//td//td', :text => event, :count => 2)
end

