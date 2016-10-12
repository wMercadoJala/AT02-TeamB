@api_test
Feature: Project Smoke Tests

  @smoke
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    And I want to create a project with the name ATTesting
    When Sending a GET request to stories endpoint
    Then I expect Status code 200 for the SmokeTest
    And I expect name will be ATTesting