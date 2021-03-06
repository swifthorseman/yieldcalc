module ApplicationHelper
      def flash_class(alert_type)

        case alert_type.to_sym
            when :alert, :error
              "alert-danger"
            when :notice
              "alert-info"
            when :success
              "alert-success"
            else
              ""
        end
    end

    def time_ago_in_letter(time)
      time_ago_in_words(time)[/^\d+ [a-z]/].delete(' ')
    end
end
