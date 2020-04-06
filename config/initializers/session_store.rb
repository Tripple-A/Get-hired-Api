# frozen_string_literal: true

if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store,
                                         key: '_foodie-apiv1',
                                         domain: 'https://foodies-stop.netlify.com'
else
  Rails.application.config.session_store :cookie_store,
                                         key: '_gethired_app'
end
