@api_test
Feature: Project Smoke Tests

  @smoke
  Scenario: Project Create
    Given I have set a connection to pivotal_tracker API service
    When Sending a POST request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Get
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a GET request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Put
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a PUT request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Get by id
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a GET BY ID request endpoint
    Then I expect Status code 200 for the SmokeTest
    Then The project is deleted

  @smoke
  Scenario: Project Delete
    Given I have set a connection to pivotal_tracker API service
    And I have a project
    When Sending a DELETE request endpoint
    Then I expect Status code 204 for the SmokeTest

  @acceptance
  Scenario Outline: Verify that creating projects have the same parameters
    Given I have set a connection to pivotal_tracker API service
    When Sending a POST request endpoint with the <Name>
    Then I expect Status code 200 for the SmokeTest

    Then The project is deleted
    Examples:
      |Name|
    |ProjectTest001|
    |ProjectTest002|

