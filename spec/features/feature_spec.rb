feature 'View bookmarks' do
  scenario 'User can see all the bookmarks' do

    Bookmark.create('http://makersacademy.com','http://makersacademy.com')
    Bookmark.create('http://destroyallsoftware.com','http://destroyallsoftware.com')
    Bookmark.create('http://google.com','http://google.com')

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
    fill_in :new_bookmark_title, with: "amazonisgreatagain"
    click_button 'Add'
    expect(page).to have_content 'URL not recognised'
  end
end

feature 'Create bookmark' do
  scenario 'User creates bookmark entering url and title' do
    visit('/bookmarks/new')
    fill_in :new_bookmark_name, with: "http://makersacademy.com"
    fill_in :new_bookmark_title, with: "Makers"
    click_button 'Add'
    expect(page).to have_link('Makers', href: "http://makersacademy.com")
  end
end
