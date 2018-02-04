#!/bin/bash

# This script controls the deployment of code for the site. 
# This should generally only be run by a continuous integration system, 
# which will validate the build process and deploy it automatically. 


# Make sure we always run from project root
cd bin 2>/dev/null && cd ..

# Clone the master branch into the public folder so we can look at it later
#   --depth 1 is a special command that only gets the most recent state, and ignores 
#   All previous ones. This just makes it faster and reduces downloading of old/deleted files
git clone --depth 1 --branch master https://github.com/stormbots/stormbots.github.io.git public

# Note, at this point we have two "nested" repositories! 
# Be mindful of the directory you're in.  If you cd below `public`, then git commands will
# work in the `master` branch (containing the generated site) _not_ the source code.

# Build the project using hugo
# This will update the `public` folder with the newest build generation
bin/hugo.linux  > hugo-build.log

# Make sure that we actually successfully generated a site. If not, quit.
bin/validate.rb hugo-build.log || exit 1

# Generate a helpful commit message to better keep track of 
# what's being deployed
# Note, we can't run this command in `/public` because we won't get the right commit!
DATE=`date +"%Y-%b-%d %H:%M"`
HASH=`git log --pretty=format:'%h' -n 1`
DESC=`git log --pretty=format:'%s' -n 1`
MESSAGE="$HASH $DATE $DESC"

# Need to change directories. This will cause git commands to work on the `master` branch 
# Containing the generated site, rather than the source code.
cd public
	# Check for differences in our newly built repository
	if [ -z "$(git status --porcelain)" ]; then
		echo "Build was successful, but no content changes were made";
		exit 0
	fi	
		
	# Add all the changes to our deployed code
	# TODO: auth using stormbotbot keys
	git add .
	git commit -m "Deploy $MESSAGE"
	git push
cd ..
