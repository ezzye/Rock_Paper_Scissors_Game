require 'game'

describe Game do
  subject(:game) {Game.new(ezzy)}
  let(:ezzy) {double(:ezzy, name: 'Ezzy')}

  describe '#message' do
    context 'when user not registered' do
      subject(:game) {Game.new}
      it 'shows welcome message' do
        expect(game.message).to eq 'Register or login before playing'
      end
    end
    context 'when user registered' do
      it 'shows hello user message' do
        expect(game.message).to eq 'Hi Ezzy, click play to start game'
      end
    end

  end
end