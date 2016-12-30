
//////////////////////////////////////////////////
//  Copyright © 1998-2007 Core Lab. All right reserved.
//  Virtual table design
//  Created:            23.08.99
//////////////////////////////////////////////////

{$IFNDEF CLR}
{$I Dac.inc}

unit VTDesign;
{$ENDIF}
interface
uses
  Classes, Forms,
{$IFDEF CLR}
  Borland.Vcl.Design.DesignIntf, Borland.Vcl.Design.DesignEditors,
{$ELSE}
{$IFDEF VER6P}
  DesignIntf, DesignEditors,
{$ELSE}
  DsgnIntf,
{$ENDIF}
{$ENDIF}
 DADesign, DADesignUtils;

type
  TVTFieldsEditor = class(TDAFieldsEditor);

  TVirtualTableEditor = class (TDADataSetEditor)
  private
    Items: TStrings;

    procedure StrProc(const S: string);
    procedure DataSetsDblClick(Sender: TObject);

    procedure ShowVTDataEditor;
    procedure ShowAssignDataSet;
    procedure LoadData;
    procedure SaveData;
    procedure ShowAbout;
  protected
    procedure InitVerbs; override;
  public
    procedure Edit; override;
  end;

procedure Register;

implementation
uses
{$IFDEF CLR}
  Borland.VCL.Design.DSDesign,
{$ELSE}
{$IFNDEF BCB}
{$IFNDEF LINUX}
  DSDesign,
{$ENDIF}
{$ENDIF}
{$ENDIF}
  Windows, DB, VirtualTable, Controls, Dialogs, Buttons, StdCtrls,
  TypInfo, Graphics, VTDataEditor, SysUtils;

//{$R DADesign.res}

{$IFDEF LINUX}
  {$DEFINE OLDDESIGNER}
{$ENDIF}
{$IFDEF BCB}
  {$DEFINE OLDDESIGNER}
{$ENDIF}

{$I DacVer.inc}

{$IFDEF OLDDESIGNER}
var
  DataSetEditorClass: TComponentEditorClass;
{$ENDIF}



procedure TVirtualTableEditor.InitVerbs;
begin
  AddVerb('Fields &Editor...', ShowFieldsEditor);
  AddVerb('VirtualTable E&ditor...', ShowVTDataEditor);
  AddVerb('Assign DataSet...', ShowAssignDataSet);
  AddVerb('Load from file...', LoadData);
  AddVerb('Save to file...', SaveData);
  AddVerb('&About...', ShowAbout);

  inherited;
end;

procedure TVirtualTableEditor.Edit;
begin
  if GetVerbCount > 1 then
    ExecuteVerb(1);
end;

procedure TVirtualTableEditor.ShowVTDataEditor;
begin
  {$IFDEF CLR}CoreLab.Dac.Design.{$ENDIF}DADesign.ShowEditor(TVTDataEditorForm, TDADesignUtils, Component, Designer);
end;

procedure TVirtualTableEditor.LoadData;
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.DefaultExt := 'vtd';
    OpenDialog.Filter :=
      'Virtual Table Data (*.vtd)|*.vtd|' +
      'XML File (*.xml)|*.xml|' +
      'Any File (*.*)|*.*';
    OpenDialog.FileName := '*.vtd';
    if OpenDialog.Execute then
      TVirtualTable(Component).LoadFromFile(OpenDialog.FileName);
  finally
    OpenDialog.Free;
  end;
end;

procedure TVirtualTableEditor.SaveData;
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.DefaultExt := 'vtd';
    SaveDialog.Filter :=
      'Virtual Table Data (*.vtd)|*.vtd|' +
      'XML File (*.xml)|*.xml|' +
      'Any File (*.*)|*.*';
    SaveDialog.FileName := 'Data1';
    if SaveDialog.Execute then
      if LowerCase(ExtractFileExt(SaveDialog.FileName)) = '.xml' then
        TVirtualTable(Component).SaveToXML(SaveDialog.FileName)
      else
        TVirtualTable(Component).SaveToFile(SaveDialog.FileName);
  finally
    SaveDialog.Free;
  end;
