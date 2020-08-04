module FunWithStrings
    def palindrome?
        return self.downcase.gsub(/\W/, '')  == self.gsub(/\W/, '').downcase.reverse
    end
    def count_words
        text = self.downcase.strip
        words = {}
        text.split(/\W+/).each do |w|
            words[w] = words.fetch(w, 0) + 1
        end
        return words
    end
    def anagram_groups
        text = self.downcase.strip
        return text.split(/\W+/).group_by { |w| w.chars.sort.join }.values
    end
end

# make all the above functions available as instance methods on Strings:

class String
    include FunWithStrings
end

# make all the above functions
