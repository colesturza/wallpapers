ORIGINAL=$(wildcard original/*)
SCALED=$(sort $(patsubst original/%, scaled/%, $(ORIGINAL)))

.PHONY: all clean

all: $(SCALED) scaled/info.xml

clean:
	rm -rf build scaled

scaled/%: original/%
	@mkdir -p build scaled
	magick "$<" -resize "3840x2160^" "build/$*"
	mv "build/$*" "$@"