end;

procedure TVirtualTableEditor.ShowAbout;
begin
  Application.MessageBox(
    'VirtualTable component'#13 +
    'Version ' + DacVersion + ' free'#13 +
    'Copyright © 1998-2007 Core Lab.'#13 +
    'All right reserved.'#13#13
    +
    'Web: www.crlab.com'#13 +
    'eMail: support@crlab.com'#13#13
    , 'About', MB_OK or MB_ICONINFORMATION);
end;

procedure TVirtualTableEditor.DataSetsDblClick(Sender: TObject);
begin
  TForm(TListBox(Sender).Owner).ModalResult := mrOk;
end;

procedure TVirtualTableEditor.StrProc(const S: string);
begin
  if S <> Component.Name then
    Items.Add(S);
end;

procedure TVirtualTableEditor.ShowAssignDataSet;
var
  Form: TForm;
  List: TListBox;
  TypeData: TTypeData;  
begin
  Form := TForm.Create(nil);
  try
    Form.BorderStyle := bsDialog;
    Form.Height := 250;
    Form.Width := 300;
    Form.Position := poScreenCenter;
    Form.Caption := 'Available DataSets';

    List := TListBox.Create(Form);
    with List do begin
      Parent := Form;
      Left := 8;
      Top := 8;
      Width := Form.ClientWidth - 16;
      Height := Form.ClientHeight - 53;
      Sorted := True;
      OnDblClick := DataSetsDblClick;
    end;
    Items := List.Items;

    with TButton.Create(Form) do begin
      Parent := Form;
      Left := 128;
      Top := 192;
      Caption := 'Ok';
      Font.Style := [fsBold];
      ModalResult := mrOk;
      Default := True;
    end;

    with TButton.Create(Form) do begin
      Parent := Form;
      Left := 208;
      Top := 192;
      Caption := 'Cancel';
      Font.Style := [fsBold];
      ModalResult := mrCancel;
      Cancel := True;
    end;

  {$IFDEF CLR}
    TypeData := TTypeData.Create(TypeOf(TDataSet));
    Designer.GetComponentNames(TypeData, StrProc);
  {$ELSE}
    TypeData.ClassType := TDataSet;
    Designer.GetComponentNames(@TypeData, StrProc);
  {$ENDIF}
    if List.Items.Count > 0 then
      List.ItemIndex := 0;

    if (Form.ShowModal = mrOk) and (List.ItemIndex >= 0) then
      TVirtualTable(Component).Assign(
        TDataSet(Designer.GetComponent(List.Items[List.ItemIndex])));
  finally
    Form.Free;
  end;
end;

procedure Register;
{$IFDEF OLDDESIGNER}
var
  DataSet: TDataSet;
  DataSetEditor: TComponentEditor;
{$ENDIF}
begin
// WAR need before register TOraQuery, TOraSmartQuery

{$IFDEF OLDDESIGNER}
{$WARNINGS OFF}
{$IFDEF VER6P}
  DataSet := nil;
  try
    DataSet := TDataSet.Create(nil);
    DataSetEditor := Pointer(Integer(GetComponentEditor(DataSet, nil)) - 20);
    DataSetEditorClass := TComponentEditorClass(DataSetEditor.ClassType);
  finally
    DataSet.Free;
  end;
{$ELSE}
  DataSet := nil;
  DataSetEditor := nil;
  try
    DataSet := TDataSet.Create(nil);
    DataSetEditor := GetComponentEditor(DataSet, nil);
    DataSetEditorClass := TComponentEditorClass(DataSetEditor.ClassType);
  finally
    DataSetEditor.Free;
    DataSet.Free;
  end;
{$ENDIF}
{$WARNINGS ON}
{$ENDIF}

  RegisterPropertyEditor(TypeInfo(DB.TFields), TVirtualTable, 'Fields',
    TVTFieldsEditor);

  RegisterComponentEditor(TVirtualTable, TVirtualTableEditor);
end;

end.
