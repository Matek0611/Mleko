unit citCursors;

interface

uses Messages;

const
  um_cit = wm_User + $0100;

  { Message for control of cursor }
  um_citCursorBusy   = um_cit + $0000;
  um_citCursorArrow  = um_cit + $0001;
  um_citCursorReset  = um_cit + $0002;

procedure CursorBusy;
procedure CursorArrow;
procedure CursorReset;

implementation

uses Windows, Forms;

procedure CursorBusy;
begin
  SendMessage(Application.MainForm.Handle, um_citCursorBusy, 0, 0);
end;

procedure CursorArrow;
begin
  SendMessage(Application.MainForm.Handle, um_citCursorArrow, 0, 0);
end;

procedure CursorReset;
begin
  SendMessage(Application.MainForm.Handle, um_citCursorReset, 0, 0);
end;

end.
