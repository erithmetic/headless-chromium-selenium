Feature: Chromium

  Scenario: Going to home page
    When I go to "https://www.chromium.org/Home"
    Then I should see "Chromium"
