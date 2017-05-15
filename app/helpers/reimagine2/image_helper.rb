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

    def default_avatar_filename
      "reimagine2/no-avatar-180.png"
    end

    def default_classes
      ["user-avatar"]
    end

    def user_avatar_tag(user, options = {})
      classes = default_classes + Array(options.delete(:class))
      classes = classes.join(" ")

      path = user.avatar_url.presence || default_avatar_filename
      options[:alt] = '' unless options[:alt]

      image_tag path, (options || {}).merge(class: classes)
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
