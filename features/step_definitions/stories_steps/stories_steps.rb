And(/^I want to create a story with (.*) (.*)$/) do |attribute, story_name|
  @body = {attribute => story_name}
  #@client = 
end

When(/^I send a POST request to (.*) endpoint with proyects id (\d+)$/) do |end_point, id_proyect|
  @code, @response = @client.return_stories_reponse(endpoint, @body)
end

And(/^I expect story (.*) will be (.*)$/) do |attribute, name|
  actual_name = @response[attribute]
  expect(name).to eql(actual_name)
end

----------
When(/^I send a GET request to (.*) endpoint with proyects id (\d+)$/) do |end_point, id_proyect|

end

----------
And(/^I want to modify a story with name StoryModify from the proyects id (\d+)$/) do
  
end

When(/^I send a PUT request to stories endpoint$/) do

end

----------------


When(/^I send a DELETE request to stories endpoint with proyects id (\d+) and story id$/) do |arg|

end