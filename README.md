# SimpleUIKit

This is a collection of a few UIKit API's simplified. 
Also see the includled Example Project on how to use all the APIs.

![Screenshots](https://raw.githubusercontent.com/calimarkus/SimpleUIKit/master/gfx/screenshots.png "Screenshots")

## SimpleActivityView

A simple to use, easy to customize activity view. Example:

```objective-c
[[SimpleActivityView activityViewWithTitle:@"Title"]
presentActivityViewOnView:view
activityBlock:^(SimpleActivityView *activityView, SimpleActivityViewDismissBlock dismissBlock) {
  // do something that takes a while
  dismissBlock(); // call to dismiss the view again
}];
```

## SimpleLocalNotification

A simplified API to schedule local notifications. Example:

```objective-c
[[SimpleLocalNotification sharedInstance] scheduleLocalNotificationWithAlertBody:@"Notification Text"
                                                             timeIntervalFromNow:60*5 // in 5 minutes
                                                                uniqueIdentifier:@"001"
                                                                      completion:nil];
```

## SimpleTableView

A simplified tableView API. Great for simple static tableViews.
The biggest benefit is, that the definition of the cell, as well as it's
action are in close proximity, which makes it very readable.
It's also super easy to move rows between rows etc. without spending
thoughts on indexPath's etc.'

Example on how do define a simple row including its tap handler:

```objective-c
[STVRow rowWithCellReuseIdentifier:reuseIdentifier
                             title:@"Cell Title"
                          subtitle:nil
                configureCellBlock:nil
                    didSelectBlock:^(STVRow *STVRow, UITableViewCell *cell, UITableView *tableView, NSIndexPath *indexPath) {
  // tap handler
}];
```

## SimpleAlertController

A simplified API to present Alerts and ActionSheets.
Example for a simple confirmation alert:

```objective-c
[UIAlertController presentFromViewController:viewController
                                   withTitle:@"Alert Title"
                                     message:@"Alert Message"
                     confirmationButtonTitle:@"Ok"];
```

## SimpleMotionEffects

A simplified API to add motion effects to your views. Example:

```objective-c
[view addMotionEffectWithMovement:CGPointMake(100, 100)];
```

[Read more](SimpleUIKit/SimpleMotionEffects/)

## SimpleAttributedString

A simple API to modify NSMutableAttributedString instances. Example:

```objective-c
[mutableString setFont:[UIFont boldSystemFontOfSize:textSize]
                 color:[UIColor orangeColor]
      forRangeOfString:@"Judy Hopps"];
```

## SimplePositioning

A simple UIView cateogry for simplified layouting/positioning of views. Examples:

```objective-c
view.frameOrigin = CGPointMake(100, 100);
anotherView.frameRight = self.frameWidth - 20;
thirdView.centerX = self.frameWidth / 2.0;
```
