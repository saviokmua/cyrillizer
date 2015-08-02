# encoding: utf-8

require 'yaml'

module Cyrillizer
  attr_writer :language

  class << self
    def language
      @language ||= :macedonian
    end

    def language=(language)
      @language = language
      @alphabet = nil
    end

    def alphabet=(file)
      if file
        @alphabet = YAML.load_file(file)
        @language = File.basename(file, File.extname(file))
      end
    end

    def alphabet
      @alphabet ||= YAML.load_file(File.join(File.dirname(__FILE__), "../alphabets/#{language.to_s}.yml"))
    end
  end
end
