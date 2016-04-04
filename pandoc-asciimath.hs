import Lexer (get_tokens)
import Parser (parseAscii)
import TeXWriter (writeTeX)
import Text.Pandoc.JSON

compile = writeTeX . parseAscii . get_tokens

main = toJSONFilter asciimath
    where asciimath (Math t s) = Math t $ compile s
          asciimath x = x
