require 'ruboty/minitest'

module Ruboty
  module Minitest
    module Actions
      # hello
      class Hello < Ruboty::Actions::Base
        def call
          message.reply('TODO: write a message.')
        end
      end
    end
  end
end
