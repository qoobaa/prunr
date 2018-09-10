class FilterThemesByIndicatorIds < ApplicationService
  def call(themes, indicator_ids = [])
    deep_dup(themes).keep_if do |theme|
      theme["sub_themes"].keep_if do |sub_theme|
        sub_theme["categories"].keep_if do |category|
          category["indicators"].keep_if do |indicator|
            indicator["id"].in?(indicator_ids)
          end.present?
        end.present?
      end.present?
    end
  end

  private

  # a simple workaround to avoid modifying the original object - may
  # be removed for optimization but the service needs to be advertised
  # as a service with side effects
  def deep_dup(object)
    JSON.parse(JSON.dump(object))
  end
end
