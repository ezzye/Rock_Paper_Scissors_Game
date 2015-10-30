feature 'Show home page' do
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content('Welcome to the Makers Rock, Paper, Scissors Game')
  end
  scenario 'instructions' do
    visit('/')
    expect(page).to have_content('Register or login then click play.')
  end
end