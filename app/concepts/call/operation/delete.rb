module Call::Operation
  class Delete < Trailblazer::Operation
    step Model(Call, :find_by)
    step :delete!

    def delete!(ctx, model:, **)
      model.destroy
    end
  end
end