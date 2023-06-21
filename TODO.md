

- [ ] Schemas and deserialization for all JSONAPI types
- [ ] Tables for all of them
- [ ] define all routes

- [ ] Login using HTTP Basic Authentication with username and password
- [ ] Storing logged in accounts including the domain, for easy switching between accounts and Stud.IP systems
- [ ] Start page with global news
- [ ] Courses page with courses filtered by semester
- [ ] Files page for access of user files
  - [ ] navigate directories
  - [ ] create/delete directories
  - [ ] set directory visibility
  - [ ] upload/download files, set license
- [ ] WebView page/button on desktop for accessing Stud.IP as the browser version from inside the app
- [ ] Cookie authentication using the WebView
    - [ ] Also fixes the problem in the old app of custom authentication systems for installations,
          as the login process is performed in the browser, but the session cookie can be extracted.
- [ ] Select login method for a new account on the login page
- [ ] Page for switching/managing accounts


- [ ] Viewing in/outbox
- [ ] viewing mails
  - [ ] image support, loading async, is there a framework to cache images in flutter?
  - [ ] attachments?
- [ ] sending mails
  - [ ] attachments via the default public user folder? Could be insecure, how does the website do that?
  - [ ] sending to multiple users
  - [ ] replying to mails


- [ ] Course forum
  - [ ] navigating the hierarchy, view posts
  - [ ] create/edit posts and comments
- [ ] View course participants
- [ ] set course visibility and group/color
  - [ ] sort courses by group, display the color and icon
- [ ] integrate course files into the file page
- [ ] Course details page
- [ ] viewing course events
- [ ] searching courses
- [ ] joining/leaving courses


- [ ] Viewing Schedule
- [ ] Hiding/showing schedule entries
- [ ] creating/deleting schedule entries




- [ ] add MPL2 license file
- [ ] Better license text for README


- [ ] Linux build on Flathub
  - [ ] publish binaries on releases, unpack them in the flatpak build
  - [ ] CI for attaching binaries to releases
  - [ ] use GitHub Actions for arm64 build? Not supported, no arm64 build for now.
  - [ ] update checking? Not sure how often users update their flatpaks


- [ ] Android build
    - [ ] With GitHub Actions
    - [ ] CD to the Play Store


- [ ] Windows build
  - [ ] With GitHub Actions
  - [ ] automatic update checking


- [ ] GitHub Pages website, for help/documentation and to host the windows builds
- [ ] Localisation for English and German, German README.md


- [ ] Publish the Windows build on the microsoft store
  - [ ] CD for microsoft store build
  - [ ] disable update checking for that (does the microsoft store auto-update apps?)


- [ ] Accessibility


- [ ] Support for the Meetings plugin with BBB in WebView
- [ ] Support for the Opencast plugin, downloading the video or playing it in a player from the network


- [ ] root/admin/dozent/tutor routes
  - [ ] Deleting users
  - [ ] posting global news
  - [ ] posting course news
  - [ ] deleting news
  - [ ] deleting/editing other's blubbers
  - [ ] create/delete forum categories in courses


- [ ] Cloud File plugin
  - [ ] via cloud file sync api on windows
  - [ ] SAF over Android
  - [ ] Via the FileProvider framework on MacOS and IOS
  - [ ] Linux currently has no corresponding API, could be proposed as an XDG portal?
- [ ] integrate Stud.IP user and (user selectable) course files via the cloud files plugin


- [ ] Get an Apple developer account
- [ ] CI/CD with XCode Cloud for MacOS and IOS/IPadOS for the App Store


