Feature: Login before admin
  As an administrator and blogger
  In order for the authors may write more than one article on the same topic and say similar things when there are multiple bloggers on one site,
  I would like to visit the article view and to merge the current article with another article.

  Background:
    Given the blog is set up
    And I am on the home page

  Scenario: A non-admin cannot merge articles.
#    And I am not logged in
    When I go to the admin page
    Then I should not see "Logged in as"

  Scenario: An admin can merge articles.
    And I am logged into the admin panel
    When I go to the admin page
    Then I should see "Logged in as"

