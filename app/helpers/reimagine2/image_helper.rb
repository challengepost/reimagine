module Reimagine2
  module ImageHelper
    # Use foundation's data-interchange way of serving responsive images
    def responsive_image_tag(image, options = {})
      options[:data] ||= {}
      options[:data].merge!(responsive_options(image, options))
      image_tag image, options
    end

    def double_density_file_name(file_name, options = {})
      double_density_label = options.delete(:double_density_label) || "@2x"

      extension = File.extname(file_name)
      filename = file_name.chomp(extension)
      [filename, double_density_label, extension].join
    end

    private

    def responsive_options(image, options = {})
      {
        interchange: [
          "[#{image_path(image)}, (default)]",
          "[#{image_path(double_density_file_name(image, options))}, (retina)]"
      ].join(", ")
      }
    end
  end
end
