require 'test_helper'

describe Ruboty::Minitest::Actions::Hello do
  subject { Ruboty::Minitest::Actions::Hello.new(mock_message) }

  let(:mock_message) { mock }

  before do
  end

  describe '#call' do
    it '<target>が"me"の場合、helloだけ返す' do
      # スタブで<target>を設定
      mock_message.stubs(:[]).with(:target).returns('me')
      # モックでreplyの引数を検証
      mock_message.expects(:reply).with('hello').once

      subject.call
    end

    it '<target>が"me"以外の場合、hello worldを返す' do
      # スタブで<target>を設定
      mock_message.stubs(:[]).with(:target).returns('world')
      # モックでreplyの引数を検証
      mock_message.expects(:reply).with('hello world').once

      subject.call
    end
  end
end
