{

  module Main where

}

%name calc
%tokentype { Token }
%error { parseError}

%token 
      let             { TokenLet }
      in              { TokenIn }
      int             { TokenInt $$ }
      var             { TokenVar $$ }
      '='             { TokenEq }
      '+'             { TokenPlus }
      '-'             { TokenMinus }
      '*'             { TokenTimes }
      '/'             { TokenDiv }
      '('             { TokenOB }
      ')'             { TokenCB }

%%

Exp : let var '=' Exp in Exp { Let $2 $4 $6 }
    | Exp1    	      	     { Exp1 $1 }

Exp1 : Exp1 '+' Term 	     { Plus $1 $3}
     | Exp1 '-' Term 	     { Minus $1 $3 }
     | Term 		     { Term $1 }

Term : Term '*' Factor 	     { Times $1 $3 }
     | Term '/' Factor 	     { Div $1 $3 }
     | Factor		     { Factor $1 }

Factor 
      : int		     { Int $1 }
      | var		     { Var $1 }
      | '(' Exp ')'	     { Brack $2 }


{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Exp  
      = Let String Exp Exp
      | Exp1 Exp1
      deriving Show

data Exp1 
      = Plus Exp1 Term 
      | Minus Exp1 Term 
      | Term Term
      deriving Show

data Term 
      = Times Term Factor 
      | Div Term Factor 
      | Factor Factor
      deriving Show

data Factor 
      = Int Int 
      | Var String 
      | Brack Exp
      deriving Show

data Token
      = TokenLet
      | TokenIn
      | TokenInt Int
      | TokenVar String
      | TokenEq
      | TokenPlus
      | TokenMinus
      | TokenTimes
      | TokenDiv
      | TokenOB
      | TokenCB
 deriving Show

isSpace c = c == ' '
isAlpha c = c == 'a' || c == 'b' || c == 'c' || c == 'd' || c == 'e' || c == 'f' || c == 'g' || c == 'h' || c == 'i' || c == 'j' || c == 'k' || c == 'l' || c == 'm' || c == 'n' || c == 'o' || c == 'p' || c == 'q' || c == 'r' || c == 's' || c == 't' || c == 'u' || c == 'v' || c == 'w' || c == 'x' || c == 'y' || c == 'z'
            
isDigit c = c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9'

lexer :: String -> [Token]



lexer [] = []
lexer ('\n':cs) = lexer cs
lexer ('=':cs) = TokenEq : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer ('*':cs) = TokenTimes : lexer cs
lexer ('/':cs) = TokenDiv : lexer cs
lexer ('(':cs) = TokenOB : lexer cs
lexer (')':cs) = TokenCB : lexer cs

lexer (c:cs) = if isSpace c then lexer cs
               else
                   if isAlpha c then
                       lexVar (c:cs)
                   else
                       if isDigit c then
                           lexNum (c:cs)
                       else
                           error ('\'' : (c :('\'' : " unrecongized character")))

lexNum cs = TokenInt (read num) : lexer rest
      where (num,rest) = span isDigit cs

lexVar cs =
   case span isAlpha cs of
      ("let",rest) -> TokenLet : lexer rest
      ("in",rest)  -> TokenIn : lexer rest
      (var,rest)   -> TokenVar var : lexer rest
main = getContents >>= print . calc . lexer
}
