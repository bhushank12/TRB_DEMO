class CallsController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        result = Call::Operation::Index.call(params: params, current_user: current_user)
        render cell(Call::Cell::Index, result[:model])
      end
      format.json { render json: DataTables::CallList.new(current_user, params) }
    end
  end

  def new
    run Call::Operation::Create::Present do |_result|
      render cell(Call::Cell::New, @form)
    end
  end

  def create
    run Call::Operation::Create, current_user: current_user do |_result|
      return redirect_to calls_path
    end
    render cell(Call::Cell::New, @form)
  end

  def show
    run Call::Operation::Show
    if result.success?
      render cell(Call::Cell::Show, result['model'])
    else
      redirect_to calls_path
    end
  end

  def edit
    run Call::Operation::Update::Present do |_result|
      render cell(Call::Cell::Edit, @form)
    end
  end

  def update
    run Call::Operation::Update do |_result|
      return redirect_to calls_path
    end
    render cell(Call::Cell::Edit, @form)
  end

  def destroy
    run Call::Operation::Delete
    redirect_to calls_path
  end

  def get_vehicle_categories
    render json: VEHICLE_CATEGORIES
  end
end
