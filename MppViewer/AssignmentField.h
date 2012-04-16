//
//  AssignmentField.h
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldType.h"

@interface AssignmentField : FieldType
{
    int _value;
    DataType *_dataType;
    FieldType *_unitsType;
}

-(NSString *)getName;

-(int)getValue;

-(DataType *)getDataType;

-(FieldType *)getUnitsType;

-(NSString *)toString;

+(AssignmentField *)getInstance:(int)type;

+(AssignmentField *)START;
+(AssignmentField *)DURATION1_UNITS;
+(AssignmentField *)DURATION2_UNITS;
+(AssignmentField *)DURATION3_UNITS;
+(AssignmentField *)DURATION4_UNITS;
+(AssignmentField *)DURATION5_UNITS;
+(AssignmentField *)DURATION6_UNITS;
+(AssignmentField *)DURATION7_UNITS;
+(AssignmentField *)DURATION8_UNITS;
+(AssignmentField *)DURATION9_UNITS;
+(AssignmentField *)DURATION10_UNITS;
+(AssignmentField *)ACTUAL_COST;
+(AssignmentField *)ACTUAL_WORK;
+(AssignmentField *)COST;
+(AssignmentField *)ASSIGNMENT_DELAY;
+(AssignmentField *)VARIABLE_RATE_UNITS;
+(AssignmentField *)ASSIGNMENT_UNITS;
+(AssignmentField *)WORK;
+(AssignmentField *)BASELINE_START;
+(AssignmentField *)ACTUAL_START;
+(AssignmentField *)BASELINE_FINISH;
+(AssignmentField *)ACTUAL_FINISH;
+(AssignmentField *)BASELINE_WORK;
+(AssignmentField *)OVERTIME_WORK;
+(AssignmentField *)BASELINE_COST;
+(AssignmentField *)WORK_CONTOUR;
+(AssignmentField *)REMAINING_WORK;
+(AssignmentField *)LEVELING_DELAY_UNITS;
+(AssignmentField *)LEVELING_DELAY;
+(AssignmentField *)DELAY;
+(AssignmentField *)UNIQUE_ID;
+(AssignmentField *)TASK_UNIQUE_ID;
+(AssignmentField *)RESOURCE_UNIQUE_ID;
+(AssignmentField *)TIMEPHASED_WORK;
+(AssignmentField *)TIMEPHASED_ACTUAL_WORK;
+(AssignmentField *)TIMEPHASED_ACTUAL_OVERTIME_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE1_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE2_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE3_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE4_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE5_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE6_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE7_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE8_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE9_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE10_WORK;
+(AssignmentField *)TIMEPHASED_BASELINE_COST;
+(AssignmentField *)TIMEPHASED_BASELINE1_COST;
+(AssignmentField *)TIMEPHASED_BASELINE2_COST;
+(AssignmentField *)TIMEPHASED_BASELINE3_COST;
+(AssignmentField *)TIMEPHASED_BASELINE4_COST;
+(AssignmentField *)TIMEPHASED_BASELINE5_COST;
+(AssignmentField *)TIMEPHASED_BASELINE6_COST;
+(AssignmentField *)TIMEPHASED_BASELINE7_COST;
+(AssignmentField *)TIMEPHASED_BASELINE8_COST;
+(AssignmentField *)TIMEPHASED_BASELINE9_COST;
+(AssignmentField *)TIMEPHASED_BASELINE10_COST;
+(AssignmentField *)TASK_ID;
+(AssignmentField *)RESOURCE_ID;
+(AssignmentField *)TASK_NAME;
+(AssignmentField *)RESOURCE_NAME;
+(AssignmentField *)REGULAR_WORK;
+(AssignmentField *)ACTUAL_OVERTIME_WORK;
+(AssignmentField *)REMAINING_OVERTIME_WORK;
+(AssignmentField *)PEAK;
+(AssignmentField *)OVERTIME_COST;
+(AssignmentField *)REMAINING_COST;
+(AssignmentField *)ACTUAL_OVERTIME_COST;
+(AssignmentField *)REMAINING_OVERTIME_COST;
+(AssignmentField *)BCWS;
+(AssignmentField *)BCWP;
+(AssignmentField *)ACWP;
+(AssignmentField *)SV;
+(AssignmentField *)COST_VARIANCE;
+(AssignmentField *)PERCENT_WORK_COMPLETE;
+(AssignmentField *)PROJECT;
+(AssignmentField *)NOTES;
+(AssignmentField *)CONFIRMED;
+(AssignmentField *)RESPONSE_PENDING;
+(AssignmentField *)UPDATE_NEEDED;
+(AssignmentField *)TEAM_STATUS_PENDING;
+(AssignmentField *)COST_RATE_TABLE;
+(AssignmentField *)TEXT1;
+(AssignmentField *)TEXT2;
+(AssignmentField *)TEXT3;
+(AssignmentField *)TEXT4;
+(AssignmentField *)TEXT5;
+(AssignmentField *)TEXT6;
+(AssignmentField *)TEXT7;
+(AssignmentField *)TEXT8;
+(AssignmentField *)TEXT9;
+(AssignmentField *)TEXT10;
+(AssignmentField *)START1;
+(AssignmentField *)START2;
+(AssignmentField *)START3;
+(AssignmentField *)START4;
+(AssignmentField *)START5;
+(AssignmentField *)FINISH1;
+(AssignmentField *)FINISH2;
+(AssignmentField *)FINISH3;
+(AssignmentField *)FINISH4;
+(AssignmentField *)FINISH5;
+(AssignmentField *)NUMBER1;
+(AssignmentField *)NUMBER2;
+(AssignmentField *)NUMBER3;
+(AssignmentField *)NUMBER4;
+(AssignmentField *)NUMBER5;
+(AssignmentField *)DURATION1;
+(AssignmentField *)DURATION2;
+(AssignmentField *)DURATION3;
+(AssignmentField *)COST1;
+(AssignmentField *)COST2;
+(AssignmentField *)COST3;
+(AssignmentField *)FLAG10;
+(AssignmentField *)FLAG1;
+(AssignmentField *)FLAG2;
+(AssignmentField *)FLAG3;
+(AssignmentField *)FLAG4;
+(AssignmentField *)FLAG5;
+(AssignmentField *)FLAG6;
+(AssignmentField *)FLAG7;
+(AssignmentField *)FLAG8;
+(AssignmentField *)FLAG9;
+(AssignmentField *)LINKED_FIELDS;
+(AssignmentField *)OVERALLOCATED;
+(AssignmentField *)TASK_SUMMARY_NAME;
+(AssignmentField *)HYPERLINK;
+(AssignmentField *)HYPERLINK_ADDRESS;
+(AssignmentField *)HYPERLINK_SUBADDRESS;
+(AssignmentField *)HYPERLINK_HREF;
+(AssignmentField *)COST4;
+(AssignmentField *)COST5;
+(AssignmentField *)COST6;
+(AssignmentField *)COST7;
+(AssignmentField *)COST8;
+(AssignmentField *)COST9;
+(AssignmentField *)COST10;
+(AssignmentField *)DATE1;
+(AssignmentField *)DATE2;
+(AssignmentField *)DATE3;
+(AssignmentField *)DATE4;
+(AssignmentField *)DATE5;
+(AssignmentField *)DATE6;
+(AssignmentField *)DATE7;
+(AssignmentField *)DATE8;
+(AssignmentField *)DATE9;
+(AssignmentField *)DATE10;
+(AssignmentField *)DURATION4;
+(AssignmentField *)DURATION5;
+(AssignmentField *)DURATION6;
+(AssignmentField *)DURATION7;
+(AssignmentField *)DURATION8;
+(AssignmentField *)DURATION9;
+(AssignmentField *)DURATION10;
+(AssignmentField *)FINISH6;
+(AssignmentField *)FINISH7;
+(AssignmentField *)FINISH8;
+(AssignmentField *)FINISH9;
+(AssignmentField *)FINISH10;
+(AssignmentField *)FLAG11;
+(AssignmentField *)FLAG12;
+(AssignmentField *)FLAG13;
+(AssignmentField *)FLAG14;
+(AssignmentField *)FLAG15;
+(AssignmentField *)FLAG16;
+(AssignmentField *)FLAG17;
+(AssignmentField *)FLAG18;
+(AssignmentField *)FLAG19;
+(AssignmentField *)FLAG20;
+(AssignmentField *)NUMBER6;
+(AssignmentField *)NUMBER7;
+(AssignmentField *)NUMBER8;
+(AssignmentField *)NUMBER9;
+(AssignmentField *)NUMBER10;
+(AssignmentField *)NUMBER11;
+(AssignmentField *)NUMBER12;
+(AssignmentField *)NUMBER13;
+(AssignmentField *)NUMBER14;
+(AssignmentField *)NUMBER15;
+(AssignmentField *)NUMBER16;
+(AssignmentField *)NUMBER17;
+(AssignmentField *)NUMBER18;
+(AssignmentField *)NUMBER19;
+(AssignmentField *)NUMBER20;
+(AssignmentField *)START6;
+(AssignmentField *)START7;
+(AssignmentField *)START8;
+(AssignmentField *)START9;
+(AssignmentField *)START10;
+(AssignmentField *)TEXT11;
+(AssignmentField *)TEXT12;
+(AssignmentField *)TEXT13;
+(AssignmentField *)TEXT14;
+(AssignmentField *)TEXT15;
+(AssignmentField *)TEXT16;
+(AssignmentField *)TEXT17;
+(AssignmentField *)TEXT18;
+(AssignmentField *)TEXT19;
+(AssignmentField *)TEXT20;
+(AssignmentField *)TEXT21;
+(AssignmentField *)TEXT22;
+(AssignmentField *)TEXT23;
+(AssignmentField *)TEXT24;
+(AssignmentField *)TEXT25;
+(AssignmentField *)TEXT26;
+(AssignmentField *)TEXT27;
+(AssignmentField *)TEXT28;
+(AssignmentField *)TEXT29;
+(AssignmentField *)TEXT30;
+(AssignmentField *)INDEX;
+(AssignmentField *)CV;
+(AssignmentField *)WORK_VARIANCE;
+(AssignmentField *)START_VARIANCE;
+(AssignmentField *)FINISH_VARIANCE;
+(AssignmentField *)VAC;
+(AssignmentField *)FIXED_MATERIAL_ASSIGNMENT;
+(AssignmentField *)RESOURCE_TYPE;
+(AssignmentField *)HYPERLINK_SCREEN_TIP;
+(AssignmentField *)WBS;
+(AssignmentField *)BASELINE1_WORK;
+(AssignmentField *)BASELINE1_COST;
+(AssignmentField *)BASELINE1_START;
+(AssignmentField *)BASELINE1_FINISH;
+(AssignmentField *)BASELINE2_WORK;
+(AssignmentField *)BASELINE2_COST;
+(AssignmentField *)BASELINE2_START;
+(AssignmentField *)BASELINE2_FINISH;
+(AssignmentField *)BASELINE3_WORK;
+(AssignmentField *)BASELINE3_COST;
+(AssignmentField *)BASELINE3_START;
+(AssignmentField *)BASELINE3_FINISH;
+(AssignmentField *)BASELINE4_WORK;
+(AssignmentField *)BASELINE4_COST;
+(AssignmentField *)BASELINE4_START;
+(AssignmentField *)BASELINE4_FINISH;
+(AssignmentField *)BASELINE5_WORK;
+(AssignmentField *)BASELINE5_COST;
+(AssignmentField *)BASELINE5_START;
+(AssignmentField *)BASELINE5_FINISH;
+(AssignmentField *)BASELINE6_WORK;
+(AssignmentField *)BASELINE6_COST;
+(AssignmentField *)BASELINE6_START;
+(AssignmentField *)BASELINE6_FINISH;
+(AssignmentField *)BASELINE7_WORK;
+(AssignmentField *)BASELINE7_COST;
+(AssignmentField *)BASELINE7_START;
+(AssignmentField *)BASELINE7_FINISH;
+(AssignmentField *)BASELINE8_WORK;
+(AssignmentField *)BASELINE8_COST;
+(AssignmentField *)BASELINE8_START;
+(AssignmentField *)BASELINE8_FINISH;
+(AssignmentField *)BASELINE9_WORK;
+(AssignmentField *)BASELINE9_COST;
+(AssignmentField *)BASELINE9_START;
+(AssignmentField *)BASELINE9_FINISH;
+(AssignmentField *)BASELINE10_WORK;
+(AssignmentField *)BASELINE10_COST;
+(AssignmentField *)BASELINE10_START;
+(AssignmentField *)BASELINE10_FINISH;
+(AssignmentField *)TASK_OUTLINE_NUMBER;
+(AssignmentField *)ENTERPRISE_COST1;
+(AssignmentField *)ENTERPRISE_COST2;
+(AssignmentField *)ENTERPRISE_COST3;
+(AssignmentField *)ENTERPRISE_COST4;
+(AssignmentField *)ENTERPRISE_COST5;
+(AssignmentField *)ENTERPRISE_COST6;
+(AssignmentField *)ENTERPRISE_COST7;
+(AssignmentField *)ENTERPRISE_COST8;
+(AssignmentField *)ENTERPRISE_COST9;
+(AssignmentField *)ENTERPRISE_COST10;
+(AssignmentField *)ENTERPRISE_DATE1;
+(AssignmentField *)ENTERPRISE_DATE2;
+(AssignmentField *)ENTERPRISE_DATE3;
+(AssignmentField *)ENTERPRISE_DATE4;
+(AssignmentField *)ENTERPRISE_DATE5;
+(AssignmentField *)ENTERPRISE_DATE6;
+(AssignmentField *)ENTERPRISE_DATE7;
+(AssignmentField *)ENTERPRISE_DATE8;
+(AssignmentField *)ENTERPRISE_DATE9;
+(AssignmentField *)ENTERPRISE_DATE10;
+(AssignmentField *)ENTERPRISE_DATE11;
+(AssignmentField *)ENTERPRISE_DATE12;
+(AssignmentField *)ENTERPRISE_DATE13;
+(AssignmentField *)ENTERPRISE_DATE14;
+(AssignmentField *)ENTERPRISE_DATE15;
+(AssignmentField *)ENTERPRISE_DATE16;
+(AssignmentField *)ENTERPRISE_DATE17;
+(AssignmentField *)ENTERPRISE_DATE18;
+(AssignmentField *)ENTERPRISE_DATE19;
+(AssignmentField *)ENTERPRISE_DATE20;
+(AssignmentField *)ENTERPRISE_DATE21;
+(AssignmentField *)ENTERPRISE_DATE22;
+(AssignmentField *)ENTERPRISE_DATE23;
+(AssignmentField *)ENTERPRISE_DATE24;
+(AssignmentField *)ENTERPRISE_DATE25;
+(AssignmentField *)ENTERPRISE_DATE26;
+(AssignmentField *)ENTERPRISE_DATE27;
+(AssignmentField *)ENTERPRISE_DATE28;
+(AssignmentField *)ENTERPRISE_DATE29;
+(AssignmentField *)ENTERPRISE_DATE30;
+(AssignmentField *)ENTERPRISE_DURATION1;
+(AssignmentField *)ENTERPRISE_DURATION2;
+(AssignmentField *)ENTERPRISE_DURATION3;
+(AssignmentField *)ENTERPRISE_DURATION4;
+(AssignmentField *)ENTERPRISE_DURATION5;
+(AssignmentField *)ENTERPRISE_DURATION6;
+(AssignmentField *)ENTERPRISE_DURATION7;
+(AssignmentField *)ENTERPRISE_DURATION8;
+(AssignmentField *)ENTERPRISE_DURATION9;
+(AssignmentField *)ENTERPRISE_DURATION10;
+(AssignmentField *)ENTERPRISE_FLAG1;
+(AssignmentField *)ENTERPRISE_FLAG2;
+(AssignmentField *)ENTERPRISE_FLAG3;
+(AssignmentField *)ENTERPRISE_FLAG4;
+(AssignmentField *)ENTERPRISE_FLAG5;
+(AssignmentField *)ENTERPRISE_FLAG6;
+(AssignmentField *)ENTERPRISE_FLAG7;
+(AssignmentField *)ENTERPRISE_FLAG8;
+(AssignmentField *)ENTERPRISE_FLAG9;
+(AssignmentField *)ENTERPRISE_FLAG10;
+(AssignmentField *)ENTERPRISE_FLAG11;
+(AssignmentField *)ENTERPRISE_FLAG12;
+(AssignmentField *)ENTERPRISE_FLAG13;
+(AssignmentField *)ENTERPRISE_FLAG14;
+(AssignmentField *)ENTERPRISE_FLAG15;
+(AssignmentField *)ENTERPRISE_FLAG16;
+(AssignmentField *)ENTERPRISE_FLAG17;
+(AssignmentField *)ENTERPRISE_FLAG18;
+(AssignmentField *)ENTERPRISE_FLAG19;
+(AssignmentField *)ENTERPRISE_FLAG20;
+(AssignmentField *)ENTERPRISE_NUMBER1;
+(AssignmentField *)ENTERPRISE_NUMBER2;
+(AssignmentField *)ENTERPRISE_NUMBER3;
+(AssignmentField *)ENTERPRISE_NUMBER4;
+(AssignmentField *)ENTERPRISE_NUMBER5;
+(AssignmentField *)ENTERPRISE_NUMBER6;
+(AssignmentField *)ENTERPRISE_NUMBER7;
+(AssignmentField *)ENTERPRISE_NUMBER8;
+(AssignmentField *)ENTERPRISE_NUMBER9;
+(AssignmentField *)ENTERPRISE_NUMBER10;
+(AssignmentField *)ENTERPRISE_NUMBER11;
+(AssignmentField *)ENTERPRISE_NUMBER12;
+(AssignmentField *)ENTERPRISE_NUMBER13;
+(AssignmentField *)ENTERPRISE_NUMBER14;
+(AssignmentField *)ENTERPRISE_NUMBER15;
+(AssignmentField *)ENTERPRISE_NUMBER16;
+(AssignmentField *)ENTERPRISE_NUMBER17;
+(AssignmentField *)ENTERPRISE_NUMBER18;
+(AssignmentField *)ENTERPRISE_NUMBER19;
+(AssignmentField *)ENTERPRISE_NUMBER20;
+(AssignmentField *)ENTERPRISE_NUMBER21;
+(AssignmentField *)ENTERPRISE_NUMBER22;
+(AssignmentField *)ENTERPRISE_NUMBER23;
+(AssignmentField *)ENTERPRISE_NUMBER24;
+(AssignmentField *)ENTERPRISE_NUMBER25;
+(AssignmentField *)ENTERPRISE_NUMBER26;
+(AssignmentField *)ENTERPRISE_NUMBER27;
+(AssignmentField *)ENTERPRISE_NUMBER28;
+(AssignmentField *)ENTERPRISE_NUMBER29;
+(AssignmentField *)ENTERPRISE_NUMBER30;
+(AssignmentField *)ENTERPRISE_NUMBER31;
+(AssignmentField *)ENTERPRISE_NUMBER32;
+(AssignmentField *)ENTERPRISE_NUMBER33;
+(AssignmentField *)ENTERPRISE_NUMBER34;
+(AssignmentField *)ENTERPRISE_NUMBER35;
+(AssignmentField *)ENTERPRISE_NUMBER36;
+(AssignmentField *)ENTERPRISE_NUMBER37;
+(AssignmentField *)ENTERPRISE_NUMBER38;
+(AssignmentField *)ENTERPRISE_NUMBER39;
+(AssignmentField *)ENTERPRISE_NUMBER40;
+(AssignmentField *)ENTERPRISE_TEXT1;
+(AssignmentField *)ENTERPRISE_TEXT2;
+(AssignmentField *)ENTERPRISE_TEXT3;
+(AssignmentField *)ENTERPRISE_TEXT4;
+(AssignmentField *)ENTERPRISE_TEXT5;
+(AssignmentField *)ENTERPRISE_TEXT6;
+(AssignmentField *)ENTERPRISE_TEXT7;
+(AssignmentField *)ENTERPRISE_TEXT8;
+(AssignmentField *)ENTERPRISE_TEXT9;
+(AssignmentField *)ENTERPRISE_TEXT10;
+(AssignmentField *)ENTERPRISE_TEXT11;
+(AssignmentField *)ENTERPRISE_TEXT12;
+(AssignmentField *)ENTERPRISE_TEXT13;
+(AssignmentField *)ENTERPRISE_TEXT14;
+(AssignmentField *)ENTERPRISE_TEXT15;
+(AssignmentField *)ENTERPRISE_TEXT16;
+(AssignmentField *)ENTERPRISE_TEXT17;
+(AssignmentField *)ENTERPRISE_TEXT18;
+(AssignmentField *)ENTERPRISE_TEXT19;
+(AssignmentField *)ENTERPRISE_TEXT20;
+(AssignmentField *)ENTERPRISE_TEXT21;
+(AssignmentField *)ENTERPRISE_TEXT22;
+(AssignmentField *)ENTERPRISE_TEXT23;
+(AssignmentField *)ENTERPRISE_TEXT24;
+(AssignmentField *)ENTERPRISE_TEXT25;
+(AssignmentField *)ENTERPRISE_TEXT26;
+(AssignmentField *)ENTERPRISE_TEXT27;
+(AssignmentField *)ENTERPRISE_TEXT28;
+(AssignmentField *)ENTERPRISE_TEXT29;
+(AssignmentField *)ENTERPRISE_TEXT30;
+(AssignmentField *)ENTERPRISE_TEXT31;
+(AssignmentField *)ENTERPRISE_TEXT32;
+(AssignmentField *)ENTERPRISE_TEXT33;
+(AssignmentField *)ENTERPRISE_TEXT34;
+(AssignmentField *)ENTERPRISE_TEXT35;
+(AssignmentField *)ENTERPRISE_TEXT36;
+(AssignmentField *)ENTERPRISE_TEXT37;
+(AssignmentField *)ENTERPRISE_TEXT38;
+(AssignmentField *)ENTERPRISE_TEXT39;
+(AssignmentField *)ENTERPRISE_TEXT40;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE1;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE2;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE3;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE4;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE5;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE6;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE7;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE8;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE9;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE10;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE11;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE12;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE13;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE14;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE15;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE16;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE17;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE18;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE19;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE20;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE21;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE22; 
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE23;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE24;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE25;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE26;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE27;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE28;
+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE29;
+(AssignmentField *)ENTERPRISE_RESOURCE_RBS;
+(AssignmentField *)RESOURCE_REQUEST_TYPE;
+(AssignmentField *)ENTERPRISE_TEAM_MEMBER;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE20;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE21;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE22;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE23;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE24;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE25;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE26;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE27;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE28;
+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE29;
+(AssignmentField *)ACTUAL_WORK_PROTECTED;
+(AssignmentField *)ACTUAL_OVERTIME_WORK_PROTECTED;
+(AssignmentField *)CREATED;
+(AssignmentField *)GUID;
+(AssignmentField *)ASSIGNMENT_TASK_GUID;
+(AssignmentField *)ASSIGNMENT_RESOURCE_GUID;
+(AssignmentField *)SUMMARY;
+(AssignmentField *)OWNER;
+(AssignmentField *)BUDGET_WORK;
+(AssignmentField *)BUDGET_COST;
+(AssignmentField *)BASELINE_BUDGET_WORK;
+(AssignmentField *)BASELINE_BUDGET_COST;
+(AssignmentField *)BASELINE1_BUDGET_WORK;
+(AssignmentField *)BASELINE1_BUDGET_COST;
+(AssignmentField *)BASELINE2_BUDGET_WORK;
+(AssignmentField *)BASELINE2_BUDGET_COST;
+(AssignmentField *)BASELINE3_BUDGET_WORK;
+(AssignmentField *)BASELINE3_BUDGET_COST;
+(AssignmentField *)BASELINE4_BUDGET_WORK;
+(AssignmentField *)BASELINE4_BUDGET_COST;
+(AssignmentField *)BASELINE5_BUDGET_WORK;
+(AssignmentField *)BASELINE5_BUDGET_COST;
+(AssignmentField *)BASELINE6_BUDGET_WORK;
+(AssignmentField *)BASELINE6_BUDGET_COST;
+(AssignmentField *)BASELINE7_BUDGET_WORK;
+(AssignmentField *)BASELINE7_BUDGET_COST;
+(AssignmentField *)BASELINE8_BUDGET_WORK;
+(AssignmentField *)BASELINE8_BUDGET_COST;
+(AssignmentField *)BASELINE9_BUDGET_WORK;
+(AssignmentField *)BASELINE9_BUDGET_COST;
+(AssignmentField *)BASELINE10_BUDGET_WORK;
+(AssignmentField *)BASELINE10_BUDGET_COST;
+(AssignmentField *)UNAVAILABLE;
+(AssignmentField *)HYPERLINK_DATA;
+(AssignmentField *)FINISH;

@end