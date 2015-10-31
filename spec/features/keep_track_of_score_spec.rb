feature 'Show initial score' do
  scenario 'when on start playing' do
    visit('/')
    click_link('register')
    fill_in(:username, with: 'Ezzy')
    fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
    click_button('Submit')
    click_link('play')
    expect(page).to have_content('Computer: 0/0 vs. Ezzy: 0/0')
  end
end