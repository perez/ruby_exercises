class Dictionary
  def initialize(file)
    @file = File.open(file, 'r')
    @words = []
    store_dictionary
  end

  private

  def store_dictionary
    until @file.eof?
      line = @file.readline.strip

      next unless line.length.between?(4, 12)

      @words << line
    end
  end

  public

  def random_word
    @words.sample
  end
end
