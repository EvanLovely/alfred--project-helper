# Alfred Project Helper

## Requirements

- [Alfred Powerpack](http://www.alfredapp.com/)
- [Terminal Notifier](https://github.com/alloy/terminal-notifier) (not necessary, but *super* useful). Run `gem install terminal-notifier` to install
- Websites that need to be built easier


## Inital Config

1. Install [Workflow](https://github.com/EvanLovely/alfred--project-helper/blob/master/Project%20Helper.alfredworkflow)
2. Invoke Alfred, type `,pn {name of new project}` to create a new project. 
3. Answer the questions about your project like site root, theme folder, files directory, and more.

You can now access these folders you setup in `~/active` (We can change this later). For now, you'll see that you can get to your projects Site Root here: `~/active/site-root`, to your Theme directory here: `~/active/theme`, and to your files here: `~/active/files`[^hardcodedfilesdirectory]. This folder will open in finder and you should fill it up with your projects files.

## Commands to start with

- `,p go` - Shows you shortcuts to each folder you just setup.
- `,p files {query}` - Search the files folder for any file that matches `{query}`
- `,p theme {query}` - Search the theme folder for any file that matches `{query}`
- `,p cc` - Runs `drush cc all` inside the Site Root
- `,p pull` - Run `git pull` in Site Root
- `,p css {query}` - Search for any SASS/LESS files in your theme directory
- `,p tpl {query}` - Search for any `.tpl.php` files in your theme directory

## More Commands

- `,p ssh` - Opens Terminal/iTerm and logs into your staging server via `ssh`. Hold Cmd to log into your production server.
- `,p commit {query}` - Tell `git` to add all files and commit using a message of `{query}`
- `,p docs {query}` - Search inside the Google Docs folder
- `,p link {query}` - Search inside the links folder for `.webloc`s and opens them. Great for adding custom bookmark support for a project. Just drag favicons to the folder to add a `.webloc`.

## Changing Project Settings

**All Settings are stored in `~/active/files/settings.yml`. The Alfred Actions below simply modify that file. Go ahead and edit there if you want.**

- `,p set ssh {query}` - Set a new SSH command for getting into the staging server. Hold Cmd for Production Server.
- Navigate to any folder or file in Alfred, then hit the right arrow key (could be different depeneding on your settings) for it's contextual menu. Then type "set" - you will see a series of options for setting preferences like which is the Site Root, Theme, Files Directory, Assets Directory (Shared Dropbox Folder perhaps?), or add new files to open at the beginning of your project. 


# Switching Projects

Once you've made a few projects using `,pn`, you can switch between them by using `,ps {project name}`. What happens next is this:

- 

This way, no matter what project you are working on, you can use the same commands to access the same type of files and perform common taks, but just for a different project. Muscle memory will improve productivity. 


# Advanced Useage

## Custom Scripts

In your project folder, there is a scripts folder, if you add more scripts then you can run them via `,p scripts {query}` (which will run in the site root.)


## Help with development of this project via Git

1. Open Alfred Prefs, go to Workflow, make a new Blank Workflow. Name it anything.
2. Click the plus in the upper right > Actions > Run Script
3. Click Open Workflow Folder
4. Go to this folder in Terminal
5. Delete all files inside the folder
6. Clone the repo directly in here by running `git clone git@github.com:EvanLovely/alfred--project-helper.git .`
7. Sym link it somewhere else so you can find it easily again.
8. Make changes to the Workflow, add and commit. 
9. Also, the entire Alfred Workflow configuration is stored in `info.plist` - search and replace on this file works excellently. 
10. Send in Pull Requests

[^hardcodedfilesdirectory]: The files directory just mentioned has actually been created at `~/Dropbox/projects/{project name} files/` and then symbolically linked to `~/active/files`. I'd like to make a setting to change the "home" of all the projects, but for now it's hardcoded in.