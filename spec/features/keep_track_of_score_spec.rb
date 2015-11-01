feature 'Show initial score' do
  scenario 'when on start playing' do
    visit('/')
    click_link('register')
    fill_in(:username, with: 'Ezzy')
    fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
    click_button('Submit')
    click_link('play')
    expect(page).to have_content('Computer: 0/0 vs. Ezzy: 0/0')
  end
end
feature 'Show score on result page after making a selction' do
  scenario 'select rock either computer or Ezzy with 1/1 with appropriate winner' do
    visit('/')
    click_link('register')
    fill_in(:username, with: 'Ezzy')
    fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
    click_button('Submit')
    click_link('play')
    click_link('R O C K')
    expect(page).to (have_content('*WINNER*  Computer: 1/1 vs. Ezzy: 0/1  *LOSER*') || have_content('*LOSER*  Computer: 0/1 vs. Ezzy: 1/1  *WINNER*'))
  end
end