require 'tilt/template'
require 'hamdown'

module Tilt
  class HamdownTemplate < Template
    self.default_mime_type = 'text/hamdown'

    def prepare
      options = {}.update(@options)
      @engine = ::Hamdown::Engine
    end

    def evaluate(scope, locals, &block)
      if scope.nil?
        @engine.perform(data)
      else
        @engine.perform(scope)
      end
    end
  end
end
