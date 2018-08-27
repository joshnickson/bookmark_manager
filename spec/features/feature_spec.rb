feature 'View bookmarks' do
  scenario 'User can see all the bookmarks' do
    visit '/'
      expect(page).to have_content 'http://makersacademy.com' 
      expect(page).to have_content 'http://google.com' 
      expect(page).to have_content 'http://destroyallsoftware.com' 
  end
end
