require_relative '../build_a_wall'

describe 'BuildAWall' do
  it 'builds a wall dimensions 5 x 5' do
    wall = BuildAWall.new(5, 5).do

    expect(wall).to eq('■■|■■|■■|■■|■■\n■|■■|■■|■■|■■|■\n■■|■■|■■|■■|■■\n■|■■|■■|■■|■■|■\n■■|■■|■■|■■|■■')
  end

  it 'builds a wall dimensions 10 x 7' do
    wall = BuildAWall.new(10, 7).do

    expect(wall).to eq('■|■■|■■|■■|■■|■■|■■|■\n■■|■■|■■|■■|■■|■■|■■\n■|■■|■■|■■|■■|■■|■■|■\n■■|■■|■■|■■|■■|■■|■■\n■|■■|■■|■■|■■|■■|■■|■\n■■|■■|■■|■■|■■|■■|■■\n■|■■|■■|■■|■■|■■|■■|■\n■■|■■|■■|■■|■■|■■|■■\n■|■■|■■|■■|■■|■■|■■|■\n■■|■■|■■|■■|■■|■■|■■')
  end

  it 'returns None for invalid input' do
    wall = BuildAWall.new('eight', [3]).do

    expect(wall).to eq('None')
  end

  it 'returns None for negative value' do
    wall = BuildAWall.new(12, -4).do

    expect(wall).to eq('None')
  end

  it 'cannot build a wall for large dimensions' do
    wall = BuildAWall.new(123, 987).do

    expect(wall).to eq('Naah, too much...here\'s my resignation.')
  end
end
