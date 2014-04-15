# Alfred Project Helper

This [Alfred](http://alfredapp.com) Workflow is created by [me](http://evanlovely.com), a Front End [Drupal](http://drupal.org) Developer who juggles multiple projects and created a utility around making that easier. It's for Web Developers in general. You can easily access your current project's Site Root, Theme Folder, and Files (like comps, wireframes, and notes). Then when it's time to switch to another project, it's easy and all the commands work on the new project.


## Requirements

- [Alfred Powerpack](http://www.alfredapp.com/).
- The `tag` command line tool for Mavericks Tags. [GitHub page here](https://github.com/jdberry/tag). Install with `sudo port install tag` or `brew install tag`.
- [Terminal Notifier](https://github.com/alloy/terminal-notifier) (not necessary, but *super* useful). Run `gem install terminal-notifier` to install.
- Websites that need to be built easier.

## Optionally Set Where All Projects Live

The default setup creates a folder at `~/all-projects` to keep all the projects. If you want to keep them elsewhere, like in Dropbox or Google Drive, then sym link that directory in here. For example, this is what I did:

    ln -s ~/Dropbox/projects ~/all-projects


## Inital Config

1. Install [Workflow](https://github.com/EvanLovely/alfred--project-helper/blob/master/Project%20Helper.alfredworkflow?raw=true)
2. Invoke Alfred, type `,pn {name of new project}` to create a new project. 
3. Answer the questions about your project like site root, theme folder, files directory, and more.

You can now access these folders you setup in `~/active-project`. You'll see that you can get to your project's Site Root here: `~/active-project/site_root`, to your Theme directory here: `~/active-project/theme`, and to your files here: `~/active-project/files` (The files directory just mentioned has actually been created at `~/all-projects/{project name} files/` and then symbolically linked to `~/active-project/files`.). This folder will open in finder and you should fill it up with your projects files. The rest of the folders' paths have been stored in `~/active-project/files/settings.yml` and then sym linked into `~/active-project`.

## Commands to start with

- `,p files {query}` - Search the files folder for any file that matches `{query}`
- `,p theme {query}` - Search the theme folder for any file that matches `{query}`
- `,p cc` - Runs `drush cc all` inside the Site Root
- `,p push` - Run `git push` in Site Root (there's also `pull`)
- `,p css {query}` - Search for any SASS/LESS files in your theme directory
- `,p tpl {query}` - Search for any `.tpl.php` files in your theme directory

## More Commands

- `,p go` - Shows you shortcuts to each main folder for your project.
- `,p assets {query}` - Searches the `~/active-project/files/assets` folder for any file. Useful for comps, site maps, and wireframes.
- `,p ssh` - Opens Terminal/iTerm and logs into your staging server via `ssh`. Hold Cmd to log into your production server.
- `,p commit {query}` - Tell `git` to add all files and commit using a message of `{query}`
- `,p docs {query}` - Search inside the Google Docs folder
- `,p link {query}` - Search inside the links folder for `.webloc`s and opens them. Great for adding custom bookmark support for a project. Just drag favicons to the folder to add a `.webloc`.
- `,p snippets {query}` - Searches the `~/active-project/files/snippets` directory for text files and copies the contents. Can add to this by typing `,p set new snippets` and passing in the Question/Value after which you get asked the Answer/Value. Helpful for copying small chunks of text related to the project.

## Changing Project Settings

**All Settings are stored in `~/active-project/files/settings.yml`. The Alfred Actions below simply modify that file. Go ahead and edit there if you want.**

- `,p set ssh {query}` - Set a new SSH command for getting into the staging server. Hold Cmd for Production Server.
- Navigate to any folder or file in Alfred, then hit the right arrow key (could be different depeneding on your settings) for it's contextual menu. Then type "set" - you will see a series of options for setting preferences like which is the Site Root, Theme, Files Directory, Assets Directory (Shared Dropbox Folder perhaps?), or add new files to open at the beginning of your project. 


# Switching Projects

Once you've made a few projects using `,pn`, you can switch between them by using `,ps {project name}`. What happens next is this:

- The `~/active-project` directory is erased - it was all symbolic links anyway.
- An empty `~/active-project` folder is created and the new project selected gets symbolic links created from the sources you've setup: `~/active-project/files`, `~/active-project/site_root`, `~/active-project/theme` and `~/active-project/gdocs` (Google Docs).
- Site Root Scripts Run - At the setup, you told what scripts to run in the site root and they run now. Useful for things like `git pull`. You can edit this at `~/active-project/files/settings/start-in-site-root.sh`. If you don't want that to happen, you can safely delete this file, same with the theme scripts below.
- Theme Scripts Run - Again, you added this in the setup. Useful for commands like `compass watch`. You can edit this at `~/active-project/files/settings/start-in-theme.sh`.
- Open Scripts Run - This just opens stuff you want open when you start a project. Files, folders, or URLs can be added. You can edit this at `~/active-project/files/settings/open-at-start.sh`. I typically have this open: 
    - Sublime Text project files
    - Markdown Notes File
    - OmniFocus Project URL
    - Project Management site (like Basecamp)

Now, all commands mentioned above, like `,p assets`, search the newly selected projects asset folder. This way, no matter what project you are working on, you can use the same commands to access the same type of files and perform common taks, but just for a different project. Muscle memory will improve productivity. It helps so much.

# Giving Feedback

Please feel free to [create an issue](https://github.com/EvanLovely/alfred--project-helper/issues/new) for problems you come across – I'd really like to get this solid, useable, and beneficial to others.


---------------


# Advanced Useage

## Using `~/active-project` in your scripts and in Terminal

One thing that is **super useful** is now, even without Alfred, your current project's Site Root is at `~/active-project/site_root` which makes it very easy to get to. I love having `~/active-project/theme` available - *so* much shorter. Not only shorter, but reusable and reliable. 


## Custom Scripts

In your project folder, there is a scripts folder, if you add more scripts then you can run them via `,p scripts {query}` (which will run in the site root.)


## Using the Links folder

When you type `,p links {query}` it will search the `~/active-project/files/links` folder for any `.webloc`s (basically just links) and open them. To add them, drag the favicon from a browser and drop it on the Finder on this folder. This is simple, but super useful. Some ideas:

- Project Site (i.e. Basecamp) Issue Queue
- Project Wiki
- Local development site's commonly edited pages
- Time Tracking site

-------

# Help with development of this project via Git

If you want to help with this project, either add an Issue or Fork this project, and make a few changes. Thanks!

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

