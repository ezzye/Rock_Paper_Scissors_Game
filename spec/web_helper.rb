def play_rock
  visit('/')
  click_link('register')
  fill_in(:username, with: 'Ezzy')
  fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
  click_button('Submit')
  click_link('play computer')
  click_button('rock')
end


def register_ezzy
  visit('/')
  click_link('register')
  fill_in(:username, with: 'Ezzy')
  fill_in(:useremail, with: 'ezzy.elliott@gmail.com')
  click_button('Submit')
end

def register_doral
  click_link('register another opponent')
  fill_in(:username, with: 'Doral')
  fill_in(:useremail, with: 'doral.elliott@gmail.com')
  click_button('Submit')
end

def login_ezzy
  click_link('log in')
  fill_in(:username, with: 'Ezzy')
  click_button('Submit')
end

def login_doral
  click_link('log in another opponent')
  fill_in(:username, with: 'Doral')
  click_button('Submit')
end