feature 'Create game room for multiplayer' do
  scenario 'create a game room' do
    visit('/')
    register_ezzy
    click_link('next turn')
    click_button('rock')
    click_button('Request player2: turn')
    expect(page).to have_content('REFRESH to see if player2 has played')
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