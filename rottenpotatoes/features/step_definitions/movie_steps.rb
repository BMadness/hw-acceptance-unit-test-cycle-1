# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie_title, director_name|
  if page.respond_to? :should
    page.should have_content(movie_title)
    page.should have_content(director_name)
  else
    assert page.has_content?(movie_title)
    assert page.has_content?(director_name)
  end

end