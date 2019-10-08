feature "creating a bookmark" do
  scenario "A user can add a bookmark to Bookmark Manager" do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.microsoft.com')
    click_button('Submit')
    expect(page).to have_content "http://www.microsoft.com"
  end
end
