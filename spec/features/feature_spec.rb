feature 'View bookmarks' do
  scenario 'User can see all the bookmarks' do

    Bookmark.create(url: 'http://makersacademy.com',title: 'Makers')
    Bookmark.create(url: 'http://destroyallsoftware.com',title: 'DAS')
    Bookmark.create(url: 'http://google.com',title: 'Google')
    visit '/bookmarks'
    expect(page).to have_link('Makers', href: 'http://makersacademy.com')
  end
end

feature 'Check user input' do
  scenario 'User enters an incorrect url and sees error' do
    visit('/bookmarks/new')
    fill_in :url, with: "amazonisgreat"
    fill_in :title, with: "amazonisgreatagain"
    click_button 'Add'
    expect(page).to have_content 'URL not recognised'
  end
end

feature 'Create bookmark' do
  scenario 'User creates bookmark entering url and title' do
    visit('/bookmarks/new')
    fill_in :url, with: "http://makersacademy.com"
    fill_in :title, with: "Makers"
    click_button 'Add'
    expect(page).to have_link('Makers', href: "http://makersacademy.com")
  end
end
