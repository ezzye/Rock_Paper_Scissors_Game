feature 'Create game room for multiplayer' do
  scenario 'play an opponent Ezzy vs Doral' do
    visit('/')
    register_ezzy
    click_link('multiplayer')
    click_button('rock')
    visit('/')
    register_doral
    click_button('rock')
    click_button('Ezzy: 0/0 vs. waiting')
    expect(page).to have_content('Ezzy: 0/1 vs. Doral: 0/1')
  end
  scenario 'create room and see result' do
    visit('/')
    register_ezzy
    click_link('multiplayer')
    click_button('rock')
    visit('/')
    register_doral
    click_button('rock')
    click_button('Ezzy: 0/0 vs. waiting')
    visit('/')
    login_ezzy
    click_link('multiplayer')
    expect(page).to have_content('Ezzy: 0/1 vs. Doral: 0/1')
  end
  # scenario 'enter a game room' do
  #   visit('/')
  #   register_doral
  #   click_link('multiplayer')
  #   click_button('paper')
  #   click_button('Play player1: Ezzy')
  #   expect(page).to have_content('*WINNER*  Doral: 1/1 vs. Ezzy: 0/1  *LOSER*')
  # end
end