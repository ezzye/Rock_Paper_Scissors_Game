feature 'Rock scissors paper play board' do
  scenario 'shows play board when register and play selected' do
    visit('/')
    click_link('log out')
    register_ezzy
    click_link('play')
    expect(page).to have_content('Computer vs. Ezzy : select rock, scissors or paper')
  end
  scenario 'shows play board when logged in and play selected' do
    visit('/')
    click_link('log out')
    expect(page).to have_content('Register or login before playing')
  end
  scenario 'shows play board rock, scissor  paper options' do
    visit('/')
    login_ezzy
    click_link('play')
    expect(page).to have_content('R O C K P A P E R S C I S S O R S')
  end
end