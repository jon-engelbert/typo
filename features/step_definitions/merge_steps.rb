And(/^I should see button "([^"]*)"$/) do |buttonID|
  expect(page).to have_button(buttonID)
end

Then(/^the article "([^"]*)" should have body "([^"]*)"$/) do |title, body|
  expect(Article.exists?(title: title))
  article = Article.find_by_title(title)
  assert_equal(body, article.body)
end

Given (/^the following Articles exist$/) do |table|
  table.hashes.each do |hash|
    Article.create!(hash)
  end
end


Given (/^the following Comments exist$/) do |table|
  # Article.stub!(:comments_closed?).and_return(TRUE)
  table.hashes.each do |hash|
    comment= Comment.new()
    comment.title= hash['title']
    comment.body= hash['body']
    comment.author= hash['author']
    article= Article.find_by_title(hash['article_title'])
    comment.article_id= article.id
    comment.save
  end
end


And(/^the article "([^"]*)" should have comment "([^"]*)"$/) do |title, comment_title|
  expect(Article.exists?(title: title))
  article = Article.find_by_title(title)
  article.comments.length.should >= 1
  comment = Comment.find_by_title(comment_title)
  assert(article.comments.include?(comment))
end

And(/^the article "([^"]*)" should have 2nd comment "([^"]*)"$/) do |title, comment_title|
  expect(Article.exists?(title: title))
  article = Article.find_by_title(title)
  article.comments.length.should > 1
  comment = Comment.find_by_title(comment_title)
  assert(article.comments.include?(comment))
end

And(/^comment (\d+) belongs to Article (\d+)$/) do |arg1, arg2|
  article = Article.find_by_id(arg1)
  comment = Comment.find_by_id(arg2)
  article.comments << comment
end

And(/^a Comment exists for "([^"]*)"$/) do |articleTitle|
  article = Article.find_by_title(articleTitle)
  articleID = article.id
  comment = Comment.create!(title:"comment1", body: "body1", article_id: articleID, author: "bob")
  article.add_comment(comment)
  #comment = article.comments.build(title:"comment1", body: "body1", author: "bob")
  #comment = article.with_options(new_comment_defaults) do |art|
  #  art.add_comment(params[:comment].symbolize_keys)
  #end

end

And(/^a Comment "([^"]*)" exists for "([^"]*)"$/) do |commentTitle, articleTitle|
  article = Article.find_by_title(articleTitle)
  comment = Comment.find_by_title(commentTitle)
  articleID = article.id
#  comment = Comment.create!(title:commentTitle, body: "body2", article_id: articleID, author: "bob")
  article.add_comment(comment)
#  comment = article.comments.build(title:"comment1", body: "body2", author: "bob")
end

And(/^I should see field "([^"]*)"$/) do |field_id|
  expect(page).to have_field(field_id)
end

When(/^I fill in the id of article "([^"]*)" for "([^"]*)"$/) do |articleTitle, field|
  value = Article.find_by_title(articleTitle).id
  fill_in(field, :with => value)
end
