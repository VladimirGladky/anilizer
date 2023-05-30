 # frozen_string_literal: true

 require_relative "test_helper"

 class TestAnilizer < Minitest::Test
   def test_that_it_has_a_version_number
     refute_nil ::Anilizer::VERSION
   end
 
   def test_up_and_low_case_and_punctuation_marks
     h = {"this" => 2, "be" => 2, "first" => 1, "test" => 2, "and" => 1, "second" => 1, "file" => 2}
     assert_equal h, Anilizer::read_words_from_file_ignoring_some_words("tests1", [""])
   end
 
   def test_ignoring_some_words_and_multiple_files_checking
     h = {"anhalt" => 2, "dessau" => 2, "hessen" => 2, "darmshtadt" => 2, "and" => 1, "of" => 4}
     assert_equal h, Anilizer::read_words_from_file_ignoring_some_words("tests2", ["Duchy"])
   end
 
   def test_lemmatization
     h = {"test" => 2, "clarify" => 1}
     assert_equal h, Anilizer::read_words_from_file_ignoring_some_words("tests3", [])
   end
 
 end