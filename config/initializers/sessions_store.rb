# frozen_string_literal: true

if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store,
                                         key: '_gethired_app',
                                         domain: 'https://foodie-apiv1.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store,
                                         key: '_gethired_app'
end
