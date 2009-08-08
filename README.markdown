COCOA SAMPLES
=============

Hi! Here's the source code I'm writing while learning Cocoa/Objective-C.

Obviously, they can be improved (as all code written by newbie programmers). If you know how
to improve some implementation, please fork it and send a better one!

SELECTABLE TOOLBAR
------------------

![Selectable Toolbar](http://github.com/fnando/cocoa-beans/raw/master/SelectableToolbar.png "Selectable Toolbar")

GROWL NOTIFICATION
------------------

### Getting started

1. Install [Growl SDK](http://growl.info/downloads_developers.php): copy `Frameworks/Growl.framework` and `Frameworks/Growl-WithInstaller.framework` to `/Developer/Library/Frameworks`.
2. On XCode, right-click `Frameworks > Linked Frameworks` from left panel; select `Add > Existing Frameworks...` and choose the Growl framework at `/Developer/Library/Framework/Growl.framework`
3. On XCode, right-click `Targets > YOUR-PROJECT-NAME` and select `Add > New Build Phase > New Copy Files Build Phase`; select `Frameworks` from the dialog and close the window. Then drag the Growl framework from `Frameworks > Linked Frameworks > Growl.framework` to `Targets > YOUR-PROJECT-NAME > Copy Files`.

![Growl Notification](http://github.com/fnando/cocoa-beans/raw/master/GrowlNotification.png "Growl Notification")

STATUS BAR
----------

![Status Bar](http://github.com/fnando/cocoa-beans/raw/master/StatusBar.png "Status Bar")

MAINTAINER
----------

* Nando Vieira (<http://simplesideias.com.br>)

LICENSE:
--------

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.