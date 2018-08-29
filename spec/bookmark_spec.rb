describe '.all' do 
  it 'returns a list of bookmarks' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://google.com');")

    bookmarks = Bookmark.all
    expect(bookmarks).to include 'http://makersacademy.com' 
    expect(bookmarks).to include 'http://google.com' 
    expect(bookmarks).to include 'http://destroyallsoftware.com' 
  end
end

describe '.create' do 
  it 'adds an item to the database' do 
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    Bookmark.create('http://eastend-butchers.com')
    expect(Bookmark.all).to include 'http://eastend-butchers.com'
  end
end


  
    