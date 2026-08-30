object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 150
  Width = 215
  object Database: TDatabase
    DatabaseName = 'LegacyERPDB'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=.'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 32
    Top = 24
  end
end
