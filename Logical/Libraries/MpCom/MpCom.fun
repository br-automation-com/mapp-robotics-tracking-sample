
FUNCTION_BLOCK MpComConfigManager (*Export / Import configuration data*) (* $GROUP=mapp Services,$CAT=mapp Link,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpCom.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (map standard interface)*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (mapp standard interface)*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface)*) (* *) (*#PAR#;*)
		DeviceName : REFERENCE TO STRING[50]; (*Name of device where file should be created*) (* *) (*#CMD#;*)
		FileName : REFERENCE TO STRING[255]; (*Name of file to import / create*) (* *) (*#CMD#;*)
		Scope : MpComConfigScopeEnum; (*Scope of configuration to export/import*) (* *) (*#CMD#;*)
		Export : BOOL; (*Export configuration to XML-File*) (* *) (*#CMD#;*)
		Import : BOOL; (*Import configuration from XML-File*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (mapp standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error (mapp standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (mapp standard interface)*) (* *) (*#PAR#;*)
		CommandBusy : BOOL; (*Function block is busy processing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command is finished*) (* *) (*#CMD#;*)
		Info : MpComConfigManagerInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComConfigInternalType; (*Internal data*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpComLoggerUI (*Get mapp logger information*) (* $GROUP=mapp Services,$CAT=mapp Link,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpCom.png *)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*Incoming communication handle (map standard interface)*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block (mapp standard interface)*) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface)*) (* *) (*#PAR#;*)
		Scope : MpComConfigScopeEnum; (*Scope of configuration to export/import*) (* *) (*#PAR#;*)
		EntryFilter : REFERENCE TO STRING[255]; (*Scope filter to define which entries will be part of the internal logger*) (* *) (*#PAR#;OPT#;*)
		BufferSize : UINT; (*Size of the internal buffer (0=default size 100)*) (* *) (*#PAR#;OPT#;*)
		UISetup : MpComLoggerUISetupType; (*Used to configure the elements connected to the HMI application*) (* *) (*#PAR#;*)
		UIConnect : REFERENCE TO MpComLoggerUIConnectType; (*This structure contains the parameters needed for the connection to the HMI application*) (* *) (*#CMD#;*)
		Clear : BOOL; (*Delete all entries inside the internal buffer*) (* *) (*#CMD#;OPT#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (mapp standard interface)*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates an error (mapp standard interface)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Error/Status information (mapp standard interface)*) (* *) (*#PAR#; *)
		Info : MpComLoggerUIInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComInternalDataType; (*Internal data*) (* *) (*#OMIT#;*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpComDump (*Creates a mapp diagnostic dump file*) (* $GROUP=mapp Services,$CAT=mapp Link,$GROUPICON=Icon_mapp.png,$CATICON=Icon_MpCom.png *)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		Dump : BOOL; (*A positive signal on this input triggers a dump*) (* *) (*#CMD#;*)
		DeviceName : STRING[50]; (*Name of device where file should be created*) (* *) (*#CMD#;*)
		FileName : STRING[255]; (*Name of file to create*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Active : BOOL; (*Function block is active (enabled)*) (* *) (*#PAR#;*)
		Error : BOOL; (*A error has occurred during the last operation*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Information about the error that has occurred*) (* *) (*#PAR#;*)
		CommandBusy : BOOL; (*Function block is busy processing a command*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command is finished*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} MpComDumpInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpComGetLink (*Get MpLink by component name*)
	VAR_INPUT
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ComponentName : REFERENCE TO STRING[100]; (*Full-qualified component name (including scope if necessary)*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		MpLink : {REDUND_UNREPLICABLE} MpComIdentType; (*Link to mapp-component*) (* *) (*#CMD#;*)
		Error : BOOL; (*A error has occurred when trying to find component*) (* *) (*#PAR#;*)
		Active : BOOL; (*Component was found (MpLink valid)*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Information about the error that has occurred*) (* *) (*#PAR#;*)
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpComConfigBasic (*Write and apply mapp-configuration*)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*MpLink for the configuration to access*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface)*) (* *) (*#PAR#;*)
		CmdRead : BOOL; (*Read configuration data (async, parameter: Data, DataType, ReadFrom)*) (* *) (*#CMD#;OPT#;*)
		CmdWrite : BOOL; (*Write configuration data (async, parameter: Data, DataType, WriteMode, ApplyTo)*) (* *) (*#CMD#;OPT#;*)
		CmdCopy : BOOL; (*Copy configuration data (input "Data" is ignored)*) (* *) (*#CMD#;OPT#;*)
		Data : UDINT; (*Address of the structure that holds the configuration data - use structures supplied by mapp-library*) (* *) (*#CMD#;*)
		DataType : UDINT; (*Type of connected structure - use ENUM supplied by mapp-library*) (* *) (*#CMD#;*)
		WriteMode : MpComConfigWriteModeEnum; (*Write mode*) (* *) (*#CMD#;*)
		ReadFrom : MpComConfigBasicSourceEnum; (*Data-Source (considered by CmdOpen)*) (* *) (*#CMD#;*)
		ApplyTo : MpComConfigTargetEnum; (*Apply-Mode*) (* *) (*#CMD#;*)
		Path : REFERENCE TO STRING[100]; (*Path in case a nested element should be read/written that is not uniquely defined by the type*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Error : BOOL; (*A error has occurred when trying to open configuration*) (* *) (*#PAR#;*)
		Active : BOOL; (*Configuration was found and handle is valid*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Information about the error that has occurred*) (* *) (*#PAR#;*)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#;*)
		CurrentDataSource : MpComDataSourceEnum; (*Parameterization is active for this component.*) (* *) (*#CMD#;*)
		Info : MpComConfigBasicInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : USINT;
		InternalData : ARRAY[0..21] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MpComConfigAdvanced (*Write/Readapply mapp-configuration or -parameters*)
	VAR_INPUT
		MpLink : REFERENCE TO MpComIdentType; (*MpLink for the configuration to access*) (* *) (*#PAR#;*)
		Enable : BOOL; (*Enables/Disables the function block *) (* *) (*#PAR#;*)
		ErrorReset : BOOL; (*Resets all function block errors (mapp standard interface)*) (* *) (*#PAR#;*)
		CmdOpen : BOOL; (*Open configuration for read/write access (parameter: ReadFrom)*) (* *) (*#CMD#;OPT#;*)
		CmdRead : BOOL; (*Read configuration data (sync, parameter: Data, DataType)*) (* *) (*#CMD#;OPT#;*)
		CmdWrite : BOOL; (*Write configuration data (sync, parameter: Data, DataType, WriteMode)*) (* *) (*#CMD#;OPT#;*)
		CmdClose : BOOL; (*Close configuration and apply changes (parameter: ApplyTo)*) (* *) (*#CMD#;OPT#;*)
		CmdCopy : BOOL; (*Copy configuration data (input "Data" is ignored)*) (* *) (*#CMD#;OPT#;*)
		Data : UDINT; (*Address of the structure that holds the configuration data - use structures supplied by mapp-library*) (* *) (*#CMD#;*)
		DataType : UDINT; (*Type of connected structure - use ENUM supplied by mapp-library*) (* *) (*#CMD#;*)
		WriteMode : MpComConfigWriteModeEnum; (*Write mode*) (* *) (*#CMD#;*)
		ReadFrom : MpComConfigAdvancedSourceEnum; (*Data-Source (considered by CmdOpen)*) (* *) (*#CMD#;*)
		ApplyTo : MpComConfigTargetEnum; (*Apply-Mode*) (* *) (*#CMD#;*)
		Path : REFERENCE TO STRING[100]; (*Path in case a nested element should be read/written that is not uniquely defined by the type*) (* *) (*#CMD#;*)
	END_VAR
	VAR_OUTPUT
		Error : BOOL; (*A error has occurred when trying to open configuration*) (* *) (*#PAR#;*)
		Active : BOOL; (*Configuration was found and handle is valid*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Information about the error that has occurred*) (* *) (*#PAR#;*)
		IsOpened : BOOL; (*Configuration is opened (read/write access possible)*) (* *) (*#CMD#;*)
		CommandBusy : BOOL; (*Function block is busy processing a command.*) (* *) (*#CMD#OPT#;*)
		CommandDone : BOOL; (*Command has finished and was successful.*) (* *) (*#CMD#;*)
		CurrentDataSource : MpComDataSourceEnum; (*Parameterization is active for this component.*) (* *) (*#CMD#;*)
		Info : MpComConfigAdvancedInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_VAR
	VAR
		InternalState : USINT;
		InternalData : ARRAY[0..22] OF UDINT;
	END_VAR
END_FUNCTION_BLOCK
