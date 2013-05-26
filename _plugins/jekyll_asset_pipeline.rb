require 'jekyll_asset_pipeline'

module JekyllAssetPipeline
  class CompassConverter < JekyllAssetPipeline::Converter
    require 'compass'
    require 'bootstrap-sass'
    require 'tempfile'

    def self.filetype
      '.sass'
    end

    def initialize(asset)
      @asset = asset
      super
    end

    def convert
      output = Tempfile.new('compass_output')
      Compass.add_project_configuration()
      Compass.configure_sass_plugin!
      Compass.compiler.compile("./_assets/stylesheets/#{@asset.filename}", output.path)
      output.read
    end
  end
end


module JekyllAssetPipeline
  class CssTagTemplate < JekyllAssetPipeline::Template
    def self.filetype
      '.css'
    end

    def self.priority
      -1
    end

    def html
      "<link href='#{@path}/#{@filename}' rel='stylesheet' type='text/css' />\n"
    end
  end
end
