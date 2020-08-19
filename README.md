# Instagrid

Instagrid allows you to combine multiple photos in a square format and share the result with your friends through your favorite apps.

## App architecture

Model View Controller

Instagrid app uses the MVC Design Pattern:

- The *View* handle the transitions between the three layouts of gridView, and set the image received from the ViewController in AddImageView.
- The *Controller* handle the communication with the views and the model, the gestures done by the user on the screen, the photo permissions and alerts.
- The *Model* Images contains a dictionary of UIImages
