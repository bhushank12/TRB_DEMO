require 'test_helper'

class CallTest < ActiveSupport::TestCase
  test 'Delete call successfully' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')

    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)
    result = Call::Operation::Delete.call(params: { id: call.id })
    assert(result.success?)
  end

  test 'Failed to delete call' do
    result = Call::Operation::Delete.call(params: { id: 'abc' })

    assert_not(result.success?)
    assert_equal(['Call Not Found'], result[:errors])
  end
end
