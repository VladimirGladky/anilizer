# frozen_string_literal: true

require_relative "anilizer/version"
require "lemmatizer"

module Anilizer
  class Error < StandardError; end

  def self.read_words_from_file_ignoring_some_words(path_to_dir, arr_of_ignored_words) #arr_of_file_names
    words = Hash.new(0)
    count = 0;
    lemmatizer = Lemmatizer.new
    arr_ignored = arr_of_ignored_words.map{|x| x.downcase}
    txt_files = Dir.entries(path_to_dir).select { |f| File.file? File.join(path_to_dir, f) }
    txt_files.each do |file|
      File.open(path_to_dir + "\\" + file, "r").each_line do |line|
        strings = line.scan(/[[:alpha:]]+/)
        strings = strings.map{|y| y.downcase}
        strings.each do |word|
          if (!arr_ignored.include?(word) && !arr_of_ignored_words.include?(word))
            lemma = lemmatizer.lemma(word)
            word = lemma
            words[word.downcase] += 1;
          end
        end
      end
    end
    words
  end
end

begin
  puts "Enter the path to the folder that contains txt files"
  path = gets.chomp
  puts "Enter the words that you don't want to count (dividing by space)"
  restricts = gets.chomp
  arr_restricts = restricts.split(' ')
  puts "There are the results"
  hash = Anilizer.read_words_from_file_ignoring_some_words(path, arr_restricts)
  p hash
rescue Errno::ENOENT => error
  puts "Folder not found: " + error.message
end
