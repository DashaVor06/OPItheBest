Program Modul3;

{ ���� ����� ������ ��� ������ ������� �� �������
  �� ���������� �������, ���������, ���� �� ���������
  ������� ����� � �������(� ������ ���������) � ��������
  ����� ��� ����� ����� � �������(����� ����� �������� � ������� ��������)
  �������, ����� �������
  �����!!!��� ����� ����������� ���� WordList �� ���� C ���� �������� � ���� ������������ �����
}
uses
  SysUtils;

Var
  // ������� ��� ������,��� ������ ���� � ������ ������
  bank: String = ('�����������������������������������');

  // ������ � ������
  mas_points: array of Integer;

  // ������ ����� ���� ��� ������
  bank_bukv: array [1 .. 2] of String = (
    '����������',
    '����������'
  );

  i, Err, Chislo_Igrokov, number_hodov, point, j, Randm, player, Count: Integer;
  Words: Text;
  Str, Word, Str1, last_word: String;
  Exist, Agree, Enter, _50_na_50, Help_friend: Boolean;
  Bufer: Char;

Begin

  WriteLn('������� ����� �������');
  ReadLn(Chislo_Igrokov);
  // 2� ������  (������� ����� � ���� ����� ���������������)

  // ���� �����
  WriteLn('������� �����');
  ReadLn(Str);

 

  // 3� ������

  // ������������� ���������� ��� ������ (�� �������� ��� ������ ������������ ���� �� 2�� ������)
  Exist := False;
  Agree := False;
  _50_na_50 := False;
  Enter := False;
  Help_friend := True;
  // ����� ������
  player := 1;

  SetLength(mas_points, Chislo_Igrokov);

  // ���� ��� ������ ���,�� ����������� ����� ���
  If number_hodov = 1 then
    last_word := '-';

  // ����� ����� = ����� ������
  point := Length(Str);

  // ���� ����� ������
  If Agree or Exist then
  Begin
    // ���� ���������� � ��� �� �����,� ������� ������������� ����������,�� ���������
    If Str[1] = last_word[Length(last_word)] then
      point := point * 2;

    // ������� ���-�� ����� � ������
    mas_points[player] := mas_points[player] + point;
  End
  Else
  Begin
    mas_points[player] := mas_points[player] - point;
  End;

  // ���� ���� ���� �� ����, �� ������������� ������������ ��������,���� ����, �� ������� ����
  if (Length(bank_bukv[player]) <> 0) and (Length(bank) <> 0) then
  Begin
    Randomize;
    If _50_na_50 then
    Begin
      // ������ 5 ��������� ���� �� ����� ���� �� ���������
      for i := 1 to 10 do
      Begin
        for j := 1 to Length(Str) do
        Begin
          If (bank_bukv[player, i] = Str[j]) then
          Begin
            // �������� �������� ����� �� ����� ���� ( ���� ���� � ������ ��� ������, �� ������ ������������ � ������ ������)
            Randm := Random(Length(bank)) + 1;
            bank_bukv[player, i] := bank[Randm];
            // �������� ����
            Delete(Str, j, 1);
            Delete(bank, Randm, 1);
            Break;
          End
        End;
      End;


      // ����� ����� ��������� �������� �� ���������
      For i := 1 to 10 do
        Write(bank_bukv[player][i]);
    End;


    i := 1;
    j := 1;
    If Help_friend then
    Begin
      // ����� ������ ����� ������� ����� �������� � �������� ������
      while bank_bukv[player][i] <> Str[3] do
      Begin
        Inc(i);
      End;

      // ����� ������ ����� ������� ����� �������� � �������� ������
      while bank_bukv[StrToInt(Str[1])][j] <> Str[5] do
      Begin
        Inc(j);
      End;

      // ������ ����� ������� � ������� �������� ����������
      Bufer := bank_bukv[player][i];
      bank_bukv[player][i] := bank_bukv[StrToInt(Str[1])][j];
      bank_bukv[StrToInt(Str[1])][j] := Bufer;
    End;

    // ����� ����� ��������� �������� �� ���������
    For i := 1 to 10 do
    Begin
      Write(bank_bukv[player][i]);
    End;
    WriteLn;
    For i := 1 to 10 do
    Begin
      Write(bank_bukv[2][i]);
    End;

  End
  Else
    Enter := True;

  // ���� ����� ����� Enter
  // Enter �� ��������� �� �����
  If Enter then
  Begin
    Inc(player);
    //������� ���-�� ��������� ���� �� �����, �� �.�. ���� ��� 3� ������ �� � �����, �� ��� �� ��������
    //����� ������ ������ ������� ��� � ���� � ����, �� ������� ����� ��������� ��������
    Inc(Count);
    { Continue }
    // ������ ��� �� �������� �.�. 3� ������ ������ ���� � �����,������� ���������� �� ������ ������
    // ����� ����� ��������� ������ ������,������� ������ ����������� � Continue
  End;

  If Agree or Exist then
    last_word := Str
  Else
    last_word := '-';


  ReadLn;

  End.
