module NegativeCaptchaViewHelpers
  def negative_captcha(captcha)
    [
      hidden_field_tag('timestamp', captcha.timestamp.to_i), 
      hidden_field_tag('spinner', captcha.spinner),
    ].join
  end
  
  def negative_text_field_tag(negative_captcha, field, options={})
    [
      text_field_tag(negative_captcha.fields[field], negative_captcha.values[field], options),
      "<div style='position: absolute; left: -2000px;'>" + text_field_tag(field, '', :tabindex => '999') + "</div>"
    ].join
  end
  
  def negative_text_area_tag(negative_captcha, field, options={})
    [
      text_area_tag(negative_captcha.fields[field], negative_captcha.values[field] || options[:value], options),
      "<div style='position: absolute; left: -2000px;'>" + text_area_tag(field, '', :tabindex => '999', :rows => 2, :cols => 1) + "</div>"
    ].join
  end
  def negative_label_tag(negative_captcha, field, name, options={})
    [
      label_tag(negative_captcha.fields[field], name, options)
    ]
  end
  
  #TODO: Select, check_box, etc
end
