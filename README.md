# Instagrid

Instagrid allows you to combine multiple photos in a square format and share the result with your friends through your favorite apps.

## App architecture

Model View Controller

Instagrid app uses the MVC Design Pattern:

- The **Model** Images contains a dictionary of UIImages
- The **View** manages the transitions between the three layouts of gridView and set image received from the ViewController in AddImageView.
- The **Controller** handles the communication between the views and the model, the gestures done by the user on the screen, the photo permissions and alert views.
