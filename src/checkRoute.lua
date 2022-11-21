if checkUserRoute(myPath) then
  getObject("Conditions[correct_route]"):setValue(VConditionValue, true)
else
  getObject("Conditions[isCheckEnd]"):setValue(VConditionValue,  false)
  getObject("Conditions[wrong_route]"):setValue(VConditionValue, true)
end
