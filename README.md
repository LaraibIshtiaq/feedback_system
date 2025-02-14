# Feedback_System

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.
It is developed to automate the process of receiving feedback from 
stakeholders of their respective project deliveries and overall performance.

## Run command
In order to run the app in any configuration i-e dev, staging or prod.
For Android
Add additional arguments in "Addition run args" in build configurations and flavor infront of main
- e-g for dev
- Dart entrypoint: <system specfic path>/lib/main/main_dev.dart
- Additional run args: --flavor development

## Routes
AutoRoute: 
https://pub.dev/packages/auto_route
 - While adding a new widget, add annotation on widget class "@RoutePage()"
 - command `flutter pub run build_runner build` to generate the route file
 - Add route in route.dart file
 - If widget name is [LoginScreen] then route name will be [LoginRoute]
 - To navigate to the route use `pushRoute(LoginRoute)'. 



## Screenshots of Feedback system app
<img width="413" alt="home_page" src="https://github.com/user-attachments/assets/3139993c-968c-4eb9-8052-80b2c4b6334e" />


<img width="413" alt="add_event_page" src="https://github.com/user-attachments/assets/83db19cd-b946-40bc-8f69-21bb149b338e" />


<img width="413" alt="add_feedback_page" src="https://github.com/user-attachments/assets/d76edaa5-89e4-4024-87ea-36712bcc8b4f" />


<img width="413" alt="view_submitted_feedback_page" src="https://github.com/user-attachments/assets/8f9f2a53-5150-4430-aff4-cdf71870b451" />


<img width="413" alt="view_recieved_notifications" src="https://github.com/user-attachments/assets/67310538-d31c-43e7-acb5-5d9b86d1aa44" />
