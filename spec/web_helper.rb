def play_rock
  visit('/')
  click_link('register')
  fill_in(:username, with: 'Ezzy')
  fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
  click_button('Submit')
  click_link('play')
  click_link('R O C K')
end


def register_ezzy
  visit('/')
  click_link('register')
  fill_in(:username, with: 'Ezzy')
  fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
  click_button('Submit')
end

def login_ezzy
  click_link('log in')
  fill_in(:username, with: 'Ezzy')
  click_button('Submit')
end