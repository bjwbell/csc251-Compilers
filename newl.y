{
module Main where
import Scanner
}


%name newl
%tokentype { Token }
%error { parseError }

%token
  "class"				{ TClass }
--  "new"					{ TNew }
  "String"				{ TString }
  "static"				{ TStatic }
  "void"				{ TVoid }
  "main"				{ TMain }
  "public"				{ TPublic }
--  "extends"				{ TExtend }
--  "int"					{ TInt }
--  "bool"				{ TBool }
--  "if"					{ TIf }
--  "else"				{ TElse }
--  "true"				{ TTrue }
--  "false"				{ TFalse }
--  "this"				{ TThis }
--  "length"				{ TLength }
--  "while"				{ TWhile }
--  integer_literal			{ TIntLiteral $$ }
  ident		                        { TIdent $$ }
  "{"	 	 	   		{ TLeftBrace }
  "}"					{ TRightBrace }
--  ","					{ TComma }
  "["					{ TLeftBrack }
  "]"					{ TRightBrack }
--  op                                    { TOp $$}
  "("                                   { TLeftParen }
  ")"                                   { TRightParen }
--  ";"                                   { TSemiColon }
--  "."                                   { TPeriod }
--  "="                                   { TEquals }

%%

Program : MainClass { $1 }
MainClass : "class" ident "{" "public" "static" "void" "main" "(" "String" "[" "]" ident ")" "{" "}" "}" { MClass $2 $12 }

--Exp : let var '=' Exp in Exp { Let $2 $4 $6 }
--    | Exp1    	      	     { Exp1 $1 }

--Exp1 : Exp1 '+' Term 	     { Plus $1 $3}
--     | Exp1 '-' Term 	     { Minus $1 $3 }
--     | Term 		     { Term $1 }

--Term : Term '*' Factor 	     { Times $1 $3 }
--     | Term '/' Factor 	     { Div $1 $3 }
--     | Factor		     { Factor $1 }

--Factor 
--      : int		     { Int $1 }
--      | var		     { Var $1 }
--      | '(' Exp ')'	     { Brack $2 }


{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Program 
    = MainClass 
      deriving Show

data MainClass
    = MClass String String
      deriving Show

--data Ident = Var String

--data Exp  
--      = Let String Exp Exp
--      | Exp1 Exp1
--      deriving Show

--data Exp1 
--      = Plus Exp1 Term 
--      | Minus Exp1 Term 
--      | Term Term
--      deriving Show

--data Term 
--      = Times Term Factor 
--      | Div Term Factor 
--      | Factor Factor
--      deriving Show

--data Factor 
--      = Int Int 
--      | Var String 
--      | Brack Exp
--      deriving Show


main = getContents >>= print . newl . alexScanTokens
}
