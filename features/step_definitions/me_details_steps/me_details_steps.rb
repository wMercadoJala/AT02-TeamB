When(/^I send a (GET) request to MeDetailsGet endpoint$/) do |method|
  require_relative '../../../src/requests/MeDetails/me_details_get'
  @response = MeDetailsGet.return_stories_response(@client, method)
end