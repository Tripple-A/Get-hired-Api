# frozen_string_literal: true

if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store,
                                         key: '_gethired_app',
                                         domain: 'http//:localhost:3000'
else
  Rails.application.config.session_store :cookie_store,
                                         key: '_gethired_app'
end
