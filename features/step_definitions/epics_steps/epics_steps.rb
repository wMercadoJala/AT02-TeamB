And(/^I have a (.*) project$/) do |project_name|
  require_relative '../../../src/requests/Epics/epics'
  @body = {:name => project_name}
  @epic = Epics.new
  # noinspection RubyResolve
  _, @response_project = @client.post_request('projects', @body)
  @project_id =  (@response_project['id']).to_s
end

###############################POST######################

Then(/^I want to create an epic with the (.*) (.*) in the project$/) do |attribute, name_epic|
  require_relative '../../../src/requests/Epics/epics'
  @body = {attribute => name_epic}
  @epic = Epics.new
end

When(/^Sending a POST request to (.*) endpoint to create the epic$/) { |endpoint|
  @code, @response = @epic.epics_post(@client, endpoint, @project_id, @body)
  @id_epic = @response['id']
}

And(/^expect (.*) of epic will be (.*)$/) do |attribute, name|
  actual_name = @response.fetch(attribute)
  expect(name).to eql(actual_name)

  @client.delete_request('projects/' + @project_id)
end

######################################DELETE######################



Then(/I want to delete an epic with the name (.*)/) do |epic_name|
  @body = {:name => epic_name}

  _, @response_epic = @epic.epics_post(@client, 'epics', @project_id, @body)
  @epic_id = @response_epic['id'].to_s
end

When (/I sending a DELETE request to (.*) endpoint/) do |endpoint|
  @code = @epic.epics_delete(@client, endpoint, @project_id, @epic_id)
  @client.delete_request('projects/' + @project_id)
end

##################################GET##############################

Then (/I want to get all epics in the project/)do | |
  @body = {:name => 'EpicTest'}
  @body2 = {:name => 'EpicTest2'}
  _, @response_epics = @epic.epics_post(@client, 'epics', @project_id, @body)
  _, @response_epics = @epic.epics_post(@client, 'epics', @project_id, @body2)
end

When (/I sending a GET request to (.*) endpoint/) do |endpoint|
  @code, @response = @epic.epics_get(@client, endpoint, @project_id)
  @client.delete_request('projects/' + @project_id)
end

#################################PUT######################


Then(/^I want to modify an epic with the (.*) (.*) to (.*)$/) do |attrib, actual_name, new_name|
  @body = {attrib => actual_name}
  @body2 = {attrib => new_name}
  _, @response_epic = @epic.epics_post(@client, 'epics', @project_id, @body)
  @epic_id = @response_epic['id'].to_s
end

When(/^I sending a PUT request to (.*) endpoint$/) do |endpoint|
  @code, @response = @epic.epics_put(@client, endpoint, @project_id, @epic_id, @body2)
  @client.delete_request('projects/' + @project_id)
end