And(/^I should see button "([^"]*)"$/) do |arg|
  pending
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
