# Alfred Project Helper

## Requirements

- [Alfred Powerpack](http://www.alfredapp.com/)
- [Terminal Notifier](https://github.com/alloy/terminal-notifier) (not necessary, but *super* useful). Run `gem install terminal-notifier` to install
- Websites that need to be built easier


## Inital Config

1. Install [Workflow](https://github.com/EvanLovely/alfred--project-helper/blob/master/Project%20Helper.alfredworkflow)
2. Invoke Alfred, type `,pn {name of new project}` to create a new project. 
3. Answers the questions about your project like site root, theme folder, files directory, and more.


## Commands to start with

- `,p files {query}` - Search the files folder for any file that matches `{query}`
- `,p theme {query}` - Search the theme folder for any file that matches `{query}`
- `,p cc` - Runs `drush cc all` inside the Site Root (that you set above)
- `,p pull` - Run `git pull` in site repo
- `,p css {query}` - Search for any SASS/LESS files in your theme directory
- `,p tpl {query}` - Search for any `.tpl.php` files in your theme directory


# Switching Projects

Once you've made a few projects using `,pn`, you can switch between them by using `,ps {project name}`. 

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
