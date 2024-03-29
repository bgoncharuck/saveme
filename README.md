### Attention: code refactoring is planned. This will not change app behaviour in any way, just will make code better.

# <img width="32px" height="32px" src="repo_assets/icon.png" /> saveme
`The Call Timer which saves lives!`
<div style="text-align:center" markdown="1">
<img width="282px" height="501px" src="repo_assets/saveme_settings.png" />
<img width="282px" height="501px" src="repo_assets/saveme_numberlist.png" />
<img width="282px" height="501px" src="repo_assets/saveme_home.png" />
</div>

# For Users

`saveme - application to inform GP & loved ones that your life is in danger.`

This application can also be used as a regular call timer.

**Feel safe, the timer does not need internet connection.**
[Privacy Policy](https://bgoncharuck.github.io/saveme/)

How to use:
1. During the application **first start**, you must select the number from your contact list for the call or enter the number manually.
You **can select several numbers** and quickly switch between them in the "numbers to call" option.
2. It is necessary to set the timer time after which the call will take place.
3. Once the call number is selected and the timer is set, the application is ready to use.
4. The **next time application starts** - the countdown will start **immediately**, and when it ends a call will take place..
Only the first call must be confirmed. Therefore, we recommend that you wait and test the first call.
5. The timer can be stopped with the "Stop" button, after which the application will turn off. Also, timer can be paused by going to application settings.

The timer does not guarantee that the person being called will pick up the phone.
It is one time call.

In order for the application to work properly, it needs to save the file with the added and selected numbers and the file with the required countdown time.
Therefore, you should give **permission to save them on your storage, as well as permission to create a call.**
Also give permission to access contacts if your number is selected from the contact list.

The application is released under GNU General Public License v3.
https://www.gnu.org/licenses/gpl-3.0.en.html

Find it on play market:
[release](https://play.google.com/store/apps/details?id=com.bgoncharuck.saveme)

# For Developers
### Current "saveme" version: 1.0.4
The application is written in Dart language with Flutter Framework.

### Depends on this packages:
- [**android_intent**](https://pub.dev/packages/android_intent)
For making direct call.
- [**permission_handler**](https://pub.dev/packages/permission_handler)
For 2 permissions.
- [**storage_access**](https://pub.dev/packages/storage_access) For correct save/load files.
- [*contact_picker*](https://pub.dev/packages/contact_picker) For option to pick a number from contact list.
- [**url_launcher**](https://pub.dev/packages/url_launcher) For *slight* iOS support.
- [*flutter_spinkit*](https://pub.dev/packages/flutter_spinkit) For heart animations.

## What need to be done:
- iOS support.
App uses android-intent to make direct call in Android. And I don't know how to correctly implement this function in iOS.
You can make it, sign it and publish on Apple Store freely.
- A way to send SMS without 2 additional permissions. For main purpose of saving life. If the phone call was not delivered.
- Check if call was delivered and call other number from numbers list otherwise.
- Ukranian, English, German and Russian languages are done so far.
You can add other languages in file lib/theme/language.dart by implementing ILanguageSetting interface.

### If you want change or publish it

>Give a link to fork or this repository with GPLv3 License. So others will make it even better.

Remember, this app can **save someone life**.
And it is our duty, to make it work well.

### Any Questions?
- ukranian.phoenix@gmail.com
- bogdan.goncharuck@gmail.com
- telegram.me/danHoncharuk
