require 'watir-webdriver'
require 'rspec'

Before do
  @browser = Watir::Browser.new
end

Given(/^I am on the feedback page$/) do
  @browser.goto "http://localhost:9292/index.html"
end

When(/^I provide a complete feedback$/) do
  @browser.textarea(:name, "feedback").set("a very simple feedback")
  @browser.text_field(:name, "author_email").set("somebody@email.com")
  @browser.button(:id, "submit").click
end

Then(/^I should see a confirmation message that the feedback was registered$/) do
  @browser.div(:id, "messages").text.should include("success")
end

After do
  @browser.close
end
