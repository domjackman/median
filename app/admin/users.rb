ActiveAdmin.register User do

around_filter do |controller, action|
    User.class_eval do
      alias :__active_admin_to_param :to_param
      def to_param() _id.to_s end
    end

    begin
      action.call
    ensure
      User.class_eval do
        alias :to_param :__active_admin_to_param
      end
    end
  end

end
