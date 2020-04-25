# csc413-Evented App

## Student Name  : Frederick White
## Student ID    : 920051012


## IDE: Android Studios
## Java language level: 12

## Working Directory: csc413_termproject_fwhite

# Requirements
## Venue and event data must be requested from separate backend
### -Either api or database*
## App must have a login page
### -User info stored in database
## App must have a sign up page
### -User input for username and password
## App must have a find events by venue type page
## App must have a search page
### -Able to search for venues or event name
## App must have a home page
### -Displays events that are followed
### -Displays event by date of occurence
## App must have a favorites page
### -Displays favorited venues
### -Favorites page must persist between use
## App must have a settings page
## App must have a details page for individual venues
## App must have a details page for individual events
## App must have a correctly populated README.md file

# Run the App 

## Option 1: Android Studio

### 1. Using Android studio create a new project from vcs using git
### 2. Use the github link to download the project
### 3. While the project is downloading it may ask to configure with android, DO NOT. 
### 4. Open an Android Emulator and hit run. 
### 5. Should open on the Android Emulator

## Possible Errors: 1. Could not determine the dependencies of task ':app:compileDebugJavaWithJavac'
### 1. Check under project structure the Project SDK. I am using version 29
### 2. Under project structure -> platform settings -> Android SDK home path. 
### change the path to correspond to your android sdk 


## Option 2: VS Code

### 1. Using VSCode create a new project from vcs using git
### 2. Use the github link to download the project
### 4. Open an Android Emulator and start debugging. 
### 5. Should open on the Android Emulator

## Possible Errors: 1. Could not determine the dependencies of task ':app:compileDebugJavaWithJavac'
### 1. Will need to modify the project sdk and the path to the android sdk
### I am not sure how to do this but if you do it should work. 

## Option 3: Run on Phone
## Theoretically should work for android or ios phone but I have not tested it on an iphone
## 1. After downloading the project from github it can be run by: 
### 1. Having an android phone connected through usb cable and running through Android Studio or VSCode
### 2. Using the terminal and installing with flutter install (directory should be the base of the project)