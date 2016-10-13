require_relative '../../../src/requests/Projects/projects'
When(/^Sending a POST request endpoint$/) do
  @json = {:name => 'new666'}
  @code, @body=Projects.project_post(@client,@json)
end