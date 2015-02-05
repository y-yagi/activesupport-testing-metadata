require 'minitest_helper'

class ActiveSupportTestingMetadataTest< Minitest::Test
  def test_metadata_returns_metadata_hash_for_each_test_method
    @a = TestClass

    expect = { js: true }
    assert_equal expect, @a.metadata['test_test1']

    expect = {}
    assert_equal expect, @a.metadata['test_test2']

    expect = { js: false }
    assert_equal expect, @a.metadata['test_test3']

    expect = { vcr: true, js: false }
    assert_equal expect, @a.metadata['test_test4']
  end
end

class TestClass < ActiveSupport::TestCase
  ActiveSupport.test_order = :random

  test 'test1', js: true do; end
  test 'test2' do; end
  test 'test3', js: false do; end
  test 'test4', :vcr, js: false do; end
end
