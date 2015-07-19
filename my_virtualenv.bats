#!/usr/bin/env bats

@test "execute select 1 inside a virtualenv" {
  ./my_virtualenv mysql -e 'select 1;' 
}
