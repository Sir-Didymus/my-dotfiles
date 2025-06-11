# Kill all polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Start polybar for every monitor and set background with feh
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --config=~/.config/polybar/config.ini --reload epic-bar &i
    feh --bg-scale "$HOME/.config/wallpapers/ukiyo-e-1.jpg"
done
