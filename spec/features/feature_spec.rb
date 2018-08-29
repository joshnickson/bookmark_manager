feature 'View bookmarks' do
  scenario 'User can see all the bookmarks' do

    Bookmark.create('http://makersacademy.com')
    Bookmark.create('http://destroyallsoftware.com')
    Bookmark.create('http://google.com')

    visit '/'
      expect(page).to have_content 'http://makersacademy.com' 
      expect(page).to have_content 'http://google.com' 
      expect(page).to have_content 'http://destroyallsoftware.com' 
  end
end


feature 'Check user input' do
  scenario 'User enters an incorrect url and sees error' do
    visit('/bookmarks/new')
    fill_in :new_bookmark_name, with: "amazonisgreat"
    click_button 'Add'
    expect(page).to have_content 'URL not recognised'
  end
end
