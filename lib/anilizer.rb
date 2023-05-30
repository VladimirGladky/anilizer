# frozen_string_literal: true

require_relative "anilizer/version"

module Anilizer
  class Error < StandardError; end

  def self.lemmatize_file(file_path, arr_of_ignored_words)
    words = Hash.new(0)
    arr_ignored = arr_of_ignored_words.map(&:downcase)
    output = `mystem.exe #{file_path} -c -l -s -d`

    words_list = output.scan(/[[:alpha:]]+/)

    words_list.each do |word|
      lemma = word.downcase

      next if arr_ignored.include?(lemma)

      words[lemma] += 1
    end

    words
  end
end

puts "Enter the path to the folder that contains txt files"
path = gets.chomp
puts "Enter the words that you don't want to count (dividing by space)"
restricts = gets.chomp
arr_restricts = restricts.split(' ')
puts "There are the results"
hash = Anilizer::lemmatize_file(path, arr_restricts)
hash.each do |word, count|
  puts "Слово: #{word}, Количество: #{count}"
end