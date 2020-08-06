/// @desc undertale_width_text(text, bigSpaces)
/// @function undertale_width_text
/// @param text
/// @param bigSpaces

var originalText = argument[0]



var newText = originalText
var deleteCharsCount = 0
var deleteChars = false
for (var i = 0; i < string_length(originalText); ++i) {
	if string_char_at(originalText,i) == "<"
		deleteChars=true
	if string_char_at(originalText,i-1) == ">" {
		deleteChars=false
	}
	
	if deleteChars {
		newText = string_delete(newText, i-deleteCharsCount, 1)
		deleteCharsCount++
	}
}


if argument_count==2 && argument[1]
	newText = string_replace_all(newText," ",space)

return string_width(newText)