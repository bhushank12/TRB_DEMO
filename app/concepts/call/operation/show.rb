module Call::Operation
  class Show < Trailblazer::Operation
    step Model(Call, :find_by)
    fail :not_found

    def not_found(ctx, **)
      ctx[:errors] = 'Call Not Found'
    end
  end
end
