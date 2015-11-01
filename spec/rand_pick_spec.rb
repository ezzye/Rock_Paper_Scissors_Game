require 'rand_pick'
describe RandPick do
  let(:choices) {[:rock,:paper,:scissors]}

  it 'returns at random paper' do
    srand(101)
    expect(RandPick.run choices).to eq :paper
  end
  it 'returns at random rock' do
    srand(102)
    expect(RandPick.run choices).to eq :rock
  end
  it 'returns at random scissors' do
    srand(106)
    expect(RandPick.run choices).to eq :scissors
  end
end