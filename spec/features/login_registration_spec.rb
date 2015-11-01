feature 'Allow user to register or login' do
  scenario 'new user clicks on register' do
    visit('/')
    click_link('register')
    expect(page).to have_content('Register to play')
  end
  scenario 'fill in registration form' do
    register_ezzy
    expect(page).to have_content('Hi Ezzy, click play to start game')
  end
    scenario 'log out of game' do
      register_ezzy
      click_link('log out')
      expect(page).to have_content('Register or login before playing')
  end
    scenario 'log in to game' do
      register_ezzy
      click_link('log out')
      login_ezzy
      expect(page).to have_content('Hi Ezzy, click play to start game')
    end
    scenario 'log in to game after delay' do
      visit('/')
      login_ezzy
      expect(page).to have_content('Hi Ezzy, click play to start game')
    end
    scenario 'log in when not registered' do
      visit('/')
      click_link('log in')
      fill_in(:username, with: 'Nobody')
      click_button('Submit')
      expect(page).to have_content('Register to play')
    end

end

