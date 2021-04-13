class BuildAWall
  def initialize(width, height)
    @width = width
    @height = height
  end

  def do
    return 'None' unless valid_number?(@width) && valid_number?(@height)
    return 'Naah, too much...here\'s my resignation.' unless valid_range?

    wall = []
    @width.times do |i|
      wall << full_row if (i % 2).zero?
      wall << half_row if (i % 2).odd?
    end
    wall.reverse.join('')[0...-2]
  end

  private

  def valid_number?(number)
    number.is_a?(Integer) && number.positive?
  end

  def valid_range?
    @width * @height < 10_000
  end

  def full_row
    '■■|'*(@height -1)+'■■\n'
  end

  def half_row
    '■|'+'■■|'*(@height -1)+'■\n'
  end
end
