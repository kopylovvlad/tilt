require 'tilt/template'
require 'hamdown'

module Tilt
  class HamdownTemplate < Template
    self.default_mime_type = 'text/hamdown'

    def prepare
      options = {}.update(@options)
      @engine = ::Hamdown::Engine.perform(content)
    end

    def evaluate(scope, locals, &block)
      @output ||= @engine.perform(data)
    end
  end
end
