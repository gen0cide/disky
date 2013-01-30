disky
=====

Check for disk status in Windows and send an email if it's bad

# Why?

So there aren't any tools in Windows to check if the hard disks are good or not.

I found out that WMI can kindof do it so I made this script.

# What's it send out?

If say disk 0 is busted and there are 3 partitions on it and those partitions are labeled

Q: R: and S: it'll send out this message:

	The following partitions have drives that are not ok:

			Q:
			R:
			S:

# Contributions

It's on github so go nuts