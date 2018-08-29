feature 'Add bookmark' do
  scenario 'user fills in new bookmark and clicks add' do
  visit('/bookmarks/new')
  fill_in :new_bookmark_name, with: "http://amazon.co.uk"
  fill_in :new_bookmark_title, with: "http://amazon.co.uk"
  click_button 'Add'
  expect(page).to have_content "http://amazon.co.uk"
  end
end