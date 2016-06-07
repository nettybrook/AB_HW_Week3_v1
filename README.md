## Mailbox

The purpose of this homework is to leverage animations and gestures to implement more sophisticated interactions. We're going to use the techniques from this week to implement the Mailbox interactions.

Time spent: 30 hours

### Features

#### Required

- [x] On dragging the message left:
  - [x] Initially, the revealed background color should be gray.
  - [x] As the reschedule icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
  - [x] After 60 pts, the later icon should start moving with the translation and the background should change to yellow.
    - [x] Upon release, the message should continue to reveal the yellow background. When the animation it complete, it should show the reschedule options.
  - [x] After 260 pts, the icon should change to the list icon and the background color should change to brown.
    - [x] Upon release, the message should continue to reveal the brown background. When the animation it complete, it should show the list options.

- [x] User can tap to dismiss the reschedule or list options. After the reschedule or list options are dismissed, you should see the message finish the hide animation.
- [x] On dragging the message right:
  - [x] Initially, the revealed background color should be gray.
  - [x] As the archive icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
  - [x] After 60 pts, the archive icon should start moving with the translation and the background should change to green.
    - [ ] Upon release, the message should continue to reveal the green background. When the animation it complete, it should hide the message.
  - [x] After 260 pts, the icon should change to the delete icon and the background color should change to red.
    - [x] Upon release, the message should continue to reveal the red background. When the animation it complete, it should hide the message.


#### Optional

- [x] Panning from the edge should reveal the menu.
  - [x] If the menu is being revealed when the user lifts their finger, it should continue revealing.
  - [x] If the menu is being hidden when the user lifts their finger, it should continue hiding.
- [x] Tapping on compose should animate to reveal the compose view.
- [ ] Tapping the segmented control in the title should swipe views in from the left or right.
- [ ] Shake to undo.

#### The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!
- Clicking the cancel on the compose link - brings you back to the mail box
- After the message is removed from the list - the scrollView moves up.
- When you get the the MENU after panning - you can navigate to the Reschedule or Lists View Controller and you can dismiss the view form there.
- Added segmented controller (visual only)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Screen Edge gesture - I might still have questions because it seemed that the View is 20 points larger and left and right - I figured that out by looking at it x position.
2. Shake gesture - is anyone has done it.

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

TBD - will post Mon Jun 6th
<img src='http://imgur.com/ffO0qIO' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

As mentioned above - the Screen Edge gesture was rough because of the unpredictability in behavior due to the view beign 20 points large than expected (I couldn't understand why i was seeing extra white space).

I had a large hump to get over to understand the gestures - but more than that - to undersand the positioning thresholds. I nested IF statements to make sure to get the "continue to swipe on gesture end" action to work.

