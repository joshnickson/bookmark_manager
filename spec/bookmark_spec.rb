describe '.all' do 
  it 'returns a list of bookmarks' do 
    Bookmark.create(url: 'http://makersacademy.com',title: 'http://makersacademy.com')
    Bookmark.create(url: 'http://destroyallsoftware.com',title: 'http://destroyallsoftware.com')
    Bookmark.create(url: 'http://google.com',title: 'http://google.com')

    bookmarks = Bookmark.all
    expect(bookmarks.flatten).to include 'http://makersacademy.com' 
  end
end

describe '.create' do 
  it 'adds an item to the database' do 
    Bookmark.create(url: 'http://eastend-butchers.com', title: 'http://eastend-butchers.com')
    expect(Bookmark.all.flatten).to include 'http://eastend-butchers.com'
  end
end


  
    