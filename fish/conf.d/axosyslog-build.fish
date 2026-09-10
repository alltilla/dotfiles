# axosyslog-build parallelism: the wrapper defaults to nproc-2 (14 here); pin the
# long-standing -j12.
set -gx AXOSYSLOG_BUILD_JOBS 12
