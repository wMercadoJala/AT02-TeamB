@api_test @story
Feature: Stories Smoke Tests

  @smoke @story
  Scenario: Stories Post
    Given I have set a connection to pivotal_tracker API service
    And I want to create a story with name AT02
    When I send a POST request to stories endpoint with proyects id 1887581
    Then I expect Status code 200 for the SmokeTest
    And I expect story name will be AT02

  Scenario: Stories Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to stories endpoint with proyects id 1887581
    Then I expect Status code 200 for the SmokeTest

  Scenario: Stories Put
    Given I have set a connection to pivotal_tracker API service
    And I want to modify a story with name StoryModify from the proyects id 1887581
    When I send a PUT request to stories endpoint
    Then I expect Status code 200 for the SmokeTest
    And I expect story name will be StoryModify

  Scenario: Stories Delete
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to stories endpoint with proyects id 1887581 and story id
    Then I expect Status code 204 for the SmokeTest