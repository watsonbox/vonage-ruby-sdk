# typed: strong

module Vonage
  class Error < StandardError
    attr_reader :response

    def initialize(response = nil)
      super

      @response = response
    end
  end
end
