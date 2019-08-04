class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(charArr)
    charArr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.join('').upcase.split('')
    else
      raise 'not valid pegs'
    end
  end

  def pegs
    @pegs
  end

  def self.random(len)
    pegArr = Array.new(len) {POSSIBLE_PEGS.keys[rand(0..3)]}
    return Code.new(pegArr)
  end

  def self.from_string(pegString)
    return Code.new(pegString.split(''))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(codeInstance)
    matches = 0
    codeInstance.pegs.each_with_index do |peg, i|
      if peg == @pegs[i]
        matches += 1
      end
    end
    return matches
  end

  def num_near_matches(codeInstance)
    count = 0
    codeInstance.pegs.each_with_index do |char, i|
      if @pegs.include?(char) && codeInstance.pegs[i] != @pegs[i]
        count += 1
      end
    end
    return count
  end

  def ==(codeInstance)
    if @pegs.join('') == codeInstance.pegs.join('')
      true
    else
      false
    end
  end
end
