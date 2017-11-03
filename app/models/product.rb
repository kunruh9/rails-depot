class Product < ApplicationRecord

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_items

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:   %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG, or PNG image.'
  }
  validates :title, length: { minimum: 10, message: 'title is too short, must be minimum of 10 characters' }

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_items
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
