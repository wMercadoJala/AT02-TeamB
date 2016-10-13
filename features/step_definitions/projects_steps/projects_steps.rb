require_relative '../../../src/requests/Projects/projects'

When(/^Sending a POST request endpoint$/) do
  @json = {:name => 'testProjectDelete05'}
  # noinspection RubyResolve
  @code, @body = Projects.project_post(@client, @json)
end

Then(/^The project is deleted$/) do
  _ = Projects.project_delete(@client, @body["id"])
end

And(/^I have a project$/) do
  @json = {:name => 'testProjectDelete05'}
  _, @body = Projects.project_post(@client, @json)
end

When(/^Sending a GET request endpoint$/) do
  @code, _ =Projects.project_get(@client)
end

When(/^Sending a PUT request endpoint$/) do
  @json = {:name => 'testProjectModify05'}
  @code, @body = Projects.project_put(@client,@json,@body["id"])
end

When(/^Sending a GET BY ID request endpoint$/) do
  @code, _ = Projects.project_get_by_id(@client,@body["id"])
end

When(/^Sending a DELETE request endpoint$/) do
  @code = Projects.project_delete(@client,@body["id"])
end