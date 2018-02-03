
# Make sure we always run from project root
cd bin 2>/dev/null && cd ..

# Clone the master branch into the public folder so we can look at it later
#   --depth 1 is a special command that only gets the most recent state, and ignores 
#   All previous ones. This just makes it faster and reduces downloading of old/deleted files
git clone --depth 1 --branch master https://github.com/stormbots/stormbots.github.io.git public

# Note, at this point we have two "nested" repositories! Be mindful of the directory you're in. 
# If you cd below `public`, then you'll be adding commits to the `master` branch, for publication

# Build the project using hugo
# This will update the `public` folder with the newest build generation
bin/hugo.linux

# Generate a helpful commit message to better keep track of 
# what's being deployed
DATE=`date +"%Y-%b-%d %H:%M"`
HASH=`git log --pretty=format:'%h' -n 1`
DESC=`git log --pretty=format:'%s' -n 1`
MESSAGE="$HASH $DATE $DESC"

# Need to change directories. This will cause git commands to work on the `master` branch 
# Containing the generated site, rather than the source code.
cd public
	
	# Add all the changes to our deployed code
	# TODO: auth using stormbotbot keys
	git add .
	git commit -m "Deploy $MESSAGE"
	git push
	
cd ..

# TODO: We need to detect if we _have_ changes. Things like adjusting build scripts may not change generated code, so 
# The deploy should "succeed" if we have no changes

# TODO: Error handling, so that if hugo fails it signals a build failure
