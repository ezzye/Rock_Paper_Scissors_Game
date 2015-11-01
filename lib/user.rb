class User

  attr_reader :name, :email, :results
  attr_accessor :pick, :score, :played

  def initialize(username,useremail)
    @name = username
    @email = useremail
    @score = 0
    @played = 0
    @results = []
  end

  def result_add result
    self.results << result
  end

  private

  attr_writer :name, :email


end