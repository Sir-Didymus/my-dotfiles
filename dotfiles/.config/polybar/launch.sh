for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --config=~/.config/polybar/config.ini --reload epic-bar &i
    feh --bg-scale "/home/felix/Files/Wallpapers/ukyo-e_1.jpg"
done
