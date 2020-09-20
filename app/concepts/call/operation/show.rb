module Call::Operation
  class Show < Trailblazer::Operation
    pass :populate_errors
    step Model(Call, :find_by)
    fail :not_found

    def populate_errors(ctx, **)
      ctx[:errors] = []
    end

    def not_found(ctx, **)
      ctx[:errors] << 'Call Not Found'
    end
  end
end
