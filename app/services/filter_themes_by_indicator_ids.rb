class FilterThemesByIndicatorIds
  include Singleton

  class << self
    delegate :call, to: :instance
  end

  def call(themes, indicator_ids = [])
    themes.dup.keep_if do |theme|
      theme["sub_themes"].keep_if do |sub_theme|
        sub_theme["categories"].keep_if do |category|
          category["indicators"].keep_if do |indicator|
            indicator["id"].in?(indicator_ids)
          end.present?
        end.present?
      end.present?
    end
  end
end
