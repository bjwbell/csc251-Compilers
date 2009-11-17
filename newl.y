{
module Main where
import Scanner

data E a = Ok a | Failed String

thenE :: E a -> (a -> E b) -> E b
m thenE k = 
   case m of 
       Ok a -> k a
       Failed e -> Failed e

returnE :: a -> E a
returnE a = Ok a

failE :: String -> E a
failE err = Failed err

catchE :: E a -> (String -> E a) -> E a
catchE m k = 
   case m of
      Ok a -> OK a
      Failed e -> k e


}


%name newl
%tokentype { Token }
%error { parseError }
%monad { E } { thenE } { returnE }

%token
  "class"				{ TClass }
  "new"					{ TNew }
  "String"				{ TString }
  "static"				{ TStatic }
  "void"				{ TVoid }
  "main"				{ TMain }
  "public"				{ TPublic }
  "return"                              { TReturn }
  "extends"				{ TExtend }
  "int"				        { TInt }
  "boolean"				{ TBool }
  "if"				        { TIf }
  "else"				{ TElse }
  "true"				{ TTrue }
  "false"				{ TFalse }
  "this"				{ TThis }
  "length"				{ TLength }
  "while"				{ TWhile }
  integer_literal			{ TIntLiteral $$ }
  ident		                        { TIdent $$ }
  "{"	 	 	   		{ TLeftBrace }
  "}"					{ TRightBrace }
  ","					{ TComma }
  "["					{ TLeftBrack }
  "]"					{ TRightBrack }
  op                                    { TOp $$}
  comop                                 { TComOp $$ }
  "("                                   { TLeftParen }
  ")"                                   { TRightParen }
  ";"                                   { TSemiColon }
  "."                                   { TPeriod }
  "!"                                   { TNot }
  "="                                   { TEquals }
  "System.out.println"                  { TPrint }
%%

Program : 
        MainClass ClassDeclList { Program $1 $2 }
MainClass : "class" ident "{" "public" "static" "void" "main" "(" "String" "[" "]" ident ")" "{" Statement "}" "}" { MClass $2 $12 $15 }

ClassDeclList :
          ClassDecl     { ClassDeclList $1 CEmpty }
          | ClassDecl ClassDeclList { ClassDeclList $1 $2 }
          |             { CEmpty }

ClassDecl : 
          "class" ident "{" VarDeclList MethodDeclList "}"                     { ClassDecl $2 "void" $4 $5 }
          | "class" ident "extends" ident "{" VarDeclList MethodDeclList "}"   { ClassDecl $2 $4 $6 $7 }



MethodDeclList :
     MethodDecl                   { MethodDeclList $1 MEmpty }
     | MethodDecl MethodDeclList  { MethodDeclList $1 $2 }
     |                            { MEmpty }


MethodDecl : "public" Type ident "(" FormalList ")" "{" VarDeclList StatementList "return" Exp ";" "}" { MethodDecl $2 $3 $5 $8 $9 $11 }

VarDeclList :
     Type ident ";" { VarDeclList $1 $2 VEmpty }
     | Type ident ";" VarDeclList { VarDeclList $1 $2 $4 }
     |              { VEmpty }

FormalList :
     Type ident       { FormalList $1 $2 FEmpty }
     | Type ident FormalList { FormalList $1 $2 $3 }

Type :
     "int" "[" "]"    { TypeIntArray }
     | "boolean"      { TypeBoolean }
     | "int"          { TypeInt }
     | ident          { TypeIdent $1 }

Statement :
    "{" StatementList "}"                            { SList $2 }
    | "if" "(" Exp ")" Statement "else" Statement  { SIfElse $3 $5 $7 }
    | "while" "(" Exp ")" Statement                { SWhile $3 $5 }
    | "System.out.println" "(" Exp ")" ";"         { SPrint $3 }
    | ident "=" Exp ";"                              { SEqual $1 $3 }
    | ident "[" Exp "]" "=" Exp ";"                  { SArrayEqual $1 $3 $6 }

StatementList :
    Statement               { StatementList Empty $1 }
    | StatementList Statement   { StatementList $1 $2 }


Exp : 
    Exp op Exp                        { ExpOp $1 $2 $3}
    | Exp comop Exp                   { ExpComOp $1 $2 $3}
    | Exp "[" Exp "]"                 { ExpArray $1 $3}
    | Exp "." "length"                { ExpLength $1}
    | Exp "." ident "(" ExpList ")"   { ExpFCall $1 $3 $5}
    | integer_literal                 { ExpInt $1}
    | "true"                          { ExpBool True}
    | "false"                         { ExpBool False}
    | ident                           { ExpIdent $1}
    | "this"                          { ExpThis }
    | "new" "int" "[" Exp "]"         { ExpNewInt $4 }  
    | "new" ident "(" ")"             { ExpNewIdent $2}
    | "!" Exp                         { ExpNot $2}
    | "(" Exp ")"                     { ExpExp $2}

ExpList :
        Exp            { ExpListExp $1 }
        | Exp ExpRest  { ExpList $1 $2 }
        |              { ExpListEmpty }
    
ExpRest : "," Exp      { ExpRest $2 }


{

parseError :: [Token] -> a
parseError tokens = failE "Parse error"

data Program 
    = Program MainClass ClassDeclList
      deriving Show

data MainClass
    = MClass String String Statement
      deriving Show

data ClassDeclList
    = ClassDeclList ClassDecl ClassDeclList
    | CEmpty
  deriving Show

data ClassDecl = ClassDecl Ident Ident VarDeclList MethodDeclList
  deriving Show


data MethodDeclList
    = MethodDeclList MethodDecl MethodDeclList
    | MEmpty
    deriving Show
data MethodDecl
    = MethodDecl Type Ident FormalList VarDeclList StatementList Exp
    deriving Show

data VarDeclList =
    VarDeclList Type Ident VarDeclList
    | VEmpty
    deriving Show

data FormalList = 
    FormalList Type Ident FormalList
    | FEmpty
  deriving Show

data Type =
    TypeIntArray
    | TypeBoolean
    | TypeInt
    | TypeIdent Ident
    deriving Show

data Statement
    = Statement String
    | SList StatementList
    | SIfElse Exp Statement Statement
    | SWhile Exp Statement
    | SPrint Exp
    | SEqual Ident Exp
    | SArrayEqual Ident Exp Exp
    deriving Show

data StatementList
    = StatementList StatementList Statement 
    | Empty
    deriving Show


data Exp
    = Exp String
    | ExpOp Exp Char Exp
    | ExpComOp Exp Char Exp
    | ExpArray Exp Exp -- "Exp [ Exp ]"
    | ExpFCall Exp Ident ExpList -- Exp . Ident ( ExpList )
    | ExpInt Int
    | ExpNewInt Exp
    | ExpBool Bool -- True or False
    | ExpIdent Ident
    | ExpNewIdent Ident -- new Ident ()
    | ExpExp Exp -- Exp ( Exp )
    | ExpThis
    | ExpNot Exp
    | ExpLength Exp
    deriving Show
data Op
     = And
     | LessThan
     | Plus
     | Minus
     | Times
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


main = getContents >>= print . newl . alexScanTokens
}
