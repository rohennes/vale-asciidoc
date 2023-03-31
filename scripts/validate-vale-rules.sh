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
    DIR=".vale/fixtures/$RULE"
    echo "$DIR"
    VALIDALERTSCOUNT="$(vale --config="$DIR/.vale.ini" --no-exit --output=line "$DIR/testvalid.adoc" | wc -l)"
    INVALIDALERTSCOUNT="$(vale --config="$DIR/.vale.ini" --no-exit --output=line "$DIR/testinvalid.adoc" | wc -l)"
    INVALIDLINES="$(grep -c "//vale-fixture" "$DIR/testinvalid.adoc" || true)"
    INVALIDGAP=$((INVALIDLINES - INVALIDALERTSCOUNT))
    if [ "$VALIDALERTSCOUNT" -gt 0 ]
    then
        echo "$VALIDALERTSCOUNT ERROR(s) in $DIR/testvalid.adoc for .vale/styles/$RULE.yml"
        TOTAL=$(( TOTAL + VALIDALERTSCOUNT ))
    fi
    if [ $INVALIDGAP -eq 0 ]
    then
        true //no errors
    else
        #handle error count or "//vale-fixture" string count mismatches
        TOTAL=$(( TOTAL + INVALIDGAP ))
        if [ $TOTAL -lt 0 ]
        then
            TOTAL=$((TOTAL * -1))
        fi
        echo "$TOTAL ERROR(s) in $DIR/testinvalid.adoc / .vale/styles/$DIR.yml"    
    fi
}

# This scripts runs the  suite for each rule in the `AsciiDoc` style.
TOTAL=0
for RULE in $(find .vale/styles/ -name '*.yml' | cut -d/ -f 3,4 | cut -d. -f1 | sort)
do
    Rule
done

echo "$TOTAL tests to fix"
exit $TOTAL