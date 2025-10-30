class Posting < ApplicationRecord

  belongs_to :author,    class_name: 'User', foreign_key: 'user_id'
  belongs_to :editor,    class_name: 'User', foreign_key: 'editor_id'
  
  # this code should not be here in the model
  # helper method or presenter should be used for represenation logic
  def article_with_image
    return type if type != 'Article'

    # i do not understand what is `body`. Should be some model method perhaps?
    # okay, I've got it from the readme. `body` is just a database field.
    figure_start = body.index('<figure') # why do we have `'<figure'` and not `'<figure>'` ?
    figure_end = body.index('</figure>')
    return "#{figure_start}_#{figure_end}" if figure_start.nil? || figure_end.nil?

    image_tags = body[figure_start...figure_end + 9]
    return 'not include <img' unless image_tags.include?('<img')

    posting_image_params(image_tags)
  end

  private

  def posting_image_params(html)
    tag_parse = -> (image, att) { image.match(/#{att}="(.+?)"/) }
    tag_attributes = {}

    %w[alt src data-image].each do |attribute|
      # the syntax `tag_parse.(html, attribute)` under the hood expects `:call` method to be present?
      # and yes, it is a lambda defined above.
      data = tag_parse.(html, attribute)
      unless data.nil?
        tag_attributes[attribute] = data[1] unless data.size < 2
      end
    end
    # tag_parse
    tag_attributes
  end
end