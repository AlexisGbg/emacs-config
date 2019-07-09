# Personal Emacs Config

## Python interactive shell setup for macOS
elpy completion features don't work for the emacs python shell on macOS. In order to avoid getting a warning reminding you that, you can add the following line to your emacs config: 
- (setq python-shell-completion-native-enable nil)   
This works for python3.6 and emacs26.2. This is not necessary if you're using python2. In order to help emacs communicate with your python interpreter, gnureadline should be installed. If you want to hide the messages emacs sends to the interpreter, you should go to python3.6/lib-dynload in your libraries and execute the comment out the following file like this: 
 - mv readline.cpython-36m-darwin.so readline.cpython-36m-darwin.so.bak 
