PROGRAM CountWords(INPUT, OUTPUT);
USES
  WordSearch, WorkWithTree;
VAR
  Root: Tree;
  NewWord: STRING;
BEGIN
  Root:= NIL;
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          GetWord(INPUT, NewWord);
          IF NewWord <> ''
          THEN
            Insert(Root, NewWord);
        END;
      READLN(INPUT)
    END;
  PrintTree(OUTPUT, Root);
  DelTree(Root)
END.


