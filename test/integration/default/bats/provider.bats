@test "created entries from lwrp" {
  grep -q 'user = "lwrp_test1:test_options1"' /etc/rssh.conf
  grep -q 'user = "lwrp_test2:test_options2"' /etc/rssh.conf
}

@test "created entries from attributes" {
  grep -q 'user = "attribute_test1:test_options1"' /etc/rssh.conf
  grep -q 'user = "attribute_test2:test_options2"' /etc/rssh.conf
}
