class Crypto
  attr_reader :normalized

  def initialize(input)
    @normalized = input.gsub(/\W/, '').downcase
  end

  def normalize_plaintext
    normalized
  end

  def size
    find_perfect(normalized.length)
  end

  def plaintext_segments
    normalized.scan(/.{1,#{size}}/)
  end

  def create_cipher
    cipher = []
    plaintext_segments.each(&:split).each do |row|
      row.split('').each_with_index do |letter, idx|
        cipher[idx] ||= []
        cipher[idx] << letter
      end
    end
    cipher
  end

  def ciphertext
    create_cipher.flatten.join
  end

  def normalize_ciphertext
    create_cipher.map { |row| row.join('') }.join(' ')
  end

  def find_perfect(square)
    while Math.sqrt(square) % 1 != 0
      square += 1
    end
    Math.sqrt(square).to_i
  end
end
