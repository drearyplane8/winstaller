# winstaller

![an unfunny meme](https://i.imgur.com/DZwt7DT.png)

Fellow Windows plebs, ever felt like this? Constantly adding things to your environment variables just to make them run? No more!

Winstaller takes files (or a directory), copies them to a new location, and adds that new folder to the PATH! 

Only works in Windows (duh)

## Usage:

File Mode
``` .\winstaller.ps1 -InputFiles file1, file2, file3 -TargetDirectory path\to\target\```

Makes TargetDirectory if it doesn't exist, copies in all provided files, and adds TargetDirectory to the PATH.

Directory Mode
```.\winstaller.ps1 -InputFiles directory1, directory2 -TargetDirectory path\to\target -DirectoryMode d```

Makes TargetDirectory if it doesn't exist, copies in the contents of all provided folders, and adds TargetDirectory to the PATH.

Relative paths are fine, they'll be converted into absolute ones before they end up in the PATH. 

I hold no liability for if this bricks your PC, it's the first PowerShell script longer than 2 lines I've ever written. 
