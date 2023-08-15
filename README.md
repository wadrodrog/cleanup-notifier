# cleanup-notifier
A Bash script and systemd units to notify you if your folders are too messy

![image](https://github.com/wadrodrog/cleanup-notifier/assets/135006964/e1a59de6-797c-4787-8f7c-cb88bed7e137)

## Installation
1. Install `libnotify` to have `notify-send` command.
2. Download `cleanup-notifier.sh` script and put it in any folder. Give permissions to execute with `chmod +x cleanup-notifier.sh`
3. Download `cleanup.service` and `cleanup.timer` and put them in `~/.config/systemd/user/` (create if doesn't exist).
4. Insert correct path to script and folders in `cleanup.service`.
5. You can adjust timings in `cleanup.timer`: `OnUnitActive` is minimum time to trigger, `RandomizedDelaySec` + `OnUnitActive` is maximum time to trigger.
6. Enable timer with the `systemctl enable --user cleanup.timer`. Start with `start`, check timer info with `status --user cleanup.timer` and logs with `status --user cleanup.service`.
8. You can duplicate `cleanup.service` and `cleanup.timer` if you don't want to see multiple notifications simultaneously. Then, insert this line in `cleanup.timer` after `[Unit]`:
`Unit=cleanup.service`

## Usage
`cleanup-notifier.sh directory1 number1 ...`

Script will count visible files and folders in defined directories.

Number is a threshold of directory in previous argument.

If amount of items is greater than threshold, a notification will be sent.

Script doesn't have value checker, so make sure arguments are correct.

You can use or modify this script freely without specifying copyright or license.

## Example
`cleanup-notifier.sh /home/user/Downloads 20 /home/user/Pictures 50`.

Script will:
- Count visible files and folders in user's Downloads
- Show a critical notification if amount of items is greater than 20
- Don't show any notifications otherwise.
- Repeat for Pictures folder with threshold 50.
