And(/^I want to create a workspace with the (.*) (.*)$/) do |attribute, name_project|
  @body = {attribute => name_project}
end

When(/^Sending a POST requests to the (.*) endpoint$/) do |endpoint|
  # noinspection RubyResolve
  @code, @response = @client.post_request(endpoint, @body)
end

And(/^I expect (.*) would be (.*)$/) do |attribute, name|
  actual_name = @response.fetch(attribute)

  expect(name).to eql(actual_name)
end

When(/^I send a GET request to Workspaces endpoint$/) do
  require_relative '../../../src/requests/Workspaces/workspaces'
  # noinspection RubyResolve
  @code, _ = Workspaces.workspaces_get(@client)
end

When(/^I send a DELETE request to Workspaces endpoint$/) do
  require_relative '../../../src/requests/Workspaces/workspaces'
  # noinspection RubyResolve
  @code, @workspace_id, _ = Workspaces.workspaces_delete(@client)
end