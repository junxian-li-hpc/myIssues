AutoTypeSearch
==============
http://sourceforge.net/projects/autotypesearch


This is a plugin to KeePass <http://www.KeePass.info> to provide a quick searching capability as
an enhancement to the global auto-type system. If a global auto-type is requested, but no matching
entry for the active window is found, this plugin will show a quick as-you-type search window which
lets you to easily pick the entry to auto-type.


Installation
------------
Place AutoTypeSearch.dll in your KeePass Plugins folder. If you are using a custom build of KeePass,
place AutoTypeSearch.plgx in the Plugins folder too.


Usage
-----
AutoTypeSearch is initially configured to automatically appear after an unsuccessful global
auto-type. However, this can be changed in the KeePass Options window (an AutoTypeShow tab has
been added). Here, a system-wide hot key can be configured to show the AutoTypeSearch window
immediately. It is also possible to show the window by running KeePass.exe passing "/e1:AutoTypeSearch"
as a command line parameter.

Once the window is shown, usage is extremely simple. Just start typing, and AutoTypeSearch will
search your database for matching entries. By default, the Title, Url, Notes, Tags, and Custom Fields
will be searched, but this can be configured in the AutoTypeShow tab of the KeePass Options window.

Protected fields (like Password) will not be searched.

The arrow keys can be used to move the selection in the list of results, then press Enter to auto-
type the selected entry. Alternatively, press Shift+Enter to open the entry instead of auto-typing it.
(These actions can also be customised in the Options window.) Clicking and Shift-Clicking an entry will
also perform those actions.


Uninstallation
--------------
Delete AutoTypeSearch.plgx from your KeePass Plugins folder.


Checking for updates
--------------------
If you want to use the KeePass Check for Updates function to check for updates to this plugin
then it requires the SourceForgeUpdateChecker plugin to be installed too:
http://sourceforge.net/projects/kpsfupdatechecker


Bug Reporting, Questions, Comments, Feedback, Donations
-------------------------------------------------------
Please use the SourceForge project page: <http://sourceforge.net/projects/autotypesearch>
Bugs can be reported using the issue tracker, for anything else, a discussion forum is available.


Changelog
---------
v0.1
 Initial release

v0.2
 Added information banner when search is shown as a result of an unsuccessful global auto-type
 Compatibility with Linux/Mono

v0.3
 Added search result prioritisation for entries where the match is found at the start of the field

v0.4
 Added support for multiple databases. All currently open, unlocked, databases will be searched

v0.5
 Added support for KeePass 2.29 high resolution custom icons

v0.6
 Where title does not uniquely identify the results shown, now also shows the group name as context

v0.7
 Added support for the "Open entry URL" action. Use the Options window to choose this, if required.

v0.8
 Added support for the "Copy password" action. Use the Options window to choose this, if required.

v0.9
 Added workaround for mono bug under Linux that could cause an ArgumentOutOfRange crash when 
  searching if only a single result is initially returned.

v0.91
 Fixed bug where up or down keys would cause an exception if there are no results to scroll through

v0.10
 Compatibility with KeePass 2.41 (No longer compatible with previous versions)

v0.11
 Diacritic (accent) insensitive searching

v0.12
 Removed ugly white top border under Windows 10

v1.0
 Compatibility with KeePass 2.42. For versions of KeePass prior to 2.42, use an 0.X version.

v1.1
 Added Auto Type Password action (thanks to Chen Zhenge for contribution)

v1.2
 Added "AutoTypeSearch" as the (invisible) window title for the search window to assist with automation
 Added support for the "Copy user name" action. Use the Options window to choose this, if required.
 Added "Keep Search Window Open" option. When enabled, the search window will not be automatically closed,
  and must be manually dismissed by the Escape key, or clicking the � button.

v1.3
 Fixed a couple of bugs with the Keep Search Window Open option and autotype, the window will now briefly
  hide during auto-type and then re-show.
 Fixed bug with extra unwanted whitespace that can appear at the bottom of the search window

v1.4
 Offer to save the window title as an auto-type target for the selected entry when a result is found from
  a search after an unsuccessful auto-type
 Follow new KeePass recommendation to distribute both plgx and dll files in release zip
 Fix bug where references in title field were not being resolved when Resolve References option is enabled

Attributions
------------
Throbber image by FlipDarius http://www.mediawiki.org/wiki/File:Loading.gif