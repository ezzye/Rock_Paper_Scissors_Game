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
feature 'Take turns at either RPS or Spock Lizard' do
  scenario 'select spock lizard' do
    visit('/')
    register_ezzy
    click_link('play computer')
    click_link('Spock Lizzard')
    srand(103)
    click_link('S P O C K')
    expect(page).to have_content('*WINNER*  Computer: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
  scenario 'select RPS after selecting spock lizard' do
    visit('/')
    register_ezzy
    click_link('play computer')
    click_link('Spock Lizzard')
    click_link('Traditional RPS')
    click_link('R O C K')
    srand(101)
    expect(page).to have_content('*WINNER*  Computer: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
end