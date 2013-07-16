class Word < ActiveRecord::Base
  # Returns an Array of Word objects which represent anagrams of this word
  # This can and should make calls to the database
  # Try to do it in as few calls as possible, without loading every word into memory.  If you can't, that's ok.
  def self.canonical(word)
    word.downcase.split('').sort.join
  end

  def self.anagram(potential_anagram)
    anagram_array = []
    anagram_list = Word.find_all_by_sorted_word(self.canonical(potential_anagram))
    anagram_list.each do |anagram_object|
      anagram_array << anagram_object.word
    end
    anagram_array
  end
end