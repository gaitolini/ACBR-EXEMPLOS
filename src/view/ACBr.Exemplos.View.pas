//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit ACBr.Exemplos.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.StdCtrls,
  Vcl.CategoryButtons,
  Vcl.Buttons,
  Vcl.ImgList,
  Vcl.Imaging.PngImage,
  Vcl.ComCtrls,
  Vcl.ActnList, Vcl.WinXPanels, Vcl.Imaging.jpeg;

type
  TViewMainACBr = class(TForm)
    pnlToolbar: TPanel;
    svMain: TSplitView;
    catMenuItems: TCategoryButtons;
    imlIcons: TImageList;
    imgMenu: TImage;
    ActionList1: TActionList;
    actHome: TAction;
    actLayout: TAction;
    actPower: TAction;
    lblTitle: TLabel;
    Image1: TImage;
    cpMain: TCardPanel;
    cardLayoutOption: TCard;
    pnlSettings: TPanel;
    lblLog: TLabel;
    lblVclStyle: TLabel;
    grpDisplayMode: TRadioGroup;
    grpPlacement: TRadioGroup;
    grpCloseStyle: TRadioGroup;
    lstLog: TListBox;
    grpAnimation: TGroupBox;
    lblAnimationDelay: TLabel;
    lblAnimationStep: TLabel;
    chkUseAnimation: TCheckBox;
    trkAnimationDelay: TTrackBar;
    trkAnimationStep: TTrackBar;
    chkCloseOnMenuClick: TCheckBox;
    cbxVclStyles: TComboBox;
    cardHome: TCard;
    cardPowerSettings: TCard;
    cardBoletos: TCard;
    Image2: TImage;
    actBoleto: TAction;
    actPIX: TAction;
    cardPix: TCard;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
    procedure grpDisplayModeClick(Sender: TObject);
    procedure grpPlacementClick(Sender: TObject);
    procedure grpCloseStyleClick(Sender: TObject);
    procedure svMainClosed(Sender: TObject);
    procedure svMainClosing(Sender: TObject);
    procedure svMainOpened(Sender: TObject);
    procedure svMainOpening(Sender: TObject);
    procedure catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
    procedure imgMenuClick(Sender: TObject);
    procedure chkUseAnimationClick(Sender: TObject);
    procedure trkAnimationDelayChange(Sender: TObject);
    procedure trkAnimationStepChange(Sender: TObject);
    procedure actHomeExecute(Sender: TObject);
    procedure actLayoutExecute(Sender: TObject);
    procedure actPowerExecute(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure actBoletoExecute(Sender: TObject);
    procedure actPIXExecute(Sender: TObject);
  private
    procedure Log(const Msg: string);
  public
  end;

var
  ViewMainACBr: TViewMainACBr;

implementation

uses
  Vcl.Themes;

{$R *.dfm}

procedure TViewMainACBr.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);

  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  cpMain.ActiveCard := cardHome;
  svMain.Open;
end;

procedure TViewMainACBr.cbxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbxVclStyles.Text);
end;

procedure TViewMainACBr.imgMenuClick(Sender: TObject);
begin
  svMain.Opened := not svMain.Opened;
end;

procedure TViewMainACBr.grpDisplayModeClick(Sender: TObject);
begin
  svMain.DisplayMode := TSplitViewDisplayMode(grpDisplayMode.ItemIndex);
end;

procedure TViewMainACBr.grpCloseStyleClick(Sender: TObject);
begin
  svMain.CloseStyle := TSplitViewCloseStyle(grpCloseStyle.ItemIndex);
end;

procedure TViewMainACBr.grpPlacementClick(Sender: TObject);
begin
  svMain.Placement := TSplitViewPlacement(grpPlacement.ItemIndex);
end;

procedure TViewMainACBr.svMainClosed(Sender: TObject);
begin
  // When TSplitView is closed, adjust ButtonOptions and Width
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions - [boShowCaptions];
  if svMain.CloseStyle = svcCompact then
    catMenuItems.Width := svMain.CompactWidth;
end;

procedure TViewMainACBr.svMainClosing(Sender: TObject);
begin
//
end;

procedure TViewMainACBr.svMainOpened(Sender: TObject);
begin
  // When not animating, change size of catMenuItems when TSplitView is opened
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := svMain.OpenedWidth;
end;

procedure TViewMainACBr.svMainOpening(Sender: TObject);
begin
  // When animating, change size of catMenuItems at the beginning of open
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := svMain.OpenedWidth;
end;

procedure TViewMainACBr.chkUseAnimationClick(Sender: TObject);
begin
  svMain.UseAnimation := chkUseAnimation.Checked;
  lblAnimationDelay.Enabled := svMain.UseAnimation;
  trkAnimationDelay.Enabled := svMain.UseAnimation;
  lblAnimationStep.Enabled := svMain.UseAnimation;
  trkAnimationStep.Enabled := svMain.UseAnimation;
end;

procedure TViewMainACBr.trkAnimationDelayChange(Sender: TObject);
begin
  svMain.AnimationDelay := trkAnimationDelay.Position * 5;
  lblAnimationDelay.Caption := 'Animation Delay (' + IntToStr(svMain.AnimationDelay) + ')';
end;

procedure TViewMainACBr.trkAnimationStepChange(Sender: TObject);
begin
  svMain.AnimationStep := trkAnimationStep.Position * 5;
  lblAnimationStep.Caption := 'Animation Step (' + IntToStr(svMain.AnimationStep) + ')';
end;

procedure TViewMainACBr.actBoletoExecute(Sender: TObject);
begin
  Log(actBoleto.Caption + ' Clicked');
  if svMain.Opened and chkCloseOnMenuClick.Checked then
    svMain.Close;

  cpMain.ActiveCard := cardBoletos;
end;

procedure TViewMainACBr.actHomeExecute(Sender: TObject);
begin
  Log(actHome.Caption + ' Clicked');
  if svMain.Opened and chkCloseOnMenuClick.Checked then
    svMain.Close;

  cpMain.ActiveCard := cardHome;
end;

procedure TViewMainACBr.actLayoutExecute(Sender: TObject);
begin
  Log(actLayout.Caption + ' Clicked');
  if svMain.Opened and chkCloseOnMenuClick.Checked then
    svMain.Close;

  cpMain.ActiveCard := cardLayoutOption;
end;

procedure TViewMainACBr.actPIXExecute(Sender: TObject);
begin
  Log(actPIX.Caption + ' Clicked');
  if svMain.Opened and chkCloseOnMenuClick.Checked then
    svMain.Close;

  cpMain.ActiveCard := cardPix;
end;

procedure TViewMainACBr.actPowerExecute(Sender: TObject);
begin
  Log(actPower.Caption + ' Clicked');
  if svMain.Opened and chkCloseOnMenuClick.Checked then
    svMain.Close;

  cpMain.ActiveCard := cardPowerSettings;
end;

procedure TViewMainACBr.catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
begin
  // Prevent the catMenuItems Category group from being collapsed
  catMenuItems.Categories[0].Collapsed := False;
end;

procedure TViewMainACBr.Log(const Msg: string);
var
  Idx: Integer;
begin
  Idx := lstLog.Items.Add(Msg);
  lstLog.TopIndex := Idx;
end;

end.
