describe '.all' do 
  it 'returns a list of bookmarks' do 
    Bookmark.create(url: 'http://makersacademy.com',title: 'Makers')
    Bookmark.create(url: 'http://destroyallsoftware.com',title: 'DAS')
    Bookmark.create(url: 'http://google.com',title: 'Google')
    bookmarks = Bookmark.all
    bookmark = Bookmark.all.first
    p bookmarks 
    expect(bookmarks.length).to eq 3
    expect(bookmark).to be_a Bookmark
    expect(bookmark).to respond_to(:id)
    expect(bookmark.title).to eq 'Makers'
    expect(bookmark.url).to eq 'http://makersacademy.com'
  end
end

describe '.create' do 
  it 'adds an item to the database' do 
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')

    expect(bookmark).to be_a Bookmark
    expect(bookmark).to respond_to(:id)
    expect(bookmark.title).to eq 'Test Bookmark'
  end
end


  
    