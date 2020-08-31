module Call::Operation
  class Index < Trailblazer::Operation
    step :fetch_calls

    def fetch_calls(ctx, params:, **)
      ctx[:model] = Call.where(user_id: params[:user_id])
    end
  end
end