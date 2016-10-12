And(/^I want to create a project with the (.*) (.*)$/) do |attribute, name_project|
@body = {attribute => name_project}
end

When(/^Sending a POST request to (.*) endpoint$/) do |endpoint|
@code, @response = @client.post_request(endpoint, @body)
end

And(/^I expect (.*) will be (.*)$/) do |attribute, name|
actual_name = @response.fetch(attribute)
expect(name).to eql(actual_name)
end