Feature: Merge Articles
  As a blog admin
  I should be able to merge articles together in the Edit Article page

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Cannot merge when composing new article
    # Create a new article first, not sure if there's a better way to work around
    Given I am on the new article page
    Then I should not see "Merge Articles"

  Scenario: An admin can merge two articles
    # Create a new article first, not sure if there's a better way to work around
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    # Edit previously created article
    When I follow "Foobar"
    And I should see "Merge Articles"
    
  Scenario: Merged article should have same title and author
    # Create a new article first, not sure if there's a better way to work around
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    # Edit previously created article
    When I follow "Foobar"
    And I fill in "merge_with" with "3"
    And I press "Merge"
    Then I should see "Articles merged successfully"
    And the "article_title" field should contain "Foobar"
    And the "article__body_and_extended_editor" field should contain "Lorem Ipsum Muspi Merol"