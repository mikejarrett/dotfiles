# Links
http://www.webupd8.org/2016/03/how-to-save-and-restore-unity-session.html
https://github.com/hotice/webupd8/commit/b95d4120ded1c1c480bc8b1ee2137fca13cb5c97

## From Blog

Unity doesn't support saving the current session and restoring it upon login for quite some time however, you can do this with the help of a script.

Arnon Weinberg created a script that allows saving and restoring a desktop session. The script doesn't work exactly like the GNOME session save and restore feature, but it does the job and gives some control over what you want to restore and when.

Here's how the script works: you must manually save a session using a simple command, and then choose when to restore it, with three different options:
restore geometries of existing windows - restores the window geometry and position (including workspace) for all running windows;
restore matching windows - restores the window geometry and position (including workspace) for both apps that are still running as well as those that were restarted;
restore running applications: restores all application windows that were running (even if they are now closed) when the session was saved, along with their position (including workspace) and window geometry;
Important note: The script can only restore app windows that were open when the session was saved and can't restore applications that were running in the background (so to be able to restore an app, that app needs to have at least one open window when the session is saved).

Obviously, if you don't want to restore the session manually, you can add the script to startup so it restores your last saved session at login, but you'll still have to save the session manually.

Arnon's original session save and restore script doesn't work properly in Unity, but I was able to get it to work with some very simple fixes. 

The script is not perfect and there are a few things you should know before using it:
it doesn't work for every single application. For instance, it can't restore an open Nemo window because Nemo lacks the "--new-window" command line option (which does exist in Nautilus);
when using "restore 2" (so the apps that aren't running are restored along with their window position and size): there's a delay between launching the app and resizing / positioning its window - that's because the script waits a few seconds to make sure the app actually starts before trying to manipulate its window.

Despite this, the script does the job pretty well and it's probably the best solution for saving and restoring the Unity session.

It's important to mention that the script is not Unity or even Ubuntu specific! In fact, Arnon created it for Fedora and GNOME Shell however, I've only tested it in Ubuntu with Unity (and thus, I've only included modifications for it).


Unity session save and restore script installation and usage


* The script requires perl, xprop (available in the x11-utils package), wmctrl and xdotool. To install these in Ubuntu, use the command below:

```
	sudo apt-get install perl x11-utils wmctrl xdotool
```

* To download my modified script, install it in /usr/local/bin and make it executable, use the following commands:

```
	wget http://raw.githubusercontent.com/hotice/webupd8/master/session -O /tmp/session
	sudo install /tmp/session /usr/local/bin/
	sudo chmod +x /usr/local/bin/session
```

You can check out the script code HERE. Or, if you want to download Arnon's script (without my Unity fixes), see his post HERE.

That's it!

To save the current session, simply use the following command: `session save`

Then, when you want to restore the session, use: `session restore X`

where X is:
2 - Restore geometries of missing windows (opens any previously running app windows and restores both windows positions and geometries);

1 - Restore geometries of matching windows (restores window geometry and position for all running apps, even if they were restarted since the session was saved); 

0 - Restore geometries of existing windows (restores window geometry and position for apps that weren't closed since the session was saved).

For instance "session restore 2" to restore geometries of missing windows, etc.
