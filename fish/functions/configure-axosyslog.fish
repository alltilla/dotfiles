function configure-axosyslog --wraps='../configure CC=/usr/bin/clang CXX=/usr/bin/clang++ --with-sanitizer=address --enable-debug --enable-extra-warnings --enable-all-modules --disable-java --disable-java-modules --enable-stackdump --prefix (realpath ./install)' --description 'alias configure-axosyslog ../configure CC=/usr/bin/clang CXX=/usr/bin/clang++ --with-sanitizer=address --enable-debug --enable-extra-warnings --enable-all-modules --disable-java --disable-java-modules --enable-stackdump --prefix (realpath ./install)'
  ../configure CC=/usr/bin/clang CXX=/usr/bin/clang++ --with-sanitizer=address --enable-debug --enable-extra-warnings --enable-all-modules --disable-java --disable-java-modules --enable-stackdump --prefix (realpath ./install) $argv
        
end
