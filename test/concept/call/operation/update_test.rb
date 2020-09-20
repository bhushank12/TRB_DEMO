require 'test_helper'

class CallTest < ActiveSupport::TestCase
  test 'Call updated successfully with new vmake' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Update.call(params: { call: { vmake: 'honda' }, id: call.id })

    assert(result.success?)
  end

  test 'Call updated successfully with new vmodel' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Update.call(params: { call: { vmodel: 'suzuki' }, id: call.id })

    assert(result.success?)
  end

  test 'Call updated successfully with new vsubmodel' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Update.call(params: { call: { vsubmodel: '1.3vxi' }, id: call.id })

    assert(result.success?)
  end

  test 'Call updated successfully with new customer first name' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Update.call(params: { call: { vmake: 'honda', customer: { first_name: 'suraj' } }, id: call.id })

    assert(result.success?)
  end

  test 'Call updated successfully with new customer last name' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Update.call(params: { call: { vmake: 'honda', customer: { last_name: 'Rajput' } }, id: call.id })
    assert(result.success?)
  end

  test 'Failed to update call' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Update.call(params: { call: { vmake: 'honda' }, id: 'abc' })

    assert_not(result.success?)
    assert_equal(['Call Not Found'], result[:errors])
  end

  test 'Failed to update call, vmake is empty' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    call = Call.create(vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Update.call(params: { call: { vmake: '' }, id: call.id })

    assert_not(result.success?)
    assert_equal(["Vmake can't be blank"], result[:errors])
  end
end
