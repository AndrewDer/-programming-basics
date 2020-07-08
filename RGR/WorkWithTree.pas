UNIT WorkWithTree;
INTERFACE
TYPE
  Tree = ^Node;
  Node = RECORD
           WordOfTree: STRING;
           WordCount: INTEGER;
           LBranch, RBranch: Tree
         END;
  PROCEDURE Insert(VAR TreeBranch: Tree; NewWord: STRING);
  PROCEDURE PrintTree(VAR FOut: TEXT; VAR TreeBranch: Tree);
  PROCEDURE DelTree(TreeBranch: Tree);
IMPLEMENTATION

  PROCEDURE Insert(VAR TreeBranch: Tree; NewWord: STRING);
  BEGIN
    IF TreeBranch = NIL
    THEN
      BEGIN
        NEW(TreeBranch);
        TreeBranch^.WordOfTree := NewWord;
        TreeBranch^.WordCount := 1;
        TreeBranch^.LBranch := NIL;
        TreeBranch^.RBranch := NIL
      END
    ELSE
      IF TreeBranch^.WordOfTree > NewWord
      THEN
        Insert(TreeBranch^.LBranch, NewWord)
      ELSE
        IF TreeBranch^.WordOfTree < NewWord
        THEN
          Insert(TreeBranch^.RBranch, NewWord)
        ELSE
          TreeBranch^.WordCount := TreeBranch^.WordCount + 1
  END;

  PROCEDURE DelTree(TreeBranch: Tree);
  BEGIN
    IF TreeBranch^.LBranch <> NIL
    THEN
      DelTree(TreeBranch^.LBranch);
    IF TreeBranch^.RBranch <> NIL
    THEN
      DelTree(TreeBranch^.RBranch);
    DISPOSE(TreeBranch)
  END;

  PROCEDURE PrintTree(VAR FOut: TEXT; VAR TreeBranch: Tree);
  BEGIN
    IF TreeBranch <> NIL
    THEN
      BEGIN
        PrintTree(FOut, TreeBranch^.LBranch);
        WRITELN(FOut, TreeBranch^.WordOfTree, ': ', TreeBranch^.WordCount);
        PrintTree(FOut, TreeBranch^.RBranch)
      END
  END;

BEGIN
END.
