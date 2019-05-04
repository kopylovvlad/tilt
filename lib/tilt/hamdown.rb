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
      if scope.is_a?(String)
        @engine.perform(scope)
      else
        @engine.perform(data)
      end
    end
  end
end
