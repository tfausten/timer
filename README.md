# Timer

A simple timer script for bash.

## Usage

```sh
timer [INTERVAL]...
```

The script will wait for the time specified in interval, displaying the progress in minutes on the console.
Specifiying multiple intervals is possible.

Example of 3 Pomodoro repitions: `timer 25 5 25 5 25`.

At the end of each interval, a message box is displayed using zenity.

