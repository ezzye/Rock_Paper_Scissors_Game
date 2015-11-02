feature 'Allow user to select either RPS or Spock Lizard' do
  scenario 'select spock lizard' do
    visit('/')
    register_ezzy
    click_link('play computer')
    click_link('Spock Lizzard')
    expect(page).to have_content('S P O C K L I Z A R D')
  end
  scenario 'select RPS after selecting spock lizard' do
    visit('/')
    register_ezzy
    click_link('play computer')
    click_link('Spock Lizzard')
    click_link('Traditional RPS')
    expect(page).not_to have_content('S P O C K L I Z A R D')
  end
end
feature 'Take turns at either RPS or Spock Lizard one player' do
  scenario 'select spock lizard' do
    visit('/')
    register_ezzy
    click_link('play computer')
    click_link('Spock Lizzard')
    srand(103)
    click_button('spock')
    expect(page).to have_content('*WINNER*  Computer: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
  scenario 'select RPS after selecting spock lizard' do
    visit('/')
    register_ezzy
    click_link('play computer')
    click_link('Spock Lizzard')
    click_link('Traditional RPS')
    click_button('rock')
    srand(101)
    expect(page).to have_content('*WINNER*  Computer: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
end
feature 'Take turns at either RPS or Spock Lizard one player (MULTIPLAYER)' do
  scenario 'select spock lizard' do
    visit('/')
    register_ezzy
    register_doral
    click_link('Spock Lizzard')
    click_link('S P O C K')
    click_link('L I Z A R D')
    expect(page).to have_content('*WINNER*  Doral: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
  scenario 'select RPS after selecting spock lizard' do
    visit('/')
    register_ezzy
    register_doral
    click_link('Traditional RPS')
    click_link('R O C K')
    click_link('P A P E R')
    expect(page).to have_content('*WINNER*  Doral: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
end