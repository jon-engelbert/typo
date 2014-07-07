Feature: Merge Articles
As an administrator and blogger
In order for the authors may write more than one article on the same topic and say similar things when there are multiple bloggers on one site,
I would like to visit the article view and to merge the current article with another article.


  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following Articles exist
      | id | title    | body                          |author | published_at |
      | 2 | article1 | 1st interesting article body. | Bob   |DateTime.now  |
      | 3 | article2 | 2nd interesting article body. | Bob   |DateTime.now  |
    And I am on the article page for "article2"
    And the following Comments exist
      | title    | body                          |author | article_title |
      | comment1 | 1st comment on article 1. | Bob   | article1  |
      | comment2 | 2nd comment on article 2. | Bob   | article2  |


  #(there should be a form on that article’s edit page that allows an administrator...)
  #When this happens, we want to preserve both articles’ content, but merge them together into one article.
  #Note: Before merging articles you should verify that both specified articles exist, and that they are not the same article.
  Scenario: Verify that the merging fields are on the page
#    Then show me the page
    Then I should see "Article ID"
    And I should see button "Merge"

  Scenario: successful merge
    And I should see button "Merge"
    And I should see field "merge_with"
    When I fill in the id of article "article1" for "merge_with"
    And I press "Merge"
    Then the article "article2" should have body "2nd interesting article body. 1st interesting article body."
    And the article "article2" should have comment "comment2"
    And the article "article2" should have 2nd comment "comment1"
#    And show me the page

#  Feature: Verify that both specified articles exist
#    Given