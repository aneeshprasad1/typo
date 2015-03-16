Feature: Write Articles
  As a blog administrator
  In order to take in edits from a team
  I want to be able to merge articles to my blog

  Background:
    Given the blog is set up
    And I am logged into a non-admin panel
    Given I am on the new article page
    When I fill in "article_title" with "Poobar"
    And I fill in "article__body_and_extended_editor" with "Dorem Pipsum"
    And I press "Publish"
    
    Given I am on the show article page of "Poobar"
    And I fill in "comment_author" with "Aneesh"
    And I fill in "comment_email" with "aneesh@berkeley.edu"
    And I fill in "comment_url" with "google.com"
    And I fill in "comment_body" with "This sucks"
    And I press "Publish"

    Given the blog is set up
    And I am logged into the admin panel
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"

    Given I am on "Foobar"'s show article page
    And I fill in "comment_author" with "Riyaz"
    And I fill in "comment_email" with "riyaz@berkeley.edu"
    And I fill in "comment_url" with "yahoo.com"
    And I fill in "comment_body" with "This rocks"
    And I press "Publish"


  Scenario: Merge contents
    Given I am logged into the admin panel
    And I am on the edit article page of "Foobar"
    And I fill in "merge_with" with "Poobar"'s article ID
    When I press "Merge"
    And I am on the show article page of "Foobar"
    Then I should see "Lorem Ipsum Dorem Pipsum"    

  Scenario: Merging Access Rights
    Given I am logged into a non-admin panel
    And I am on the edit article page of "Poobar"
    Then I should not see "Merge Articles"

  Scenario: Single Author
    Given I am on the show article page of "Foobar"
    Then I should see "admin"
    And I should not see "non-admin"

  Scenario: Aggregated Comments
    Given I am on the show_article page of "Foobar"
    Then I should see "Aneesh"
    And I should see "Riyaz"

  Scenario: Single Title
    Given I am on the show article page of "Foobar"
    Then I should see "Foobar"
    And I should not see "Poobar"




    
    