module Call::Operation
  class Delete < Trailblazer::Operation
    pass :populate_errors
    step Model(Call, :find_by)
    step :delete!
    fail :not_found

    def populate_errors(ctx, **)
        ctx[:errors] = []
      end

    def delete!(_ctx, model:, **)
      model.destroy
    end

    def not_found(ctx, **)
      ctx[:errors] << 'Call Not Found'
    end
  end
end
