#!../../bin/linux-x86_64/QEPro

< envPaths

dbLoadDatabase("$(TOP)/dbd/QEPro.dbd")

QEPro_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("PREFIX", "OceanOptics")
epicsEnvSet("PORT",   "QEPro")
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db")

QEProConfig("$(PORT)", 0)

#asynSetTraceMask("$(PORT)", -1, 0x0)
#asynSetTraceMask("$(PORT)", -1, 0x1)

# Enables both log and error messages
asynSetTraceMask("$(PORT)", -1, 0x9)
#asynSetTraceMask("$(PORT)", -1, 0xF)
#asynSetTraceMask("$(PORT)", -1, 0x11)
#asynSetTraceMask("$(PORT)", -1, 0xFF)
#asynSetTraceIOMask("$(PORT)", -1, 0x0)
#asynSetTraceIOMask("$(PORT)", -1, 0x2)

dbLoadRecords("../../db/QEPro.template", "PREFIX=$(PREFIX), P=$(PREFIX):, R=cam1:, PORT=$(PORT), ADDR=0, TIMEOUT=1")
dbLoadRecords("../../db/QEProCollect.template", "PREFIX=$(PREFIX), PORT=$(PORT), ADDR=0, TIMEOUT=1")
dbLoadRecords("../../db/QEProSpectra.template", "PREFIX=$(PREFIX), PORT=$(PORT), ADDR=0, TIMEOUT=1")
dbLoadRecords("$(ASYN)/db/asynRecord.db", "PORT=$(PORT), P=$(PREFIX), R=:ASYNIO, ADDR=0, OMAX=0, IMAX=0")
dbLoadRecords("$(DEVIOCSTATS)/db/iocAdminSoft.db", "IOC=$(PREFIX)")


## autosave/restore machinery
#save_restoreSet_Debug(0)
#save_restoreSet_IncompleteSetsOk(1)
#save_restoreSet_DatedBackupFiles(1)
 
#set_savefile_path("as","/sav")
#set_requestfile_path("as","/req")
 
#set_pass0_restoreFile("info_positions.sav")
#set_pass0_restoreFile("info_settings.sav")
#set_pass1_restoreFile("info_settings.sav")
 
iocInit()
 
dbpf OceanOpticsPoolPollStats.SCAN 0
dbpf OceanOptics:TEC 1

## more autosave/restore machinery
#cd autosave/req
#makeAutosaveFiles()
#cd ../..
#create_monitor_set("info_positions.req", 5 , "")
#create_monitor_set("info_settings.req", 15 , "")
