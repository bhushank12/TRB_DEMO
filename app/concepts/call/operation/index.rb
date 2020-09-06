module Call::Operation
  class Index < Trailblazer::Operation
    step :model
    step :set_total_calls
    step :search_calls
    step :paginate
    step :set_response_data

    def model(ctx, current_user:, **)
      ctx[:model] = Call.where(user_id: current_user.id)
    end

    def set_total_calls(ctx, model:, **)
      ctx[:total_calls] = model.size
    end

    def search_calls(ctx, model:, params:, **)
      search_value = params.dig(:search, :value)&.squish
      return true if search_value.blank? || search_value.length < 3

      ctx[:model] = model.where(
      "calls.vmake ILIKE ? OR calls.vmodel ILIKE ?",
      "%#{search_value}%",
      "#{search_value}%"
      )
    end

    def paginate(ctx, params:, model:,**)
      offset = params[:start].to_i
      limit = params[:length].to_i
      ctx[:model] = model.offset(offset).limit(limit)
    end

    def set_response_data(ctx, **)
      ctx[:response_data] = {
        model: ctx[:model],
        total_calls: ctx[:total_calls]
      }
    end
  end
end