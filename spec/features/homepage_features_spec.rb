require 'pg'

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

  scenario 'Valid bookmarks added and shown, no error raised' do
    visit('/')
    fill_in 'bookmark', with: 'https://www.msnnews.co.uk'
    click_button 'Enscribe'
    expect(page).to have_content 'https://www.msnnews.co.uk'
    expect(page).not_to have_content 'This is not U R (ea) L (ife)'
  end

  scenario 'Raises error if user does not submit a real URL' do
    visit('/')
    fill_in('bookmark', :with => 'Hello')
    click_button 'Enscribe'
    expect(page).to have_content 'This is not U R (ea) L (ife)'
  end

end
