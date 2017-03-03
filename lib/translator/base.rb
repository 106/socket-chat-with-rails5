module Translator
  class Base
    attr_accessor :message, :dialect

    def initialize(message, dialect)
      @message = message
      @dialect = dialect
    end

    def translate!
      raise 'Should be implemented in children'
    end
  end
end
