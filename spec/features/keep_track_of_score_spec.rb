feature 'Show initial score' do
  scenario 'when on start playing' do
    visit('/')
    click_link('register')
    fill_in(:username, with: 'Ezzy')
    fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
    click_button('Submit')
    click_link('play computer')
    expect(page).to have_content('Computer: 0/0 vs. Ezzy: 0/0')
  end
end
feature 'Show score on result page after making a selction' do
  scenario 'select rock either computer or Ezzy with 1/1 with appropriate winner' do
    srand(101)
    play_rock
    expect(page).to have_content('*WINNER*  Computer: 1/1 vs. Ezzy: 0/1  *LOSER*')
  end
end
feature 'Show score on result page after making a selction' do
  scenario 'select rock either computer or Ezzy with 1/1 with appropriate winner' do
    srand(102)
    play_rock
    expect(page).to have_content('*DRAW*  Computer: 0/1 vs. Ezzy: 0/1  *DRAW*')
  end
end
feature 'Show score on result page after making a selction' do
  scenario 'select rock either computer or Ezzy with 1/1 with appropriate winner' do
    srand(106)
    play_rock
    expect(page).to have_content('*LOSER*  Computer: 0/1 vs. Ezzy: 1/1  *WINNER*')
  end
end
feature 'Show score on playing again' do
  scenario 'select rock either computer or Ezzy with 1/1 with appropriate winner' do
    srand(106)
    play_rock
    click_link('play again')
    srand(106)
    click_link('P A P E R')
    expect(page).to have_content('*WINNER*  Computer: 1/2 vs. Ezzy: 1/2  *LOSER*')
  end
end