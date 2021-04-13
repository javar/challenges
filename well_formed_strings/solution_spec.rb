def validate(string)
  stack = []
  string.chars.each do |character|
    if valid_pairs.key?(character)
      stack.push(character)
    elsif valid_pairs[stack.last] == character
      stack.pop
    elsif valid_pairs.value?(character)
      return false
    end
  end
  stack.count.zero?
end

def valid_pairs
  {
    '{' => '}',
    '(' => ')',
    '[' => ']'
  }
end

describe 'validate well-formed string' do
  it 'validates string as valid' do
    string = '({12}[34(56){67}])'

    expect(validate(string)).to be(true)
  end

  it 'validates string as valid' do
    string = '{[()]}'

    expect(validate(string)).to be(true)
  end

  it 'validates the string as invalid' do
    string = '({12)'

    expect(validate(string)).to be(false)
  end

  it 'validates the string as invalid' do
    string = '({12)}'

    expect(validate(string)).to be(false)
  end
end
