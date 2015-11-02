feature 'select two player on the same computer option' do
  scenario 'take turns to register' do
    register_ezzy
    register_doral #on user2 register page --sets doral as user2
    expect(page).to have_content('Doral: 0/0 vs. Ezzy: 0/0') #play2 page paired with result2
  end
  scenario 'take turns to login' do
    visit('/')
    login_ezzy
    login_doral #on user2 login page --sets doral as user2
    expect(page).to have_content('Doral: 0/0 vs. Ezzy: 0/0') #play2 page paired with
  end
end
feature 'select play computer option' do
  scenario 'take option to play computer' do
    register_ezzy
    click_link('play computer') #on user2 register page --sets user2 as computer
    expect(page).to have_content('Computer: 0/0 vs. Ezzy: 0/0') #play paired with result
  end
  scenario 'take option to play computer' do
    visit('/')
    login_ezzy
    click_link('play computer') #on user2 login page  --sets user2 as computer
    expect(page).to have_content('Computer: 0/0 vs. Ezzy: 0/0') #play paired with result
  end
end
feature 'Two human opponents takign turns playing' do
  scenario 'pay one round Doral winner' do
    register_ezzy
    register_doral
    click_button('rock')
    click_button('paper')
    expect(page).to have_content('*WINNER*  Doral: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
  scenario 'pay one round Ezzy winner' do
    register_ezzy
    register_doral
    click_button('paper')
    click_button('rock')
    expect(page).to have_content('*LOSER*  Doral: 0/1 vs. Ezzy: 1/1  *WINNER*')
  end
  scenario 'pay one round a draw' do
    register_ezzy
    register_doral
    click_button('scissors')
    click_button('scissors')
    expect(page).to have_content('*DRAW*  Doral: 0/1 vs. Ezzy: 0/1  *DRAW*')
  end
  scenario 'pay one round a draw and play again Doral winning' do
    register_ezzy
    register_doral
    click_button('scissors')
    click_button('scissors')
    click_link('play again')
    click_button('rock')
    click_button('paper')
    expect(page).to have_content('*WINNER*  Doral: 1/2 vs. Ezzy: 0/2  *LOSER*')
  end
end