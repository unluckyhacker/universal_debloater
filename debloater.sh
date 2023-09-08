#!/bin/bash
#!/bin/bash
display_banner() {


 echo '          ____________'
 echo '         < r0h1th >'
 echo '          _ _ _ _ _ _ _'
 echo '             \   ,__,'
 echo '              \  (oo)____'
 echo '                 (__)    )\'
 echo '                     ||--||*'
 echo ''
    echo '    Universal Debloater 👽...🛸 '
    echo '    Author: r0h1th'
    echo '    Version: 1.0'
    echo '    Ping: 127.0.0.1...  '
}
display_banner

debloat_dir="./debloat_files"

if ! adb devices | grep -w device &> /dev/null; then
    echo "No device is connected via ADB. Please connect your device and try again."
    exit 1
fi

echo "Select your device:"
echo "1. Samsung"
echo "2. Realme"
echo "3. Redmi"
echo "4. Vivo"
echo "5. Oppo"
echo "6. OnePlus"

read -p "Enter the number of your device: " device_choice

case "$device_choice" in
    1) device="samsung";;
    2) device="realme";;
    3) device="redmi";; 
    4) device="vivo";;
    5) device="oppo";;
    6) device="oneplus";;
    *) echo "Invalid choice"; exit 1;;
esac

debloat_file="$debloat_dir/${device}_debloat.txt"
if [ ! -f "$debloat_file" ]; then
    echo "De-bloat file '$debloat_file' not found for the selected device."
    exit 1
fi

while ROH= read -r package_name; do
    echo "Removing package: ./adb shell pm uninstall -k --user 0 $package_name"
done < "$debloat_file"

echo "Bloatware removal process completed for $device..."
