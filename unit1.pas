unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    rbSum: TRadioButton;
    rbCom: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

type
  ali = array [0..9] of integer;
  bali = array [0..9] of string;

var
  Form1: TForm1;
  s1, s2, s3: string;
  n, dest: integer;

implementation

{$R *.lfm}

{ TForm1 }

function numb(s: string; kb, n: integer; mb: bali; mc: ali): integer;
var
  x, i, j: integer;
begin
  x := 0;
  for i := 1 to length(s) do
  begin
    x := x * n;
    for j := 0 to kb - 1 do
      if mb[j] = copy(s, i, 1) then
        x := x + mc[j];
  end;
  numb := x;
end;

procedure pruv(s1, s2, s3: string; n, kb: integer; var col: integer; mb: bali;
  mc: ali; memo1: TMemo);
var
  a, b, c: integer;
begin
  a := numb(s1, kb, n, mb, mc);
  b := numb(s2, kb, n, mb, mc);
  c := numb(s3, kb, n, mb, mc);
  case dest of
    1:
      if a + b = c then
      begin
        memo1.Lines.Add(IntToStr(a) + '+' + IntToStr(b) + '=' + IntToStr(c));
        col := col + 1;
      end;
    3:
      if a * b = c then
      begin
        memo1.Lines.Add(IntToStr(a) + '*' + IntToStr(b) + '=' + IntToStr(c));
        col := col + 1;
      end;
  end;

end;

procedure razbor(s: string; var kb: integer; var mb: bali; memo1: TMemo);
var
  i, j: integer;
begin
  for i := 1 to length(s) do
  begin
    j := -1;
    repeat
      j := j + 1
    until ((j = kb) or (mb[j] = copy(s, i, 1)));
    if j = kb then
      if kb = 10 then
      begin
        memo1.Lines.Add('Плохие данные');
        break;
      end
      else
      begin
        mb[kb] := copy(s, i, 1);
        kb := kb + 1;
      end;
  end;
end;

procedure reshu(s1, s2, s3: string; n: integer; memo1: TMemo);
var
  mc, us: ali;
  mb: bali;
  kb, col, i, i0, i1, i2, i3, i4, i5, i6, i7, i8, i9: integer;
begin
  kb := 0;
  col := 0;
  for i := 0 to 9 do
    us[i] := 1;
  razbor(s1, kb, mb, memo1);
  if kb < n then
  begin
    razbor(s2, kb, mb, memo1);
    if kb < n then
    begin
      razbor(s3, kb, mb, memo1);
      if kb < n then
      begin
        for i0 := 0 to n - 1 do
        begin
          mc[0] := i0;
          us[i0] := 0;
          if kb > 1 then
            for i1 := 0 to n - 1 do
            begin
              if us[i1] = 1 then
              begin
                mc[1] := i1;
                us[i1] := 0;
                if kb > 2 then
                  for i2 := 0 to n - 1 do
                  begin
                    if us[i2] = 1 then
                    begin
                      mc[2] := i2;
                      us[i2] := 0;
                      if kb > 3 then
                        for i3 := 0 to n - 1 do
                        begin
                          if us[i3] = 1 then
                          begin
                            mc[3] := i3;
                            us[i3] := 0;
                            if kb > 4 then
                              for i4 := 0 to n - 1 do
                              begin
                                if us[i4] = 1 then
                                begin
                                  mc[4] := i4;
                                  us[i4] := 0;
                                  if kb > 5 then
                                    for i5 := 0 to n - 1 do
                                    begin
                                      if us[i5] = 1 then
                                      begin
                                        mc[5] := i5;
                                        us[i5] := 0;
                                        if kb > 6 then
                                          for i6 := 0 to n - 1 do
                                          begin
                                            if us[i6] = 1 then
                                            begin
                                              mc[6] := i6;
                                              us[i6] := 0;
                                              if kb > 7 then
                                                for i7 := 0 to n - 1 do
                                                begin
                                                  if us[i7] = 1 then
                                                  begin
                                                    mc[7] := i7;
                                                    us[i7] := 0;
                                                    if kb > 8 then
                                                      for i8 := 0 to n - 1 do
                                                      begin
                                                        if us[i8] = 1 then
                                                        begin
                                                          mc[8] := i8;
                                                          us[i8] := 0;
                                                          if kb > 9 then
                                                            for i9 := 0 to n - 1 do
                                                            begin
                                                              if us[i9] = 1 then
                                                              begin
                                                                mc[9] := i9;
                                                                us[i9] := 0;
                                                                pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                                                                us[i9] := 1;
                                                              end;
                                                            end
                                                          else
                                                            pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                                                          us[i8] := 1;
                                                        end;
                                                      end
                                                    else
                                                      pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                                                    us[i7] := 1;
                                                  end;
                                                end
                                              else
                                                pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                                              us[i6] := 1;
                                            end;
                                          end
                                        else
                                          pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                                        us[i5] := 1;
                                      end;
                                    end
                                  else
                                    pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                                  us[i4] := 1;
                                end;
                              end
                            else
                              pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                            us[i3] := 1;
                          end;
                        end
                      else
                        pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                      us[i2] := 1;
                    end;
                  end
                else
                  pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
                us[i1] := 1;
              end;
            end
          else
            pruv(s1, s2, s3, n, kb, col, mb, mc, memo1);
          us[i0] := 1;
        end;
      end;
    end;
    if col = 0 then
      memo1.Lines.add('Нет вариантов');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var f:boolean;
begin
  f := rbSum.Checked or rbCom.Checked;
  if not(f) then
  else
    begin
      if rbSum.Checked then
        dest := 1;
      if rbCom.Checked then
        dest := 3;
      s1 := edit1.Text;
      s2 := edit2.Text;
      s3 := edit3.Text;
      n := StrToInt(edit4.Text);
      memo1.Lines.Clear;
      reshu(s1, s2, s3, n, memo1);
    end
end;

end.
