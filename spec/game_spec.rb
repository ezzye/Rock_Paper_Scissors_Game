require 'game'

describe Game do
  subject(:game) {Game.new(ezzy,computer)}
  let(:ezzy) {double(:ezzy, name: 'Ezzy')}
  let(:computer) {double(:computer, name: 'Computer')}

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
  describe '#update_score' do
    it 'updates user scores based on picks' do
      allow(ezzy).to receive(:pick=)
      allow(computer).to receive(:pick=)
      allow(ezzy).to receive(:played=)
      allow(computer).to receive(:played=)
      allow(ezzy).to receive(:score=)
      allow(computer).to receive(:score=)
      allow(ezzy).to receive(:result_add)
      allow(computer).to receive(:result_add)
      allow(ezzy).to receive(:played).and_return(0)
      allow(computer).to receive(:played).and_return(0)
      allow(ezzy).to receive(:pick).and_return(:rock)
      allow(computer).to receive(:pick).and_return(:paper)
      allow(ezzy).to receive(:score).and_return(0)
      allow(computer).to receive(:score).and_return(1)
      game.update_score
      expect(game.user.score).to eq 0
      expect(game.user2.score).to eq 1
    end
  end
  describe '#spock?' do
    it 'set spock ' do
      game.play_spock
      expect(game).to be_spock
    end
  end
end