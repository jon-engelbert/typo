Feature: Create Category
  As an author
  In order to organize my thoughts
  I want to manage categories for my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Visit Categories page
    When I follow "Categories"
    Then I should be on the categories page
    And I should see "no articles"

#  Scenario: Add new category
#    Given I am on the categories page
#    And I fill in "Goals" for "Name"
#    When I choose "Save"
#    Then I should see "Categories"
