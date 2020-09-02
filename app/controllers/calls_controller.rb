class CallsController < ApplicationController
  def index
    respond_to do |format|
      format.html {
        result = Call::Operation::Index.(params: params, current_user: current_user)
        render cell(Call::Cell::Index, result[:model])
      }
      format.json {render json: DataTables::CallList.new(current_user, params)}
    end
  end

  def new
    run Call::Operation::Create::Present do |result|
      render cell(Call::Cell::New, @form)
    end
  end
end
