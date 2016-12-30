{---------------------------------------------------------------------------
|
|  Module: UrlJmp.Pas
|
|  Description: Unit to jump to a URL using the default web browser.
|
|  History: May 31, 1997 MB first version
|           Sep 04, 1997 MB moved from OpenUrl.Dpr
|---------------------------------------------------------------------------}
unit UrlJmp;

interface

{$X+,B-}

procedure JumpToURL( const URL : AnsiString );


(************************************************************************

  * *   * ***  *    **** *   * **** *   * *****   *   ***** *  **  *   *
  * ** ** *  * *    *    ** ** *    **  *   *    * *    *   * *  * **  *
  * * * * ***  *    **   * * * **   * * *   *   *   *   *   * *  * * * *
  * *   * *    *    *    *   * *    *  **   *   *****   *   * *  * *  **
  * *   * *    **** **** *   * **** *   *   *   *   *   *   *  **  *   *

 ************************************************************************)

implementation

uses
  Windows,
  ShellApi;   { for FindExecutable }

procedure JumpToURL( const URL : AnsiString );
begin
    {$Warnings Off}
    ShellExecute(0, PChar('open'), PChar(URL), '', '', SW_SHOWNORMAL);
    {$Warnings On}
end;

end.
