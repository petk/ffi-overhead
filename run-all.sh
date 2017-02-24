#!/bin/sh

[ $# -gt 0 ] || { echo "First arg (0 - 2000000000) is required."; exit 1; }

[ "$1" -eq "$1" ] 2>/dev/null || { echo "Must be a positive number not exceeding 2 billion."; exit 1; }

echo "The results are elapsed time in milliseconds"
echo "============================================"

if [ "$2" = "scoped" ]; then
    echo "\nnode scoped:"
    node hello.js $@ && \
    node hello.js $@

    echo "\ndart scoped:"
    dart hello.dart $@ && \
    dart hello.dart $@
    
    exit 0
fi

echo "\nluajit:"
luajit hello.lua $@ && \
luajit hello.lua $@

echo "\nc:"
./c_hello $@ && \
./c_hello $@

echo "\ncpp:"
./cpp_hello $@ && \
./cpp_hello $@

echo "\nnim:"
./nim_hello $@ && \
./nim_hello $@

echo "\nrust:"
./rust_hello $@ && \
./rust_hello $@

echo "\nd:"
./d_hello $@ && \
./d_hello $@

echo "\njava7:"
/usr/lib/jvm/java-7-oracle/bin/java -cp . jhello.Hello $@ && \
/usr/lib/jvm/java-7-oracle/bin/java -cp . jhello.Hello $@

echo "\njava8:"
/usr/lib/jvm/java-8-oracle/bin/java -cp . jhello.Hello $@ && \
/usr/lib/jvm/java-8-oracle/bin/java -cp . jhello.Hello $@

echo "\nnode:"
node hello.js $@ && \
node hello.js $@

echo "\ngo:"
./go_hello $@ && \
./go_hello $@

echo "\ndart:"
dart hello.dart $@ && \
dart hello.dart $@

