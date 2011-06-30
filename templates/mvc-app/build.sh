if [ -f bin/Main.swf ];
	then
	if [ -f bin/app.swf ];
		then
		rm -rf bin/app.swf
		mv bin/Main.swf bin/app.swf
	fi
fi