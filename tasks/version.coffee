gulp  = require "gulp"
bump  = require "gulp-bump"
git   = require "gulp-git"

gulp.task "bump/bower.json", ->
  gulp.src ["bower.json"]
    .pipe bump type: "patch"
    .pipe gulp.dest "./"

gulp.task "bump", ["bump/bower.json"], ->
  version = require("../bower.json")["version"]
  gulp.src ["bower.json"]
    .pipe git.add()
    .pipe git.commit "bump version into #{version}"
    .on "end", ->
      git.tag(version, version, ->)

