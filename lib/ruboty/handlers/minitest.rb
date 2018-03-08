require "ruboty/minitest/actions/hello"

module Ruboty
  module Handlers
    class Minitest < Base
      on /minitest hello/, name: 'hello', description: 'TODO: write your description'

      def hello(message)
        Ruboty::Minitest::Actions::Hello.new(message).call
      end
    end
  end
end
