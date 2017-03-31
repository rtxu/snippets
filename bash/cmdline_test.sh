
./cmdline.sh -vfd ./foo/bar/someFile -o /fizz/someOtherFile
./cmdline.sh -v -f -d -o/fizz/someOtherFile -- ./foo/bar/someFile
./cmdline.sh --verbose --force --debug ./foo/bar/someFile -o/fizz/someOtherFile
./cmdline.sh --output=/fizz/someOtherFile ./foo/bar/someFile -vfd
./cmdline.sh ./foo/bar/someFile -df -v --output /fizz/someOtherFile
