require 'test_helper'

describe Ruboty::Handlers::Minitest do
  let(:robot) { Ruboty::Robot.new }

  before do
  end

  describe '#hello' do
    let(:action) { Ruboty::Minitest::Actions::Hello }

    # Action#callの代わりとなるmockを作る（１回呼ばれるかを検証）
    let(:mock_action_call) { mock().tap { |mock| mock.expects(:call).once } }

    it 'Actionが呼ばれることの検証' do
      # Action.newの引数のmessageを取り出して、正規表現のマッチが正しいかを検証する
      action
        .stubs(:new)
        .with do |message|
          message[:hello].must_equal 'hello'
          message[:target].must_equal 'world'
        end
        .returns(mock_action_call)

      robot.receive(body: 'ruboty minitest hello world', from: 'sender', to: 'channel')
    end

    it 'Actionが呼ばれないことの検証' do
      # Action#callをmock化して、呼ばれないことを検証
      action.any_instance.expects(:call).never
      robot.receive(body: 'ruboty minitest never', from: 'sender', to: 'channel')
    end
  end
end
