@api_test @story
Feature: Stories Smoke Tests

  @smoke @story @post
  Scenario: Stories Post
    Given I have set a connection to pivotal_tracker API service
    And I want to create a story with name TestStory04
    When I send a POST request to stories endpoint with projects id 1887617
    Then I expect Status code 200 for the SmokeTest
    And I expects story name will be TestStory04

  @smoke @story @get
  Scenario: Stories Get
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to stories endpoint with projects id 1887617
    Then I expect Status code 200 for the SmokeTest

  @smoke @story @put
  Scenario: Stories Put
    Given I have set a connection to pivotal_tracker API service
    And I send a PUT request to stories with new name StoryModify
    When I want to modify a stories endpoint with id from the projects id 1887617
    Then I expect Status code 200 for the SmokeTest
    And I expects story name will be StoryModify

#  @smoke @story @delete
#  Scenario: Stories Delete
#    Given I have set a connection to pivotal_tracker API service
#    When I send a DELETE request to stories endpoint with projects id 1887581 and story id
#    Then I expect Status code 204 for the SmokeTest