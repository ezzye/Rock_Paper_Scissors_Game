feature 'Show home page' do
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content('Welcome to the Makers Rock, Paper, Scissors Game')
  end
  scenario 'instructions for new game' do
    visit('/')
    click_link('log out')
    expect(page).to have_content('Register or login before playing')
  end
end