Feature: Feedback provision
  In order to provide feedback to a person, 

  Scenario: Provide feedback for a person

    Given I am on the feedback page
    When I provide a complete feedback
    Then I should see a confirmation message that the feedback was registered
