class CallsController < ApplicationController
  def index
    run Call::Operation::Index, params: {user_id: current_user.id}
    render cell(Call::Cell::Index, @model)
  end

  def new
    run Call::Operation::Create::Present do |result|
      render cell(Call::Cell::New, @form)
    end
  end
end
