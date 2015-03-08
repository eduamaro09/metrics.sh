#!/bin/sh

if is_osx; then
  collect () {
    report $(sysctl -n vm.swapusage | awk '{printf "%.1f", $6 / $3 * 100.0}')
  }
else
  collect () {
    report $(free | awk '/Swap/{printf "%.1f", $3/$2 * 100.0}')
  }
fi

docs () {
  echo "Percentage of used swap space."
}