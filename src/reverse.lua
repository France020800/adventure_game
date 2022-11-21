text = getObject("Values[cypher_text]"):getStr(VValueString)

reverseText = string.reverse(text)

getObject("Values[cypher_text]"):setValue(VValueString,reverseText)
