#!/bin/sh
#
# Copyright (c) 2021 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Fail on errors
set -e

Rule() {
    DIR=".vale/fixtures/AsciiDoc/$RULE"
    echo $DIR
    VALIDALERTSCOUNT="$(vale --config="$DIR/.vale.ini" --no-exit --output=line "$DIR/testvalid.adoc" | wc -l)"
    INVALIDALERTS="$(vale --config="$DIR/.vale.ini" --no-exit --output=line "$DIR/testinvalid.adoc" | wc -l)"
    #echo "Vale ALERTS: $INVALIDALERTS"
    INVALIDLINES="$(grep -c "//vale-fixture" "$DIR/testinvalid.adoc" || true)"
    #echo "INVALID LINES: $INVALIDLINES"
    INVALIDGAP=$(($INVALIDLINES - $INVALIDALERTS))
    if [ "$VALIDALERTSCOUNT" -gt 0 ]
    then
    #    echo "INVALID LINES: $INVALIDLINES"
    #    echo "Vale ALERTS: $INVALIDALERTS"
        echo "ERROR: $VALIDALERTSCOUNT in .vale/fixtures/AsciiDoc/$RULE/testvalid.adoc for .vale/styles/AsciiDoc/$RULE.yml"
        TOTAL=$(( TOTAL + VALIDALERTSCOUNT ))
    fi
    if [ $INVALIDGAP -gt 0 ]
    then
        echo "ERROR: $INVALIDGAP in .vale/fixtures/AsciiDoc/$RULE/testinvalid.adoc / .vale/styles/AsciiDoc/$RULE.yml"
        TOTAL=$(( TOTAL + INVALIDGAP ))
    fi
}

# This scripts runs the  suite for each rule in the `RedHat` style.
TOTAL=0
for RULE in $(find .vale/styles/AsciiDoc/ -name '*.yml' | cut -d/ -f 4 | cut -d. -f1 | sort)
do  
    Rule
done

echo "$TOTAL tests to fix"
exit $TOTAL