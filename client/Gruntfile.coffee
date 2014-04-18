module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        env:
            dev:
                NODE_ENV: 'DEVELOPMENT'
            prd:
                NODE_ENV: 'PRODUCTION'
        jade:
            prd:
                options:
                    data:
                        debug: no
                files:
                    'build/index.html': ['source/index.jade']
        coffee:
            dev:
                options:
                    sourceMap: on
                files: [
                    expand: yes
                    cwd: 'source'
                    src: '**/*.coffee'
                    dest: 'build/'
                    ext: '.js'
                ]
        copy:
            dev:
                files: [
                    expand: yes
                    cwd: 'source'
                    src: '**/*.jade'
                    dest: 'build/'
                ]


    grunt.loadNpmTasks mod for mod in (require 'matchdep').filterDev 'grunt-*' when not mod.match 'grunt-template' and not mod.match 'grunt-cli'

    grunt.registerTask 'clean', 'Clean build directory', (target) ->
        output = grunt.config 'build'
        files = ['build/**/*.*']
        options =
            force: target is 'force'
        grunt.file.delete file,options for file in grunt.file.expand files when grunt.file.exists file
        !@errorCount

    grunt.registerTask 'default', ['install', 'coffeelint']
    grunt.registerTask 'bower', ['bower']
    grunt.registerTask 'dev', ['env:dev', 'clean', 'copy:dev', 'coffee:dev']
