require 'test_helper'

describe Ruboty::Handlers::Minitest do
  before do
  end

  describe '#hello' do
    it 'Actionのcallが呼ばれることの検証' do
      Ruboty::Minitest::Actions::Hello.any_instance.expects(:call).once
      Ruboty::Robot.new.receive(body: 'ruboty minitest hello', from: 'sender', to: 'channel')
    end

    it 'Actionのcallが呼ばれないことの検証' do
      Ruboty::Minitest::Actions::Hello.any_instance.expects(:call).never
      Ruboty::Robot.new.receive(body: 'ruboty minitest never', from: 'sender', to: 'channel')
    end
  end
end
