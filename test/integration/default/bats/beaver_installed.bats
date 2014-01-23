#!/usr/bin/env bats

@test "beaver binary is found in PATH" {
  run which beaver
  [ "$status" -eq 0 ]
}
