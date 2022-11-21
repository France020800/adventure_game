-- Function definition --

function replaceChar(char, index, text)
  if index == 1 then
    text = char .. text:sub(index+1)
  elseif index == #text then
    text = text:sub(1, index-1) .. char
  else
    text = text:sub(1, index-1) .. char .. text:sub(index+1)
  end
  return text
end

function upperCaseEncryption(charToShift)
  local shiftedChar = ((string.byte(charToShift)-64) + 13)%26
  return string.char(shiftedChar+64)
end

function lowerCaseEncryption(charToShift)
  local shiftedChar = ((string.byte(charToShift)-96) + 13)%26
  return string.char(shiftedChar+96)
end

-- Main --

text = getObject("Values[cypher_text]"):getStr(VValueString)

for i = 1, #text do
  charToShift = text:sub(i,i)
  if string.byte(charToShift) >= 65 and string.byte(charToShift) <= 90 then
    charToShift = upperCaseEncryption(charToShift)
  elseif string.byte(charToShift) >= 97 and string.byte(charToShift) <= 122 then
    charToShift = lowerCaseEncryption(charToShift)
  end
  text = replaceChar(charToShift, i, text)
end

getObject("Values[cypher_text]"):setValue(VValueString,text)
