# Alfred Project Helper

## Requirements

- [Alfred Powerpack](http://www.alfredapp.com/)
- [Terminal Notifier](https://github.com/alloy/terminal-notifier) (not necessary, but *super* useful). Run `gem install terminal-notifier` to install
- Drupal Sites that need to be built faster

When you see me use `{query}` below, that just means type something and it'll filter all the possibilities by that. If you want to see all possibilites and it doesn't show them, just type `.` in it's place.

## Inital Config

1. Install [Workflow](https://github.com/EvanLovely/alfred--project-helper/blob/master/Project%20Helper.alfredworkflow)
- Invoke Alfred, type `,pn {acronym of new project}` to create and switch to a new project.
- Using Alfred's File Navigation, go to several directories and then to their contextual menu (hit right on it), then you'll see options like Open With, Reveal in Finder, Email To; and then type "set" to filter the list and see all the things you can set this folder to. Here's what I'd advise setting up first:
    1. Site Root
    - Site Theme
    - Project's Files (which usually contains the below folders for me)
        - Project's Assets (comps, wireframes, etc)
        - Links folder (just create a folder inside the files directory, more on this command later)


## Commands to start with

- `,p cc` - Run `drush cc all` inside the Site Root (that you set above)
- `,p assets {query}` - Search the assets folder for any file that matches `{query}`
- `,p pull` - Run `git pull` in site repo
- `,p sass {query}` - Search for any SASS/SCSS files in your theme directory
- `,p tpl {query}` - Search for any `.tpl.php` files in your theme directory


## Common Links

When you have links you go to often (Project Management sites, Dev Sites, Hosted Assets, etc), this will help. 


### To set up

1. Open the Links folder in Finder you setup initially. (Just an empty folder called Links (or anything) inside the Project Files directory).
- Go to site in a browser.
- Drag the favicon to the Links folder in the Finder window. 
- This will create a `.webloc` file which, when opened, will open the default browser and go to the site.

### To use

1. Invoke Alfred and type `,p links {query}`
2. The browser will open the link.


# Switching Projects

Once you've made a few projects using `,pn`, you can switch between them by using `,ps {project name}`. You can always view the active project's folder by going to `~/projects/active` and see all projects by looking in `~/projects`. When you switch to a project, it just sym links the project folder, which itself contains symlinks to your site root, theme folder, project files etc, to `~/projects/active`. 

This way, no matter what project you are working on, you can use the same commands to do the same thing, but just for a different project. Muscle memory will improve productivity.


# Advanced Useage

## Custom Scripts

Create a folder called `scripts` in `~/projects/active` or in `~/projects` and then you can run them via `,p scripts {query}` (which will run in the site root.)
