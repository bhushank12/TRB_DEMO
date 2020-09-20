require 'test_helper'

class CallTest < ActiveSupport::TestCase
  test 'Initialize new call successfully' do
    result = Call::Operation::Create::Present.call(params: {})

    assert(result.success?)
    assert_not_nil(result[:model])
    assert_not_nil(result[:model].customer)
  end
end
