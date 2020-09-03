module DataTables
  class CallList
    def initialize(current_user, params)
      @params = params
      @result = Call::Operation::Index.(params: @params, current_user: current_user)
      @calls = @result.success? ? @result[:response_data][:model] : []
      @current_user = current_user
      @errors = @result[:errors] || ""
    end

    def as_json(_options = {})
      {
        draw:            @params[:draw].to_i,
        data:            data,
        recordsTotal:    count,
        recordsFiltered: count,
        error:           errors
      }
    end

    private

    def count
      @result[:response_data] ? @result[:response_data][:total_calls] : 0
    end

    def errors
      @result.failure? ? @errors : ''
    end

    def data
      @data ||= @calls.map do |call|
        [
          call[:make]&.titleize || "-",
          call[:model]&.titleize || "-",
          call[:submodel]&.titleize || "-",
          call[:category]&.titleize || "-",
          call[:subcategory]&.titleize || "-",
          call[:registration_date]&.titleize || "-",
          call[:policy_expiry]&.titleize || "-"
        ].compact
      end
    end
  end
end