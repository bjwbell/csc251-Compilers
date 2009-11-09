{
module Main where
import Scanner
}


%name newl
%tokentype { Token }
%error { parseError }

%token
  "class"				{ TClass }
  "new"					{ TNew }
  "String"				{ TString }
  "static"				{ TStatic }
  "void"				{ TVoid }
  "main"				{ TMain }
  "public"				{ TPublic }
--  "extends"				{ TExtend }
"int"				        { TInt }
--  "bool"				{ TBool }
--  "if"				{ TIf }
--  "else"				{ TElse }
  "true"				{ TTrue }
  "false"				{ TFalse }
  "this"				{ TThis }
  "length"				{ TLength }
--  "while"				{ TWhile }
  integer_literal			{ TIntLiteral $$ }
  ident		                        { TIdent $$ }
  "{"	 	 	   		{ TLeftBrace }
  "}"					{ TRightBrace }
  ","					{ TComma }
  "["					{ TLeftBrack }
  "]"					{ TRightBrack }
  op                                    { TOp $$}
  "("                                   { TLeftParen }
  ")"                                   { TRightParen }
  ";"                                   { TSemiColon }
  "."                                   { TPeriod }
  "!"                                   { TNot }
--  "="                                   { TEquals }

%%

Program : MainClass { $1 }
MainClass : "class" ident "{" "public" "static" "void" "main" "(" "String" "[" "]" ident ")" "{" Exp ";" "}" "}" { MClass $2 $12 $15 }

Exp : 
    Exp op Exp                        { Exp "e1"}
    | Exp "[" Exp "]"                 { Exp "e2"}
    | Exp "." "length"                { Exp "e3"}
    | Exp "." ident "(" ExpList ")"   { Exp "e4"}
    | integer_literal                 { Exp "e5"}
    | "true"                          { ExpBool True}
    | "false"                         { ExpBool False}
    | ident                           { ExpIdent $1}
    | "this"                          { ExpThis }
    | "new" "int" "[" Exp "]"         { ExpOp NewInt $4 }  
    | "new" ident "(" ")"             { ExpNewIdent $2}
    | "!" Exp                         { ExpOp Not $2}
    | "(" Exp ")"                     { ExpExp $2}

ExpList :
        Exp            { ExpListExp $1 }
        | Exp ExpRest  { ExpList $1 $2 }
        |              { ExpListEmpty }
    
ExpRest : "," Exp      { ExpRest $2 }


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
    = MClass String String Exp
      deriving Show
data Exp
    = Exp String
    | ExpComOp Exp Op Exp
    | ExpArray Exp Exp -- "Exp [ Exp ]"
    | ExpOp Operation Exp  -- different opterations such as Exp . length, !Exp, "new" "int" "[" Exp "]" etc
    | ExpFCall Exp Ident ExpList -- Exp . Ident ( ExpList )
    | ExpInt Integer_Literal
    | ExpBool Bool -- True or False
    | ExpIdent Ident
    | ExpNewIdent Ident Operation -- new Ident ()
    | ExpExp Exp -- Exp ( Exp )
    | ExpThis
    deriving Show
data Op
     = And
     | LessThan
     | Plus
     | Minus
     | Times
     deriving (Show, Eq)
data Operation 
     = Not
     | Length
     | NewInt
     | NewIdent
     deriving (Show, Eq)
type Ident = String
type Integer_Literal = Int
data ExpList
    = ExpList Exp ExpRest
    | ExpListEmpty
    | ExpListExp Exp
    deriving Show
data ExpRest
    = ExpRest Exp
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
