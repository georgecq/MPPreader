//
//  TaskField.h
//  MppViewer
//
//  Created by Fernando Araya on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldType.h"

@interface TaskField : FieldType 
{
    int _value;
    DataType *_dataType;
    FieldType *_unitsType;
}

-(int)getValue;

-(NSString *)toString;

+(TaskField *)getInstance:(int) type;

+(TaskField *)START;
+(TaskField *)DURATION_UNITS;
+(TaskField *)BASELINE_DURATION_UNITS;
+(TaskField *)ACTUAL_DURATION_UNITS;
+(TaskField *)LEVELING_DELAY_UNITS;
+(TaskField *)DURATION1_UNITS;
+(TaskField *)DURATION2_UNITS;
+(TaskField *)DURATION3_UNITS;
+(TaskField *)DURATION4_UNITS;
+(TaskField *)DURATION5_UNITS;
+(TaskField *)DURATION6_UNITS;
+(TaskField *)DURATION7_UNITS;
+(TaskField *)DURATION8_UNITS;
+(TaskField *)DURATION9_UNITS;
+(TaskField *)DURATION10_UNITS;
+(TaskField *)WORK;
+(TaskField *)BASELINE_WORK;
+(TaskField *)ACTUAL_WORK;
+(TaskField *)WORK_VARIANCE;
+(TaskField *)REMAINING_WORK;
+(TaskField *)COST;
+(TaskField *)BASELINE_COST;
+(TaskField *)ACTUAL_COST;
+(TaskField *)FIXED_COST;
+(TaskField *)COST_VARIANCE;
+(TaskField *)REMAINING_COST;
+(TaskField *)BCWP;
+(TaskField *)BCWS;
+(TaskField *)SV;
+(TaskField *)NAME;
+(TaskField *)WBS;
+(TaskField *)CONSTRAINT_TYPE;
+(TaskField *)CONSTRAINT_DATE;
+(TaskField *)CRITICAL;
+(TaskField *)LEVELING_DELAY;
+(TaskField *)FREE_SLACK;
+(TaskField *)TOTAL_SLACK;
+(TaskField *)ID;
+(TaskField *)MILESTONE;
+(TaskField *)PRIORITY;
+(TaskField *)SUBPROJECT_FILE;
+(TaskField *)BASELINE_DURATION;
+(TaskField *)ACTUAL_DURATION;
+(TaskField *)DURATION;
+(TaskField *)DURATION_VARIANCE;
+(TaskField *)REMAINING_DURATION;
+(TaskField *)PERCENT_COMPLETE;
+(TaskField *)PERCENT_WORK_COMPLETE;
+(TaskField *)EARLY_START;
+(TaskField *)EARLY_FINISH;
+(TaskField *)LATE_START;
+(TaskField *)LATE_FINISH;
+(TaskField *)ACTUAL_START;
+(TaskField *)ACTUAL_FINISH;
+(TaskField *)BASELINE_START;
+(TaskField *)BASELINE_FINISH;
+(TaskField *)START_VARIANCE;
+(TaskField *)FINISH_VARIANCE;
+(TaskField *)PREDECESSORS;
+(TaskField *)SUCCESSORS;
+(TaskField *)RESOURCE_NAMES;
+(TaskField *)RESOURCE_INITIALS;
+(TaskField *)TEXT1;
+(TaskField *)START1;
+(TaskField *)FINISH1;
+(TaskField *)TEXT2;
+(TaskField *)START2;
+(TaskField *)FINISH2;
+(TaskField *)TEXT3;
+(TaskField *)START3;
+(TaskField *)FINISH3;
+(TaskField *)TEXT4;
+(TaskField *)START4;
+(TaskField *)FINISH4;
+(TaskField *)TEXT5;
+(TaskField *)START5;
+(TaskField *)FINISH5;
+(TaskField *)TEXT6;
+(TaskField *)TEXT7;
+(TaskField *)TEXT8;
+(TaskField *)TEXT9;
+(TaskField *)TEXT10;
+(TaskField *)MARKED;
+(TaskField *)FLAG1;
+(TaskField *)FLAG2;
+(TaskField *)FLAG3;
+(TaskField *)FLAG4;
+(TaskField *)FLAG5;
+(TaskField *)FLAG6;
+(TaskField *)FLAG7;
+(TaskField *)FLAG8;
+(TaskField *)FLAG9;
+(TaskField *)FLAG10;
+(TaskField *)ROLLUP;
+(TaskField *)CV;
+(TaskField *)PROJECT;
+(TaskField *)OUTLINE_LEVEL;
+(TaskField *)UNIQUE_ID;
+(TaskField *)NUMBER1;
+(TaskField *)NUMBER2;
+(TaskField *)NUMBER3;
+(TaskField *)NUMBER4;
+(TaskField *)NUMBER5;
+(TaskField *)SUMMARY;
+(TaskField *)CREATED;
+(TaskField *)NOTES;
+(TaskField *)UNIQUE_ID_PREDECESSORS;
+(TaskField *)UNIQUE_ID_SUCCESSORS;
+(TaskField *)OBJECTS;
+(TaskField *)LINKED_FIELDS;
+(TaskField *)RESUME;
+(TaskField *)STOP;
+(TaskField *)OUTLINE_NUMBER;
+(TaskField *)DURATION1;
+(TaskField *)DURATION2;
+(TaskField *)DURATION3;
+(TaskField *)COST1;
+(TaskField *)COST2;
+(TaskField *)COST3;
+(TaskField *)HIDEBAR;
+(TaskField *)CONFIRMED;
+(TaskField *)UPDATE_NEEDED;
+(TaskField *)CONTACT;
+(TaskField *)RESOURCE_GROUP;
+(TaskField *)ACWP;
+(TaskField *)TYPE;
+(TaskField *)RECURRING;
+(TaskField *)EFFORT_DRIVEN;
+(TaskField *)OVERTIME_WORK;
+(TaskField *)ACTUAL_OVERTIME_WORK;
+(TaskField *)REMAINING_OVERTIME_WORK;
+(TaskField *)REGULAR_WORK;
+(TaskField *)OVERTIME_COST;
+(TaskField *)ACTUAL_OVERTIME_COST;
+(TaskField *)REMAINING_OVERTIME_COST;
+(TaskField *)FIXED_COST_ACCRUAL;
+(TaskField *)INDICATORS;
+(TaskField *)HYPERLINK;
+(TaskField *)HYPERLINK_ADDRESS;
+(TaskField *)HYPERLINK_SUBADDRESS;
+(TaskField *)HYPERLINK_HREF;
+(TaskField *)ASSIGNMENT;
+(TaskField *)OVERALLOCATED;
+(TaskField *)EXTERNAL_TASK;
+(TaskField *)SUBPROJECT_READ_ONLY;
+(TaskField *)RESPONSE_PENDING;
+(TaskField *)TEAMSTATUS_PENDING;
+(TaskField *)LEVELING_CAN_SPLIT;
+(TaskField *)LEVEL_ASSIGNMENTS;
+(TaskField *)WORK_CONTOUR;
+(TaskField *)COST4;
+(TaskField *)COST5;
+(TaskField *)COST6;
+(TaskField *)COST7;
+(TaskField *)COST8;
+(TaskField *)COST9;
+(TaskField *)COST10;
+(TaskField *)DATE1;
+(TaskField *)DATE2;
+(TaskField *)DATE3;
+(TaskField *)DATE4;
+(TaskField *)DATE5;
+(TaskField *)DATE6;
+(TaskField *)DATE7;
+(TaskField *)DATE8;
+(TaskField *)DATE9;
+(TaskField *)DATE10;
+(TaskField *)DURATION4;
+(TaskField *)DURATION5;
+(TaskField *)DURATION6;
+(TaskField *)DURATION7;
+(TaskField *)DURATION8;
+(TaskField *)DURATION9;
+(TaskField *)DURATION10;
+(TaskField *)START6;
+(TaskField *)FINISH6;
+(TaskField *)START7;
+(TaskField *)FINISH7;
+(TaskField *)START8;
+(TaskField *)FINISH8;
+(TaskField *)START9;
+(TaskField *)FINISH9;
+(TaskField *)START10;
+(TaskField *)FINISH10;
+(TaskField *)FLAG11;
+(TaskField *)FLAG12;
+(TaskField *)FLAG13;
+(TaskField *)FLAG14;
+(TaskField *)FLAG15;
+(TaskField *)FLAG16;
+(TaskField *)FLAG17;
+(TaskField *)FLAG18;
+(TaskField *)FLAG19;
+(TaskField *)FLAG20;
+(TaskField *)NUMBER6;
+(TaskField *)NUMBER7;
+(TaskField *)NUMBER8;
+(TaskField *)NUMBER9;
+(TaskField *)NUMBER10;
+(TaskField *)NUMBER11;
+(TaskField *)NUMBER12;
+(TaskField *)NUMBER13;
+(TaskField *)NUMBER14;
+(TaskField *)NUMBER15;
+(TaskField *)NUMBER16;
+(TaskField *)NUMBER17;
+(TaskField *)NUMBER18;
+(TaskField *)NUMBER19;
+(TaskField *)NUMBER20;
+(TaskField *)TEXT11;
+(TaskField *)TEXT12;
+(TaskField *)TEXT13;
+(TaskField *)TEXT14;
+(TaskField *)TEXT15;
+(TaskField *)TEXT16;
+(TaskField *)TEXT17;
+(TaskField *)TEXT18;
+(TaskField *)TEXT19;
+(TaskField *)TEXT20;
+(TaskField *)TEXT21;
+(TaskField *)TEXT22;
+(TaskField *)TEXT23;
+(TaskField *)TEXT24;
+(TaskField *)TEXT25;
+(TaskField *)TEXT26;
+(TaskField *)TEXT27;
+(TaskField *)TEXT28;
+(TaskField *)TEXT29;
+(TaskField *)TEXT30;
+(TaskField *)RESOURCE_PHONETICS;
+(TaskField *)ASSIGNMENT_DELAY;
+(TaskField *)ASSIGNMENT_UNITS;
+(TaskField *)COST_RATE_TABLE;
+(TaskField *)PRELEVELED_START;
+(TaskField *)PRELEVELED_FINISH;
+(TaskField *)ESTIMATED;
+(TaskField *)IGNORE_RESOURCE_CALENDAR;
+(TaskField *)CALENDAR;
+(TaskField *)OUTLINE_CODE1;
+(TaskField *)OUTLINE_CODE2;
+(TaskField *)OUTLINE_CODE3;
+(TaskField *)OUTLINE_CODE4;
+(TaskField *)OUTLINE_CODE5;
+(TaskField *)OUTLINE_CODE6;
+(TaskField *)OUTLINE_CODE7;
+(TaskField *)OUTLINE_CODE8;
+(TaskField *)OUTLINE_CODE9;
+(TaskField *)OUTLINE_CODE10;
+(TaskField *)DEADLINE;
+(TaskField *)START_SLACK;
+(TaskField *)FINISH_SLACK;
+(TaskField *)VAC;
+(TaskField *)GROUP_BY_SUMMARY;
+(TaskField *)WBS_PREDECESSORS;
+(TaskField *)WBS_SUCCESSORS;
+(TaskField *)RESOURCE_TYPE;
+(TaskField *)BASELINE1_DURATION_UNITS;
+(TaskField *)BASELINE2_DURATION_UNITS;
+(TaskField *)BASELINE3_DURATION_UNITS;
+(TaskField *)BASELINE4_DURATION_UNITS;
+(TaskField *)BASELINE5_DURATION_UNITS;
+(TaskField *)BASELINE6_DURATION_UNITS;
+(TaskField *)BASELINE7_DURATION_UNITS;
+(TaskField *)BASELINE8_DURATION_UNITS;
+(TaskField *)BASELINE9_DURATION_UNITS;
+(TaskField *)BASELINE10_DURATION_UNITS;
+(TaskField *)BASELINE1_START;
+(TaskField *)BASELINE1_FINISH;
+(TaskField *)BASELINE1_COST;
+(TaskField *)BASELINE1_WORK;
+(TaskField *)BASELINE1_DURATION;
+(TaskField *)BASELINE2_START;
+(TaskField *)BASELINE2_FINISH;
+(TaskField *)BASELINE2_COST;
+(TaskField *)BASELINE2_WORK;
+(TaskField *)BASELINE2_DURATION;
+(TaskField *)BASELINE3_START;
+(TaskField *)BASELINE3_FINISH;
+(TaskField *)BASELINE3_COST;
+(TaskField *)BASELINE3_WORK;
+(TaskField *)BASELINE3_DURATION;
+(TaskField *)BASELINE4_START;
+(TaskField *)BASELINE4_FINISH;
+(TaskField *)BASELINE4_COST;
+(TaskField *)BASELINE4_WORK;
+(TaskField *)BASELINE4_DURATION;
+(TaskField *)BASELINE5_START;
+(TaskField *)BASELINE5_FINISH;
+(TaskField *)BASELINE5_COST;
+(TaskField *)BASELINE5_WORK;
+(TaskField *)BASELINE5_DURATION;
+(TaskField *)BASELINE6_START;
+(TaskField *)BASELINE6_FINISH;
+(TaskField *)BASELINE6_COST;
+(TaskField *)BASELINE6_WORK;
+(TaskField *)BASELINE6_DURATION;
+(TaskField *)BASELINE7_START;
+(TaskField *)BASELINE7_FINISH;
+(TaskField *)BASELINE7_COST;
+(TaskField *)BASELINE7_WORK;
+(TaskField *)BASELINE7_DURATION;
+(TaskField *)BASELINE8_START;
+(TaskField *)BASELINE8_FINISH;
+(TaskField *)BASELINE8_COST;
+(TaskField *)BASELINE8_WORK;
+(TaskField *)BASELINE8_DURATION;
+(TaskField *)BASELINE9_START;
+(TaskField *)BASELINE9_FINISH;
+(TaskField *)BASELINE9_COST;
+(TaskField *)BASELINE9_WORK;
+(TaskField *)BASELINE9_DURATION;
+(TaskField *)BASELINE10_START;
+(TaskField *)BASELINE10_FINISH;
+(TaskField *)BASELINE10_COST;
+(TaskField *)BASELINE10_WORK;
+(TaskField *)BASELINE10_DURATION;
+(TaskField *)ENTERPRISE_COST1;
+(TaskField *)ENTERPRISE_COST2;
+(TaskField *)ENTERPRISE_COST3;
+(TaskField *)ENTERPRISE_COST4;
+(TaskField *)ENTERPRISE_COST5;
+(TaskField *)ENTERPRISE_COST6;
+(TaskField *)ENTERPRISE_COST7;
+(TaskField *)ENTERPRISE_COST8;
+(TaskField *)ENTERPRISE_COST9;
+(TaskField *)ENTERPRISE_COST10;
+(TaskField *)ENTERPRISE_DATE1;
+(TaskField *)ENTERPRISE_DATE2;
+(TaskField *)ENTERPRISE_DATE3;
+(TaskField *)ENTERPRISE_DATE4;
+(TaskField *)ENTERPRISE_DATE5;
+(TaskField *)ENTERPRISE_DATE6;
+(TaskField *)ENTERPRISE_DATE7;
+(TaskField *)ENTERPRISE_DATE8;
+(TaskField *)ENTERPRISE_DATE9;
+(TaskField *)ENTERPRISE_DATE10;
+(TaskField *)ENTERPRISE_DATE11;
+(TaskField *)ENTERPRISE_DATE12;
+(TaskField *)ENTERPRISE_DATE13;
+(TaskField *)ENTERPRISE_DATE14;
+(TaskField *)ENTERPRISE_DATE15;
+(TaskField *)ENTERPRISE_DATE16;
+(TaskField *)ENTERPRISE_DATE17;
+(TaskField *)ENTERPRISE_DATE18;
+(TaskField *)ENTERPRISE_DATE19;
+(TaskField *)ENTERPRISE_DATE20;
+(TaskField *)ENTERPRISE_DATE21;
+(TaskField *)ENTERPRISE_DATE22;
+(TaskField *)ENTERPRISE_DATE23;
+(TaskField *)ENTERPRISE_DATE24;
+(TaskField *)ENTERPRISE_DATE25;
+(TaskField *)ENTERPRISE_DATE26;
+(TaskField *)ENTERPRISE_DATE27;
+(TaskField *)ENTERPRISE_DATE28;
+(TaskField *)ENTERPRISE_DATE29;
+(TaskField *)ENTERPRISE_DATE30;
+(TaskField *)ENTERPRISE_DURATION1_UNITS;
+(TaskField *)ENTERPRISE_DURATION2_UNITS;
+(TaskField *)ENTERPRISE_DURATION3_UNITS;
+(TaskField *)ENTERPRISE_DURATION4_UNITS;
+(TaskField *)ENTERPRISE_DURATION5_UNITS;
+(TaskField *)ENTERPRISE_DURATION6_UNITS;
+(TaskField *)ENTERPRISE_DURATION7_UNITS;
+(TaskField *)ENTERPRISE_DURATION8_UNITS;
+(TaskField *)ENTERPRISE_DURATION9_UNITS;
+(TaskField *)ENTERPRISE_DURATION10_UNITS;
+(TaskField *)ENTERPRISE_DURATION1;
+(TaskField *)ENTERPRISE_DURATION2;
+(TaskField *)ENTERPRISE_DURATION3;
+(TaskField *)ENTERPRISE_DURATION4;
+(TaskField *)ENTERPRISE_DURATION5;
+(TaskField *)ENTERPRISE_DURATION6;
+(TaskField *)ENTERPRISE_DURATION7;
+(TaskField *)ENTERPRISE_DURATION8;
+(TaskField *)ENTERPRISE_DURATION9;
+(TaskField *)ENTERPRISE_DURATION10;
+(TaskField *)ENTERPRISE_FLAG1;
+(TaskField *)ENTERPRISE_FLAG2;
+(TaskField *)ENTERPRISE_FLAG3;
+(TaskField *)ENTERPRISE_FLAG4;
+(TaskField *)ENTERPRISE_FLAG5;
+(TaskField *)ENTERPRISE_FLAG6;
+(TaskField *)ENTERPRISE_FLAG7;
+(TaskField *)ENTERPRISE_FLAG8;
+(TaskField *)ENTERPRISE_FLAG9;
+(TaskField *)ENTERPRISE_FLAG10;
+(TaskField *)ENTERPRISE_FLAG11;
+(TaskField *)ENTERPRISE_FLAG12;
+(TaskField *)ENTERPRISE_FLAG13;
+(TaskField *)ENTERPRISE_FLAG14;
+(TaskField *)ENTERPRISE_FLAG15;
+(TaskField *)ENTERPRISE_FLAG16;
+(TaskField *)ENTERPRISE_FLAG17;
+(TaskField *)ENTERPRISE_FLAG18;
+(TaskField *)ENTERPRISE_FLAG19;
+(TaskField *)ENTERPRISE_FLAG20;
+(TaskField *)ENTERPRISE_NUMBER1;
+(TaskField *)ENTERPRISE_NUMBER2;
+(TaskField *)ENTERPRISE_NUMBER3;
+(TaskField *)ENTERPRISE_NUMBER4;
+(TaskField *)ENTERPRISE_NUMBER5;
+(TaskField *)ENTERPRISE_NUMBER6;
+(TaskField *)ENTERPRISE_NUMBER7;
+(TaskField *)ENTERPRISE_NUMBER8;
+(TaskField *)ENTERPRISE_NUMBER9;
+(TaskField *)ENTERPRISE_NUMBER10;
+(TaskField *)ENTERPRISE_NUMBER11;
+(TaskField *)ENTERPRISE_NUMBER12;
+(TaskField *)ENTERPRISE_NUMBER13;
+(TaskField *)ENTERPRISE_NUMBER14;
+(TaskField *)ENTERPRISE_NUMBER15;
+(TaskField *)ENTERPRISE_NUMBER16;
+(TaskField *)ENTERPRISE_NUMBER17;
+(TaskField *)ENTERPRISE_NUMBER18;
+(TaskField *)ENTERPRISE_NUMBER19;
+(TaskField *)ENTERPRISE_NUMBER20;
+(TaskField *)ENTERPRISE_NUMBER21;
+(TaskField *)ENTERPRISE_NUMBER22;
+(TaskField *)ENTERPRISE_NUMBER23;
+(TaskField *)ENTERPRISE_NUMBER24;
+(TaskField *)ENTERPRISE_NUMBER25;
+(TaskField *)ENTERPRISE_NUMBER26;
+(TaskField *)ENTERPRISE_NUMBER27;
+(TaskField *)ENTERPRISE_NUMBER28;
+(TaskField *)ENTERPRISE_NUMBER29;
+(TaskField *)ENTERPRISE_NUMBER30;
+(TaskField *)ENTERPRISE_NUMBER31;
+(TaskField *)ENTERPRISE_NUMBER32;
+(TaskField *)ENTERPRISE_NUMBER33;
+(TaskField *)ENTERPRISE_NUMBER34;
+(TaskField *)ENTERPRISE_NUMBER35;
+(TaskField *)ENTERPRISE_NUMBER36;
+(TaskField *)ENTERPRISE_NUMBER37;
+(TaskField *)ENTERPRISE_NUMBER38;
+(TaskField *)ENTERPRISE_NUMBER39;
+(TaskField *)ENTERPRISE_NUMBER40;
+(TaskField *)ENTERPRISE_TEXT1;
+(TaskField *)ENTERPRISE_TEXT2;
+(TaskField *)ENTERPRISE_TEXT3;
+(TaskField *)ENTERPRISE_TEXT4;
+(TaskField *)ENTERPRISE_TEXT5;
+(TaskField *)ENTERPRISE_TEXT6;
+(TaskField *)ENTERPRISE_TEXT7;
+(TaskField *)ENTERPRISE_TEXT8;
+(TaskField *)ENTERPRISE_TEXT9;
+(TaskField *)ENTERPRISE_TEXT10;
+(TaskField *)ENTERPRISE_TEXT11;
+(TaskField *)ENTERPRISE_TEXT12;
+(TaskField *)ENTERPRISE_TEXT13;
+(TaskField *)ENTERPRISE_TEXT14;
+(TaskField *)ENTERPRISE_TEXT15;
+(TaskField *)ENTERPRISE_TEXT16;
+(TaskField *)ENTERPRISE_TEXT17;
+(TaskField *)ENTERPRISE_TEXT18;
+(TaskField *)ENTERPRISE_TEXT19;
+(TaskField *)ENTERPRISE_TEXT20;
+(TaskField *)ENTERPRISE_TEXT21;
+(TaskField *)ENTERPRISE_TEXT22;
+(TaskField *)ENTERPRISE_TEXT23;
+(TaskField *)ENTERPRISE_TEXT24;
+(TaskField *)ENTERPRISE_TEXT25;
+(TaskField *)ENTERPRISE_TEXT26;
+(TaskField *)ENTERPRISE_TEXT27;
+(TaskField *)ENTERPRISE_TEXT28;
+(TaskField *)ENTERPRISE_TEXT29;
+(TaskField *)ENTERPRISE_TEXT30;
+(TaskField *)ENTERPRISE_TEXT31;
+(TaskField *)ENTERPRISE_TEXT32;
+(TaskField *)ENTERPRISE_TEXT33;
+(TaskField *)ENTERPRISE_TEXT34;
+(TaskField *)ENTERPRISE_TEXT35;
+(TaskField *)ENTERPRISE_TEXT36;
+(TaskField *)ENTERPRISE_TEXT37;
+(TaskField *)ENTERPRISE_TEXT38;
+(TaskField *)ENTERPRISE_TEXT39;
+(TaskField *)ENTERPRISE_TEXT40;
+(TaskField *)COMPLETE_THROUGH;
+(TaskField *)SUMMARY_PROGRESS;
+(TaskField *)GUID;
+(TaskField *)ACTIVE; 
+(TaskField *)TASK_MODE;
+(TaskField *)ASSIGNMENT_OWNER;
+(TaskField *)BASELINE_BUDGET_COST;
+(TaskField *)BASELINE_BUDGET_WORK;
+(TaskField *)BASELINE_DELIVERABLE_FINISH;
+(TaskField *)BASELINE_DELIVERABLE_START;
+(TaskField *)BASELINE_ESTIMATED_DURATION;
+(TaskField *)BASELINE_ESTIMATED_START;
+(TaskField *)BASELINE_ESTIMATED_FINISH;
+(TaskField *)BASELINE_FIXED_COST;
+(TaskField *)BASELINE_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE1_ESTIMATED_START;
+(TaskField *)BASELINE1_ESTIMATED_FINISH;
+(TaskField *)BASELINE1_ESTIMATED_DURATION;
+(TaskField *)BASELINE1_FIXED_COST;
+(TaskField *)BASELINE1_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE1_BUDGET_COST;
+(TaskField *)BASELINE1_BUDGET_WORK;
+(TaskField *)BASELINE1_DELIVERABLE_FINISH;
+(TaskField *)BASELINE1_DELIVERABLE_START;
+(TaskField *)BASELINE2_ESTIMATED_START;
+(TaskField *)BASELINE2_ESTIMATED_FINISH;
+(TaskField *)BASELINE2_ESTIMATED_DURATION;
+(TaskField *)BASELINE2_FIXED_COST;
+(TaskField *)BASELINE2_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE2_BUDGET_COST;
+(TaskField *)BASELINE2_BUDGET_WORK;
+(TaskField *)BASELINE2_DELIVERABLE_FINISH;
+(TaskField *)BASELINE2_DELIVERABLE_START;
+(TaskField *)BASELINE3_ESTIMATED_START;
+(TaskField *)BASELINE3_ESTIMATED_FINISH;
+(TaskField *)BASELINE3_ESTIMATED_DURATION;
+(TaskField *)BASELINE3_FIXED_COST;
+(TaskField *)BASELINE3_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE3_BUDGET_COST;
+(TaskField *)BASELINE3_BUDGET_WORK;
+(TaskField *)BASELINE3_DELIVERABLE_FINISH;
+(TaskField *)BASELINE3_DELIVERABLE_START;
+(TaskField *)BASELINE4_ESTIMATED_START;
+(TaskField *)BASELINE4_ESTIMATED_FINISH;
+(TaskField *)BASELINE4_ESTIMATED_DURATION;
+(TaskField *)BASELINE4_FIXED_COST;
+(TaskField *)BASELINE4_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE4_BUDGET_COST;
+(TaskField *)BASELINE4_BUDGET_WORK;
+(TaskField *)BASELINE4_DELIVERABLE_FINISH;
+(TaskField *)BASELINE4_DELIVERABLE_START;
+(TaskField *)BASELINE5_ESTIMATED_START;
+(TaskField *)BASELINE5_ESTIMATED_FINISH;
+(TaskField *)BASELINE5_ESTIMATED_DURATION;
+(TaskField *)BASELINE5_FIXED_COST;
+(TaskField *)BASELINE5_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE5_BUDGET_COST;
+(TaskField *)BASELINE5_BUDGET_WORK;
+(TaskField *)BASELINE5_DELIVERABLE_FINISH;
+(TaskField *)BASELINE5_DELIVERABLE_START;
+(TaskField *)BASELINE6_ESTIMATED_START;
+(TaskField *)BASELINE6_ESTIMATED_FINISH;
+(TaskField *)BASELINE6_ESTIMATED_DURATION;
+(TaskField *)BASELINE6_FIXED_COST;
+(TaskField *)BASELINE6_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE6_BUDGET_COST;
+(TaskField *)BASELINE6_BUDGET_WORK;
+(TaskField *)BASELINE6_DELIVERABLE_FINISH;
+(TaskField *)BASELINE6_DELIVERABLE_START;
+(TaskField *)BASELINE7_ESTIMATED_START;
+(TaskField *)BASELINE7_ESTIMATED_FINISH;
+(TaskField *)BASELINE7_ESTIMATED_DURATION;
+(TaskField *)BASELINE7_FIXED_COST;
+(TaskField *)BASELINE7_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE7_BUDGET_COST;
+(TaskField *)BASELINE7_BUDGET_WORK;
+(TaskField *)BASELINE7_DELIVERABLE_FINISH;
+(TaskField *)BASELINE7_DELIVERABLE_START;
+(TaskField *)BASELINE8_ESTIMATED_START;
+(TaskField *)BASELINE8_ESTIMATED_FINISH;
+(TaskField *)BASELINE8_ESTIMATED_DURATION;
+(TaskField *)BASELINE8_FIXED_COST;
+(TaskField *)BASELINE8_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE8_BUDGET_COST;
+(TaskField *)BASELINE8_BUDGET_WORK;
+(TaskField *)BASELINE8_DELIVERABLE_FINISH;
+(TaskField *)BASELINE8_DELIVERABLE_START;
+(TaskField *)BASELINE9_ESTIMATED_START;
+(TaskField *)BASELINE9_ESTIMATED_FINISH;
+(TaskField *)BASELINE9_ESTIMATED_DURATION;
+(TaskField *)BASELINE9_FIXED_COST;
+(TaskField *)BASELINE9_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE9_BUDGET_COST;
+(TaskField *)BASELINE9_BUDGET_WORK;
+(TaskField *)BASELINE9_DELIVERABLE_FINISH;
+(TaskField *)BASELINE9_DELIVERABLE_START;
+(TaskField *)BASELINE10_ESTIMATED_START;
+(TaskField *)BASELINE10_ESTIMATED_FINISH;
+(TaskField *)BASELINE10_ESTIMATED_DURATION;
+(TaskField *)BASELINE10_FIXED_COST;
+(TaskField *)BASELINE10_FIXED_COST_ACCRUAL;
+(TaskField *)BASELINE10_BUDGET_COST;
+(TaskField *)BASELINE10_BUDGET_WORK;
+(TaskField *)BASELINE10_DELIVERABLE_FINISH;
+(TaskField *)BASELINE10_DELIVERABLE_START;
+(TaskField *)CPI;
+(TaskField *)CVPERCENT;
+(TaskField *)DELIVERABLE_FINISH;
+(TaskField *)DELIVERABLE_GUID;
+(TaskField *)DELIVERABLE_NAME;
+(TaskField *)DELIVERABLE_START;
+(TaskField *)DELIVERABLE_TYPE;
+(TaskField *)EAC;
+(TaskField *)EARNED_VALUE_METHOD;
+(TaskField *)ERROR_MESSAGE;
+(TaskField *)HIDE_BAR;
+(TaskField *)IGNORE_WARNINGS;
+(TaskField *)PEAK;
+(TaskField *)PHYSICAL_PERCENT_COMPLETE;
+(TaskField *)PLACEHOLDER;
+(TaskField *)PUBLISH;
+(TaskField *)REQUEST_DEMAND;
+(TaskField *)SCHEDULED_DURATION;
+(TaskField *)SCHEDULED_FINISH;
+(TaskField *)SCHEDULED_START;
+(TaskField *)SPI;
+(TaskField *)STATUS;
+(TaskField *)STATUS_INDICATOR;
+(TaskField *)STATUS_MANAGER;
+(TaskField *)SVPERCENT;
+(TaskField *)TASK_CALENDAR;
+(TaskField *)TASK_CALENDAR_GUID;
+(TaskField *)TCPI;
+(TaskField *)WARNING;
+(TaskField *)UNAVAILABLE;
+(TaskField *)START_TEXT;
+(TaskField *)FINISH_TEXT;
+(TaskField *)DURATION_TEXT;
+(TaskField *)MANUAL_DURATION_UNITS;
+(TaskField *)MANUAL_DURATION;
+(TaskField *)SUBPROJECT_TASKS_UNIQUEID_OFFSET;
+(TaskField *)SUBPROJECT_UNIQUE_TASK_ID;
+(TaskField *)SUBPROJECT_TASK_ID;
+(TaskField *)HYPERLINK_DATA;
+(TaskField *)RECURRING_DATA;
+(TaskField *)OUTLINE_CODE1_INDEX;
+(TaskField *)OUTLINE_CODE2_INDEX;
+(TaskField *)OUTLINE_CODE3_INDEX;
+(TaskField *)OUTLINE_CODE4_INDEX;
+(TaskField *)OUTLINE_CODE5_INDEX;
+(TaskField *)OUTLINE_CODE6_INDEX;
+(TaskField *)OUTLINE_CODE7_INDEX;
+(TaskField *)OUTLINE_CODE8_INDEX;
+(TaskField *)OUTLINE_CODE9_INDEX;
+(TaskField *)OUTLINE_CODE10_INDEX;
+(TaskField *)ENTERPRISE_DATA;
+(TaskField *)PARENT_TASK_UNIQUE_ID;
+(TaskField *)CALENDAR_UNIQUE_ID;
+(TaskField *)FIXED_DURATION;
+(TaskField *)RESUME_NO_EARLIER_THAN;
+(TaskField *)PARENT_TASK;
+(TaskField *)INDEX;
+(TaskField *)DURATION1_ESTIMATED;
+(TaskField *)DURATION2_ESTIMATED;
+(TaskField *)DURATION3_ESTIMATED;
+(TaskField *)DURATION4_ESTIMATED;
+(TaskField *)DURATION5_ESTIMATED;
+(TaskField *)DURATION6_ESTIMATED;
+(TaskField *)DURATION7_ESTIMATED;
+(TaskField *)DURATION8_ESTIMATED;
+(TaskField *)DURATION9_ESTIMATED;
+(TaskField *)DURATION10_ESTIMATED;
+(TaskField *)BASELINE_DURATION_ESTIMATED;
+(TaskField *)HYPERLINK_SCREEN_TIP;
+(TaskField *)ENTERPRISE_OUTLINE_CODE1;
+(TaskField *)ENTERPRISE_OUTLINE_CODE2;
+(TaskField *)ENTERPRISE_OUTLINE_CODE3;
+(TaskField *)ENTERPRISE_OUTLINE_CODE4;
+(TaskField *)ENTERPRISE_OUTLINE_CODE5;
+(TaskField *)ENTERPRISE_OUTLINE_CODE6;
+(TaskField *)ENTERPRISE_OUTLINE_CODE7;
+(TaskField *)ENTERPRISE_OUTLINE_CODE8;
+(TaskField *)ENTERPRISE_OUTLINE_CODE9;
+(TaskField *)ENTERPRISE_OUTLINE_CODE10;
+(TaskField *)ENTERPRISE_OUTLINE_CODE11;
+(TaskField *)ENTERPRISE_OUTLINE_CODE12;
+(TaskField *)ENTERPRISE_OUTLINE_CODE13;
+(TaskField *)ENTERPRISE_OUTLINE_CODE14;
+(TaskField *)ENTERPRISE_OUTLINE_CODE15;
+(TaskField *)ENTERPRISE_OUTLINE_CODE16;
+(TaskField *)ENTERPRISE_OUTLINE_CODE17;
+(TaskField *)ENTERPRISE_OUTLINE_CODE18;
+(TaskField *)ENTERPRISE_OUTLINE_CODE19;
+(TaskField *)ENTERPRISE_OUTLINE_CODE20;
+(TaskField *)ENTERPRISE_OUTLINE_CODE21;
+(TaskField *)ENTERPRISE_OUTLINE_CODE22;
+(TaskField *)ENTERPRISE_OUTLINE_CODE23;
+(TaskField *)ENTERPRISE_OUTLINE_CODE24;
+(TaskField *)ENTERPRISE_OUTLINE_CODE25;
+(TaskField *)ENTERPRISE_OUTLINE_CODE26;
+(TaskField *)ENTERPRISE_OUTLINE_CODE27;
+(TaskField *)ENTERPRISE_OUTLINE_CODE28;
+(TaskField *)ENTERPRISE_OUTLINE_CODE29;
+(TaskField *)ENTERPRISE_OUTLINE_CODE30;
+(TaskField *)BASELINE1_DURATION_ESTIMATED;
+(TaskField *)BASELINE2_DURATION_ESTIMATED;
+(TaskField *)BASELINE3_DURATION_ESTIMATED;
+(TaskField *)BASELINE4_DURATION_ESTIMATED;
+(TaskField *)BASELINE5_DURATION_ESTIMATED;
+(TaskField *)BASELINE6_DURATION_ESTIMATED;
+(TaskField *)BASELINE7_DURATION_ESTIMATED;
+(TaskField *)BASELINE8_DURATION_ESTIMATED;
+(TaskField *)BASELINE9_DURATION_ESTIMATED;
+(TaskField *)BASELINE10_DURATION_ESTIMATED;
+(TaskField *)ENTERPRISE_PROJECT_COST1;
+(TaskField *)ENTERPRISE_PROJECT_COST2;
+(TaskField *)ENTERPRISE_PROJECT_COST3;
+(TaskField *)ENTERPRISE_PROJECT_COST4;
+(TaskField *)ENTERPRISE_PROJECT_COST5;
+(TaskField *)ENTERPRISE_PROJECT_COST6;
+(TaskField *)ENTERPRISE_PROJECT_COST7;
+(TaskField *)ENTERPRISE_PROJECT_COST8;
+(TaskField *)ENTERPRISE_PROJECT_COST9;
+(TaskField *)ENTERPRISE_PROJECT_COST10;
+(TaskField *)ENTERPRISE_PROJECT_DATE1;
+(TaskField *)ENTERPRISE_PROJECT_DATE2;
+(TaskField *)ENTERPRISE_PROJECT_DATE3;
+(TaskField *)ENTERPRISE_PROJECT_DATE4;
+(TaskField *)ENTERPRISE_PROJECT_DATE5;
+(TaskField *)ENTERPRISE_PROJECT_DATE6;
+(TaskField *)ENTERPRISE_PROJECT_DATE7;
+(TaskField *)ENTERPRISE_PROJECT_DATE8;
+(TaskField *)ENTERPRISE_PROJECT_DATE9;
+(TaskField *)ENTERPRISE_PROJECT_DATE10;
+(TaskField *)ENTERPRISE_PROJECT_DATE11;
+(TaskField *)ENTERPRISE_PROJECT_DATE12;
+(TaskField *)ENTERPRISE_PROJECT_DATE13;
+(TaskField *)ENTERPRISE_PROJECT_DATE14;
+(TaskField *)ENTERPRISE_PROJECT_DATE15;
+(TaskField *)ENTERPRISE_PROJECT_DATE16;
+(TaskField *)ENTERPRISE_PROJECT_DATE17;
+(TaskField *)ENTERPRISE_PROJECT_DATE18;
+(TaskField *)ENTERPRISE_PROJECT_DATE19;
+(TaskField *)ENTERPRISE_PROJECT_DATE20;
+(TaskField *)ENTERPRISE_PROJECT_DATE21;
+(TaskField *)ENTERPRISE_PROJECT_DATE22;
+(TaskField *)ENTERPRISE_PROJECT_DATE23;
+(TaskField *)ENTERPRISE_PROJECT_DATE24;
+(TaskField *)ENTERPRISE_PROJECT_DATE25;
+(TaskField *)ENTERPRISE_PROJECT_DATE26;
+(TaskField *)ENTERPRISE_PROJECT_DATE27;
+(TaskField *)ENTERPRISE_PROJECT_DATE28;
+(TaskField *)ENTERPRISE_PROJECT_DATE29;
+(TaskField *)ENTERPRISE_PROJECT_DATE30;
+(TaskField *)ENTERPRISE_PROJECT_DURATION1;
+(TaskField *)ENTERPRISE_PROJECT_DURATION2;
+(TaskField *)ENTERPRISE_PROJECT_DURATION3;
+(TaskField *)ENTERPRISE_PROJECT_DURATION4;
+(TaskField *)ENTERPRISE_PROJECT_DURATION5;
+(TaskField *)ENTERPRISE_PROJECT_DURATION6;
+(TaskField *)ENTERPRISE_PROJECT_DURATION7;
+(TaskField *)ENTERPRISE_PROJECT_DURATION8;
+(TaskField *)ENTERPRISE_PROJECT_DURATION9;
+(TaskField *)ENTERPRISE_PROJECT_DURATION10;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE1;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE2;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE3;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE4;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE5;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE6;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE7;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE8;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE9;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE10;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE11;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE12;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE13;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE14;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE15;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE16;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE17;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE18;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE19;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE20;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE21;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE22;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE23;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE24;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE25;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE26;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE27;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE28;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE29;
+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE30;
+(TaskField *)ENTERPRISE_PROJECT_FLAG1;
+(TaskField *)ENTERPRISE_PROJECT_FLAG2;
+(TaskField *)ENTERPRISE_PROJECT_FLAG3;
+(TaskField *)ENTERPRISE_PROJECT_FLAG4;
+(TaskField *)ENTERPRISE_PROJECT_FLAG5;
+(TaskField *)ENTERPRISE_PROJECT_FLAG6;
+(TaskField *)ENTERPRISE_PROJECT_FLAG7;
+(TaskField *)ENTERPRISE_PROJECT_FLAG8;
+(TaskField *)ENTERPRISE_PROJECT_FLAG9;
+(TaskField *)ENTERPRISE_PROJECT_FLAG10;
+(TaskField *)ENTERPRISE_PROJECT_FLAG11;
+(TaskField *)ENTERPRISE_PROJECT_FLAG12;
+(TaskField *)ENTERPRISE_PROJECT_FLAG13;
+(TaskField *)ENTERPRISE_PROJECT_FLAG14;
+(TaskField *)ENTERPRISE_PROJECT_FLAG15;
+(TaskField *)ENTERPRISE_PROJECT_FLAG16;
+(TaskField *)ENTERPRISE_PROJECT_FLAG17;
+(TaskField *)ENTERPRISE_PROJECT_FLAG18;
+(TaskField *)ENTERPRISE_PROJECT_FLAG19;
+(TaskField *)ENTERPRISE_PROJECT_FLAG20;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER1;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER2;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER3;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER4;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER5;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER6;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER7;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER8;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER9;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER10;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER11;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER12;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER13;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER14;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER15;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER16;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER17;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER18;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER19;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER20;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER21;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER22;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER23;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER24;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER25;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER26;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER27;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER28;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER29;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER30;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER31;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER32;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER33;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER34;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER35;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER36;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER37;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER38;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER39;
+(TaskField *)ENTERPRISE_PROJECT_NUMBER40;
+(TaskField *)ENTERPRISE_PROJECT_TEXT1;
+(TaskField *)ENTERPRISE_PROJECT_TEXT2;
+(TaskField *)ENTERPRISE_PROJECT_TEXT3;
+(TaskField *)ENTERPRISE_PROJECT_TEXT4;
+(TaskField *)ENTERPRISE_PROJECT_TEXT5;
+(TaskField *)ENTERPRISE_PROJECT_TEXT6;
+(TaskField *)ENTERPRISE_PROJECT_TEXT7;
+(TaskField *)ENTERPRISE_PROJECT_TEXT8;
+(TaskField *)ENTERPRISE_PROJECT_TEXT9;
+(TaskField *)ENTERPRISE_PROJECT_TEXT10;
+(TaskField *)ENTERPRISE_PROJECT_TEXT11;
+(TaskField *)ENTERPRISE_PROJECT_TEXT12;
+(TaskField *)ENTERPRISE_PROJECT_TEXT13;
+(TaskField *)ENTERPRISE_PROJECT_TEXT14;
+(TaskField *)ENTERPRISE_PROJECT_TEXT15;
+(TaskField *)ENTERPRISE_PROJECT_TEXT16;
+(TaskField *)ENTERPRISE_PROJECT_TEXT17;
+(TaskField *)ENTERPRISE_PROJECT_TEXT18;
+(TaskField *)ENTERPRISE_PROJECT_TEXT19;
+(TaskField *)ENTERPRISE_PROJECT_TEXT20;
+(TaskField *)ENTERPRISE_PROJECT_TEXT21;
+(TaskField *)ENTERPRISE_PROJECT_TEXT22;
+(TaskField *)ENTERPRISE_PROJECT_TEXT23;
+(TaskField *)ENTERPRISE_PROJECT_TEXT24;
+(TaskField *)ENTERPRISE_PROJECT_TEXT25;
+(TaskField *)ENTERPRISE_PROJECT_TEXT26;
+(TaskField *)ENTERPRISE_PROJECT_TEXT27;
+(TaskField *)ENTERPRISE_PROJECT_TEXT28;
+(TaskField *)ENTERPRISE_PROJECT_TEXT29;
+(TaskField *)ENTERPRISE_PROJECT_TEXT30;
+(TaskField *)ENTERPRISE_PROJECT_TEXT31;
+(TaskField *)ENTERPRISE_PROJECT_TEXT32;
+(TaskField *)ENTERPRISE_PROJECT_TEXT33;
+(TaskField *)ENTERPRISE_PROJECT_TEXT34;
+(TaskField *)ENTERPRISE_PROJECT_TEXT35;
+(TaskField *)ENTERPRISE_PROJECT_TEXT36;
+(TaskField *)ENTERPRISE_PROJECT_TEXT37;
+(TaskField *)ENTERPRISE_PROJECT_TEXT38;
+(TaskField *)ENTERPRISE_PROJECT_TEXT39;
+(TaskField *)ENTERPRISE_PROJECT_TEXT40;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE1;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE2;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE3;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE4;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE5;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE6;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE7;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE8;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE9;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE10;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE11;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE12;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE13;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE14;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE15;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE16;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE17;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE18;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE19;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE20;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE21;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE22;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE23;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE24;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE25;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE26;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE27;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE28;
+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE29;
+(TaskField *)RESOURCE_ENTERPRISE_RBS;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE20;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE21;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE22;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE23;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE24;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE25;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE26;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE27;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE28;
+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE29;
+(TaskField *)ACTUAL_WORK_PROTECTED;
+(TaskField *)ACTUAL_OVERTIME_WORK_PROTECTED;
+(TaskField *)BUDGET_WORK;
+(TaskField *)BUDGET_COST;
+(TaskField *)RECALC_OUTLINE_CODES;
+(TaskField *)IS_START_VALID;
+(TaskField *)IS_FINISH_VALID;
+(TaskField *)IS_DURATION_VALID;
+(TaskField *)FINISH;

@end