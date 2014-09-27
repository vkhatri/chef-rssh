include_recipe "rssh::default"

rssh_user "lwrp_test1" do
  options "test_options1"
end

rssh_user "lwrp_test2" do
  options "test_options2"
end

node.set['rssh']['user']['attribute_test1'] = 'test_options1'
node.set['rssh']['user']['attribute_test2'] = 'test_options2'
