# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, format: :json do
    namespace :v1 do
      resources :teachers do
        member do
          get :followed_students, action: :list_followed_students
          post "followed_students/:student_id", action: :follow_student
          delete "followed_students/:student_id", action: :unfollow_student
        end
      end
    end
  end
end
