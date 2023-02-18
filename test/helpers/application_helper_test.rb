require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'should return success flash class' do
    assert_equal 'success', flash_class('notice')
  end

  test 'should return danger flash class' do
    assert_equal 'danger', flash_class('alert')
  end

  test 'should return info flash class' do
    assert_equal 'info', flash_class('another')
  end
end
