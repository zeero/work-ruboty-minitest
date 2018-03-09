module Ruboty
  module Minitest
    module Actions
      # hello
      class Hello < Ruboty::Actions::Base
        def call
          if message[:target] == 'me'
            message.reply('hello')
          else
            message.reply("hello #{message[:target]}")
          end
        end
      end
    end
  end
end
