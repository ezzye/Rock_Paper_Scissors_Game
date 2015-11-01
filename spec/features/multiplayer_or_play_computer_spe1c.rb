feature 'select two player on the same computer option' do
  scenario 'take turns to register' do
    register_ezzy
    register_doral #on user2 register page --sets doral as user2
    expect(page).to have_content(Doral: 0/0 vs. Ezzy: 0/0) #play2 page paired with result2
  end
  # scenario 'take turns to login' do
  #   login_ezzy
  #   login_doral #on user2 login page --sets doral as user2
  #   expect(page).to have_content(Doral: 0/0 vs. Ezzy: 0/0) #play2 page paired with
  # end
end
# feature 'select play computer option' do
#   scenario 'take option to play computer' do
#     register_ezzy
#     click_link(play computer) #on user2 register page --sets user2 as computer
#     expect(page).to have_content(Computer: 0/0 vs. Ezzy: 0/0) #play paired with result
#   end
#   scenario 'take option to play computer' do
#     login_ezzy
#     click_link(play computer) #on user2 login page  --sets user2 as computer
#     expect(page).to have_content(Computer: 0/0 vs. Ezzy: 0/0) #play paired with result
#   end
end