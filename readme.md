## zTreeDev ##
This is a Windows batch file tool I made back in high school to help me work with the [Zurich Toolbox for Readymade Economic Experiments](http://www.iew.uzh.ch/ztree/index.php) (z-Tree).

This software helps automate development tasks that would otherwise require command arguments and unwieldy task switches, namely:

- launching z-Tree with the current project
- launching a variable number of zleaves
 - not full-screen, for easier switching
 - unique leaf names, allowing multiple leaves on one computer
- killing all running zleaves for easy quitting
- purging data files to avoid clutter

### Usage
Place your licensed `zleaf.exe` and `ztree.exe` in the top level directory, put your `.ztt` files in `programs/`, and run `zTreeDev.bat`.