Feature: Create Categories
  As a blog administrator
  I want to be able to add categories for articles in the admin panel

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully open categories page
    When I follow "Categories"
    Then I should be on the categories page
    And I should see "Name"
    And I should see "Keywords"
    And I should see "Permalink"
    And I should see "Description"

  Scenario: Successfully add a new category
    Given I am on the categories page
    When I fill in "Name" with "Test"
    And I fill in "Permalink" with "test"
    And I press "Save"
    Then I should see "successfully saved"
  
  Scenario: Fail to add blank category
    Given I am on the categories page
    When I fill in "Name" with ""
    And I press "Save"
    Then I should not see "successfully saved"
  
  Scenario: Edit an existing category
    Given I am on the categories page
    When I follow "Edit"
    Then the "Name" field should contain "General"
    And the "Permalink" field should contain "general"