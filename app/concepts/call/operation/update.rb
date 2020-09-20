module Call::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      pass :populate_errors
      step Model(Call, :find_by)
      fail :not_found, fail_fast: true
      step Contract::Build(constant: Call::Contract::Form)

      def populate_errors(ctx, **)
        ctx[:errors] = []
      end

      def not_found(ctx, **)
        ctx[:errors] << 'Call Not Found'
      end
    end

    step Subprocess(Present), fast_track: true
    step Contract::Validate(key: :call)
    step Contract::Persist()
    fail :log_errors

    def log_errors(ctx, model:, **)
      contract = ctx['contract.default']
      ctx[:errors] << contract.errors.full_messages.presence || contract.model.errors.full_messages
      ctx[:errors] = ctx[:errors].compact.flatten
    end
  end
end
