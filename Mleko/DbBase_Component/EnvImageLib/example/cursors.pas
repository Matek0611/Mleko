{---------------------------------------------------------------------------
|
|  Module: Cursors.Pas
|
|  Description: Unit to include user defined cursors in a delphi application
|
|  History: Sep 04, 1997 MB first version
|---------------------------------------------------------------------------}
unit Cursors;

interface

{$X+,B-}

const

    crHand = 1;

(************************************************************************

  * *   * ***  *    **** *   * **** *   * *****   *   ***** *  **  *   *
  * ** ** *  * *    *    ** ** *    **  *   *    * *    *   * *  * **  *
  * * * * ***  *    **   * * * **   * * *   *   *   *   *   * *  * * * *
  * *   * *    *    *    *   * *    *  **   *   *****   *   * *  * *  **
  * *   * *    **** **** *   * **** *   *   *   *   *   *   *  **  *   *

 ************************************************************************)


implementation

uses
    {$ifdef Win32}
    Windows,  { for LoadCursor }
    {$else}
    WinTypes,
    WinProcs,
    {$endif}
    Forms;    { for Screen }

{$ifdef Win32}
  {$R Cursors.R32}
{$else}
  {$R Cursors.R16}
{$endif}

begin
    Screen.Cursors[crHand] := LoadCursor(hInstance, 'HANDCURSOR');
end.
