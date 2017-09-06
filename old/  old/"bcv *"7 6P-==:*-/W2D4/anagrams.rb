def anagram?(word1, word2)
  perm1 = word1.chars.permutation
  perm1.include?(word2.chars)
end

def anagram2(word1,word2)
  word1.chars - word2.chars == []
end

def anagram3(word1,word2)
  word1.chars.sort == word2.chars.sort
end

def anagram4(word1,word2)
  w1 = Hash.new(0)
  word1.each_char do |l|
    w1[l] += 1
  end
  word2.each_char do |l|
    w1[l] -= 1
  end
  w1.values.all? { |v| v == 0 }
end
