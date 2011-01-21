# encoding: utf-8

# A simple Password generator. Central parts are based on 
# http://snippets.dzone.com/posts/show/2137 and comments.
class Password
  # consonantes and pronounceable combinations with vowels
  CONSONANTS = %w(b c d f g h j k l m n p qu r s t v w x z ch cr fr nd ng nk nt ph pr rd sch sh sl sp st th tr)
  # vowels and sound-alike +y+
  VOWELS = %w(a e i o u y)
  # some characters
  CHARS = (('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a + "%&/()[]!\"§$,.-;:_#'+*?".split(//u)) - "io01lO".split(//u)

  # Creates a new password generator. The length +len+ might be an
  # +Integer+ or a +Range+.
  def initialize len = (8..12)
    if len.is_a? Integer
      @length = Range.new(len-1, len+1)
    elsif len.is_a? Range
      @length = len
    else
      raise ArgumentException, "Length is neither an Integer nor a Range."
    end
  end

  class << self
    # Similar to #pronounceable, this generates a pronounceable password.
    def pronounceable len = (8..12)
      self.new(len).pronounceable
    end

    # Similar to #random, this generates a random password.
    def random len = (8..12)
      self.new(len).random
    end
  end

  # Generates a pronounceable password.
  def pronounceable
    size = @length.to_a[rand(@length.count)] - 2
    f, pw = true, ''
    size.times do
      pw << (f ? CONSONANTS[rand * CONSONANTS.size] : VOWELS[rand * VOWELS.size])
      f = !f
    end
    pw
  end

  # Unlike #pronounceable, this does not ensure the pronounceability and
  # will include some special characters, but will exclude "unfriendly"
  # characters (like +0+, +O+).
  def random
    size = @length.to_a[rand(@length.count)]
    (1..size).collect do |a|
      CHARS[rand(CHARS.size)]
    end.join ''
  end
end

