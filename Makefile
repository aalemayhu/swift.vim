swift_repo ?=https://github.com/apple/swift
swift_dir ?=$(shell pwd)/../swift
swift_rev ?=$(shell git -C ${swift_dir} --no-pager log -1 --pretty='tformat:%h (%s, %ad)' --date=short)

sync:
	if ! test -d $(swift_dir); then \
	  git clone $(swift_repo) $(swift_dir); \
	fi
	rsync -av ${swift_dir}/utils/vim/ .
	git commit -a -m "Sync with upstream commit ${swift_rev}"
