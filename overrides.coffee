translate = require "t7e"
enUs = require './translations/en-us'
translate.load enUs

Footer = require 'zooniverse/controllers/footer'
SecondarySubNav = require './secondary-pages/sub-nav'
ClassifyMenu = require "./classify/menu"
project = require "zooniverse-readymade/current-project"

ProfileOverrides = require "./zooniverse/profile"

ClassifyPageEvents = require "./classify/events"
ClassifyMetadata = require "./classify/metadata"
ClassifyButtons = require "./classify/buttons"
ClassifySubjectLoader = require "./classify/subject-loader"

AboutNav = new SecondarySubNav "about"
EducationNav = new SecondarySubNav "education"
TeamNav = new SecondarySubNav "team"

footer = new Footer
classifyMenu = new ClassifyMenu

project.header.el.append("<meta name='viewport' content='width=600, user-scalable=no'>")
footer.el.appendTo $("<div id='footer-container'></div>").insertAfter(".stack-of-pages")

ClassifyMetadata.init()
ClassifyButtons.init()
ClassifySubjectLoader.init()
ProfileOverrides.init()

$(".readymade-call-to-action").html translate 'site.callToAction'

# events
$ -> ClassifyPageEvents.setupListeners()
