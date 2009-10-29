
{
module Main (main) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				;
  "class"				{ \s -> TClass }
  "new"					{ \s -> TNew }
  "String"				{ \s -> TStr }
  "static"				{ \s -> TStatic }
  "void"				{ \s -> TVoid }
  "main"				{ \s -> TMain }
  "public"				{ \s -> TPublic }
  "extends"				{ \s -> TExtend }
  "int"					{ \s -> TInt }
  "bool"				{ \s -> TBool }
  "if"					{ \s -> TIf }
  "else"				{ \s -> TElse }
  "true"				{ \s -> TTrue }
  "false"				{ \s -> TFalse }
  "this"				{ \s -> TThis }
  "length"				{ \s -> TLength }
  "while"				{ \s -> TWhile }
  $digit+				{ \s -> Int (read s) }
  [\=\+\-\*\/\(\)\.\;]|&&		{ \s -> Sym (head s) }
  $alpha[$alpha $digit \_ \']*		{ \s -> Ident s }
  "{"	 	 	   		{ \s -> LeftBrace }
  "}"					{ \s -> RightBrace }
  ","					{ \s -> Comma }
  "["					{ \s -> LeftBrack }
  "]"					{ \s -> RightBrack }
{
-- Each action has type :: String -> Token

-- The token type:
data Token =
     	LeftBrace	|
	RightBrace	|
	Comma		|
	LeftBrack	|
	RightBrack	|
	TClass 		|
	TPublic		|
	TStr		|
	TStatic		|
	TVoid		|
	TMain		|
	TExtend		|
	TInt		|
	TBool		|
	TIf		|
	TElse		|
	TTrue		|
	TFalse		|
	TThis		|
	TLength		|
	TWhile		|
	TNew		|
	Sym Char	|
	Ident String	|
	Int Int
	deriving (Eq,Show)

main = do
  s <- getContents
  print (alexScanTokens s)
}
