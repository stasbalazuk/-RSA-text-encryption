unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    procedure Btn_codefyClick(Sender: TObject);
    procedure sMemo1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//простое число ложь/истина
Function p_number(X: LongInt): boolean;
var
i: LongInt;
Begin
 if x>1 then
 begin
 Result:=false;
   for i:=2 to trunc(sqrt(x)) do
   if x mod i = 0 then Exit;
 Result:=true;
 end else Result:=false;
end;

// 1
//генерируем два простых числа больше kp
Procedure Generate_namber(var PP,QQ: Byte);
begin
 //генерируем числа больше kp
 While not ((qq>50)and(p_number(qq))) do
   qq:=Random(500);
 While not ((pp>50)and(p_number(pp))and(pp<qq)) do
   pp:=Random(500);
end;

// 2
//умножение p*q -->n
Function Sub(p,q: word):Word;
begin
 Result:=p*q;
end;

// 3
//высчитываем функцию эйлера   --> m
Function Eler(p,q: word):Word;
begin
 Result:=(p-1)*(q-1);
end;


//наименьший общий делитель
Function HOD(a,b:Integer):Integer;
begin
while (a<>0)and(b<>0) do
 if a>b then a :=a mod b
    else b:=b mod a;
 if a=0 then Result:=b
    else Result:=a;
end;

Function Pow(x:extended; y:integer):extended;
var i:integer;
begin
Result:=1;
if y=1
 then Result:=x;
if y>1
 then
  for i:=1 to y do
   Result:=Result*x;
end;


// 4
//найти минимальное число не имеющего
//общих сомножителей с m  --> d
Function Not_efficient(m:Word):Word;
var i,d: Integer;
    yeah: boolean;
begin
   {Это не подходит, т.к. я нахожу
   число которое не являющееся
   одним из множителей M,
   а надо не явяющееся одним из
   множителей!!! }
{for i:=2 to m-1 do
 if m mod i <> 0 then break;                      }

d:=1;
repeat
inc(d);
yeah:=true;
  for i:=2 to d do
    if ((d mod i = 0)and(m mod i = 0)) then yeah:=false;
until yeah;
Result:=d;
end;


// 5
//вычисляется соотношение (e*d)mod(m) --> E
Function Correlation(d,m: Word):Word;
begin
 Result:=Trunc((1+m)/d);
end;

// 6
//соответствующее id буквы в алфавите
Function RusCharToInt(ch: char):byte;
Const S:array[0..33] of char=
 (' ','А','Б','В','Г','Д','Е','Ё','Ж','З','И','Й','К','Л','М','Н','О','П',
  'Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я');
Var i: byte;
begin
for i:=0 to high(s) do
  if ch=s[i] then break;
Result:=i;
end;

// 7
//Шифруем с помощью открытого ключа (e,n)
Function Codefy(N_alf,e,n:Integer):Int64;
begin
Result:=Round(Pow(N_alf,e)) mod (n);
end;


//Шифрование                      Memo1 ---> Memo2
procedure TForm1.Btn_codefyClick(Sender: TObject);
var Cod_alf: array of byte;
    P,Q : Byte;
    N,M,E,D: Word;
    I: Word;
begin
p:=3; q:=11; // по контр. примеру
//Generate_namber(P,Q); //1
Label5.Caption:='p= '+IntToStr(p);
Label6.Caption:='q= '+IntToStr(q);
N:=Sub(P,Q); // 2
Label4.Caption:=IntToStr(N);
M:=Eler(P,Q); // 3
Label8.Caption:='M= '+IntToStr(M);
D:=Not_efficient(M); // 4
Label3.Caption:=IntToStr(D);
E:=Correlation(D,M); // 5      //по контр. примеру = 7
Label7.Caption:='E= '+IntToStr(E);

(*
И вот слово ГАЗ={4,1,9} Г-4буква в алф. А- первая З-девятая
и вот зашифр. должно получица {16,1,15}  по функц. --> Codefy
*)

//числовой эквивалент по алфавиту
 //выделяем размер массива под коды симв. и под. шифр. символы -->
 SetLength(Cod_alf, Memo1.GetTextLen);
 for i:=0 to Memo1.GetTextLen do
   Cod_alf[i]:=RusCharToInt(Memo1.Text[i+1]);

 Memo2.Text:='';
 for i:=0 to high(Cod_alf) do
    Memo2.Text:=Memo2.Text+floatToStr(Codefy(Cod_alf[i],E,N))+' '; //подставь что комент.ниже
     // --->  Codefy(Cod_alf[i],E,N)  <--- это и будет зашифр. слово, а пока
     //будет выдавать порядк. номер. алфавита
     //проверка Codefy(Cod_alf[i],E,N)^d mod n=номер буквы в алф.

end;

//только русские буквы
procedure TForm1.sMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  Case key of
    'А'..'Я','Ё': ;
    'а'..'я','ё': key:=ansiUpperCase(key)[1];
    #8,#32  : ;
  else key:=#0;
  end;
end;

end.
