feature 'Rock scissors paper play board' do
  scenario 'shows play board when logged in and play selected' do
    visit('/')
    click_link('log out')
    click_link('register')
    fill_in(:username, with: 'Ezzy')
    fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
    click_button('Submit')
    click_link('play')
    expect(page).to have_content('Computer vs. Ezzy : select rock, scissors or paper')
  end
  scenario 'shows play board when logged in and play selected' do
    visit('/')
    click_link('log out')
    click_link('play')
    expect(page).to have_content('Register or login before playing')
  end
end