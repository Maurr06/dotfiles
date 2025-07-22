Of course. I've analyzed the `issues.md` file and categorized the items into feature requests and bugs, grouping similar reports to identify the most common themes. Here is a summary to help with your triage:

### Common Feature Requests

1.  **Enhanced Keyboard Shortcuts & Controls**
    *   **Allow Modifier Keys**: Numerous requests to use modifier keys like `Shift`, `Ctrl`, or `Alt` for a wider range of shortcuts (#1126, #1023, #806).
    *   **New Action Shortcuts**: Requests for shortcuts to toggle fullscreen (#1201, #1025), control volume (#760), and perform frame-by-frame seeking (#1087).
    *   **Expanded Key Support**: Allow assigning F13-F24 keys (#1187) and improve recognition for non-US keyboards (#1181).
    *   **Mouse-based controls**: Add support for mouse gestures or scroll wheel to control speed (#1163, #715).

2.  **UI and UX Improvements**
    *   **Controller Position & Visibility**: Many users want to set a default position for the speed controller to avoid it being obscured by other UI elements on sites like YouTube (#1202, #1143, #1099).
    *   **Touch-Friendly Interface**: Requests for touch gestures (e.g., swipe up/down for speed) and a more touch-friendly UI, especially for mobile and tablet users (#1152, #1102).
    *   **Add/Improve UI Buttons**: Users have asked for a dedicated button to reset speed to 1x (#1115, #778) and a way to type in a speed value directly (#773).

3.  **Per-Site and Advanced Settings**
    *   **Site-Specific Configurations**: A strong desire for per-site settings, such as remembering playback speed only on certain sites or having different hotkey configurations for different domains (#1027, #1218, #723).
    *   **Improved Blacklisting/Whitelisting**: Users want more granular control over where the extension is active, for example, enabling it for Twitch VODs but not for live streams (#1218, #1044).
    *   **Export/Import Settings**: A request to backup and restore extension settings (#1097, #795).

4.  **Broader Platform Support**
    *   **Picture-in-Picture (PiP)**: Add controls and hotkey support for videos playing in Picture-in-Picture mode (#1065, #1038, #796).
    *   **Browser Support**: Official support and release on the Microsoft Edge store (#1033, #719) and better compatibility with Arc Browser (#1090, #1082).
    *   **Site Support**: Requests to add support for Spotify (#1030).

---

### Common Bugs

1.  **Site-Specific Compatibility Issues** (This is the largest category)
    *   **YouTube**: The controller's position is often incorrect in theater or fullscreen mode (#1121, #1202), subtitles lag at high speeds (#1185), and the controller disappears or conflicts with YouTube Shorts (#1157, #1116).
    *   **Major Streaming Services (Netflix, Hulu, Disney+, etc.)**: Speed automatically resets, especially after ads or when navigating between episodes (#1221, #1120, #1095, #1089, #625). The controller is also often unresponsive or hidden (#1028, #704).
    *   **Social Media (Reddit, Facebook, Bilibili)**: The extension is frequently reported as non-functional, breaking video playback, or having hotkey conflicts on these platforms (#1128, #1111, #1053, #849, #843, #724).
    *   **Educational & Niche Platforms**: Many reports of the extension not working on e-learning sites like Panopto, Kaltura, and Canvas (#1046, #857, #861).

2.  **Core Functionality & Performance**
    *   **Settings Don't Save**: Users report that their settings are not being saved, especially after a browser restart or on certain browsers like Arc (#1139, #1082, #1029).
    *   **Performance Issues**: The extension is reported to cause performance degradation on some pages (#1145, #1055, #1054) and audio desync at high speeds (#822, #777).
    *   **Local Files**: The extension behaves inconsistently with local video files, with shortcuts firing twice or not at all (#1148, #1122, #1117, #1080).
    *   **Hotkey/Focus Issues**: Hotkeys sometimes stop working after clicking elsewhere on the page (#1045) or conflict with other extensions in shadow DOM (#1149).

3.  **UI Glitches**
    *   **Controller Visibility & Position**: The most commonly reported bug is the controller appearing in random locations, being hidden unexpectedly, or not showing up at all (#1184, #1157, #1109, #870, #853).
    *   **State Management**: The speed sometimes resets unexpectedly when pausing, seeking, or changing tabs (#1043, #864). Some users also report the speed defaulting to an incorrect value (#1077, #1057).

This breakdown should give you a clear overview of the current state of the issue backlog. Let me know how you'd like to proceed!

--------------

# Open Issues Summary - Video Speed Controller

This document contains all open issues from the GitHub repository `igrigorik/videospeed` as of the report date.

## Issue #1221: Speed Quickly Reverts Back to 1.00 on Hulu & Paramount Plus, But Works on Other Sites

Since yesterday, the speed quickly returns to 1.00 after setting an increase on some streaming sites. This occurred yesterday in Hulu and yesterday and today in Paramount Plus. I haven't checked Hulu yet today. The VSC worked fine in YouTube, Amazon Prime Video and Netflix during this time span since I noticed the issue yesterday. Also, I didn't notice issues in Peacock yesterday, but I didn't pay enough attention to be sure about Peacock. I am using Mac OS Ventura 13.7.6 (22H625) and the Chrome Browser version 138.0.7204.158 (Official Build) (x86_64) and Video Speed Controller version 0.9.0. My computer has been shut down and rebooted during this time.

## Issue #1218: Would you consider adding an option to force it on for sites.

Specifically for twitch. I want to watch the clips sped up but not the streams as it will cause stuttering. You can disable the video speed manually  but an allow list to automate this function would be nice. IF this si allready doable with regex that would be great too. 

So for example: 
Disable:
twitch.com/*
Allow:
twitch.com/<user>/clip/*
twitch.com/videos/*

## Issue #1204: Can't see the controllers on (web.telegram.org) videos when Full Screen

Hello,

Can't see the controllers on (web.telegram.org) videos when Full Screen.

## Issue #1202: Controller hidden by UI

Youtube's UI on chrome has changed recently so that the top left corner of the video has a link to the creator's page. This element happens to be on top of the controller which is really annoying to deal with. I couldn't find a way to move the controller without first going into the settings to make it larger so I wouldn't accidentally click the link to the creator's page. Would it be possible to add a keyboard option for moving the controller? Or maybe a way to change the default location of the controller on a video?

## Issue #1201: Suggestion : Full Screen Shortcut

Please create a shortcut to switch to full screen

## Issue #1187: Custom key bindings do not allow for F13-F24 keys to be assigned

![Image](https://github.com/user-attachments/assets/7e4cb65f-c595-44dd-b396-f70c68b4205a)
In this page, when i try to use any of the F13-F24 keys that i have on my macropad, it simply ignores the keypress and will not assign those keys.

I found this bit of code:
https://github.com/igrigorik/videospeed/blob/d7856864138f95b7acf1a7fdcc96f397c4248502/options.js#L30-L77

Seems like adding F13-F24 should not be a problem

## Issue #1185: Fix YouTube subtitles lagging behind

With this, subtitles on YouTube should keep up with up to 8x speed. They should no longer lag behind nor alternate between suddenly slowing down and speeding up.

This works by making YouTube's timers fire earlier / more frequently. This makes YouTube pick up the earlier-than-usual video positions caused by Video Speed Controller, and both refresh earlier and schedule the next timer to refresh earlier. A constant 4x boost is used for simplicity (the new script runs elsewhere in the unisolated MAIN world, so getting settings is hard), and 4x should be enough for most people.

YouTube's own speed should not be set to 0.25, or we get the same behavior as before this PR. The constant 4x should be low enough not to cause lag even with timers firing at 8x the normal 1x speed when YouTube's speed is set to 2x.

A funny side effect of this is that ads are cut a few seconds short.

Fixes #537

## Issue #1184: Pressing V is not causing controls to show.

Pressing V does not cause controls to show. Having a show controls button under the pinned icon would be nice. (yes, I'm on an HTML5 page, YouTube, and I right-clicked to be sure)

After several reloads (5), you are back, strange, this happened after PC forced a Win11Pro64 update restart.

Thanks for your consideration, and a heck of a good extension that should be part of Opera by default.

## Issue #1181: Not all keys are recognized in non US keyboard

I have an ABNT keyboard (Brasil) and the "numpad ." is not recognized by the extension for a shortcut (and some other keys from the alphanumerical part). It simply types them in the shortcut box.
Is there a workaround this? 
Thank you! : )

## Issue #1180: The extension is blocking iframe component to be created on the page

If the page is having a functionality that creates iframe element dynamically(like when I click a button, it creates iframe content on the page), Video speed controller blocks that behavior. Please try reproducing it and fix the issue. Thanks

## Issue #1170: Draggable HTML5 Video Containers Interfere with Controller Drag-and-Drop

The HTML5 Video Containers for YouTube videos are by default set to `draggable="true"`. This interferes with moving the speed box via drag-and-drop – the speed box sometimes moves with cursor after (sometimes not); difficult to rearrange and control. 

https://github.com/user-attachments/assets/4d343781-d054-42dc-9630-ef11f32a1e2c

## Issue #1163: Add mouse shortcut support too

Like mouse scroll right click left click just like keyboard letters shortcuts there should be option to capture any key.
I'm a student it helps me alot I use it on kiwi browser in my android phone.

## Issue #1162: Extension breaks 3d.laingame.net

The website <https://3d.laingame.net/> is subtly broken when used with this extension's default configuration. The "game" contains several short videos which this extension picks up. At the same time the game's default key bindings include `x` (or `◯`) for 'confirm' and `z` (or `✖`) for 'back' which clashes with the extension's default bindings for 'advance' and 'rewind'. This results in most in-game videos starting incorrectly and probably causes some other glitches I've been observing. There could also be some race conditions at play here (could the extension be catching some of the key presses and so prevent the game from picking them up?).

At first I wasn't sure if these were bugs in the WebGL reimplementation or maybe even intended behavior based on the original PlayStation game. It took me noticing that the controller UI shows up on those in-game videos and then connecting the dots to figure out what was going on. After that, to resolve the problem I just added `laingame.net` to the list of "sites on which extension is disabled" in the settings. What I'm trying to say is it's really not that obvious. It would help a lot if the extension could avoid this problem out of the box.

One solution would be to have `laingame.net` in the exclusion list by default (or have it always be excluded since the game using HTML5 videos is just an implementation detail). If that's the best course of action I could probably prepare a patch. On the other hand maybe there's a deeper issue here. Would it be possible to detect if a website uses the same keybindings as the extension and deal with this clash somehow? But also there are quite a lot of websites using HTML5 video for stuff other than regular video playback. In such case the controller UI showing up can be quite annoying. If the extension could exclude all such cases automatically it would be be a pretty nice improvement.

## Issue #1160: React Hydration Error

A [React hydration error](https://github.com/facebook/react/issues/24430#issuecomment-2520093757) seems to be occurring with [Video Speed Controller Chrome Extension](https://chromewebstore.google.com/detail/video-speed-controller/nffaoalbilbmmfgbnbgppjihopabppdk) with the Next.js version `next@15.0.4-canary.41` (React version `19.0.0-rc-de68d2f4-20241204`) in the reproduction template:

```
Hydration failed because the server rendered HTML didn't match the client. As a result this tree will be regenerated on the client. This can happen if a SSR-ed Client Component used
```

- https://codesandbox.io/p/sandbox/github/vercel/next.js/tree/canary/examples/reproduction-template 

![Screenshot 2024-12-05 at 12 20 14](https://github.com/user-attachments/assets/bd61a1f5-5109-4b25-92ea-4752d7d8ea17)

![Screenshot 2024-12-05 at 12 20 18](https://github.com/user-attachments/assets/a42cfe93-15f1-47be-badb-214eba073318)

I haven't observed this in other Next.js versions up until now, and we do update to new versions often.

## Issue #1159: Not Working with Online university 

As Topic say it's not working with university Stuff
page keep refreshing not saving the last position of video and restarting most of times video from zero

## Issue #1157: Speed box not visible on YouTube

When I launch a video page, I cansometimes see the black box for half a second and it then disappears. The extension still works and I can accelerate or slow down videos but I have no idea about the speed. This does not happen on the other websites I use.

Edit: I found out it still appears when in fullscreen mode.

## Issue #1153: https://uzaktanegitimkapisi.cbiko.gov.tr/ It doesn't work on this website

https://uzaktanegitimkapisi.cbiko.gov.tr/ It doesn't work on this website

## Issue #1152: Request: Improve expand/collapse of controls overlay for mouse and touch

**Context**
When only using mouse or touch to watch videos, the controls overlay isn't very user-friendly or sometimes isn't functional (due to Windows issue, see below). This means that a keyboard may be effectively required to use the actions.

**Issue**
With a mouse, you need to hover over the smaller target of the current speed and then navigate to the right to click the action you want. If you accidentally move too vertical or horizontal, it collapses and you have to try again. This can be harder when using a touchpad where fine control of the mouse isn't as easy or if you're just not as accurate for whatever other reason.

With a touch device, Windows seems to do weird things with moving your mouse to that location or not. I don't really get it and it's super inconsistent at the OS level. The result is that sometimes tapping the current speed overlay results in it expanding and staying expanded (since it thinks your mouse it there). Other times, it ignores the tap or just flickers the expanded controller (likely because it thinks your mouse is elsewhere). Again, this is a Windows issue so it can't be resolved directly but it stems from the reliance on mouse location as the sole trigger for expanding.

**Resolution**
I'm just going to throw some ideas out there so someone else may have a better approach in mind:
This would be easier if the controls could be resized but it would also be nice to keep it expanded if desired. Perhaps clicking the current speed would trigger expand/collapse so it can be done on the fly while the current auto-expand/collapse remains. And maybe provide an option to configure the delay before collapsing.

**Extra notes**
This is may not be relevant if the control overlay were reworked for #1102 but I think the things I mentioned would be quicker tweaks. Combined with #1115 ([specifically my comment expanding the scope](https://github.com/igrigorik/videospeed/issues/1115#issuecomment-2467038319)), this would fully replace the need for a keyboard.

## Issue #1149: KeyEvent from inputs inside another extension's shadowroot triggers the hotkey

I'm the developer of another Chrome Extension, our extension inject a shadowroot element with text input inside. But when we are typing in that text input, it triggers the keyboard hotkey of this video extension which is very annoying. I've tried other extension with same shadowroot approach, same thing happens.

Since Video Speed extension haa a huge user base, is there a way to solve this? Does it require changes on our side or there could be a change in this extension?

## Issue #1148: Speed Multipler Wrong on Local Files

I drag and dropped a .mp4 file into my Chrome and tried to use the mulitplier but it was going from 1x to 2x to 3x, etc., when I had it set to 0.4x increase per key press.

I reopened chrome and now it's 0.8x increase.

The decrease multiplier is also wrong. It's decreasing 0,2x

## Issue #1146: It would be nice to have somewhere to see what the current speed is. Ideally on the icon.

Ah, nvm I found it.. problem is that it's quite transparent, hard to see on some videos.

## Issue #1145: Slowdown caused by plugin on Google flights

The date selector on google flights is slowed down when the plugin is enabled. Turning off the plugin speeds up things on the page

## Issue #1143: I want to be able to specify the default position of the setting on the screen

On some websites, the upper left corner is blocked by some prompts, so the playback speed cannot be seen. I hope to set a default specific position.

## Issue #1141: That when you change the speed again that it will show up again even you press V. That i want a soultion of permtaly disabel it. it never show up ever.

[No description provided - title appears incomplete]

## Issue #1139: Won't save any settings

I am trying to speed up edgenuity videos. It keeps overriding the set speed because the setting to force last saved speed isn't saved which is super annoying as i have to hold down the D key

## Issue #1136: Clicking fast forward too quickly makes the page go full-screen.

I used to be able to click on the fast forward button multiple times to adjust the speed quickly; now I need to click the button, wait a second or two, then repeat the process starting from 1.0 until 2.0; I am unsure what causes this change, maybe an update to chrome but it is a very subtle yet annoying change. Unsure if there is a way around this

## Issue #1130: Allow Up/Down and Left/Right key to rewind video.

[No description provided]

## Issue #1128: extension causing videos on reddit to be unplayable.

when i have the extension enabled videos in reddit give error before being played, with extension turned off it all works again.

## Issue #1127: window print function may fail if plugin is enabled in some webs

window print function may fail if plugin is enabled in some webs literally

the print panel will not show if plugin is enable

## Issue #1126: Allow modifier keys

it'd be nice if i could have a second layer of keys.

like if i could set "z" to rewind 3 seconds, and "shift z" to rewind 5 seconds.

## Issue #1125: "Hide controller by default" only works on YouTube

"Hide controller by default" doesn't work on all other streaming services other than YouTube.

## Issue #1122: local media playback issue.

default over floating icon at video screen is error in media speed control using shortcut.
over floating speed controller icon is hindering the local media plaback speed control with keyboard shortcut

## Issue #1121: youtube controller location bug

this isn't a critical bug, but in youtube if use theater mode as default and then use full screen, then the controller is in the middle of the video instead of the top left. you can move it to normal manually but its still pretty annoying 
![bug](https://github.com/igrigorik/videospeed/assets/72693847/887be387-e213-4662-bd7e-10ba9177a058)

## Issue #1120: Problems at Disney+

Speed ​​automatically resets to 1.0x, does not stay at selected speed

## Issue #1117: Local media playback issue

Cannot adjust speed using short keys and also the controller disappears on full screen.
Not working on local media on chrome browser.

## Issue #1116: It is not possible to use in youtube shorts. The play button doesn't allowed It to be use.

It is not possible to use in youtube shorts. The play button doesn't allowed It to be use.
![4asd4ad](https://github.com/igrigorik/videospeed/assets/171956461/af2947af-8fdf-460f-a10d-b78169a1f054)

## Issue #1115: add extra button in Firefox android version to reset playback speed.

As there are limited button works on android. Keyboard aren't attached so many features is unavailable in Firefox android version.
![IMG_20240603_212117](https://github.com/igrigorik/videospeed/assets/169541248/7dc828c0-a180-4715-9599-95d5a9798409)

So, add and extra button to reset playback speed in one tap.
Also you can extra button to quickly switch to 2x playback speed.
As it is Mobile devices , so I can't reset playback speed quickly.
By tapping R from keyboard.

https://addons.mozilla.org/en-US/android/addon/video-speed-controller-android/
![Screenshot_2024-06-03-21-05-27-24_50ecd26a21c2c56ce608de5e94733463](https://github.com/igrigorik/videospeed/assets/169541248/caa30f67-4732-42d5-a607-7078d2d7d4e9)

## Issue #1113: Specify `run_at:document_start`

The following must be added to content_scripts in manifest.json.
`"run_at": "document_start"` (or `"run_at": "document_end"`)

This is not directly related to the use of this extension, but is necessary to solve the following problem

Nico Nico Live Broadcast has a content called "Nico Nico Game".
The NicoNico game runs in Iframe
When the extension tries to load scripts or CSS into this Iframe, the NicoLive Game will not start.

The problem seems to depend on specifying when the extension is loaded.
The problem seems to occur only when `run_at` is `document_idle`.
I could not figure out why the problem only occurs if `document_idle` is `run_at`.

This problem may not be very common, or it may be a problem on the website side.
If there is no problem, please make this change!

(I used the DeelL translation)

## Issue #1111: doesnt work on reddit

videos dont play on reddit. it shows a black screen with " this video cannot be played"

## Issue #1109: The latest update broke the display.

Lately, when I've been changing the speed of videos on YouTube, I only _sometimes_ get the speed display in the top left corner. Sometimes it doesn't appear at all. And I think I see the reason why. I have a video open right now where I'm having the problem. The extension adds the vsc-show class to the vsc-controller, but it doesn't remove the vsc-hidden class. So your style that tells vsc-hidden not to appear (display: none) just stays in place.

In order to get the display to appear, I had to override the style on my computer using Stylebot:

.vsc-controller.vsc-nosource.vcs-show {
  display: unset;
}

In fact, even when I remove the vsc-hidden class, the display doesn't appear when the vcs-show class is added. I'm guessing there used to be a style in there that changed its css display property, that somehow got left out of this last release.

## Issue #1104: disable youtube press and release changing playback speed and displaying it

[No description provided]

## Issue #1103: Is it possible to make the font size of the tip text in the top left corner of the video larger? Or support customized font size, thank you!

[No description provided]

## Issue #1102: Touch friendly "gestures" (like in NewPipe / VLC mobile)

There are devices such as "surface pro" tablets which have touchscreen on desktop. There is also fork of this extension for firefox, and it is possible to install firefox extensions on mobile.

In app called NewPipe (for android) when video is in full-screen, touching on right portion of the screen and dragging finger up or down, changes volume (up or down). Touching on left portion of the screen and dragging up or down, changes brightness.
It would be great if this extension would allow to use this or similar gesture to change speed of the video. Simmilarly it also works in mobile version of VLC app.
Another way I thought of is to create some semi transparent button appears on middle left or right side (or other) and touching and dragging it would "reveal" slider to change video speed (and this dragging would change the video speed up or down). It would be kinda simmilar to current semi-transparent button, but it would open slider instead of buttons, and it would appear in different (than upper left) position of the screen. So it could be then made in settings to choose If someone wants buttons or slider; If button should be always visible or auto-hiding; What is the min and max speed. If the button would be only clicked (and not dragged) then slider would also pop up but just clicking in desired position on slider would change video speed (instead of dragging), and then I would argue that it would even benefit desktop users (but In my opinion even dragging would benefit desktop users - I really liked using scrolwheel to change video speed when it was avaiable).

## Issue #1100: 我在使用tiktok，刷到下一个视频，就要重新设置倍率

使用tiktok浏览短视频的时候，设置的视频播放速度，在浏览下一个视频时会失效，需要重新设置

## Issue #1099: Feature request

Add the capability to change the default location in the video, I love the button, and, I'll love it more if would stay close to full screen button

## Issue #1098: Sound split-second cut-off when modifying speed on WebKit browsers

Hello, I know this is an extension for Chrome (which is not based on WebKit) but I have been able to install it on the Orion Browser (which is). I understand if the issue is closed but maybe it will be a challenge to someone?
BTW. I think it's pertinent to Webkit and not just Orion, because I also installed the browser extension for Safari and the effect is identical.

**Steps to Reproduce**
1. Install the Orion Browser on a Mac (tried on both M1 and Intel Macs)
2. In Orion settings>Advanced, enable installing extensions from both Firefox and Chrome stores.
3. Install the Video Speed Controller extension
4. Attempt to adjust the speed of any video with sound (particularly speech)

**Problematic behaviour**
At the moment of adjustment (pressing S or D), the video sound "stutters" - the sound is cut off for a split second, enough to miss a word or two if people are speaking

**Expected behaviour**
No stutter, fluid sound acceleration or deceleration like on Chrome.

## Issue #1097: general question - export / import saved settings

Hi, this isn't an issue, but more of a general question... I thought this would be simple to find, but I can't. I'm looking to export my saved settings to be imported later if needed (or shared). Is there a way to do this ? Or where is this data saved ?

Thanks, Steve

## Issue #1096: No longer working on pesi.com

This extension was working on pesi.com but today I haven't been able to get it to work.

## Issue #1095: No longer works on Disney+.

I don't know if that's a problem that can be fixed. There's no overlay, and right-clicking seems disabled.

Might be a duplicate of https://github.com/igrigorik/videospeed/issues/1089

## Issue #1090: Support for ARC BROWSER

Please add support for arc browser

## Issue #1089: no longer works in Disney+?

no response to any change of settings in Disney+ today

## Issue #1087: please add next frame and previous frame feature

i am an animator and it'll help a lot to observe frame by frame

thank you

## Issue #1086: Extension not working after latest update

I see new options in the extension settings and it suddenly stopped working. It is also taking a very long time to save the settings and also to enable and disable the extension. I updated chrome yesterday but it was working fine. The problem started when i restarted my computer today.
![image](https://github.com/igrigorik/videospeed/assets/159157730/cd472060-39ee-47cb-a753-2d93e6817270)
Al my saved settings are rest back to normal once i exit the settings page as well.

## Issue #1085: I can not move to next page

Dear Developers,

I have been using videospeed for almost 2 years.
Thank you for your effort.

I was using speed controller on an education website, which shows videos like book pages,
at the end of every video, I need to click "next" button to move next page (video).
Videospeed was working well until two weeks ago. I can't move to next page when I use videospeed.
If I deactivate the add on, then I can move to next page.

How can I solve the issue?

Regards

## Issue #1083: Using the extension with Playposit videos disables the video

When I use this extension on the website PlayPosit, it speeds up the audio but disables the video from playing as well.

## Issue #1082: Settings Not Working on Arc Browser

Hi, the extension settings on [Arc browser](https://arc.net/) can't be saved for some reason. I tried on another browser like Brave and it worked just fine.

<img width="646" alt="image" src="https://github.com/igrigorik/videospeed/assets/22806872/a6b6dad4-4ef2-4c20-a0ab-16072a253a36">

This is what I see on my brave browser.

<img width="643" alt="image" src="https://github.com/igrigorik/videospeed/assets/22806872/0eed5447-1c50-4740-8045-9fc11f6f2de9">

This is what I see on Arc, but I can still use the shortcuts and the extension is working properly. Anyone can help to debug the issue?

Arc is also a browser based on Chromium so I imagine that there wouldn't be any difference but I might be wrong

## Issue #1081: Setting to make video play in background despite not being the active tab

Some videos will automatically pause when they're not the active browser tab. Example: tiktok. Suppose you're happy to just have the audio of the video in the background and you don't care about the actual visuals (e.g. a podcast that has audio+visual but you only care for the audio) then you might want it to play it in the background. It would be cool for this extension to provide such functionality to allow videos to keep playing when they're not the active tab on sites that would usually pause the video if it's not the active tab.

## Issue #1080: Local file: Keyboard shortcuts trigger actions twice.

When I rewind or skip forward, it skips 2x the set amount. When I pause, it does nothing, presumably because it pauses and then plays again. The extension works great for me in normal websites, I only experience this issue with local files.

## Issue #1079: VIDEOSPEED NON FUNZIONA

Buongiorno, nonostante si imposti una certa velocità, il video prosegue a velocità normale. Potete risolvere? Grazie

## Issue #1077: default vedio speed is 2x,I can't adjust it to 1x

[No description provided]

## Issue #1076: Youtube audio silent after over 8x speed (and other)

as header youtube audio stopped working after 8x speed. I use Firefox, I think all users have this problem but I can't find out any solutions on google

## Issue #1074: local file: reset speed and 2x speed (defult g and r) shortcuts don't work, decrease increase speed does. mp4 file

[No description provided]

## Issue #1073: Videospeed controller breaks layouts containing video

It spoils the appearance of websites/blogs look bad, could you please fix this? see some examples below:

<img width="1151" alt="image" src="https://github.com/igrigorik/videospeed/assets/51622226/9af1aead-cb03-4c9d-91e4-bc119a7965af">

<img width="1132" alt="image" src="https://github.com/igrigorik/videospeed/assets/51622226/d0937ce6-441f-4c48-a72c-b21b7184dbf0">

https://mefody.dev/chunks/hover-debug/

## Issue #1072: Video Speed Controller does not work with the Mux Player

The Video Speed Controller Chrome Extension does not work with the Mux Player: https://www.mux.com/player

It does not show the overlay and also the keyboard shortcuts dont work.

## Issue #1070: Video single tab

After the latest chrome update v. 119.0.6045.105 bindings keys stopped working on tabs where there is only video. 
(for example https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_1MB.mp4 )
Please fix this

## Issue #1067: Does the software no longer have the ability to view video resolution, bit rate, and frame rate

I downloaded it for this feature, but it's sad not to find it

## Issue #1065: Enable speed control for picture-in-picture mode on Edge and Chromium browsers

# Feature request: Picture-in-picture mode compatibility

Hello,

I love using **Video Speed Controller** to adjust the playback speed of online videos. However, I noticed that it does not work well with the **picture-in-picture mode**, especially on **Microsoft Edge** and other **Chromium-based browsers**. 

Picture-in-picture mode allows me to watch videos in a floating window while doing other tasks on my computer. It would be great if Video Speed Controller could also control the speed of the videos in this mode, just like it does in the normal mode.

Is it possible to add this feature to Video Speed Controller? I think it would enhance the user experience and make the extension more versatile.

Thank you for your consideration and your awesome work on this extension.

## Issue #1063: How about including a file with the full text of the MIT License in the repository?

First of all, thank you for this wonderful and useful product.
May I make one suggestion for this project?

### Suggestion
It might be more comfortable for users to use and contribute to this software as OSS if the full text of the MIT License is filed(such as `License.txt`) or otherwise placed in the repository.

### The reason why
Many OSS include license information in the `About` section of GitHub repository, and you can also find detailed license information from there by linking to a text file, such as `License.txt`, in the repository.

![スクリーンショット 2023-09-30 15 58 21](https://github.com/oss-gate/workshop/assets/128765400/88d12866-0dcf-4c6f-b32f-8f38f2fc66c5)

The MIT License also indicates that the "permission notice" itself should be included somewhere in the software, as follows.
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

[The MIT License – Open Source Initiative](https://opensource.org/license/mit/)

Meanwhile, I am aware that at the end of the README for this project, it states `(MIT License) - Copyright (c) 2014 Ilya Grigorik`, thereby indicating that this software is OSS. I also understand that this is not a problem conventionally.

On the other hand, I would like to make this suggestion because I think that a file describing the entire license text would make the product more secure and easier to understand for more users as OSS.

### Reference:
[Adding a license to a repository \- GitHub Docs](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-a-license-to-a-repository)
[Licensing a repository \- GitHub Docs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository#determining-the-location-of-your-license)
(it says "As a best practice, we encourage you to include the license file with your project.")

Once again, I appreciate the great product. Thanks in advance.

## Issue #1061: Suggestions

Hi. I'm very happy with this great extension it saves me a lot of time and add me more control on playing videos. But it would be better if you could add this little features:
1 The ability of control buttons size especially on mobile.
2. The ability to delete or disable the close button.
3. The ability of getting the video URL in the real or add button to download files.
Thanks for your efforts .. hope you find my suggestions useful for you.

## Issue #1060: Controller is always hidden in YouTube Music when using "Song" instead of "Video" mode

[YouTube Music](https://music.youtube.com/) allows you to listen to tracks audio-only or with the video (if a video is available).
![YT Music](https://github.com/igrigorik/videospeed/assets/16425112/949b3db0-0aff-4410-aea9-57bd76ee6ac2)
When playing audio-only, whether by choice or because a video is unavailable, the video controller speed is never shown. Pressing `V` doesn't change this.

I have my controller displayed by default.
![VSC settings](https://github.com/igrigorik/videospeed/assets/16425112/35f93e0f-fab0-4a2a-8bf7-5ef6847c4c80)
Would it be possible to ensure that the video controller speed is shown for YouTube Music when audio-only, please?

Thank you

## Issue #1059: Doesn't seem to be working on Reddit for some reason

[No description provided]

## Issue #1058: Using space to pause YouTube videos activates the button twice

*Using Opera GX
When I use the pause key bind when mapped to [Spacebar] the video pauses then plays (vice versa).

I have tried turning on/off "Disable Website Key Binds" but the issue still occurs either way and I also know YouTube already uses the spacebar key to pause videos. If I change the key bind to [K] (which is also the pause button for YouTube) it works fine, even when the experimental feature is toggled to either option. It just happens with spacebar.

I'll leave feedback using YouTube's feedback section since there's additional bugs on their video player regarding the spacebar. But in the meantime I'll remove it from my key binds.

## Issue #1057: Automatic 2x

For some reason the extension is automatically playing all my videos to 2x. I set it back to 1x speed, but go straight back to 2x when I pause the video. II've tried uninstalling and reinstalling but running into the issue. Anyone else running into this?

## Issue #1056: One site keeps defaulting to 50%

Version 0.7.3

On one site video speed controller defaults to 50% even though I have no idea how it got that way.  I've reset the settings, uninstalled & reinstalled after first 
`mv ~/.config/google-chrome/Default/Extensions/nffaoalbilbmmfgbnbgppjihopabppdk/0.7.3_0 ~/.config/google-chrome/Default/Extensions/nffaoalbilbmmfgbnbgppjihopabppdk/~0.7.3_0`
so the config files couldn't be accessed.  

![image](https://github.com/igrigorik/videospeed/assets/535962/8458817e-888a-49de-b40b-323b75e4086d)

## Issue #1055: Excessive processing consumption!

I noticed that when using it on Youtube, the extension causes an exaggerated consumption of processing on the cpu, the strange thing is that I didn't have this problem before!

## Issue #1054: videospeed reduces browser's perfomance according to Speedometer

It seems having videospeed enabled would reduce web performance by about 15%-20% according to Speedometer test. That would be significant

https://browserbench.org/Speedometer2.1/

## Issue #1053: The extension doesn't work on Facebook.

Nothing works properly when I am watching videos on Facebook, keyboard keys and mouse clicks on buttons don't work.

## Issue #1049: Video speed controller doesnt work well anymore

It just crashes while playing my video. Doesnt remember its speed when I scroll back. How can I fix this?

## Issue #1047: The extension makes nextjs display an error in the console

Since the extension adds the class 'vsc-initialized' to the body of the HTML, the body of the client and the one from server become inconsistent. Which leads to NextJS throwing an error in the console.

![image](https://github.com/igrigorik/videospeed/assets/41365655/055d0bef-cdc9-4988-b7a1-ac228255a322)

As a temporary fix, I just made the extension ignore localhost in the configuration
![image](https://github.com/igrigorik/videospeed/assets/41365655/98343d35-b30d-4f36-bacd-9477ea97749a)

## Issue #1046: Video speed control extension does not sync speed across multiple videos on panopto.eu.

# Video speed control extension does not sync speed across multiple videos on panopto.eu

## Description
I installed the video speed control extension on Edge to watch lectures on panopto.eu. The extension allows me to adjust the playback speed of any video on the web. However, I noticed that when I watched a lecture that had multiple or dual videos (such as a slide and a speaker), the speed did not sync across all the videos. For example, if I set the speed to 1.5x on one video, the other video would still play at 1x. This made it difficult to follow the lecture and caused confusion. I also noticed that the extension controller showed the changed speed but actually the speed was not changed and the times were not synchronized. I tried to reload the page, disable and enable the extension, and change the browser settings, but none of them worked. I also checked other websites that had multiple videos, such as YouTube and Vimeo, and the extension worked fine there. The bug seems to be specific to panopto.eu.

## Steps to reproduce
1. Install the video speed control extension on Edge.
2. Go to panopto.eu and log in with your credentials.
3. Find a lecture that has multiple or dual videos and open it.
4. Click on the extension icon and adjust the speed of one video.
5. Observe that the other video does not change its speed accordingly and that the extension controller shows a different speed and time than the actual video.

## Expected behavior
The speed should sync across all videos on the same page and the extension controller should show the correct speed and time.

## Actual behavior
The speed does not sync across all videos on the same page and the extension controller shows a different speed and time than the actual video.

## Environment
- Edge version 114.0.1823.41 (Official build) (64-bit)
- Windows 11 Version 22H2 (OS Build 22621.1778)
- Video speed control extension version 0.7.3 installed via chrome webstore
- Panopto.eu

## Issue #1045: Stops working after clicking anywhere else

The speed controller works when the page first loads. But if you click anywhere else the keys stop working and won't speed up / slow down

## Issue #1044: Trying to blacklist part of a site isn't working

I want to blacklist livestreams on twitch but have the extension enabled on VODs.
A live stream has a url "twitch.tv/streamerName" and a VOD has a url "twitch.tv/videos/someNumber"
I tried blacklisting using `/twitch\.tv\/[^\/]*$/` but it doesn't blocks either of them, can someone help me please?

## Issue #1043: Video speed will go back to normal if you tab out

Video speed will go back to normal if you tab out, or going to a different window, and this is very annoying; because it only started doing this recently.

## Issue #1042: hunet websites having trouble fastforwarding greater than >x2

when I press 'D', the player automatically gets locked to x2 and the speed doesn't get faster.

I attach to F12 snapshot thank you.
![11111](https://github.com/igrigorik/videospeed/assets/100756133/d02c90b5-2971-4419-9a20-494c8bad482f)

## Issue #1040: Not working in Redbull site due to shadow DOM

For example in this video:
https://www.redbull.com/cl-es/videos/aczino-the-goat-radiografia

As mentioned in #934 it is because of shadow DOM.

I think it is possible to automatically discover and process shadow DOM, but i'm not sure about the drawbacks in performance or false positives.

## Issue #1039: Can't reposition controller on YouTube. Controls for changing speed and fast forward/backward are missing.

Can't reposition controller on YouTube. Controls for changing speed and fast forward/backward are missing.

## Issue #1038: Keyboard shortcuts on Picture-in-Picture

Would it even be possible for the extension to allow its keyboard shortcuts to be available after clicking the Picture-in-Picture (PIP) window, on the video being played in the PiP window, even if its tab isn't the current one in its browser window? I suppose this would be rather be an issue to be dealt with by the browser devs? That would be neat, as i find myself using this extension shortcuts a lot when listening to videos, i would like to use PiP more but the lack of control is a huge issue for me.

## Issue #1037: Speed Controller incremental increase bug

For some reason increasing speed by .1 or any increment sets the video speed to x2 every time (instead of x1.1, x1.2, x2.1 etc). Increasing or decreasing the speed at all always sets it to x2

## Issue #1036: [HELP] Regex for youtube shorts

Anyone able to help for the regex for youtube shorts?
I want to be able to speed up videos for youtube but for shorts to be normal speed.

Not able to get the regex to work 

Tried the following below 
youtube\.com\/shorts
(.+)youtube\.com(\/shorts)$

## Issue #1035: I wrote some CSS for the settings page

I was bored so I asked chatGPT to write some CSS for the settings page, and then slightly modified it. Feel free to use I (the bullet point before the first style block should be an * asterisk)t:

 `<style>
 * {
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
 }

 body {
     background-color: #f5f5f5;
     color: #333;
     line-height: 1.6;
 }

 /* Container */
 .container {
     max-width: 960px;
     margin: 0 auto;
     padding: 30px;
     background-color: #fff;
     box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.12), 0px 1px 2px rgba(0, 0, 0, 0.24);
 }

 /* Headings */
 h1,
 h2,
 h3,
 h4,
 h5,
 h6 {
     margin-bottom: 20px;
 }

 /* Form */
 form {
     margin-top: 20px;
 }

 .form-group {
     margin-bottom: 20px;
     display: flex;
     align-items: center;
     justify-content: space-between;
     flex-wrap: wrap;
 }

 label {
     font-weight: bold;
     display: inline-block;
     margin-bottom: 5px;
     width: 30%;
     text-align: right;
     padding-right: 15px;
 }

 select,
 input[type="text"],
 input[type="email"],
 input[type="password"] {
     width: calc(65% / 3 - 10px);
     padding: 10px;
     border: 1px solid #ddd;
     border-radius: 5px;
     outline: none;
     margin-right: 5px;
 }

 input[type="checkbox"] {
     width: auto;
 }

 button {

     padding: 10px;
     background-color: #007BFF;
     color: #333;
     border: none;
     border-radius: 5px;
     cursor: pointer;
     font-size: 18px;
     margin-top: 20px;
 }

 button:hover {
     background-color: #0056b3;
 }
 </style>`

## Issue #1034: Echo 360

It's not showing the tool bar and therefore won't work on the echo view 360, for lecture recordings. I have checked and the site is an html site not flash.

## Issue #1033: Please release official Edge extension

Thank you for your work.

There are a lot of shady extensions both in the Chrome and Edge store related to video speed management. They seem to copy from each other. Yours is one of the few I trust.

It would be nice if you'd release Video Speed Controller in the Edge store: 
https://microsoftedge.microsoft.com/addons/Microsoft-Edge-Extensions-Home

P.S.: I know that Chrome extensions work on Edge, but I'd prefer getting them from the Edge store.

## Issue #1030: Any plan to add support for Spotify ?

Currently Spotify doesn't support playback speed on web player and another extension is needed to bring the support, please add support for Spotify.

Thanks for this lovely and useful extension.

## Issue #1029: not working on Microsoft Edge 111.0.1661.44

just update to Microsoft Edge 111.0.1661.44.
Ran into problems of Edge itself, may be related to this.

Couldn't save any setting and won't show in HTML5 video.
![image](https://user-images.githubusercontent.com/33191110/225940979-d1f502ca-eabc-48b5-bcbb-943a2fd00286.png)

## Issue #1028: When I click my keys to speed up or slow down or whatever it activates the netflix title of the movie

I'd like to be able to just play netflix and youtube tv at a higher speed without having to activate the title of the move / show. 
Everytime I touch my keyboard it goes shows the title and the play and pause button extra and it kind of ruins what i'm watching. 

It didn't used to do this. Does anyone know how to help?

Thank you very much

## Issue #1027: Feature Request: Per-Site "Remember Playback Speed"/"Forced Last Speed" settings

### Description

There are currently several settings under "Other" heading on the settings page that could benefit from being set on a per-site basis. Currently there is a box to exclude sites from the extension altogether, but an additional box where we can set these settings to on or off by website would be incredibly useful.

### Reasons

- Work on audio /  Hide controller by default 
1. Certain sites (e.g. with multiple audio streams on a page) can be glitchy with the controller hiding most/all of the audio  streams controls as they are made deliberately small/narrow by the site owners.  Users may want to hide controllers or disable audio on such sites only.
2. The UI can be annoying on certain sites where it takes up  the same slot as other control  elements (Netflix). Users may want to hide/disable the UI on such sites. 


- Remember playback speed / Force last saved speed
3. Certain sites (e.g. Imgur on reddit) may lead to users setting playback speeds far higher than they want elsewhere. (e.g. User may play a long boring subtitled imgur clip at 10x speed, but not want this to carry over to Netflix or Youtube or even to apply to other clips on the given site itself)
4. Similarly certain websites (e.g. Udemy) sometimes have issues with forcing the last saved speed and users may want to disable this option for those sites alone

### Impact

- Minimal - I imagine this feature while useful would only ever be used by a tiny minority of users. I imagine the average user never opens the settings page.

### Estimated work

- High: No baseline but it seems like this could be finnicky/a lot of work to implement

### Comments

No expectation this will ever be added given the low impact + how much work this is, but thought I'd make the ticket. Really love this extension btw.

## Issue #1026: Problem with Widget "Video Playlist" of Elementor Pro

Hello Team,
I found your Video Speed Controller very useful. Great.
But the chrome extension does not work together with the Widget "Video Playlist" of Elementor Pro.

Do you know this? What can I do apart from disable the extension?
Thanks
Jens

## Issue #1025: [Feature request] Add a button for full screen videos.

Hey,
I wish if there is a button like "F" to have full screen video.

## Issue #1023: Feature request: allow overriding pre-existing Shift+<key> shortcuts

As raised in #306, some of this extension's default shortcuts clash with YouTube's spherical video shortcuts.

#350 added the ability (hidden behind "Show Experimental Features") to "Disable website key bindings", which is handy. But it would be nice if it could be fine-tuned to only block lowercase or uppercase. I'd like to use `t` as another "Preferred speed" shortcut, but YouTube uses `t` (with or without `Shift`) to "Toggle theater mode". It would be nice if this extension could both block YouTube from listening to `t` (but allow `shift-T`) and only listen to `shift-T`, so both shortcuts could still be reached easily, but would no longer trigger simultaneously. Or vice versa.

This snippet blocks YouTube from listening to `Shift-t` (uppercase T), but does not prevent this extension from doing so, and does not stop YouTube from listening to `t` (lowercase t).

```js
function onKeyDown(e) {
  if (e.key !== "T") return;
  e.stopPropagation(); // or e.preventDefault();
}
document.addEventListener("keydown", onKeyDown, true);
```

Changing `"T"` to `"t"` on line 2 -- as you might expect -- blocks YouTube from listening to `t` (lowercase t), but does not prevent this extension from doing so, and does not stop YouTube from listening to `Shift-t` (uppercase T).

The point being, it seems feasible to allow make the override more selective, at least on some websites.

Downsides: more codebase complexity, and settings would become more complicated as well.

I'd be willing to open a PR. The simplest solution (in terms of UI) would be something like this (copy could be improved, this is just a rough POC):
![lowercase_uppercase_mockup](https://user-images.githubusercontent.com/669326/221069369-f133738a-34bd-4359-b9a9-378864f4eb58.png)

## Issue #1022: Controller isn't working with files opened in browser

I opened video file in browser but there isn't video speed controller
Browser: [Version 1.48.164 Chromium: 110.0.5481.100 (Official Build) (arm64)](https://brave.com/latest/)
Device: macbook air 2020

---

## Issue #870: After the update, the controller does not appear in the upper left corner of the image

After the update, the controller does not appear in the upper left corner of the image.

Especially on Youtube, the controller has been on the top left all the time, but it doesn't now. it appears everywhere randomly after the last update.

Still thank you for the program. Have nice one

---

## Issue #868: Some sites start video with 0.00 speed on older versions of Chrome

For a while, whenever I opened a YouTube video (which makes up 99% of my use of this utility), the content would just sit with the loading circle going round and round. I eventually realized that the speed of the video was set to 0.00. I never set it to that (iirc you can only go as low as 0.07), so I'm not sure how that would be a PEBKAC issue. Pressing the 'r' key to reset the utility worked as expected and brought the speed to 1 (and from there everything worked fine). I was able to replicate the issue on facebook, but not instagram. I didn't think to check reddit as another data sample. 

Regardless, after updating Chrome (I forgot to note the prior version I was on; currently using v93.0.4577.82), everything seems to be working properly, so I guess this isn't so much of an issue as it is a notification of unexpected behavior.

---

## Issue #865: the playback speed get reset after add is skipped on youtube

---

## Issue #864: playback speed gets reset when playing the video after pausing.

sometimes it works if I disable and re-enable the extension.
But most of the time it does work.

---

## Issue #863: Extension prevents playback of BBC video

Videos published by the BBC will not play in chrome when the extension is enabled.

e.g. https://www.bbc.co.uk/news/av/world-us-canada-58509703

The following error is logged in the console when you press play: "uncaught element is not video or audio DOM type!"

If you disable the extension the videos play fine.

- Chrome Version 93.0.4577.63 (Official Build) (x86_64)
- Video Speed Controller Version 0.6.5

---

## Issue #862: Apple TV+ TypeError: Cannot read properties of null (reading 'prepend')

I wish I was a better developer, but I cant figure out how to fix the issue. 

When first loaded it seems to not be able to find `".skrim"` inject.js line 365. 

If I change to `".background-video__wrapper"` it works initially on the preview videos, but not the main content after clicking play. 

```
inject.js:366 Uncaught TypeError: Cannot read properties of null (reading 'prepend')
    at tc.videoController.initializeControls (inject.js:366)
    at new tc.videoController (inject.js:202)
    at checkForVideo (inject.js:620)
    at inject.js:662
    at Array.forEach (<anonymous>)
    at requestIdleCallback.timeout (inject.js:638)
```

---

## Issue #861: Video Speed Controller Issue on School Website

Issue started a few days ago (~5), video speed no longer changes on the Canvas website (that my school uses--though I'm unable to identify the source of the website) through use of the extension. Icon still shows up on top left of screen, but most other actions no longer work. Still works on YouTube (haven't tried other websites).
A lot of the students at my school use this extension to study, so I know there's a lot of people who would be grateful to you for a fix on this. Thank you!

---

## Issue #860: Zoom Videos Posted On Facebook

Some Zoom videos posted on Facebook feeeds do not have the option to use the video speed controller. Is there a fix for this? Thanks!

---

## Issue #859: I am unable to use the extension

Seems like with the recent update that the extension is no longer working. I am unable to increase or decrease the speed. the only thing I can see is the current speed. Please update this issue. 
Also, I was able to use the speed controller on every video on Facebook but now it only works for the first video and then disappears for the rest of the videos. Please fix that as well. 
Thanks! -Andy

---

## Issue #857: Problems working on Kaltura

Kaltura is an (unfortunate) media recording software used by some university systems to record, share, and view material like lectures. In the past month, the hotkeys no longer work with the kaltura media player. While I would love to just use a different media player, that unfortunately is not an option. The video speed controller functions such that I can still manually change the speeds with the on screen controller, but if the video is paused the speed resets, and the hotkeys do not work. Without the hotkeys, the extension loses a lot of its utility, since being able to change the speed on the fly is its greatest appeal (imho). Any insight or fixes are greatly appreciated!

---

## Issue #856: Stopped working on AppleTV+

For the the last two weeks, I have been unable to change the speed of video played back in the browser version of AppleTV+.

Can't use any of the keyboard commands to change speed or bring up the UI. Tried turning off auto-hide for the controller - it still didn't appear.

The plugin still works as normal with other video sites.

Same issue in Chrome on both macOS Big Sur and Windows 10.

---

## Issue #855: Controller Position is not fixed, yet!

As the title says and as I observed, ambititions to fix the controller on videos to put it back into the left corner weren't successful, yet, since taking updates etc. doesn't result in position fix from lately discussed problems more users reported.

Thanks ahead, keep up the good work!

Best Regards,
a Fan

---

## Issue #853: controller position went crazy

the controller is now placed in random places on the screen or simply does not appear in the videos.

---

## Issue #851: VideoSpeed Controller not appearing in the corner of the screen

VideoSpeed Controller not appearing in the corner of the screen, after the latest update.
Despite moving it to a corner, it again goes to its original position on the next video.

its position is very irritating.
I do not want to hide it.
I need to see it, in the corner.

---

## Issue #850: (new) Video controller appears near the center of the video, instead of top left


before the design of the controller changed, it always appeared at the top left,

now, it always gets in the way of the video, i cant always drag it to the top left, its too much trouble

---

## Issue #849: bilibili.com新发布自己的快捷键操作，导致这个插件失效

之前的bilibili右键打开"快捷键"：

现在的bilibili右键打开"快捷键"：

于是现在VSC插件就失效了，请问有人解决此问题吗？是不是可以禁用bilibili上的快捷键？

---

## Issue #848: Introduce everyone a way to use the old version to make the UI display in the correct position/给大家介绍一个用回旧版本使UI显示在正确位置的方法

首先感谢开发者开发这款插件，我之前一直用得很舒服。但最近发现悬浮UI不显示在左上角了而显示在视频中间或右下角，发现果然很多人都碰到了这个问题 #839 ，开发者迟迟不回复。其实开发者早就知道有这个问题 #786 ，但仍一意孤行地在问题还没修复的情况下推行新版本。Chrome是强制自动更新插件的，普通用户难以拒绝。不过我作为插件开发者可以给大家简单介绍一个使用旧版本的方法来对抗开发者的独断专行，这样不用等待开发者修复就能自己修复这个问题了。

1、下载旧版本没有问题的软件包 https://github.com/igrigorik/videospeed/archive/refs/tags/v0.6.4.zip 并解压到任意文件夹
2、到插件管理页面 chrome://extensions/ 右上角打开开发者模式
3、点击【加载已解压的扩展程序】选择刚才解压的目录即可使用旧版插件

请注意这种方法就不会自动更新了，如果以后想用新版本还是需要启用从chrome商店安装的插件

---

## Issue #847: Playback Adjustment Of Speed Is Not Working Via Keyboard Shortcut

Pressing D or S to increase or decrease the playback speed is no longer available in this new version. I have to use extra technical time to click x times as per the increments i desire.

Not acceptable! Please look into fixing this. The new UI has brought about such functional issues as well.

---

## Issue #846: YouTube playback speed resets even after updating to latest version

If I'm watching a YouTube playlist or queue and use VSC to set the playback speed, YouTube will reset it back to 1.0x speed when it transitions to the next video in the playlist/queue.

This happens even when the new "Force last saved speed" option is enabled.

---

## Issue #844: Controller Not Visible or Obscured in Reply Tweets

When viewing a reply tweet of a tweet that has a video, the video controller works but is not visible or is otherwise obscured. This is a regression that showed up in v0.6.5 and echoes the general reports of #839.

Example: https://twitter.com/SantiagoAuFund/status/1430978121667420166

---

## Issue #843: HEVC视频无法使用插件

哔哩哔哩网站 https://www.bilibili.com/ 在播放HEVC视频情况下无法使用该插件，不能调节速度。 

---

## Issue #841: Not working past 2x speed on Panopto video

I am using the newest Google Chrome like I always do, and it is working on Youtube and Netflix, but not Panopto

---

## Issue #839: I want you to return to the previous UI

On youtube, the button is displayed above the video and it is hard to see.

I can speak only a little English. (google translate)

---

## Issue #838: Not working on facebook using Brave browser

Not working on facebook using Brave browser

---

## Issue #835: feature request

indicator from the plugin window that let's us know what speed is applied and inc/dec buttons

---

## Issue #833: the video in https://www.bilibili.com/ usually invalid

the first video you open could control the speed in general,  but when you open the second video or another video, the speed controller will invalid

---

## Issue #831: Overlay moved to center of screen and doesn't react anymore.

I've been using the add-on for a few months without a problem but all of a sudden it stopped working. The overlay reset its position to the middle of the screen and when I hover my cursor over it to move it somewhere else I can't move it, I just click through it and pause the video. It also doesn't expand to show the buttons. I can still access it via the hotkeys though. 
Already reinstalled it but the problem persists.

---

## Issue #830: Video Speed Extension NFL Gamepass Issue

NFL Gamepass just updated for the 2021 season and now the extension is not allowing me to rewind. I have deleted the extension and redownloaded it as well. Any ideas on how to fix it?

---

## Issue #829: videospeed Extension doesn't work on bilibili/哔哩哔哩

for example LTT's new video 
`Easy Small Form Factor Build` [Link](https://www.bilibili.com/video/BV1S64y1x7ZE)
videospeed can't control the playback speed.

---

## Issue #828: Delay when opening new youtube video tab

It was working fine yesterday, now when I open a new video tab it takes 10-20 seconds for the ui to show up and the extension to have any effect on video speed. 

Reinstalled the browser to see if it would fix it but no dice.

---

## Issue #827: in black mode, the text is not clearly visible.

I am using it well.
But in black mode, the text is not clearly visible.
I would appreciate it if you could display the current playback speed with a badge on the top right icon.

---

## Issue #826: Feature Request - Seek To Time

Can there please be a seek to time option thanks a lot for the amazing software

Thanks, Charlie

---

## Issue #825: Not working on digitalinnovation.one

platform uses youtube videos with its own player
https://digitalinnovation.one/

---

## Issue #823: Experimental Feature doesn't work on Amazon Prime's video

The "disabled website key bindings" works fine for all the websites I use except Amazon Prime video. I know it's an experimental feature but I really hope this could work on Amazon as well

---

## Issue #822: Audio desync issue

Recently on Youtube I've been getting audio desyncs, with the audio running ahead of the image after speeding the video up for a while.

---

## Issue #821: Request to add support for H.265

 I can't use the acceleration function while watching videos on Bilibili.

---

## Issue #820: Video Speed Controller Issue

There should be a tool in the settings to allow the speed controller buttons to be placed at different parts of the video screen, for example "top right, bottom left, bottom right etc." I frequent a channel where when you move the mouse to top left of the video a button appears (always on top) for toggling back to the main menu. It just happens to appear right on top of where the VSC appears on the video so I cannot even use the VSC on that site. I know VSC has drag and drop capability but in this case I can't even get to it because the website's button appears exactly on top of the VSC. If there was a parameter in the settings to move the VSC to another position on the video screen the problem would be solved. Thanks

---

## Issue #819: suggestion for my favorite chrome extension

This is a perfect extension with more uses than can be explained to someone all at once when recommending it. 

Currently the lowest I can set video speed is .07. Let me tell you this, the difference between that and 0 may be small, but I believe the ways this would pay off for the user would be similarly endless. Videos in this day and age are programmed to frustrate us, buffering only so far on purpose and in all sorts of other ways. When I'm streaming movies, if I pause it for too long it just unloads the video and when i unpause it crashes. If I were able to set the video speed to 0 with your extension, the frame wouldnt even be aware of my pausing, and I would be able to stop and start again on the same file endlessly without sacrificing my hard earned buffer progress.

---

## Issue #818: Move default controller location

Is there a way to move the default location of the controller without having to drag and drop each time? YouTube has started putting a "Includes Paid Promotion" button over top of the controller. It goes away after a few seconds, but if the controller could be set to show up lower on the video, it would avoid the overlay at the beginning. It would also be useful on Reddit gifs.
Thank you.

---

## Issue #817: the 1.00 button thing shows up in the middle of my screen when i watch netflix

---

## Issue #816: Little bug in Microsoft stream videos

When i use the rewind option a couple of times in a row in Microsoft Stream videos, the video keeps loading forever.
This thing doesn't happen when i use the "left arrow" key (a.k.a the default option to rewind in MS Stream).

---

## Issue #815: Microsoft Edge permission system not usable for this extension 

The Extension only works on pages when the permission for the extension is set to 'allow on all websites'. The permissions 'allow on specific websites' and 'allow after click on extension' will set the extension in a disabled state, even if the filters for the extension to be enabled are given.

Microsoft Edge
Version 91.0.864.27 (Offizielles Build) beta (64-Bit)

---

## Issue #814: doesn't working on YouTube Ads

it's a couple of days that doesn't work whit YouTube Ads, the ones that interrupt videos while playing. 
the YT ads gets stuck and "crash the system". i mean, after 15 minutes the situation was the same even if i had refreshed YouTube page.

---

## Issue #813: Someone broke the license agreement?

I have been using this extension forawhile.. it has no reference back to this repository, nor is it opensource, nor did they mention the copyright notice of this repository per MIT license.. 

options.js found is pretty much a clone of this repository.

https://chrome.google.com/webstore/detail/video-speed-manager/fkopaaikpmfhpmoobnmklgmcgmhgfkcd

---

## Issue #812: Not working in Vivaldi Browser

After the latest update of vivaldi browser 3.8.2259.42 (Stable channel) (64-bit).. Videos are not playing until this extension is disabled.

---

## Issue #810: Not working on Amazon Prime Video

The controller shows up in the Amazon Prime Video player, but I can't click it. Whenever I try to click it, the video just pauses.

---

## Issue #809: Multiple Controller Previews

I've long had an issue with this extension where there'd be multiple instances of the `1.00` controller overlay, depending on the platform. Finally decided to open an issue about it when I fired up a movie on Prime Video and got a new high score, lol

Don't know enough about JS to spitball why this might be happening, but any suggestions to sort this out on my end would be greatly appreciated!

---

## Issue #807: Not working on digitaltheatreplus

The video speed controller doesn't work on digitaltheatreplus. It shows up but can't even be clicked on or moved or anything. It's just there. It doesn't affect anything no matter the speed it's set at.

---

## Issue #806: feature requests: (1) jump to percentage position, (2) frame by frame, (3) allow modifier keys for shortcuts...

hello - here are some feature requests (hope it's ok to list them all together like this, if not please let me know and i will open separate threads for each of them!)...


(1) jump to percentage position:  
- allow the 0-9 keys to jump to 0(begin)/10/20/.../90% of the way through a video (similar to how it works on youtube already, but allow it on all videos).  maybe also allow shortcut keys to skip forward/backward by a certain percentage of the video (instead of set # of seconds).

(2) frame by frame:  
- when paused, allow keystrokes to move forward or backward frame-by-frame (or a different set # of frames).  currently have to use a separate extension for this (which only allows skipping forwards/backwards by 1 or 10 frames though), would be nice to have it incorporated into Video Speed Controller instead, and have it be more configurable.

(3) allow modifier keys for shortcuts:  
- allow shift/ctrl/option/cmd modifier keys for keyboard shortcuts, as this would enable more flexibility to use more shortcuts (i've run out of keys to use!).


thank you so much for one of the most indispensable extensions ever!!  =)

---

## Issue #805: New tab page need Reload

Hi.
I have several chrome browser user accounts on my computer and the main user have this extention in default that mean i don't Need to reload the page another time after opening the tab , but at the seconds users i need to do that and its realy annoying.
So please if it can be fixed . thanks 
And for the exstension itself very usefull !!!

---

## Issue #804: Reappears on Hulu

When watching TV show on Hulu.
After the controls GUI disappears and reappears if VSC was hidden VSC reappears.

Using chrome: 90.0.4430.93
VSC version: 0.6.4
x64 Win 10 Pro

Love the extension, best video speed controller out there, shame it's not higher listed in the extension store.

---

## Issue #803: not working on netflix

For some reason it was working fine on Netflix until recently when I can no longer adjust the speed. It stays on normal speed despite me using the keyboard shortcuts and clicking on the icon to make the videos faster.

---

## Issue #802: does not work on baiducloud

it dose not work on baiducloud in my google chrome,but it can work in my firefox.

---

## Issue #801: Does not work on SoundCloud

Video Speed Controller does not work on SoundCloud. E.g:

https://soundcloud.com/tony-robbins-material/tony-robbins-ultimateedge

"Work on Audio" is checked under Settings.

Please fix.

Thx.

---

## Issue #800: Speed won't go below 0.07x speed.

I have been unable to slow the video down past 0.07x speed, even after pressing the slow down button repeatedly it wont go any lower. I enjoy watching videos at 0.07x speed, specificially for the audio, however this is still too fast. It would vastly increase the potential applications of my favourite chrome extension if I could slow down the videos further. I am assuming this is a bug and that the developers didn't intend to limit the functionality of the extension in such an impactful way.

---

## Issue #799: web.WHATSAPP.com does not work

Hi,
can someone help me fix it because it stopped working on web.whatsapp.com,
is it general for everyone or something you can do to fix it?
is it an update of the web.whatsapp that made it stop?

this tool helps me a lot, can someone help me?

I have already created a new profile on chrome to rule out the possibility of an error in the browser!

thanks

---

## Issue #798: Something changed recently - videos failing to load

I love this extension, and I've relied on it for a long while. Recently however, it seems to be causing youtube videos to hang when initially loading. When I disable the extension, the videos start and play normally, but the problem returns when I re-enable it. This has happened on my macbook and on my windows pc. Any advice?

---

## Issue #796: Wont work in picture in picture

Is it possible to make the speed controller work in chromes picture in picture, because i can change it if I go to the original page, but if i just click on the PIP popout i cant control it or use the shortcuts to control it

---

## Issue #795: Feature Request: Backup (Export / Import) Preferences

Hi, I believe a backup (export/import) feature would be useful. Is it possible to implement?

---

## Issue #794: Play in reverse 

Hello, 
Is there a possibility to create a reverse function in different speed settings?

thanks

---

## Issue #793: The speed controller always hide autumatically and the hide/show hot key is not available

Every time when i watch the first video in _www.bilibili.com_ , the function is all ok. While i play the next video in the same video set , the video controller button always hide and i cannot use the hotkey V to show the button. i try to change the hot key ,but it still break down. How can i do to make the button always visible (since i want to know the current speed) ?

---

## Issue #792: issue with the speed icon showing above the search bar in chrome

I noticed that when searching in chrome on macbook pro, and video results show up the speed icon is on the video. The issue happens when scrolling down the page and the icon is shown above the search bar. This seems like a UI issue.

---

## Issue #791: Netflix skip ahead issue?

When i try to skip ahead on my mac using chrome.......it usually shows an error. 

Any help on this?

---

## Issue #789: The evaluation of Regex expressions in the blacklist is broken

## Expected Behavior
When adding the regex expression `/.*/g` to the blacklist, the VSC should not be initialized on any website.
## Current Behavior
The regex does not match all websites and is still initialized most of the time.
## The Issue
#### Current Implementation
The _RegExp_ is initialized as `var regexp = new RegExp(match);` at **inject.js:391** where _match_ is the string of the regular expression. When we now print the evaluated expression we get `//.*/g/` which already points us to the issue.
#### What is happening?
The _RegExp_ constructor expects to receive only the body of the expression as the first parameter, the flags should be passed as the second argument, which currently results into the expression to be wrapped inside another regular expression without any flags.
#### Current Workaround
Multiple people already found out, that removing the flags fixes the issue. If we remove the flags, but leave the first forward slash, to still indicate, that this entry of the blacklist should be treated as a regular expression, they indeed work properly again.
#### Why does that work?
If, we now print the expression, we get `//.*/` as the result. This is fortunately working fine, as most URLs contain a forward slash after the protocol.
### Possible solution
Before initialization, we have to split the expression into it's body and the flags, so it's properly constructed.
## Migration
In the future we should only allow valid expressions, when saving the options, but we also have to fix the existing ones, so current blacklists still work fine without any modification. 
#### Fixing existing expressions
Fortunately we know, that currently all expressions are working, at least if they were working before, without any flag, so appending a single forward slash, makes them valid. 
#### Migrating them
When saving the current blacklist to the local storage we just update any regular expression, that doesn't offer a trailing slash with none or only valid flags following, by enclosing it in two forward slashes, just like the old implementation did. This makes sure that old expressions don't change behavior. 
#### Risks
There is the small chance, that an expression used as a workaround could pass that test and change behavior, but that's very unlikely.

---

## Issue #788: Is it possible to disable/override embedded Wistia videos' hotkeys?

I have my config set up like this:

Basically I just want to be able to do `shift + >` and `shift + <` to increase/decrease any videos' speed by 0.5x on any website.

This usually works great, but not with embedded Wistia videos. For some reason when I hit `shift + >` it increases to `1.5x` speed, waits a millisecond, then bumps up to `1.75x` speed.

If I hit random combinations of `shift + >` and `shift + <` it seems to set the speed almost randomly.

If I use `s` and `d` to adjust the video speed, it works as expected, so I think `shift` and/or `>`/`<` are just conflicting with some hotkeys Wistia embeds have.

Any idea how to fix this aside from just changing my hotkeys?

---

## Issue #785: Add API so that a webpage can automatically configure play speed of an IFRAME (e.g. YouTube, etc) if extension installed

It would be nice to have an API (such as reading the URL bar (e.g. "#iframespeed=4")

To allow any JavaScript in a webpage to automatically set the playback speed of an IFRAME (e.g. YouTube embed).

This will be useful for automatically playing videos as 240fps on modern 240Hz gaming monitors, such as this video:

https://www.youtube.com/watch?v=qH_uMmLSArg

---

## Issue #784: Does not work in Philips Learning Center

I cannot speed up the Philips Learning Center training videos.

---

## Issue #783: clicking increase speed button fast can trigger double click of video

It would be great if the toolbar could capture the doubleclick event and do nothing with it, preventing it from going through to the video surface.

---

## Issue #782: Video control stopped on www.crunchyroll.com

With the recent malware in extensions cropping up.

I've elected to have most of my extensions be enabled on click or giving a safe list. 

I recently visited https://www.crunchyroll.com/ and was trying to speed up the videos on it, sadly it seems the plugin in google chrome did not interact with the html5 video player that crunchyroll uses. It was working a week or two before. 

Does anyone else have any issues with this site also?

---

## Issue #779: Add it to Microsoft Edge Browerser

**Please!!!**

---

## Issue #778: The only thing this is missing...

First off, great tool!  I use it every day.  The one thing it is missing is a quick link to jump back to 100%.  Use case: I'm going to watch a video on yxxxxxe.com.  Before the video I want to watch plays, some other video that is not what I want to watch plays and cannot be skipped (well, sometimes can).  In this instance I would want to jack the speed up as high as possible, then quickly return to normal speed once the desired video starts playing.

---

## Issue #777: Lag when slowing down and speeding up a video

When I slow down a video from 1x to 0.07x speed, then speed the video back up to 1x then to 2x speed, you can tell there is noticeable lag. The audio gets pretty out of sync from the video. This is really annoying, but can be fixed by going back 5 or 10 seconds and then going forward the same amount of time.

---

## Issue #776: not working on https://www.focus-academy.co.il/app/courses/view/CGo-/BmFVNg--

the page is with lots of lessons .. small windows and when i press D on the keyboard to speed up nothing happend???
pls help me..

---

## Issue #774: Infected with malware (Charm Searching)

When videospeed extension is enabled in Google Chrome and you perform a search via search bar, it routes you through a known malware called Charm Searching.

---

## Issue #773: Feature Request: Able to Type In New Speed

Using GUI or keyboard shortcuts to jump to 4x speed is super slow. Other extensions I've used allow clicking the current speed, typing in a new speed, and clicking Enter to jump to the new speed. Similar ease and flexibility of use could also be achieved by adding a dropdown menu with common speeds between 0.25x and 10x.

---

## Issue #772: Delete/disable shortcuts

I already use a ton of custom keyboard shortcuts (with commands built into Vivaldi, and extra commands with Vimium), and would prefer disabling all (or most) of the ones available for this extension. I can delete all the shortcuts in the options page and save, but when I refresh they shortcut keys all reappear again.

---

## Issue #771: messgener.com side effect - sent video frame shifts from visible area

I've noticed messenger.com video previews and playback are shifted down some 40% with white overhead like shown on the picture:

If I exclude messenger.com in options and refresh the page they look normal:

UPD1: I guess it shares same code with Facebook, so my issues with news feed containing videos which I had for months are also resolved by excluding FB in the settings.

---

## Issue #770: Video speed up freezing. closed

so i solved the issue by disabling litevideo in chrome://flags
its very likely new chrome update imported this feature and it caused the issue
freezing happens as well when the extension is disabled and only uses youtube native speedup , so it must be chrome bug.
hope this helps you guys
i dont know anything about how it works but it works
tell chrome developer team about that

---

## Issue #769: Wrong standardspeed on Twitch.tv

Only on Twitch.tv is my standard speed on 1.03 instead of 1.00, with livestreams speeds are very important not to bottleneck to far when it's starts to buffer.

---

## Issue #768: No controller when I change Site Access Permission

Hello, the controller only shows when I set the Site Access to "All Sites" but it doesn't appear if I change the settings to "On Click" or "Specific Sites".  Thank you.

---

## Issue #767: request takes effect on other extended play pages of chrome

Some video websites don't have the function of setting the bit rate. I can set the bit rate by grabbing m3u8 and playing it in the Chrome extension. However, the speed and jump of those extensions are not easy to use without this extension. I would like to know how to modify it so that I can enable this extension on other extension pages.

For example, for example, I want to take effect on this extended page
chrome-extension://fkjdjfdsfjkdfjkdsjfkdsjfkdsjflkdsjflksdjfc/player.html#https://dfsdsfdfs.com/dfd.m3u8
I want to know if there is an easy way to allow videospeed to have permission to access other extension pages, and then make it take effect.

---

## Issue #765: goes back to 1.00 after rewinding and fast forward at sharepoint.com

when using teams video links sharepoint.com  it goes back to 1.00 speed after fast forward or rewind 

---

## Issue #764: pluralsight.com

on pluralsight.com, only works if you refresh the page on every single video

---

## Issue #763: Doesn't work on websites which reset the speed regularly such as "nicovideo.jp"

It works during few seconds but the speed gets back afterward.
On websites which reset the speed regularly (ex. every 5 seconds), this extension will be useless.
Can you please add a new function to this extension so that it'll prevent the webpage from resetting the speed regularly?

---

## Issue #760: New features

I love your extesion mainly for the simplicity, design and customization, but I would like ask for more 2 features.
-  Shortcut to fullscreen.
-  Shortcut to increase and decrease volume.

---

## Issue #759: it is not work at chrome86

---

## Issue #758: Not working on Telegram

Hi,

I noticed the pop up appears but does not modify the playback speed of audio files (voice only files like podcasts).

---

## Issue #757: Isn't working on Kiwi Browser (android) 

The speed control bar stays grayed out on videos in the Kiwi browser. Unable to press any buttons to speed up videos. Using on Facebook videos.

Is this possible to fix? 

Thanks for the great extension.

---

## Issue #754: Videospeed enlarges the videos at honeycode.aws

Link: https://www.honeycode.aws/

This messes up the site's layout and adds horizontal scrollbars.

---

## Issue #748: Give Buttons in Chrome menu for increasing and decreasing, sometime shortcut does not work

Give Buttons in Chrome menu for increasing and decreasing, sometimes shortcut does not work

---

## Issue #747: Isn't working on edpuzzle.com

It used to work, but not anymore.

---

## Issue #745: Please add full screen option for videos with custom button such as F that will be very helpful.

Please add a full-screen option for videos with a custom button such as F that will be very helpful for watching videos on another platform rather than just on youtube, it becomes very annoying to always go and click on the full-screen button given in the video.

---

## Issue #743: Video stuck to loading in zoom recordings

I can't share an example link due to privacy,
But there are videos in https://us02web.zoom.us/rec/play/ that in high speeds (2.7+)
In chrome - pauses every  few seconds to load (although the buffer is already ahead of the play position)
In firefox - video is playing "smooth" but there's a lot of missing video frames.

---

## Issue #742: Control of sound volume

This App is amazing.
But I hope there is also sound controller because Youtube volumer is sit

---

## Issue #741: Breaking Embiggen Spotify Video extension on Spotify web player

I don't know if this should be considered a bug on the videospeed extension, a bug on the Embiggen Spotify Video extension, or both, but the problem is that the two extensions can't be properly used together on Spotify videos, which would be very useful. 

The videospeed extension breaks the ability of the Embiggen extension to resize the Spotify video to the size of the browser window (which is the whole point of the Embiggen extension). I believe this is something to do with videospeed's invisible video overlay that is used for the controls (whether they are visible or hidden).

Here's the link to the Embiggen extension: https://chrome.google.com/webstore/detail/embiggen-spotify-video/cmjmpolcfeoajihjljoifcnneehgoeff?hl=en

Any video podcast on Spotify can be used to test this.  The Joe Rogan Experience podcasts are the ones I've tested it on: https://open.spotify.com/show/4rOoJ6Egrf8K2IrywzwOMk

Using Embiggen with the Spotify web player allows for a much better multitasking viewing experience than their standalone Spotify app, but their Spotify web player doesn't include a playback speed control, which is where the videospeed extension comes in.

---

## Issue #739: Doesn't work right on coursera - you end up with a lot of talking voices when using this controller

---

## Issue #738: Why can not it speed up the video of bilibili.com?----solved! (to use shortcut) 

Can you add the function for the video of bilibili.com?

---

## Issue #737: Option to use "Set Preset Speeds"

Option to use "Set Preset Speeds" with default of 5 that can be edited or increased/decreased from 5.  Eg. 1.15x, 1.33x, 1.5, 2, 2.5

---

## Issue #734: Need a set speed button

Pressing the reset button actually toggles between the 1x and the current speed. So suppose the current speed was 1.3x, then we might end up listening to the entire video/audio like that without noticing. This is especially problematic while using websites such as Spotify or YouTube Music in dark mode. I use the speed change feature to learn some songs off the record while playing directly on YouTube music but then when I listen to a particular song I press R to make sure that it's set back to 1x but can't be sure because it toggles the speed. 

One workaround that I've found was to set the current speed to something ridiculously fast and then press R so that you can know for sure which speed is 1x. Right now, most of the time, I have put YouTube music on the blacklist and remove it when I need to learn a song. But when using dark theme, it's impossible to see the controller no matter the opacity. Please fix this. Otherwise great app. I use it all the time. Everyday. How do I contribute to you monetarily?

---

## Issue #732: Video Speed Controller won't get off the screen

I have been a satisfied user for a very long time but for the past month, I have been so annoyed with this extension. I added the extension to my Google Chrome to use on my Mac and lately the extension has been duplicating itself putting a second controller bar in the middle of the screen that doesn't go away or reappears when you close out of it. Even if I drag it to a new location, it moves itself back to center screen and it is so frustrating. I am going to attempt to remove and re-install... really hope that works because typically it works wonderfully

---

## Issue #731: Speed resetting on Instagram

With the "Remember playback speed" checked the speed resets to 1.0 for every Instagram video you watch. 
When viewing an IG video you can see the playback speed at the right number for a second and then it jumps to 1.0. This happens for every Instagram video you view.
If you then go to view a different video it does remember the right playback speed.

---

## Issue #729: Extension not working on netflix.....an error message pops up everytime i try to skip forward 5 seconds.

I am on chrome.

---

## Issue #728: Play speed and fast forward seconds cannot be used together

I set the playback speed to 1.4, and when I pause the video and start it again, it goes back to 1.0. If I fast-forward 10 seconds at 1.4, it will also go back to 1.0. I select remember the playback speed in the Settings, but it doesn't seem to work.

---

## Issue #724: Doesn't work on Facebook fullscreen

When opening a Facebook video in a group, it appears in a small window. When I click on the fullscreen button, the URL changes to facebook.com/username/videos/videoid. Since the video moved, the video speed controller doesn't appear anymore.

It used to be possible to refresh that URL, but now, refreshing it just opens it back in the small window.

As a result, this extension is no longer usable on Facebook.

---

## Issue #723: Advance shortcut timing based on url/regex

For Example
I want x to be shortcut for advance on 1.com for 10 Sec
and on 2.com for 20 Sec

So VSC can determine the advance timing based on the url
Shortcut will be same for both website but timing will be different 

if not mention like 3.com is not mention then x will advance shortcut which point to default timing like 5 sec

---

## Issue #721: The chrome extension is preventing YouTube videos from loading

I'm using **Chrome Version 86.0.4240.75 (Official Build) (64-bit)** and I'm getting "If playback doesn't begin shortly, try restarting your device" error on YouTube if the video speed chrome extension is enabled, once disabled the videos load successfully.

Edit: now it's not just Youtube videos.

---

## Issue #720: Allow f13-f24 keys to be valid inputs for commands

It would be fantastic if i could use the f13-24 keys. this would allow so much functionality

---

## Issue #719: #feature request# Sync the Extension to Microsoft Edge Extensions Store

Sync the Extension to [Microsoft Edge Extensions Store](https://microsoftedge.microsoft.com/addons/Microsoft-Edge-Extensions-Home) so Edge users can sync this nice extension easily.

<3

---

## Issue #718: Allow access on other extensions

I want to have the control show up on torrents streamed on the Brave browser using webtorrent inbuilt extension. Currently, it doesn't show up even after giving access to URLs.

---

## Issue #716: Initial Position Seting?

This'll sound stupid, but any Plex show places it's screen minimize button right over the "videospeed control buttons".  It's great that I can still select, move, and change speeds and settings and of course the keys still work, but not so nice that I have to "move it over" and then hit the player minimize button.

Sure wish there were (say upper left, upper middle, and upper right, ?maybe lower left?) options for initial positioning.  Minimizing the screen is great for still listening to an artist/song while I'm looking around for the _NEXT_ one to listen to.  Seems like mostly a nit, but also sounds fairly easy to implement.  

Be aware that the **NEXT** item someone may wish for along these (*I* don't care) would be a setting per site, which suddenly needs a table to look up, store, and even edit.  So seemingly easy to start with, but heading down towards a trail of woe and destruction on the back end.  :-)

It works great though mostly, thanks! (My initial playback speed setting is 1.5, BTW. And the linked audio works wonderfully!)

---

## Issue #715: Mouse gestures / wheel function via Custom Script shortcut

------ Thanks ------
First of all thanks for the awesome extension, I have utilized it fully and its a pleasure to use, but now Im getting a bit greedy.
Im trying to get my mouse to work with this extension.

------ Short version ------
I just need your extension to accept a NEW shortcut Script (accepts text string value) and kicks off another existing shortcut (standard pre-existing Video Speed Controller settings), the simplest way I can think is create a new shortcut = Script just extend the hotkey field from 1 char to string text and I should be able to do the rest. more details below.

------ Detail explination ------
Currently on Linux and recently playing with some new tools I have recently found, Windows will have their equivalent.
They are global mouse gestures, global keyboard shortcuts to activate custom scripts etc....
xdotool, autokey, easystroke, hotcorners, wmctrl

eg mouse gestures and wheel to forward/back video playback/speed etc.....
Rightclick + wheel to fast/slow playback speed.
mouse gestures long, medium jump forward/back video etc......

------ NEW Shortcut for Videospeed extension ------
Shortcut name: Script
Hotkey field: (currently only takes 1 digit char), please expand that to accept full text field so I can add in my custom scripts. It is used similar to existing shortcuts, but instead of receiving 1 char, it will receive a string text.
Value field: it could be left blank, or assign a pre-existing shortcut hotkey.

------ Detail example ------
This is how I imagine it will work

New Shortcut = 'Script'; 
Hotkey = 'rewind10s' (string text); 
Value = 'Num 4'  <-- note this is a single digit char numeric "4" from the numb pad.

When Videospeed extension detects the shortcut/hotkey 'rewind10s'  , it will activate another existing shortcut
in the above case its 'Num 4' which I have already setup using existing Videospeed extension 

eg I want to move video backwards 10 sec using mouse
I hold down right mouse button and slide it left, easystroke (Linux global mouse gesture program) custom setup to paste some text (eg 'rewind10s') if its in Chrome youtube
Videospeed extension Script will pickup this string of text 'rewind10s' and treats this string of text as a Hotkey similar to existing functiongs.
It will then activate its value, in the above example that would be  'Num 4' 

I have pre-existing standard Videospeed extension Shortcuts for  'Num 4'  to Rewind 10 seconds

The numpad section of my keyboard is fully utilized by most video / audio application with similar shortcuts on my System, VLC, SMplayer, music player, youtube video (thanks to your awesome Videospeed extension)

I have already configured Videospeed extension to match my  PC system keyboard shortcuts (please see blow), but now I want to also have the the same ability to control video playback via the mouse. I can use both keyboard or mouse depending on my mood. 

I may be able use existing tool and workaround to integrate them with your Videospeed extension without any modifications at your end, but because Im setting global values, I will probably need to make a lot of exceptions which makes the whole thing more complex, plus Your extension only accepts single digit hotkey (it may limit my workarounds), if its able to accept Text string as hotkey it will make my life much easier, it gives me more moving room for my workarounds.

------ My custom setup on most video , audio , youtube players on my system ------
some of them use your Experimental Features = Disable website key bindings = on numeric keys
0 key reset speed

1 and 3 key are 5sec jump back and forward
4 and 6 key are 10sec jump, 
7 and 9 are 1min jump, 
/ and * are 5min jump.
dot . key is full screen. 
'-' and '+' key increase/decrease playback speed
2 and 5 are volume key 
8 is to skip to next section/segment
Arrow Left / Right = 3sec jump
Arrow Up / Down = next previous video/audio

FYI:
easystroke (Linux global mouse gesture program) is very powerful, it can remember all sorts of custom gestures, and can combine multiple, mouse buttons and/or keyboard buttons to set trigger+gestures making it capable of having lots of different combinations, its not just limited to the normal mouse guestures eg left, right, up, down. you can do start, clockwise/anticlockwise circle, triangle, S, W etc.... its basically a pen.

---

## Issue #714: Couldn't work on Bilibili

It used to work on this website, but I couldn't click the button when playing the video now

https://www.bilibili.com/

---

## Issue #713: Speed settings for songs 

Hello everyone!

One of the great feature of this extensions is that it remembers the previous playback speed. The problem pops up when someone is listening to songs, because listening to 1.5x it's not a great idea.

It would be an amazing feature if the extension could detect a song and set a speed of 1x, and for the remaining video the other one that is usually used. A good way to approximate it that is easy to realize, is creating an option in the settings that allows you to specify the speed that is used for videos whose duration is less than x minutes and y seconds.

What do you think?

---

## Issue #712: Feature request: Button for preferred speed

On a touch screen, the keyboard controls are not easy to use, therefore it would be very helpful to have the preferred speed available via a button in the collapsible panel along with the other buttons.

---

## Issue #709: D key (forward = pop-up tech box)  S key backward = displays share options

I've seen this on a few different websites. Unfortunately, they are in paid sites like URL below; (it only impacts default keys, D and S, so changing the keys to Q and W works), so not truly a bug, but some people install and it wont work with defaults. So if this becomes a bigger problem, it might be best to change defaults??

https://members.drnajeeblectures.com/#!/video/5

The pop-up I get going forward (D key) is;

Clip ID:436811817
Delivery:application/vnd.vimeo.dash+json
Codec:AVC
Playing:1920×1080@30 5,181 Kbps
Embed size:1057×594
Separate AV:true
Dropped frames:21 / 4675 - 0.45%
Playhead / buffer:175.692 / 198.198 / 22.506
Bandwidth:134,837 Kbps
(47,867 Kbps143,732 Kbps)

---

## Issue #707: Preferred speed is not applied on Jellyfin player load

Similar user experience issue to #699 
Jellyfin player automatically playing next video properly preserves speed now, but resets to 1.00 when I use skip or prev buttons to change video. I do not see any obvious console messages to help for this issue.

---

## Issue #704: On Netflix button in the middle of the screen

Hi, sorry if someone already posted it but I didn't find anything about that. 
Netflix player as changed 2 days ago for me and now the addon doesn't work anymore. I have the 1.00 in the middle of the screen without anything else. I'm using Brave but I've tried on Chrome and I have the same problem.

---

## Issue #692: Req: Display new duration

- Video length: 10:00
- Preferred speed: 2x
- Please display: 5:00

In addition to "10:00"

https://github.com/ajayyy/SponsorBlock recently started doing this, and I like it

Duration-display helps us pick which videos to watch, and when to watch them:

- "Do I have enough time for this video?"
- "How much more time am I going to spend watching this video?"

---

## Issue #690: Allow configurable controller z-stacking to bypass overlay objects

Sites like...
* primevideo.com
* iview.abc.net.au 
* sbs.com.au

have multiple layers separating their video from their overlay controls or other objects. This renders the use of mouse with VSC useless. 

Solution: 
A simple fix is to use the switch case statement and start adding exceptions. The **_smarter_** way would be to add a setting where we can play with the **z-Order** of the VSC-controller div tag, like a _bring-to-forward_ **_or_** _send-to-back_ one step/layer at a time, per site that is having issues and it then somehow remembers that setting. I am not _that_ skilled in JS sadly to implement the advanced solution, but I have implemented the easier version, at least for me.

---

## Issue #683: "stopImmediatePropagation" interfering with other extensions (SponsorBlock)

I've been getting a lot of reports about [my extension](https://github.com/ajayyy/SponsorBlock) breaking when using video speed. It seems to be caused by [this line](https://github.com/igrigorik/videospeed/blob/master/inject.js#L408) where it stops propagation of `ratechange` events, so my extension is not notified (as found by "@9732").

I've thought of two solutions, and I'm wondering what you think of them?

1. Is this required on YouTube? From what I've heard, it is only required on twitch and some other sites. If so, maybe it could not happen if on YouTube.

2. Maybe videospeed could [create a custom event](https://developer.mozilla.org/en-US/docs/Web/Guide/Events/Creating_and_triggering_events) that other extensions could listen to

Anyone else have any other ideas?

---

## Issue #663: Displayed speed doesn't update after YouTube ad or intro

When I speed up a YouTube pre-roll ad, e.g. to 3x, then – after skipping the ad – the main video starts at 1x speed. This is as expected, however, the extension's overlay still shows 3x. 

This is obviously not a big deal, I can get rid of it by quickly pressing "s d" to get it to display 1x again, but I personally find it mildly infuriating to see the wrong speed after every ad and this should hopefully be a quick fix.

The same behavior also occurs on my university's e-Learning platform, where they show a 5 second intro before every lecture which seems to be a separate video file and thus the speed of the video resets to 1x after the intro, but the displayed speed on the overlay still displays the previous speed.

---

## Issue #647: Changing Speed Toggles Full Screen

I have noticed that the last few times I have used the extension, every time I change the speed it changes from window to full screen or full screen to window. I am clicking on the overlay when this happens.

---

## Issue #641: Speed overlay broken on VRV

When I change the speed on vrv it just shows the current speed and the speed it was at on top of each other making it unreadable and you end up having to guess what speed it is on

---

## Issue #634: S button doesn't work properly on FrontendMasters

clicking 's' when watching a video on frontendmasters.com doesn't work correctly. instead of decrementing by .1, it seems to kind of almost randomly bounce.

This behavior doesn't happen on other sites.
The 'd' button works properly on frontendmasters btw.

---

## Issue #625: Hulu resetting speed

The past two days, anytime Hulu loads a commercial, the speed resets back to 1.0. I have to keep pressing my hotkey to get it back up to speed.
I have my preferred speed set to 3
I have "Remember Playback Speed" checked

---

## Issue #616: Speed indicator not updating in real time

When i hold the increase speed button (in my case "+"), it is not updating in real time like it used to. It can take a second or two to catch up.

Additionally this also seems to cause slow down on the entire web page.

Upon further testing refreshing the page seems to fix the issue for that specific instance, but does not prevent the bug from happening again.

---

**Total Open Issues: 400**

Report generated from GitHub repository `igrigorik/videospeed`

## Issue #870: After the update, the controller does not appear in the upper left corner of the image

After the update, the controller does not appear in the upper left corner of the image.

Especially on Youtube, the controller has been on the top left all the time, but it doesn't now. it appears everywhere randomly after the last update.

Still thank you for the program. Have nice one

---

## Issue #868: Some sites start video with 0.00 speed on older versions of Chrome

For a while, whenever I opened a YouTube video (which makes up 99% of my use of this utility), the content would just sit with the loading circle going round and round. I eventually realized that the speed of the video was set to 0.00. I never set it to that (iirc you can only go as low as 0.07), so I'm not sure how that would be a PEBKAC issue. Pressing the 'r' key to reset the utility worked as expected and brought the speed to 1 (and from there everything worked fine). I was able to replicate the issue on facebook, but not instagram. I didn't think to check reddit as another data sample. 

Regardless, after updating Chrome (I forgot to note the prior version I was on; currently using v93.0.4577.82), everything seems to be working properly, so I guess this isn't so much of an issue as it is a notification of unexpected behavior.

---

## Issue #865: the playback speed get reset after add is skipped on youtube

---

## Issue #864: playback speed gets reset when playing the video after pausing.

sometimes it works if I disable and re-enable the extension.
But most of the time it does work.

---

## Issue #863: Extension prevents playback of BBC video

Videos published by the BBC will not play in chrome when the extension is enabled.

e.g. https://www.bbc.co.uk/news/av/world-us-canada-58509703

The following error is logged in the console when you press play: "uncaught element is not video or audio DOM type!"

If you disable the extension the videos play fine.

- Chrome Version 93.0.4577.63 (Official Build) (x86_64)
- Video Speed Controller Version 0.6.5

---

[... and 296 more issues...]
