class ApplicationController < ActionController::Base

before_filter :parse_facebook_cookies

def parse_facebook_cookies
  @facebook_cookies ||= Koala::Facebook::OAuth.new('161293420568925', '93fee3a1c1d4961402882f3bfb606640').get_user_from_cookie(cookies)

  # If you've setup a configuration file as shown above then you can just do
  # @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_from_cookie(cookies)
   logger.info "The cookies are #{@facebook_cookies}"
   logger.info "cookies #{@cookies}"
end


  protect_from_forgery
  helper_method :cookies
end
