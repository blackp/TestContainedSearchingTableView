TestContainedSearchingTableView
===============================

Example Xcode project exhibiting problematic behaviour of UISearchDisplayController within child view controller.

Based on the Xcode Master/Detail template. Added dummy search capability to Master view controller with a UISearchDisplayController in the storyboard.

When the Master view controller is made the root view controller of a UINavigationController, everything works as expected.

Alternative methods of containing the Master view controller in another view controller seem to break the UISearchDisplayController. Specifically how it interacts with the navigation bar.

Update the Initial View Controller in the storyboard to see different behaviours.
