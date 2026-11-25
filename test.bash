#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kaito Komatsuzaki
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo "${1}行目のテスト失敗"
        res=1
}

res=0

### NORMAL INPUT (DEFAULT WINDOW = 3) ###
out=$(printf "10\n20\n30\n40\n" | ./movingavg)
[ "$?" = 0 ] || ng "$LINENO"
expected=$'10.00\n15.00\n20.00\n30.00'
[ "${out}" = "${expected}" ] || ng "$LINENO"

### NORMAL INPUT (WINDOW = 2) ###
out=$(printf "10\n20\n30\n40\n" | ./movingavg 2)
[ "$?" = 0 ] || ng "$LINENO"
expected=$'10.00\n15.00\n25.00\n35.00'
[ "${out}" = "${expected}" ] || ng "$LINENO"

### STRANGE INPUT (NON-NUMERIC) ###
out=$(echo "abc" | ./movingavg 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### STRANGE INPUT (EMPTY) ###
out=$(printf "" | ./movingavg 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### STRANGE INPUT (INVALID WINDOW SIZE) ###
out=$(printf "10\n20\n" | ./movingavg 0 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(printf "10\n20\n" | ./movingavg abc 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo "OK"
exit $res
