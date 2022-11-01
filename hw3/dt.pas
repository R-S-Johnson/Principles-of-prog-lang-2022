program dt;

uses sysutils;


type
day_range = 1 .. 31;
month_range = 1 .. 12;

date_t = record
    year: integer;
    month: month_range;
    day: day_range;
end;

procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
begin
  dt.year := year;
  dt.month := month;
  dt.day := day;
end;

procedure init_date1 (var dt : date_t);
var
month, day, year : Word;
str_tmp : string;
begin
  DecodeDate (Date, year, month, day);
  str(year, str_tmp);
  dt.year := StrToInt(str_tmp);
  str(month, str_tmp);
  dt.month := StrToInt(str_tmp);
  str(day, str_tmp);
  dt.day := StrToInt(str_tmp);
end;

function date_equal (date1 : date_t; date2 : date_t) : boolean;
begin
  date_equal := False;
  if ((date1.year = date2.year) and (date1.month = date2.month) and (date1.day = date2.day)) then
    date_equal := True;
end;

function date_less_than (date1 : date_t; date2 : date_t) : boolean;
begin
  date_less_than := False;
  if (date1.year < date2.year) then
    date_less_than := True
  else if (date1.year = date2.year) then
    if (date1.month < date2.month) then
      date_less_than := True
    else if (date1.month = date2.month) then
      if (date1.day < date2.day) then
      date_less_than := True
end;

function month_str (month : month_range) : string;
begin
  case (month) of
    1 : month_str := 'January';
    2 : month_str := 'February';
    3 : month_str := 'March';
    4 : month_str := 'April';
    5 : month_str := 'May';
    6 : month_str := 'June';
    7 : month_str := 'July';
    8 : month_str := 'August';
    9 : month_str := 'September';
    10 : month_str := 'October';
    11 : month_str := 'November';
    12 : month_str := 'December';
    end;
end;

procedure format_date (dt : date_t; var ret_str : string);
begin
  ret_str := Concat(month_str(dt.month), ' ', IntToStr(dt.day), ', ', IntToStr(dt.year));
end;

procedure next_day (var dt : date_t);
    function leap_year (year : integer) : boolean;
    begin
    leap_year := False;
      if ((year mod 4) = 0) then
        leap_year := True;
        if ((year mod 100) = 0) then
          leap_year := False;
          if ((year mod 400) = 0) then
            leap_year := True;
    end;

    function month_length (month: month_range; leap: boolean): day_range;
    begin
      month_length := 31;
      if ((month = 4) or (month = 6) or (month = 9) or (month = 11)) then
        month_length := 30;
      if ((month = 2) and leap) then
        month_length := 29;
      if ((month = 2) and (not leap)) then
        month_length := 28;
    end;

begin
  if ((dt.month = 12) and (dt.day = 31)) then
  begin
    dt.year := dt.year + 1;
    dt.month := 1;
    dt.day := 1;
  end
  else if (dt.day = month_length(dt.month, leap_year(dt.year))) then
  begin
    dt.month := dt.month + 1;
    dt.day := 1;
  end
  else
    dt.day := dt.day + 1;
end;

var
d1, d2, d3 : date_t;
format_str : string;

begin
  init_date1 (d1);
  init_date (d2, 30, 12, 1999);
  init_date (d3, 1, 1, 2000);

  format_date(d1, format_str);
  WriteLn ('d1: ' + format_str);
  format_date(d2, format_str);
  WriteLn ('d2: ' + format_str);
  format_date(d3, format_str);
  WriteLn ('d3: ' + format_str);
  WriteLn ();

  if (date_less_than(d1, d2)) then
    WriteLn ('d1 < d2? TRUE')
  else
    WriteLn ('d1 < d2? FALSE');
  
  if (date_less_than(d2, d3)) then
    WriteLn ('d2 < d3? TRUE')
  else
    WriteLn ('d2 < d3? FALSE');
  WriteLn ();


  next_day(d2);
  format_date(d2, format_str);
  WriteLn ('next day d2: ' + format_str);
  
  if (date_less_than(d2, d3)) then
    WriteLn ('d2 < d3? TRUE')
  else
    WriteLn ('d2 < d3? FALSE');

  if (date_equal(d2, d3)) then
    WriteLn ('d2 = d3? TRUE')
  else
    WriteLn ('d2 = d3? FALSE');

  if ((not date_less_than(d2, d3)) and (not date_equal(d2, d3))) then
    WriteLn ('d2 > d3? TRUE')
  else
    WriteLn ('d2 > d3? FALSE');
  WriteLn ();

  next_day(d2);
  format_date(d2, format_str);
  WriteLn ('next day d2: ' + format_str);
  if (date_equal(d2, d3)) then
    WriteLn ('d2 = d3? TRUE')
  else
    WriteLn ('d2 = d3? FALSE');
  WriteLn ();
  
  init_date(d1, 28, 2, 1529);
  WriteLn ('initialized d1 to February 28, 1529');
  next_day(d1);
  format_date(d1, format_str);
  WriteLn ('next day d1: ' + format_str);
  WriteLn ();

  init_date(d1, 28, 2, 1460);
  WriteLn ('initialized d1 to February 28, 1460');
  next_day(d1);
  format_date(d1, format_str);
  WriteLn ('next day d1: ' + format_str);
  WriteLn ();

  init_date(d1, 28, 2, 1700);
  WriteLn ('initialized d1 to February 28, 1700');
  next_day(d1);
  format_date(d1, format_str);
  WriteLn ('next day d1: ' + format_str);
  WriteLn ();

  init_date(d1, 28, 2, 1600);
  WriteLn ('initialized d1 to February 28, 1600');
  next_day(d1);
  format_date(d1, format_str);
  WriteLn ('next day d1: ' + format_str);
  WriteLn ();


end.