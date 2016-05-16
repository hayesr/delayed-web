module Delayed
  module Web
    class ActiveJobDecorator < SimpleDelegator
      def parsed_handler
        @parsed_handler ||= YAML.load(handler)
      end

      def job_class_name
        if parsed_handler.respond_to? :job_data
          parsed_handler.job_data["job_class"]
        end
      end

      def job_args
        if parsed_handler.respond_to? :job_data
          parsed_handler.job_data["arguments"]
        end
      end

      def job_description
        "#{job_class_name} /#{job_args.join(', ')}"
      end
    end
  end
end
