# Oxyloan

This is the Mobile Developer test task for Oxymon Solutions.

<p align="center">
    <img src="https://user-images.githubusercontent.com/50449937/179316677-7c5c9600-d801-4b5d-8ce7-e30aec209b26.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179316931-91155aa1-74d8-44cb-9e4e-89c5a2184fe0.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179316986-4db4ab06-7d7e-4bb7-98d2-e1320e46c367.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179317031-b02eaa64-8e9b-4f7b-a252-c2cd46209504.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179317076-5e9f4402-e10d-4a52-a638-0b93a9d03a7e.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179317131-fad0f167-2188-4080-aac7-fd801184b9a1.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179317197-2e496077-6c5b-4016-b593-20e3eb41cb54.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179317256-be4d42c3-7ded-440f-9a28-ba3c94d8c52e.jpg" width="140" height="280">
    <img src="https://user-images.githubusercontent.com/50449937/179317300-b122bb50-8269-4fd4-b89d-b62ea912d275.jpg" width="140" height="280">
</p>

## About Oxymon
Oxymon solutions enriches the life of individuals and makes financial processes simple, easy and accessible at the time needed.

Giving Financial Power To All with personalized financial solutions which are easily accessible.

* Loans
* Savings
* Agent Banking

## Flutter

Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

This project is built with flutter.

To check if you have flutter installed, run

```
flutter doctor 
```
if you don't have flutter installed and setup, follow this: [How to setup Flutter](https://docs.flutter.dev/get-started/install)


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/JustineUgo/oxyloan.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

Connect your mobile phone or emulator and run this command:

```
flutter run
```

## Modules

* Home - Loan details, application
* Authentication - covers authentication 
* Onboarding - step-by-step intro 

## Details

* Framewort: [Flutter](https://flutter.dev/) > 2.5 with Null Safety
* Architectural pattern: MVC(Model-View-Controller)
* Storage(local): [GetStorage](https://pub.dev/packages/get_storage)
* State management: [GetX](https://github.com/mobxjs/mobx.dart)
* Backend: [Firebase](http://console.firebase.google.com/)

## Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
|- web
```

Here is the folder structure we have been using in this project

```
lib/app
|- data/
|- modules/
|- routes.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- util - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `api endpoints`, `preferences` etc.
2- data - Custom widgets and functions used across the modules of the app.
3- modules - Contains the 3 different modules of the app. 
4 - routes.dart — This file contains all the routes for your application.
```

### Modules

Contains the 3 different modules of the appplication.

```
modules/
|- authentication/
|- home/
|- onboarding
```
Folders found in each module:

```
controllers - this is where the logic of the app is written.
views - contains the ui of the module. 
providers — contains the network calls.
models - contains the application's dynamic data structure
```



### Routes

This file contains all the routes for your application.

```
routes/
|- app_pages.dart
|- app_routes.dart
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.


## Credits

All images where gotten from [Freepik](https://freepik.com/)

## Conclusion

I will be happy to answer any questions that you may have on this project. 🙂

If you liked my work, don’t forget to ⭐ star the repo.
