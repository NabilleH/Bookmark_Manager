feature 'validating URL' do
  scenario 'it returns a message to user if URL format is not correct' do
    visit('/bookmarks/new')
    fill_in('url', with: 'randomcat')
    fill_in('title', with: 'cat')
    click_button('Submit')

    expect(page).to have_content('Invalid URL')
  end
end
