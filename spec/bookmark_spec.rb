describe '.all' do 
  it 'returns a list of bookmarks' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: 'http://makersacademy.com',title: 'http://makersacademy.com')
    Bookmark.create(url: 'http://destroyallsoftware.com',title: 'http://destroyallsoftware.com')
    Bookmark.create(url: 'http://google.com',title: 'http://google.com')

    bookmarks = Bookmark.all
    expect(bookmarks.flatten).to include 'http://makersacademy.com' 
    expect(bookmarks.flatten).to include 'http://google.com' 
    expect(bookmarks.flatten).to include 'http://destroyallsoftware.com' 
  end
end

describe '.create' do 
  it 'adds an item to the database' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    Bookmark.create(url: 'http://eastend-butchers.com', title: 'http://eastend-butchers.com')
    expect(Bookmark.all.flatten).to include 'http://eastend-butchers.com'
  end
end


  
    