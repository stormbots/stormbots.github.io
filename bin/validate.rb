#!/usr/bin/env ruby

# This script is intended to parse and verify the output of hugo's build system
# and report whether or not the build was successful.
# This is only required currently since Hugo itself does not provide a mechanism
# to otherwise get this information.


# Shorthand regex to mark the date which is prented next to errors
date = /\d{4}\/\d{2}\/\d{2} \d{2}:\d{2}:\d{2}/

# Use these to whitelist specific errors that might otherwise cause a build failure
# These will not cause a build failure
ACCEPTABLE = [
	# Avoid failing because we forgot a date somewhere
	# TODO make this more precise
	/^ERROR #{date} .* parse date /,
]

# These should generate some sort of message. Not sure how to implement.
WARNING = [
]

# These will cause the build to fail, resulting in not publishing the current site version
ERROR = [
	/^ERROR/,
]

# These represent a line from Hugo that indicates a successful build.
# If we don't see one of these, then assume that the build failed even if we don't have an error
REQUIRED = [
	/Built site for language en/,
	/^total in \d+/,
]

# ARGF is a special param. It reprepsents an opened file (from a parameter),
# or STDIN if nothing listed
output = ARGF.each.to_a

# Delete requirements if we run across a line that matches it
output.each do |line|
	REQUIRED.delete_if{|r| line.match r}
end

# Take our output and filter out non-error lines
errors = output.select do |line|
	next if ACCEPTABLE.any?{|r| r.match line}
	next if WARNING.any?{|r| r.match line}
	next true if ERROR.any?{|r| r.match line}
	next
end

# Show the user some information about what's happening
width = 40
puts "="*width
puts "Hugo Build Output"
puts "="*width
puts output

# Successful exit if we have no errors and nothing still required
exit 0 if errors.none? and REQUIRED.none?

# Otherwise, fail the build and explain why
STDERR.puts "="*width
STDERR.puts "Build Failed!"
STDERR.puts "="*width
if errors.any?
	STDERR.puts "Critical errors were:"
	STDERR.puts errors.map{|l| "  "+l }
end
if REQUIRED.any?
	STDERR.puts "Output did not match all required rules:"
	STDERR.puts REQUIRED.map{|r|r.inspect}
end

exit(1)
