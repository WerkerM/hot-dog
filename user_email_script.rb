User.all.each do |user|
  old_email = user.email
  email = (user.email.split("@")[0] + '@fake234gasdw.com')
  user.change_email(email)
  Contact.where(email: old_email).each do |contact|
    contact.update(email: email)
  end
end
