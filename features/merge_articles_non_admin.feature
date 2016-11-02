Feature: Merge Articles Non-Admin
  As a blog publisher/contributor
  I should not be able to merge articles together in the Edit Article page

  Background:
    Given the blog is set up
    And I am logged in as an user

  Scenario: A non-admin cannot merge two articles
    # Create a new article first, not sure if there's a better way to work around
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I follow "Foobar"
    Then I should not see "Merge Articles"