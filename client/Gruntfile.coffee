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
            dev:
                options:
                    data:
                        debug: yes
                files:
                    'build/index.html': ['source/index.jade']

        coffeelint:
            all: ['Gruntfile.coffee', 'source/**/*.coffee']
            options:
                indentation:
                    value: 4
                max_line_length:
                    level: 'ignore'
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
        stylus:
            prd:
                options:
                    compress: yes
                files:
                    'build/bottomline.min.css': ['source/**/*.styl']
            dev:
                options:
                    compress: no
                files: [
                        expand: yes
                        cwd: 'source'
                        src: ['**/*.styl']
                        dest: 'build/'
                        ext: '.css'
                ]

        copy:
            dev:
                files: [
                        src: 'bower_components/requirejs/require.js'
                        dest: 'build/script/require.js'
                    ,
                        expand: yes
                        src: 'bower_components/**/*.*'
                        dest: 'build/'
                    ,
                        expand: yes
                        src: 'source/**/*.*'
                        dest: 'build/'
                ]


    grunt.loadNpmTasks mod for mod in (require 'matchdep').filterDev 'grunt-*' when not mod.match 'grunt-template' and not mod.match 'grunt-cli'

    grunt.registerTask 'clean', 'Clean build directory', (target) ->
        output = grunt.config 'build'
        files = ['build/**/*.*']
        options =
            force: target is 'force'
        grunt.file.delete file,options for file in grunt.file.expand files when grunt.file.exists file
        not @errorCount

    grunt.registerTask 'default', ['install', 'coffeelint']
    grunt.registerTask 'bower', ['bower']
    grunt.registerTask 'dev', ['env:dev', 'clean', 'copy:dev', 'jade:dev', 'coffeelint', 'coffee:dev', 'stylus:dev']
