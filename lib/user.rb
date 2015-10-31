class User

  attr_reader :name, :email

  def initialize(username,useremail)
    @name = username
    @email = useremail
  end

  private

  attr_writer :name, :email


end