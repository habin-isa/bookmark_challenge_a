require 'pg'

feature 'Homepage' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Welcome to Gerking\'s Bookmark Manager'
  end

  scenario 'Titles appear on startup' do
    visit('/')
    expect(page).to have_content 'YouTube'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Makers Academy'
  end

  scenario 'Valid titles and bookmarks added and titles shown, no error raised' do
    visit('/')
    fill_in 'bookmark', with: 'https://www.msnnews.co.uk'
    fill_in 'title', with: 'MSN'
    click_button 'Enscribe'
    expect(page).to have_content 'MSN'
    expect(page).not_to have_content 'This is not U R (ea) L (ife)'
  end

  scenario 'Raises error if user does not submit a real URL' do
    visit('/')
    fill_in('bookmark', :with => 'Hello')
    fill_in 'title', with: 'I like shovels'
    click_button 'Enscribe'
    expect(page).to have_content 'This is not U R (ea) L (ife)'
  end

  scenario 'Deletes a bookmark' do
    visit('/')
    fill_in('bookmark', :with => 'https://www.msnnews.co.uk')
    fill_in 'title', with: 'MSN'
    click_button 'Rid it!'
    expect(page).to_not have_content 'MSN'
  end
end
