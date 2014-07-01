Feature: Merge Articles
As an administrator and blogger
In order for the authors may write more than one article on the same topic and say similar things when there are multiple bloggers on one site,
I would like to visit the article view and to merge the current article with another article.


  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following Articles exist
      | id | title    | body                          |
      | 1  | article1 | 1st interesting article body. |
      | 2  | article2 | 2nd interesting article body. |
    And I am on the article page for "article1"
    And a Comment "comment1" exists for "article1"
    And a Comment "comment2" exists for "article2"


  #(there should be a form on that article’s edit page that allows an administrator...)
  #When this happens, we want to preserve both articles’ content, but merge them together into one article.
  #Note: Before merging articles you should verify that both specified articles exist, and that they are not the same article.
  Scenario: Verify that the merging fields are on the page
    Then show me the page
    And I should see "Article ID"
    And I should see button "Merge"

  Scenario: successful merge
    And I should see button "Merge"
    And I should see field "merge_with"
    And I fill in "4" for "merge_with"
    When I press "Merge"
    Then the article "article1" should have body "1st interesting article body.2nd interesting article body."
    And the article "article1" should have comment "1st comment."
    And the article "article1" should have 2nd comment "2nd comment."
    And show me the page

#  Feature: Verify that both specified articles exist
#    Given