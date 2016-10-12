Feature: Create Categories
  As a blog administrator
  I want to be able to add categories for articles in the admin panel

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully open categories page
    When I follow "Categories"
    Then I should be on the categories page
