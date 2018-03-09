module Ruboty
  module Minitest
    module Actions
      # hello
      class Hello < Ruboty::Actions::Base
        def call
          if message[:target] == 'me'
            message.reply(message[:hello])
          else
            message.reply("#{message[:hello]} #{message[:target]}")
          end
        end
      end
    end
  end
end
