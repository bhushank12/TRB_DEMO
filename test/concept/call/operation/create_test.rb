require 'test_helper'

class CallTest < ActiveSupport::TestCase
  # create operation
  test 'Creates call successfully' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')

    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                                                    customer: { title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male'} }
                                          }, current_user: user)

    assert(result.success?)
  end

  test 'Call creation failed, vmake cannot be blank' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: '', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                                                    customer: {title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male'}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Vmake can't be blank"], result[:errors])
  end

  test 'Call creation failed, vmodel cannot be blank' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: '', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                                                    customer: {title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male'}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Vmodel can't be blank"], result[:errors])
  end

  test 'Call creation failed, vsubmodel cannot be blank' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: 'swift', vsubmodel: '', vehicle_type: 'private_car',
                                                    customer: {title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male'}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Vsubmodel can't be blank"], result[:errors])
  end

  test 'Call creation failed, vehicle type cannot be blank' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: '',
                                                    customer: {title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male'}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Vehicle Type can't be blank"], result[:errors])
  end

  test 'Call creation failed, customer is invalid title must be present' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                                                    customer: {title: '', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male'}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Customer Title can't be blank"], result[:errors])
  end

  test 'Call creation failed, customer is invalid first name must be present' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                                                    customer: {title: 'mr', first_name: '', last_name: 'Kalode', gender: 'male'}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Customer First Name can't be blank"], result[:errors])
  end

  test 'Call creation failed, customer is invalid last name must be present' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                                                    customer: {title: 'mr', first_name: 'bhushan', last_name: '', gender: 'male'}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Customer Last Name can't be blank"], result[:errors])
  end

  test 'Call creation failed, customer is invalid gender must be present' do
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')
    result = Call::Operation::Create.call(params: {
                                            call: { vmake: 'maruti', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                                                    customer: {title: 'mr', first_name: 'bhushan', last_name: 'kalode', gender: ''}}
                                          }, current_user: user)

    assert_not(result.success?)
    assert_equal(["Customer Gender can't be blank"], result[:errors])
  end

  # show operation
  test 'Retrive call details successfully' do
    customer = Customer.create(title: 'Mr', first_name: 'Bhushan', last_name: 'Kalode', gender: 'male')
    user = User.create(email: 'bhushan@gmail.com', password: 'bhushan')

    call = Call.create(vmake: '', vmodel: 'swift', vsubmodel: '1.2vxi', vehicle_type: 'private_car',
                       customer_id: customer.id, user_id: user.id)

    result = Call::Operation::Show.call(params: {id: call.id})

    assert(result.success?)
  end

  test 'Failed to retrive call details if call does not exist' do
    result = Call::Operation::Show.call(params: {id: 'abc'})

    assert_not(result.success?)
    assert_equal('Call Not Found', result[:errors])
  end
end
