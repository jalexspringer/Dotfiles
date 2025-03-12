# #!/bin/bash
# WALLPAPER_DIR="$HOME/Media/Wallpapers/walls"

# menu() {
#     find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | awk '{print "img:"$0}'
# }
# main() {
#     choice=$(menu | wofi -c ~/.config/wofi/wallpaper -s ~/.config/wofi/style-wallpaper.css --show dmenu --prompt "Select Wallpaper:" -n)
#     selected_wallpaper=$(echo "$choice" | sed 's/^img://')
#     swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
#     wal -i "$selected_wallpaper" -n
#     # swaync-client --reload-css
#     pywalfox update
#     color1=$(awk 'match($0, /color2=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
#     color2=$(awk 'match($0, /color3=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
#     cava_config="$HOME/.config/cava/config"
#     sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" $cava_config
#     sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" $cava_config
#     pkill -USR2 cava 2>/dev/null
#     source ~/.cache/wal/colors.sh && cp -r $wallpaper ~/Media/Wallpapers/pywallpaper.jpg 
# }
# main


#!/bin/bash
WALLPAPER_DIR="$HOME/Media/Wallpapers/walls"

menu() {
    find "${WALLPAPER_DIR}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | sort
}

main() {
    # Use tofi for selection
    selected_wallpaper=$(menu | tofi --prompt-text "Select Wallpaper:" --num-results 15 )
    
    # If nothing was selected, exit
    [ -z "$selected_wallpaper" ] && exit 1
    
    # Apply the wallpaper
    swww img "$selected_wallpaper" --transition-type any --transition-fps 60 --transition-duration .5
    
    # Generate color scheme
    wal -i "$selected_wallpaper" -n
    
    # Update Firefox colors
    pywalfox update
    
    # Extract colors for cava visualization
    color1=$(awk 'match($0, /color2=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
    color2=$(awk 'match($0, /color3=\47(.*)\47/,a) { print a[1] }' ~/.cache/wal/colors.sh)
    
    # Update cava config
    cava_config="$HOME/.config/cava/config"
    sed -i "s/^gradient_color_1 = .*/gradient_color_1 = '$color1'/" $cava_config
    sed -i "s/^gradient_color_2 = .*/gradient_color_2 = '$color2'/" $cava_config
    
    # Reload cava
    pkill -USR2 cava 2>/dev/null
    
    # Save current wallpaper
    source ~/.cache/wal/colors.sh && cp -r "$selected_wallpaper" ~/Media/Wallpapers/pywallpaper.jpg
}

main
