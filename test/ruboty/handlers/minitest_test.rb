require 'test_helper'

describe Ruboty::Handlers::Minitest do
  before do
  end

  describe '#hello' do
    it 'Actionのcallが呼ばれることの検証' do
      # Action.newをstubにするため、Action#callはmockにする（一回呼ばれているかは検証する）
      mock = mock()
      mock.expects(:call).once

      # Action.newの引数のmessageを取り出して、正規表現のマッチが正しいかを検証する
      Ruboty::Minitest::Actions::Hello
        .stubs(:new)
        .with { |message| message[:hello].must_equal 'hello' }
        .returns(mock)

      Ruboty::Robot.new.receive(body: 'ruboty minitest hello', from: 'sender', to: 'channel')
    end

    it 'Actionのcallが呼ばれないことの検証' do
      Ruboty::Minitest::Actions::Hello.any_instance.expects(:call).never
      Ruboty::Robot.new.receive(body: 'ruboty minitest never', from: 'sender', to: 'channel')
    end
  end
end
