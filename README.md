
# Snippet2Clipboard


its a shell script that read ${HOME}/.snippet file and yanks the field in system clipboard using xclip


## requirements
xclip\
awk \
rofi 



# Installation + setup
```bash
# 1. Download the zip archive
curl -L -o main.zip https://github.com/kapil000005/snipppet2clipboard/archive/refs/heads/main.zip

# 2. Extract the zip file (requires 'unzip' utility)
unzip main.zip

# 3. Navigate into the extracted folder
cd snipppet2clipboard-main

chmod +x ./snippet
sudo mv  ./snippet /bin/snippet
sudo mv ./snippet.desktop  /usr/share/applications/snippet.desktop
   
```
## usage


${HOME}/.snippet
```bash
"field1"="value1"
"field2"="value2"
"field3"="value3"
"field4"="value4"
"nth field"="nth value"
```
```bash
# directly launch via rofi dmenu or by terminal (not recommended beacuse then it ends it reason ) 
```

## Demo

<video src="https://github.com/kapil000005/snipppet2clipboard/blob/main/Demo-2026-11-14_02.28.48.mp4?raw=true" controls="controls" style="max-width: 100%;">
</video>

THE END
