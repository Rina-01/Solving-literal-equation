program project1;

type
  ali=array [0..9] of integer;
  bali=array [0..9] of string;

var
  s1,s2,s3:string; n,kb,col:integer;
  mc,us:ali; mb:bali; i,i0,i1,i2,i3,i4,i5,i6,i7,i8,i9:integer;

function numb(s:string; kb,n:integer; mb:bali; mc:ali):integer;
var x,i,j:integer;
begin
  x:=0;
  for i:=1 to length(s) do
    begin
      x:=x*n;
      for j:=0 to kb do
        if mb[j]=copy(s,i,1) then
          x:=x+mc[j]
    end;
  numb:=x
end;

procedure pruv(s1,s2,s3:string; n,kb:integer; var col:integer; mb:bali; mc:ali);
var a,b,c:integer;
begin
  a:=numb(s1,kb,n,mb,mc);
  b:=numb(s2,kb,n,mb,mc);
  c:=numb(s3,kb,n,mb,mc);
  if a+b=c then
    begin
      writeln(a,'+',b,'=',c);
      col:=col+1
    end
end;

procedure razbor(s:string; var kb:integer; var mb:bali);
var i,j:integer;
begin
  for i:=1 to length(s) do
    begin
      j:=-1;
      repeat j:=j+1
      until ((j=kb) or (mb[j]=copy(s,i,1)));
      if j=kb then
        if kb=10 then
          begin
            writeln('mistake');
            break
          end
        else
          begin
            mb[kb]:=copy(s,i,1);
            kb:=kb+1
          end
    end
end;

begin
  writeln('I want term 1, term 2, amount and number system.');
  writeln('term 1: '); readln(s1);
  writeln('term 2: '); readln(s2);
  writeln('amount: '); readln(s3);
  writeln('number system: '); readln(n);
  kb:=0; col:=0;
  for i:=0 to 9 do us[i]:=1;
  razbor(s1,kb,mb);
  if kb<n then
  begin
  razbor(s2,kb,mb);
  if kb<n then
  begin
  razbor(s3,kb,mb);
  if kb<n then
  begin
    for i0:=0 to n-1 do
    begin
      mc[0]:=i0; us[i0]:=0;
      if kb>1 then
        for i1:=0 to n-1 do
        begin
          if us[i1]=1 then
          begin
            mc[1]:=i1; us[i1]:=0;
            if kb>2 then
              for i2:=0 to n-1 do
              begin
                if us[i2]=1 then
                begin
                  mc[2]:=i2; us[i2]:=0;
                  if kb>3 then
                    for i3:=0 to n-1 do
                    begin
                      if us[i3]=1 then
                      begin
                        mc[3]:=i3; us[i3]:=0;
                        if kb>4 then
                          for i4:=0 to n-1 do
                          begin
                            if us[i4]=1 then
                            begin
                              mc[4]:=i4; us[i4]:=0;
                              if kb>5 then
                                for i5:=0 to n-1 do
                                begin
                                  if us[i5]=1 then
                                  begin
                                    mc[5]:=i5; us[i5]:=0;
                                    if kb>6 then
                                      for i6:=0 to n-1 do
                                      begin
                                        if us[i6]=1 then
                                        begin
                                          mc[6]:=i6; us[i6]:=0;
                                          if kb>7 then
                                            for i7:=0 to n-1 do
                                            begin
                                              if us[i7]=1 then
                                              begin
                                                mc[7]:=i7; us[i7]:=0;
                                                if kb>8 then
                                                  for i8:=0 to n-1 do
                                                  begin
                                                    if us[i8]=1 then
                                                    begin
                                                      mc[8]:=i8; us[i8]:=0;
                                                      if kb>9 then
                                                        for i9:=0 to n-1 do
                                                        begin
                                                          if us[i9]=1 then
                                                          begin
                                                            mc[9]:=i9; us[i9]:=0;
                                                            pruv(s1,s2,s3,n,kb,col,mb,mc);
                                                            us[i9]:=1
                                                          end
                                                        end
                                                      else pruv(s1,s2,s3,n,kb,col,mb,mc);
                                                      us[i8]:=1
                                                    end
                                                  end
                                                else pruv(s1,s2,s3,n,kb,col,mb,mc);
                                                us[i7]:=1
                                              end
                                            end
                                          else pruv(s1,s2,s3,n,kb,col,mb,mc);
                                          us[i6]:=1
                                        end
                                      end
                                    else pruv(s1,s2,s3,n,kb,col,mb,mc);
                                    us[i5]:=1
                                  end
                                end
                              else pruv(s1,s2,s3,n,kb,col,mb,mc);
                              us[i4]:=1
                            end
                          end
                        else pruv(s1,s2,s3,n,kb,col,mb,mc);
                        us[i3]:=1
                      end
                    end
                  else pruv(s1,s2,s3,n,kb,col,mb,mc);
                  us[i2]:=1
                end
              end
            else pruv(s1,s2,s3,n,kb,col,mb,mc);
            us[i1]:=1
          end
        end
      else pruv(s1,s2,s3,n,kb,col,mb,mc);
      us[i0]:=1
    end
  end
  end;
  if col=0 then writeln('No')
  end;
  readln
end.
