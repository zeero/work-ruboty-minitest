require "test_helper"

class Ruboty::MinitestTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ruboty::Minitest::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
