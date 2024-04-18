module Messenger
  module Api
    module StringUtils
      def class_name(object, downcase = true)
        class_name = object.class.to_s
        return class_name.downcase if downcase

        class_name
      end
    end
  end
end
