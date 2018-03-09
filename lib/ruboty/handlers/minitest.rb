require 'ruboty/minitest/actions/hello'

module Ruboty
  module Handlers
    # handler
    class Minitest < Base
      on(/minitest +(?<hello>hello) +(?<target>.+)/, name: 'hello', description: 'helloと言う')

      def hello(message)
        Ruboty::Minitest::Actions::Hello.new(message).call
      end
    end
  end
end
