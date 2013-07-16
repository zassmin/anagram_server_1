module SeedDB
  def self.seed
    File.open('anagram.txt').each_line do |word|
      word = word.chomp
      Word.create(word: word, sorted_word: word.downcase.split('').sort.join)
    end
  end
end

