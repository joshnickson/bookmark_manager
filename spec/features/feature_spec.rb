feature 'View bookmarks' do
  scenario 'User can see all the bookmarks' do
    visit '/'
      expect(page).to have_content 'https://makersstudents.slack.com' 
      expect(page).to have_content 'https://www.bbc.co.uk/sport/football' 
      expect(page).to have_content 'https://makersstudents.slack.com' 
  end
end
