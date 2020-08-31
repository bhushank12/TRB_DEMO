module Call::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Call, :new)
      step Contract::Build( constant: Call::Contract::Form )
    end

    step Subprocess(Present)
    step Contract::Validate(key: :call)
    step Contract::Persist()
  end
end