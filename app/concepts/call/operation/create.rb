module Call::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      pass :populate_errors
      step :build_model
      step Contract::Build(constant: Call::Contract::Form)

      def populate_errors(ctx, **)
        ctx[:errors] = []
      end

      def build_model(ctx, **)
        ctx[:model] = Call.new
        ctx[:model].build_customer
      end
    end

    step Subprocess(Present)
    step Contract::Validate(key: :call)
    step :prepopulate
    step Contract::Persist()
    fail :log_errors

    def prepopulate(ctx, current_user:, **)
      ctx['contract.default'].prepopulate!(user_id: current_user.id)
    end

    def log_errors(ctx, model:, **)
      contract = ctx['contract.default']
      ctx[:errors] << contract.errors.full_messages.presence || contract.model.errors.full_messages
      ctx[:errors] = ctx[:errors].compact.flatten
    end
  end
end
