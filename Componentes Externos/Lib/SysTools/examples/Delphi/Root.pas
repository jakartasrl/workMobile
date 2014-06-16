(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is TurboPower SysTools
 *
 * The Initial Developer of the Original Code is
 * TurboPower Software
 *
 * Portions created by the Initial Developer are Copyright (C) 1996-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

unit Root;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TRootForm = class(TForm)
    ObserverBtn: TButton;
    MediatorBtn: TButton;
    ChainBtn: TButton;
    SingletonBtn: TButton;
    ExitBtn: TButton;
    procedure ObserverBtnClick(Sender: TObject);
    procedure ChainBtnClick(Sender: TObject);
    procedure MediatorBtnClick(Sender: TObject);
    procedure SingletonBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RootForm: TRootForm;

implementation

uses Chain, Medtr, Observer, Singlton;


{$R *.DFM}

procedure TRootForm.ObserverBtnClick(Sender: TObject);
begin
  Application.CreateForm(TObserverForm, ObserverForm);
  ObserverForm.ShowModal;
end;

procedure TRootForm.ChainBtnClick(Sender: TObject);
begin
  Application.CreateForm(TChainForm, ChainForm);
  ChainForm.ShowModal;
end;

procedure TRootForm.MediatorBtnClick(Sender: TObject);
begin
  Application.CreateForm(TMediatorForm, MediatorForm);
  MediatorForm.ShowModal;
end;

procedure TRootForm.SingletonBtnClick(Sender: TObject);
begin
  Application.CreateForm(TSingletonForm, SingletonForm);
  SingletonForm.ShowModal;
end;

procedure TRootForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

end.
