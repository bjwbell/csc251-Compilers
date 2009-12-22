{
module Main where
import Scanner
-- Notes
--1. Arrays are not implemented. So please dont use them
--2. The array of arguments passed to main is not implemented.
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
MainClass : 
          "class" ident "{" "public" "static" "void" "main" "(" "String" "[" "]" ident ")" "{" Statement "}" "}" { MClass $2 $12 $15 }
--          | error {% failE ("Error parsing MainClass")}


ClassDeclList :
          ClassDecl     { ClassDeclList $1 CEmpty }
          | ClassDecl ClassDeclList { ClassDeclList $1 $2 }
          |             { CEmpty }
--          | error {% failE "Error parsing Classes"}

ClassDecl : 
          "class" ident "{" VarDeclList MethodDeclList "}"                     { ClassDecl $2 "void" $4 $5 }
          | "class" ident "extends" ident "{" VarDeclList MethodDeclList "}"   { ClassDecl $2 $4 $6 $7 }
--          | error {% failE "Error parsing ClassDecl"}


MethodDeclList :
     MethodDecl                   { MethodDeclList $1 MEmpty }
     | MethodDecl MethodDeclList  { MethodDeclList $1 $2 }
     |                            { MEmpty }
--     | error {% failE "Error parsing MethodDeclList"}

MethodDecl : 
     "public" Type ident "(" FormalList ")" "{" VarDeclList StatementList "return" Exp ";" "}" { MethodDecl $2 $3 $5 $8 $9 $11 }
--     | error {% failE "Error parsing MethodDecl"}

VarDeclList :
     Type ident ";" { VarDeclList $1 $2 VEmpty }
     | Type ident ";" VarDeclList { VarDeclList $1 $2 $4 }
     |              { VEmpty }
--     | error {% failE "Error parsing VarDeclList"}

FormalList :
     Type ident       { FormalList $1 $2 FEmpty }
     | Type ident FormalList { FormalList $1 $2 $3 }
--     | error {% failE "Error parsing FormalList"}

Type :
     "int" "[" "]"    { TypeIntArray }
     | "boolean"      { TypeBoolean }
     | "int"          { TypeInt }
     | ident          { TypeIdent $1 }
--     | error {% failE "Error parsing Type"}

Statement :
    "{" StatementList "}"                            { SList $2 }
    | "if" "(" Exp ")" Statement "else" Statement  { SIfElse $3 $5 $7 }
    | "while" "(" Exp ")" Statement                { SWhile $3 $5 }
    | "System.out.println" "(" Exp ")" ";"         { SPrint $3 }
    | ident "=" Exp ";"                              { SEqual $1 $3 }
    | ident "[" Exp "]" "=" Exp ";"                  { SArrayEqual $1 $3 $6 }
--    | error                                         {% failE "Error parsing statement" }

StatementList :
    Statement               { StatementList Empty $1 }
    | StatementList Statement   { StatementList $1 $2 }
--    | error {% failE "Error parsing StatementList"}

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
--    | error                           {% failE "Error parsing expression" }

ExpList :
        Exp            { ExpListExp $1 }
        | Exp ExpRest  { ExpList $1 $2 }
        |              { ExpListEmpty }
--        | error {% failE "Error parsing Expression List"}

ExpRest : 
     "," Exp      { ExpRest $2 }
--     | error {% failE "Error parsing Expression List"}

{

data E a = ParseOk a 
  | ParseFailed String
  deriving Show

thenE :: E a -> (a -> E b) -> E b
m `thenE` k = 
   case m of 
       ParseOk a -> k a
       ParseFailed e -> ParseFailed e

returnE :: a -> E a
returnE a = ParseOk a

failE :: String -> E a
failE err = ParseFailed err

catchE :: E a -> (String -> E a) -> E a
catchE m k = 
   case m of
      ParseOk a -> ParseOk a
      ParseFailed e -> k e

parseError :: [Token] -> E a
parseError tokens = failE ("Parse error on token "  ++ (show (head tokens)))

data Program 
    = Program MainClass ClassDeclList
      deriving (Show, Eq)



data MainClass
    = MClass String String Statement
      deriving (Show, Eq)

data ClassDeclList
    = ClassDeclList ClassDecl ClassDeclList
    | CEmpty
  deriving (Show, Eq)

data ClassDecl = ClassDecl Ident Ident VarDeclList MethodDeclList
  deriving (Show, Eq)


data MethodDeclList
    = MethodDeclList MethodDecl MethodDeclList
    | MEmpty
    deriving (Show, Eq)
data MethodDecl
    = MethodDecl Type Ident FormalList VarDeclList StatementList Exp
    deriving (Show, Eq)

data VarDeclList =
    VarDeclList Type Ident VarDeclList
    | VEmpty
    deriving (Show, Eq)

data FormalList = 
    FormalList Type Ident FormalList
    | FEmpty
  deriving (Show, Eq)

data Type =
    TypeIntArray
    | TypeBoolean
    | TypeInt
    | TypeIdent Ident
    deriving (Show, Eq)

data Statement
    = Statement String
    | SList StatementList
    | SIfElse Exp Statement Statement
    | SWhile Exp Statement
    | SPrint Exp
    | SEqual Ident Exp
    | SArrayEqual Ident Exp Exp
    | StatementError
    deriving (Show, Eq)

data StatementList
    = StatementList StatementList Statement 
    | Empty
    deriving (Show, Eq)


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
    | ExpError
    deriving (Show, Eq)

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
    deriving (Show, Eq)
data ExpRest
    = ExpRest Exp
    deriving (Show, Eq)

data Sym = Sym String String
  deriving (Show, Eq)


data Symbol 
    = ClassSymbol 
      {
          className       :: String
        , publicVariables :: [Symbol] 
        , methods         :: [MethodSymbol] -- class name, public variables, methods
      }
    | IntSymbol String -- variable is an integer, String is the name
    | BoolSymbol String -- variable is a boolean, String is the name
      deriving (Eq)

--data Color 
--    = Red String
--    | Green String
--instance Show Color where
--    show Red = "Red"
--    show Green = "Green"

--instance Show Symbol where show = showSymbol

instance Show Symbol where 
    show (ClassSymbol name1 vars methods) = show name1
    show (IntSymbol name2) = show name2
    show (BoolSymbol name3) = show name3

--data MethodSymbol = MethodSymbol String String [String] -- return type, name, type names of the params
    
data MethodSymbol = MethodSymbol {
      returnType :: String
    , name       :: String
    , args       :: [String]
    } 
                    deriving (Show, Eq)
-- String String [String] -- return type, name, types names of the params

classSymbols (ParseOk (Program mainClass classDeclList)) = classSymbolsMainClass mainClass : classSymbolscl classDeclList 
classSymbolsMainClass (MClass className paramName statement) = (className, (ClassDecl className "void" VEmpty MEmpty))
classSymbolsc (ClassDecl className parentClassName varDecls methodDecls) = (className, (ClassDecl className parentClassName varDecls methodDecls))
classSymbolscl (ClassDeclList classDecl classDeclList) = classSymbolsc classDecl : classSymbolscl classDeclList
classSymbolscl (CEmpty) = []


semanticAnalysis (ParseOk (Program mainClass classDeclList)) classes = semanticAnalysisMainClass mainClass classes

semanticAnalysisMainClass (MClass className paramName statement) classes = do
  if lookup className classes == Nothing
      then error ("Error " ++ className ++ " is not a declared class")
      else semanticAnalysisStatement statement classes [("dummysymbol", IntSymbol "dummysymbol")]

semanticAnalysisStatement (Statement string) classes context = "Success" -- dont know what Statement string is from so defaulting to success
semanticAnalysisStatement (SList statementList) classes context = 
    semanticAnalysisStatementList statementList classes context
semanticAnalysisStatement (SIfElse exp1 statement1 statement2) classes context =
    if semanticAnalysisStatement statement1 classes context == "Success" && semanticAnalysisStatement statement2 classes context == "Success"
       then "Success"
       else error ("Error in If Else Statement")

semanticAnalysisStatement (SWhile exp statement) classes context = 
    do
      semanticAnalysisExp exp classes context
      semanticAnalysisStatement statement classes context


semanticAnalysisStatement (SEqual ident1 exp1) classes context = "Success"

semanticAnalysisStatement (SPrint exp) classes context = semanticAnalysisExp exp classes context
--    "Success"

--    "Success"
semanticAnalysisStatement (SArrayEqual ident exp1 exp2) classes context = "Success"




semanticAnalysisStatementList (StatementList statementList statement) classes context = 
    if semanticAnalysisStatementList statementList classes context == "Success" 
        then  semanticAnalysisStatement statement classes context
        else  error "Statement list error"
                    
semanticAnalysisStatementList Empty classes context = "Success"

-- the semanticAnalysisExp return the type name of the expression
semanticAnalysisExp (Exp string) classes context = "Success" -- wtf is this?

semanticAnalysisExp (ExpOp exp1 char exp2) classes context = 
    if semanticAnalysisExp exp1 classes context == "int" && semanticAnalysisExp exp2 classes context == "int"
       then "int"
       else error ("one of the expressions exp1:" ++ show(exp1) ++ " exp2:" ++ show(exp2) ++ " is not an integer")

semanticAnalysisExp (ExpComOp exp1 char exp2) classes context = 
    if semanticAnalysisExp exp1 classes context == "int" && semanticAnalysisExp exp2 classes context == "int"
       then "bool"
       else error ("one of the expressions exp1:" ++ show(exp1) ++ " exp2:" ++ show(exp2) ++ " is not an integer")


semanticAnalysisExp (ExpArray exp1 exp2) classes context  = "not implemented" -- "Exp [ Exp ]"

semanticAnalysisExp (ExpFCall exp ident expList) classes context = semanticAnalysisExp exp classes context -- Exp . Ident ( ExpList )

semanticAnalysisExp (ExpInt int) classes context = "int"

semanticAnalysisExp (ExpNewInt exp) classes context = 
    if semanticAnalysisExp exp classes context == "int"
       then "int"
       else error ("Error new int[exp] the expression is not of an integer")

semanticAnalysisExp (ExpBool bool) classes context  = "boolean" -- True or False


semanticAnalysisExp (ExpIdent ident) classes context = 
    if lookup ident context == Nothing
       then error ("Error " ++ ident ++ " is not a declared variable")
       else show(lookup ident context)
                                                       
semanticAnalysisExp (ExpNewIdent ident) classes context = 
    if lookup ident classes == Nothing
    then error ("Error " ++ ident ++ " is not a declared class")
    else ident

semanticAnalysisExp (ExpExp exp) classes context  = semanticAnalysisExp exp classes context -- Exp ( Exp )

semanticAnalysisExp (ExpThis) classes context = "not implemented"

semanticAnalysisExp (ExpNot exp) classes context = 
    if semanticAnalysisExp exp classes context == "boolean"
       then "boolean"
       else error "wrong type for !exp, expecting type of boolean"

semanticAnalysisExp (ExpLength exp) classes context =
    if semanticAnalysisExp exp classes context == "int[]"
           then "int"
           else error "Error in " ++ show(exp) ++ ".length the expression is not of type int[] "


main = do 
  inStr <- getContents
  let parseTree = newl (alexScanTokens inStr)  
  putStrLn ("parseTree: " ++ show(parseTree))
  let classes = classSymbols parseTree
  putStrLn "classes " 
  print classes
  putStrLn ""
--  let al = [(1, "one")]
--  let r = lookup 1 al
--  print r
  let sAnalysis = semanticAnalysis parseTree classes
  putStrLn ("Semantic Analysis Results " ++ show(sAnalysis))
  putStrLn "\n"
  print "done"
  --print (symbolTable (parseTree))

}
