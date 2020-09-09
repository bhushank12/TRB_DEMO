module Call::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Call, :find_by)
      step Contract::Build(constant: Call::Contract::Form)
    end

    step Nested(Present)
    step Contract::Validate(key: :call)
    step Contract::Persist()
  end
end
