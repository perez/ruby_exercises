class Codemaker
  def initialize
    @secret_code = generate_code
  end

  private

  def generate_code
    [*1..6].sample(4)
  end
end
