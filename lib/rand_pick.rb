class RandPick

  attr_reader :choices

  def initialize(choices)
    @number_of_choices = choices.count
    @choices = choices
  end

  def self.run(choices)
    new(choices).run
  end

  def run
    choices[rand(@number_of_choices)]
  end
end