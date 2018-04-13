#!/usr/bin/env bash

# This script controls the deployment of code for the site.
# This should generally only be run by a continuous integration system,
# which will validate the build process and deploy it automatically.

# However, it will also work on a standard UNIX system assuming you're set up right.


# Make sure we always run from project root
cd bin 2>/dev/null && cd ..

# GITHUB_AUTH_TOKEN is an environmental variable configured in our deployment tools.
# We don't want this saved as part of the repo, since it's effectively a full access password
# to the git repositories StormbotBot can access. Really don't want to lose it!
# If we don't have this environmental variable, then the script will just prompt us when we
# try to run git commands
if [ -z "$GITHUB_AUTH_TOKEN" ] ; then
	echo "-------------------------------------------------------"
	echo "Could not find GITHUB_AUTH_TOKEN in environment."
	echo "User will need to provide authentication."
	echo "-------------------------------------------------------"
fi

git config --global user.name $GIT_AUTHOR_NAME
git config --global user.email $GIT_AUTHOR_EMAIL

# We need to append the @ to our auth token if we use it since it acts as a username.
# If it's blank, we can simpy type in credentials while running the script
[ -n "$GITHUB_AUTH_TOKEN" ] && GITHUB_AUTH_TOKEN="${GITHUB_AUTH_TOKEN}"

# The URL for our git repo, plus or minus auth
URL=https://${GITHUB_AUTH_TOKEN}@github.com/stormbots/stormbots.github.io.git

# All previous ones. This is not normally wanted, but for this case it just makes
# it faster and reduces downloading of old/deleted files.

# Now we do a git clone of our deployed master output code so we can update it.
# This process normally consists of a single command:
#   git clone --depth 1 --branch master public
# This more complicated process is needed to avoid saving our GITHUB_AUTH_TOKEN token as part of the
# repository configuration, making it not-secret anymore.
echo "-------------------------------------------------------"
echo "Checking out master into 'public' directory."
echo "-------------------------------------------------------"

mkdir public
cd public
	git init
	git remote add origin $URL
	git pull --depth=1 origin master
	ls -l
cd ..

# The command `--depth 1` is a special flag that only gets files in the most recent state,
# as of the last commit to master.
# This is typically undesirable for normal repos, but in this case we only care about this data
# anyway, and our branch is likely full of lots of old photos which we don't care to deal with.

# Note, at this point we have two "nested" repositories!
# Be mindful of the directory you're in.  If you cd below `public`, then git commands will
# work in the `master` branch (containing the generated site) _not_ the source code.

echo "-------------------------------------------------------"
echo "Using hugo to build site."
echo "-------------------------------------------------------"

# Build the project using hugo
# This will update the `public` folder with the newest build generation
if [ "$(uname)" == "Darwin" ]; then
	bin/hugo.osx > hugo-build.log
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	bin/hugo.linux > hugo-build.log
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	bin/hugo.exe > hugo-build.log
fi

echo "-------------------------------------------------------"
echo "Validating..."
echo "-------------------------------------------------------"

# Make sure that we actually successfully generated a site. If not, quit.
bin/validate.rb hugo-build.log || exit 1

# Generate a helpful commit message to better keep track of
# what's being deployed
# Note, we can't run this command in `/public` because we won't get the right commit!
DATE=$(date +"%Y-%b-%d %H:%M")
HASH=$(git log --pretty=format:'%h' -n 1)
DESC=$(git log --pretty=format:'%s' -n 1)
MESSAGE="$HASH $DATE $DESC"

# Make sure we're actually working in the `production` branch
# We normally would not want to deploy anything from other branches
if [ ! -z "$CI_BRANCH" ] ; then
	BRANCH=$CI_BRANCH
else
	BRANCH=$(git rev-parse --abrev-ref HEAD)
fi

if [ "production" != "$BRANCH" ] ; then
	echo "-------------------------------------------------------"
	echo "Build was successful, but stubbornly refusing to deploy"
	echo "from any branch but 'production'"
	echo "-------------------------------------------------------"
	exit 0
fi

# Need to change directories. This will cause git commands to work on the `master` branch
# Containing the generated site, rather than the source code.
cd public
	# Check for differences in our newly built repository
	if [ -z "$(git status --porcelain)" ]; then
		echo "------------------------------------------------------"
		echo "Build was successful, but no content changes were made"
		echo "------------------------------------------------------"
		exit 0
	fi

	echo "-------------------------------------------------------"
	echo "Deploying changes to master branch."
	echo "-------------------------------------------------------"

	# Add all the changes to our deployed code
	git add .
	git commit -m "Deploy $MESSAGE"
	git push $URL
cd ..
