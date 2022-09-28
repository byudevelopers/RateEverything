# Rate Everything

An app for rating everything!

# Set Up

1. Download and install [VSCode](https://code.visualstudio.com/download)

2. Clone this repo with the following:
```
git clone https://github.com/byudevelopers/RateEverything.git
```

3. Setup flutter on your machine. [This website](https://www.projekt202.com/blog/2020/vscode-for-flutter) is a good resource to review.

4. Everything will be easier if flutter is installed in your path. If you are not familiar with adding variables to your path, then follow these instructions:
    1. In a terminal, go to where flutter is installed.
    2. Now `cd` into flutter and `cd` into bin.
    3. Run `pwd`. Copy the output; it should look something like `/Users/me/Applications/flutter/bin`. As long as the ending has `/flutter/bin` you are good to go.
    4. In your terminal type `vim ~/.` and hit tab. You should see many files come up. Look for `.bash_profile`, `.zshrc` or `.zprofile` and vim that file. Add `export PATH="PUT_COPIED_OUTPUT_HERE:${PATH}"`
    5. Close your terminal, open it, and run `flutter`. You should now see output.

The project won't run yet. Use `flutter doctor` to see what you need to fix (i.e., it will show that more extensions need to be downloaded). Keep running `flutter doctor` and fixing the problems until it works. This command will help you get everything set up (you will need all of the xcode tools and some other things).

Next you need to select a simulator for the project to run on. Click on the simulator spot at the bottom of VS Code.

![VS Code Screenshot](/icons/simulator_instructions.png)

I use both the iOS Simulator and the Android Pixel Simulator. It is probably good to be able to run both, but start with getting one to work. It is also possible to use your personal device, but it can be tricky. If you need any help, send a slack.

To run the project, use `flutter run`.

# For PC Users

If you are a PC user you will not be able to install Xcode and build in IOS without installing a Virtual Machine or using a CI/CD tool such as Code Magic. However a virtual machine is far less efficient than a real machine, and you will have to pay for a service like Code Magic. I would recommend testing your code with the Android and Chrome Browser Simulators. If you need to test your code with IOS you can push your code, and a Mac user can then run your code on an IOS Simulator.


## Working on the App

There are a lot of free resources for working with Flutter/Dart. [Pub.dev](https://pub.dev) has flutter widgets that can be used.

