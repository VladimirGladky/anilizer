# frozen_string_literal: true

require_relative "lib/anilizer/version"

Gem::Specification.new do |spec|
  spec.name = "anilizer"
  spec.version = Anilizer::VERSION
  spec.authors = ["Smooth","Glagol718","Astapov1138","rburdukovskii","M-Zverev"]
  spec.email = ["gadjiram@icloud.com"]

  spec.summary = "анализатор текста"
  spec.description = "Частотный анализ текстовых файлов. На вход подается путь к папке с файлами в формате .txt. Нужно считать   данные из всех файлов и вернуть список встречающихся в файлах слов, указав для каждого слова количество вхождений. Нужно сделать настройки для работы модуля: стоп-лист слов (слова, которые не учитываются при подсчете), проводить ли лемматизацию."
  spec.homepage = "https://github.com/Glagol718/Ruby_Gem"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/Glagol718/Ruby_Gem"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Glagol718/Ruby_Gem"
  spec.metadata["changelog_uri"] = "https://github.com/Glagol718/Ruby_Gem"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
