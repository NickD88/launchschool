class DNA
  def initialize(dna)
    @dna = dna.chars
  end

  def hamming_distance(test_dna)
    distance = test_dna.chars.reject.with_index do |letter, idx|
      letter == @dna[idx] || @dna[idx] == nil
    end
    distance.length
  end
end
