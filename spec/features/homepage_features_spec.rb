feature 'Homepage' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Welcome to Gerking\'s Bookmark Manager'
  end

  scenario 'Bookmarks appear on startup' do
    visit('/')
    expect(page).to have_content 'https://www.youtube.com'
    expect(page).to have_content 'https://www.google.com'
    expect(page).to have_content 'https://www.makersacademy.com'
  end
end
