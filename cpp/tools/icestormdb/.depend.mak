DBTypes.h DBTypes.cpp: DBTypes.ice ./SubscriberRecord.ice "$(slicedir)/Ice/Identity.ice" "$(slicedir)/IceStorm/IceStorm.ice" "$(slicedir)/Ice/SliceChecksumDict.ice" "$(slicedir)/IceStorm/Metrics.ice" "$(slicedir)/Ice/Metrics.ice" "$(slicedir)/Ice/BuiltinSequences.ice" ./LLURecord.ice "$(SLICE2CPP)" "$(SLICEPARSERLIB)"
LLURecord.h LLURecord.cpp: LLURecord.ice "$(SLICE2CPP)" "$(SLICEPARSERLIB)"
SubscriberRecord.h SubscriberRecord.cpp: SubscriberRecord.ice "$(slicedir)/Ice/Identity.ice" "$(slicedir)/IceStorm/IceStorm.ice" "$(slicedir)/Ice/SliceChecksumDict.ice" "$(slicedir)/IceStorm/Metrics.ice" "$(slicedir)/Ice/Metrics.ice" "$(slicedir)/Ice/BuiltinSequences.ice" "$(SLICE2CPP)" "$(SLICEPARSERLIB)"
