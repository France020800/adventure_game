isCheckedX0 = getObject("Conditions[xActive]"):getBool(VConditionValue)
isCheckedX1 = getObject("Conditions[x1Active]"):getBool(VConditionValue)
isCheckedX2 = getObject("Conditions[x2Active]"):getBool(VConditionValue)
isCheckedX3 = getObject("Conditions[x3Active]"):getBool(VConditionValue)
isCheckedX4 = getObject("Conditions[x4Active]"):getBool(VConditionValue)
isCheckedX5 = getObject("Conditions[x5Active]"):getBool(VConditionValue)
isCheckedX6 = getObject("Conditions[x6Active]"):getBool(VConditionValue)
isCheckedX7 = getObject("Conditions[x7Active]"):getBool(VConditionValue)
isCheckedX8 = getObject("Conditions[x8Active]"):getBool(VConditionValue)
isCheckedX9 = getObject("Conditions[x9Active]"):getBool(VConditionValue)
isCheckedX10 = getObject("Conditions[x10Active]"):getBool(VConditionValue)
isCheckedX11 = getObject("Conditions[x11Active]"):getBool(VConditionValue)
isCheckedX12 = getObject("Conditions[x12Active]"):getBool(VConditionValue)
isCheckedX13 = getObject("Conditions[x13Active]"):getBool(VConditionValue)
isCheckedX14 = getObject("Conditions[x14Active]"):getBool(VConditionValue)
isCheckedX15 = getObject("Conditions[x15Active]"):getBool(VConditionValue)

-- Settaggio variabili booleani in merito alle stelle attive --
-- Settaggio prima linea di porte

if not (isCheckedX0 and isCheckedX1) then
  getObject("Conditions[sx_sx_sx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[sx_sx_sx]"):setValue(VConditionValue, false)
end

if (isCheckedX2 and isCheckedX3) then
  getObject("Conditions[sx_sx_dx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[sx_sx_dx]"):setValue(VConditionValue, false)
end

if not (isCheckedX4 or isCheckedX5) then
  getObject("Conditions[sx_dx_sx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[sx_dx_sx]"):setValue(VConditionValue, false)
end

if (isCheckedX6 and isCheckedX7) then
  getObject("Conditions[sx_dx_dx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[sx_dx_dx]"):setValue(VConditionValue, false)
end

if not (isCheckedX8 or isCheckedX9) then
  getObject("Conditions[dx_sx_sx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[dx_sx_sx]"):setValue(VConditionValue, false)
end

if (isCheckedX10 and isCheckedX11) then
  getObject("Conditions[dx_sx_dx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[dx_sx_dx]"):setValue(VConditionValue, false)
end

if (isCheckedX12 or isCheckedX13) then
  getObject("Conditions[dx_dx_sx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[dx_dx_sx]"):setValue(VConditionValue, false)
end

if (isCheckedX14 and isCheckedX15) then
  getObject("Conditions[dx_dx_dx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[dx_dx_dx]"):setValue(VConditionValue, false)
end

sxSxSxActive = getObject("Conditions[sx_sx_sx]"):getBool(VConditionValue)
sxSxDxActive = getObject("Conditions[sx_sx_dx]"):getBool(VConditionValue)
sxDxSxActive = getObject("Conditions[sx_dx_sx]"):getBool(VConditionValue)
sxDxDxActive = getObject("Conditions[sx_dx_dx]"):getBool(VConditionValue)
dxSxSxActive = getObject("Conditions[dx_sx_sx]"):getBool(VConditionValue)
dxSxDxActive = getObject("Conditions[dx_sx_dx]"):getBool(VConditionValue)
dxDxSxActive = getObject("Conditions[dx_dx_sx]"):getBool(VConditionValue)
dxDxDxActive = getObject("Conditions[dx_dx_dx]"):getBool(VConditionValue)

-- Settaggio seconda linea di porte

if not (sxSxSxActive and sxSxDxActive) then 
  getObject("Conditions[sx_sx]"):setValue(VConditionValue, true)
else 
  getObject("Conditions[sx_sx]"):setValue(VConditionValue, false)
end

if sxDxSxActive and sxDxDxActive then
  getObject("Conditions[sx_dx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[sx_dx]"):setValue(VConditionValue, false)
end

if not (dxSxSxActive and dxSxDxActive) then
  getObject("Conditions[dx_sx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[dx_sx]"):setValue(VConditionValue, false)
end

if dxDxSxActive and dxDxDxActive then
  getObject("Conditions[dx_dx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[dx_dx]"):setValue(VConditionValue, false)
end

sxSxActive = getObject("Conditions[sx_sx]"):getBool(VConditionValue)
sxDxActive = getObject("Conditions[sx_dx]"):getBool(VConditionValue)
dxSxActive = getObject("Conditions[dx_sx]"):getBool(VConditionValue)
dxDxActive = getObject("Conditions[dx_dx]"):getBool(VConditionValue)

-- Settaggio terza linea di porte

if (sxSxActive and sxDxActive) then
  getObject("Conditions[sx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[sx]"):setValue(VConditionValue, false)
end

if not (dxSxActive or dxDxActive) then
  getObject("Conditions[dx]"):setValue(VConditionValue, true)
else
  getObject("Conditions[dx]"):setValue(VConditionValue, false)
end

sxActive = getObject("Conditions[sx]"):getBool(VConditionValue)
dxActive = getObject("Conditions[dx]"):getBool(VConditionValue)

-- Settaggio porta finale

if sxActive and dxActive then
  getObject("Conditions[center]"):setValue(VConditionValue, true)
  getObject("Conditions[isKeyDropped]"):setValue(VConditionValue, true)
else
  getObject("Conditions[center]"):setValue(VConditionValue, false)
end
