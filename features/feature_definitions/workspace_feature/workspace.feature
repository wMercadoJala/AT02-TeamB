@api_test
Feature: Workspace Smoke Tests


  @smoke
  Scenario: Workspace Create
    Given I have set a connection to pivotal_tracker API service
    And I want to create a workspace with the name WorkTesting
    When Sending a POST requests to the my/workspaces endpoint
    Then I expect Status code 200 for the SmokeTest
    And I expect name would be WorkTesting

  @smoke
  Scenario: Workspace Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to Workspaces endpoint
    Then I expect Status code 200 for the SmokeTest
#
#    @smoke
#    Scenario: Workspace Delete
#      Given I have set a connection to pivotal_tracker API service
#      When I send a DELETE request to Workspaces endpoint
#      Then I expect Status code 204 for the SmokeTest