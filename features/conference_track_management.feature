Feature: Conference Tack Management

  Scenario: Morning sessions begin at 9am
    Given I am on the start page
    When I upload a conference file
    Then Morning session talks must start at 09:00AM

  Scenario: A conference has multiple tracks
    Given I am on the start page
    When I upload a conference file
    Then I should see 2 tracks

  Scenario: Lunch must start at 12 noon
    Given I am on the start page
    When I upload a conference file
    Then Lunch must start at 12:00PM

  Scenario: Afternoon sessions begin at 1pm
    Given I am on the start page
    When I upload a conference file
    Then Afternoon session talks must start at 01:00PM

  Scenario: Networking event must start by 5pm
    Given I am on the start page
    When I upload a conference file
    Then Network event must start at 05:00PM
