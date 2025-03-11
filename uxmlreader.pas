unit uxmlreader;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  (*

  TXmlReader - This is the main class that controls the Xml File.

  *)

  TXmlReader = class
  private
    FCurrentRecord: Integer;
    DataFile: TStringList;
    FFieldList: TObjectList;
    FValueList: TObjectList;
    Line: Integer;
    RecordStartLine: Integer;
    RecordEndLine: Integer;
    EndOfFile: Boolean;
    FNewRecord: Boolean;
    procedure FindNextRecord;
    procedure PrepareValues;
    procedure ClearValues;
    procedure PrepareFieldValue( aXmlFieldValue: TXmlFieldValue; iBegin: Integer; iEnd: Integer );
    function BeginTag( aTag: String ): String;
    function EndTag( aTag: String ): String;
    function FindTag ( aText: String; TagToFind: String ): Integer;
    procedure FindFieldValue( aXmlValue: TXmlFieldValue; iBegin: Integer; iEnd: Integer );
    procedure RemoveLinesCurrentRecord;
    procedure AddDbMark;
  public
    RecordTag: String;
    constructor Create ( aDataFile: TStringList );
    destructor Destroy; override;
    procedure Next;
    procedure Initialize;
    function RecordField( TagFieldName: String; ParentField: TXmlField = nil ): TXmlField;
    function EOF: Boolean;
    function ReadValue( aXmlField: TXmlField; pos: Integer = 0 ): TStringList;
    function GetFieldValue( aXmlField: TXmlField ): TXmlFieldValue;
    procedure UpdateValues;
    procedure Insert;
    procedure SaveToFile( FileName: String );
    procedure ClearDatabase;
    procedure AddValue( aField: TXmlField; aValue: TStringList; ParentElement: TXmlElementValue = nil ); overload;
    procedure AddValue( aField: TXmlField; aValue: String; ParentElement: TXmlElementValue = nil ); overload;
    procedure ClearFieldValue( aField: TXmlField );
    procedure DeleteCurrentRecord;
  published
    property CurrentRecord: Integer read FCurrentRecord;
    property FieldList: TObjectList read FFieldList;    // TXmlField List
    property ValueList: TObjectList read FValueList;  // TXmlValue List
    property NewRecord: Boolean read FNewRecord;
  end;


implementation

end.

