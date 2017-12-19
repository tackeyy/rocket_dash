module ApplicationHelper
  FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-danger',
    warning: 'alert-warning',
    notice: 'alert-warning'
  }.freeze

  def flash_class_for(flash_type)
    FLASH_MSG[flash_type.to_sym] || flash_type.to_s
  end
end
