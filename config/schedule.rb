every :day, :at => '12pm' do
  runner "User.everyday_update", :environment => 'development'
end
