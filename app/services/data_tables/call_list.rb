module DataTables
  class CallList < Base
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
          call[:vmake]&.titleize || "-",
          call[:vmodel]&.titleize || "-",
          call[:vsubmodel]&.titleize || "-",
          call[:vcategory]&.titleize || "-",
          call[:vsubcategory]&.titleize || "-",
          call[:registration_date]&.strftime("%d/%m/%Y") || "-",
          call[:policy_expiry]&.strftime("%d/%m/%Y") || "-",
          call_action_tags(call)
        ].compact
      end
    end
  end
end