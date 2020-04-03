#!/usr/bin/env sh

# foo.dodo   - program given to dodo to run
# foo.in     - file given to dodo to operatoe on
# foo.out    - expected file after running dodo
# foo.stdout - optional, expected stdout produced from running dodo program

for infile in t/tests/interactive/*.in; do
    base=`echo $infile | sed 's/\.in$//g'`
    testfile="$base.tmp"
    teststdout="$base.stdout_tmp"

    echo "testing $base"
    cp $infile $testfile

    ./dodo -i $testfile < "$base.dodo" > "$teststdout"
    ret=$?
    if [ $ret -ne 0 ]; then
        echo "dodo failed: test failed for $base"
        exit 1
    fi

    echo "\texited successfully"

    diff $testfile "$base.out"
    ret=$?
    if [ $ret -ne 0 ]; then
        echo "output was not expected: test failed for $base"
        exit 1
    fi

    echo "\toutput file matched expectations"

    expstdout="$base.stdout"
    if [ -e "$expstdout" ]; then
        diff $teststdout $expstdout
        ret=$?
        if [ $ret -ne 0 ]; then
            echo "stdout was not expected: test failed for $base"
            exit 1
        fi

        echo "\tstdout matched expectations"
    fi

    rm $testfile
    rm $teststdout
done

echo "exhaustive testing completed successfully"

