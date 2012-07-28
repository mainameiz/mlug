Factory.define :user do |f|
  f.username "foo"
  f.password "secret"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "mail#{n}@example.com" }
end
