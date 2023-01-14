local has_impatient, impatient = pcall(require, "impatient")

if not has_impatient then
  return
end

impatient.enable_profile()
