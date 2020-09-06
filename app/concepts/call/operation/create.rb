module Call::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :build_model
      step Contract::Build( constant: Call::Contract::Form )


      def build_model(ctx, **)
        ctx[:model] = Call.new
        ctx[:model].build_customer
      end
    end

    step Subprocess(Present)
    step Contract::Validate(key: :call)
    step Contract::Persist()
  end
end