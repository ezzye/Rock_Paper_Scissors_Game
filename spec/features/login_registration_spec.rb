feature 'allow user to register' do
  scenario 'new user clicks on register' do
    visit('/')
    click_link('register')
    expect(page).to have_content('Register to play')
  end
  scenario 'fill in registration form' do
    visit('/')
    click_link('register')
    fill_in(:username, with: 'Ezzy')
    fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
    click_button('Submit')
    expect(page).to have_content('Hi Ezzy, click play to start game')
  end
    scenario 'log out of game' do
    visit('/')
    click_link('register')
    fill_in(:username, with: 'Ezzy')
    fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
    click_button('Submit')
    click_link('log out')
    expect(page).to have_content('Register or login before playing')
  end
end







feature 'allow user to login' do
end