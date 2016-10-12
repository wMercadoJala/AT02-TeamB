
And(/^I expects story (.*) will be (.*)$/) do |attribute, name|
  actual_name = @response[attribute]
  expect(name).to eql(actual_name)
end

###POST

And(/^I want to create a story with (.*) (.*)$/) do |attribute, story_name|
  require_relative '../../../src/requests/Stories/stories'
  @body = {attribute => story_name}
end

When(/^I send a POST request to (.*) endpoint with projects id (.*)$/) do |end_point, id_project|
  @code, @response = Stories.stories_post(@client, id_project, end_point, @body)
end

####GET

When(/^I send a GET request to (.*) endpoint with projects id (.*)$/) do |end_point, id_project|
  @code, @response_get = Stories.stories_get(@client, id_project, end_point)
end

####PUT

And(/^I send a PUT request to stories with new name (.*)$/) do |modify_name|
  @body = {'name' => modify_name}
end

When(/^I want to modify a (.*) endpoint with (.*) from the projects id (.*)$/) do |end_point, story_attribute, id_project|
  require_relative '../../../src/requests/Stories/stories'

  @body_aux = {'name' => 'ParaPUTS'}
  @code_aux, @response_aux = Stories.stories_post(@client, id_project, end_point, @body_aux)

  @code, @response = Stories.stories_put(@client, id_project, end_point, @response_aux[story_attribute].to_s, @body)
end

