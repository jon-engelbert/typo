And(/^I should see button "([^"]*)"$/) do |buttonID|
  expect(page).to have_button(buttonID)
end

Then(/^the article "([^"]*)" should have body "([^"]*)"$/) do |title, body|
  expect(Article.exists?(title: title))
  article = Article.find_by_title(title)
  expect(article.body).to eql?(body)
end

Given (/^the following Articles exist$/) do |table|
  table.hashes.each do |hash|
    Article.create!(hash)
  end
end

Given (/^the following Comments exist$/) do |table|
  # Article.stub!(:comments_closed?).and_return(TRUE)
  table.hashes.each do |hash|
    Comment.create!(hash)
  end
end


And(/^the article "([^"]*)" should have comment "([^"]*)"$/) do |title, comment_body|
  expect(Article.exists?(title: title))
  article = Article.find_by_title(title)
  expect(article.comments.length).to >= 1
  expect(article.comments[1].body).to eql?(comment_body)
end

And(/^the article "([^"]*)" should have 2nd comment "([^"]*)"$/) do |title, comment_body|
  expect(Article.exists?(title: title))
  article = Article.find_by_title(title)
  expect(article.comments.length).to > 1
  expect(article.comments[2].body).to eql?(comment_body)
end

And(/^comment (\d+) belongs to Article (\d+)$/) do |arg1, arg2|
  article = Article.find_by_id(arg1)
  comment = Comment.find_by_id(arg2)
  article.comments << comment
end

And(/^a Comment exists for "([^"]*)"$/) do |articleTitle|
  articleID = Article.find_by_title(articleTitle).id
  Comment.create!(title:"comment1", body: "body1", article_id: articleID, author: "bob")

end

And(/^a Comment "([^"]*)" exists for "([^"]*)"$/) do |commentTitle, articleTitle|
  articleID = Article.find_by_title(articleTitle).id
  Comment.create!(title:commentTitle, body: "body2", article_id: articleID, author: "bob")
end

And(/^I should see field "([^"]*)"$/) do |field_id|
  expect(page).to have_field(field_id)
end