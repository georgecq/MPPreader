//
//  AssignmentField.m
//  MppViewer
//
//  Created by Fernando Araya on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AssignmentField.h"
#import "DataType.h"
#import "FieldType.h"

@implementation AssignmentField

static AssignmentField *_START = nil;
static AssignmentField *_DURATION1_UNITS = nil;
static AssignmentField *_DURATION2_UNITS = nil;
static AssignmentField *_DURATION3_UNITS = nil;
static AssignmentField *_DURATION4_UNITS = nil;
static AssignmentField *_DURATION5_UNITS = nil;
static AssignmentField *_DURATION6_UNITS = nil;
static AssignmentField *_DURATION7_UNITS = nil;
static AssignmentField *_DURATION8_UNITS = nil;
static AssignmentField *_DURATION9_UNITS = nil;
static AssignmentField *_DURATION10_UNITS = nil;
static AssignmentField *_ACTUAL_COST = nil;
static AssignmentField *_ACTUAL_WORK = nil;
static AssignmentField *_COST = nil;
static AssignmentField *_ASSIGNMENT_DELAY = nil;
static AssignmentField *_VARIABLE_RATE_UNITS = nil;
static AssignmentField *_ASSIGNMENT_UNITS = nil;
static AssignmentField *_WORK = nil;
static AssignmentField *_BASELINE_START = nil;
static AssignmentField *_ACTUAL_START = nil;
static AssignmentField *_BASELINE_FINISH = nil;
static AssignmentField *_ACTUAL_FINISH = nil;
static AssignmentField *_BASELINE_WORK = nil;
static AssignmentField *_OVERTIME_WORK = nil;
static AssignmentField *_BASELINE_COST = nil;
static AssignmentField *_WORK_CONTOUR = nil;
static AssignmentField *_REMAINING_WORK = nil;
static AssignmentField *_LEVELING_DELAY_UNITS = nil;
static AssignmentField *_LEVELING_DELAY = nil;
static AssignmentField *_DELAY = nil;
static AssignmentField *_UNIQUE_ID = nil;
static AssignmentField *_TASK_UNIQUE_ID = nil;
static AssignmentField *_RESOURCE_UNIQUE_ID = nil;
static AssignmentField *_TIMEPHASED_WORK = nil;
static AssignmentField *_TIMEPHASED_ACTUAL_WORK = nil;
static AssignmentField *_TIMEPHASED_ACTUAL_OVERTIME_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE1_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE2_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE3_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE4_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE5_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE6_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE7_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE8_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE9_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE10_WORK = nil;
static AssignmentField *_TIMEPHASED_BASELINE_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE1_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE2_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE3_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE4_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE5_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE6_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE7_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE8_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE9_COST = nil;
static AssignmentField *_TIMEPHASED_BASELINE10_COST = nil;
static AssignmentField *_TASK_ID = nil;
static AssignmentField *_RESOURCE_ID = nil;
static AssignmentField *_TASK_NAME = nil;
static AssignmentField *_RESOURCE_NAME = nil;
static AssignmentField *_REGULAR_WORK = nil;
static AssignmentField *_ACTUAL_OVERTIME_WORK = nil;
static AssignmentField *_REMAINING_OVERTIME_WORK = nil;
static AssignmentField *_PEAK = nil;
static AssignmentField *_OVERTIME_COST = nil;
static AssignmentField *_REMAINING_COST = nil;
static AssignmentField *_ACTUAL_OVERTIME_COST = nil;
static AssignmentField *_REMAINING_OVERTIME_COST = nil;
static AssignmentField *_BCWS = nil;
static AssignmentField *_BCWP = nil;
static AssignmentField *_ACWP = nil;
static AssignmentField *_SV = nil;
static AssignmentField *_COST_VARIANCE = nil;
static AssignmentField *_PERCENT_WORK_COMPLETE = nil;
static AssignmentField *_PROJECT = nil;
static AssignmentField *_NOTES = nil;
static AssignmentField *_CONFIRMED = nil;
static AssignmentField *_RESPONSE_PENDING = nil;
static AssignmentField *_UPDATE_NEEDED = nil;
static AssignmentField *_TEAM_STATUS_PENDING = nil;
static AssignmentField *_COST_RATE_TABLE = nil;
static AssignmentField *_TEXT1 = nil;
static AssignmentField *_TEXT2 = nil;
static AssignmentField *_TEXT3 = nil;
static AssignmentField *_TEXT4 = nil;
static AssignmentField *_TEXT5 = nil;
static AssignmentField *_TEXT6 = nil;
static AssignmentField *_TEXT7 = nil;
static AssignmentField *_TEXT8 = nil;
static AssignmentField *_TEXT9 = nil;
static AssignmentField *_TEXT10 = nil;
static AssignmentField *_START1 = nil;
static AssignmentField *_START2 = nil;
static AssignmentField *_START3 = nil;
static AssignmentField *_START4 = nil;
static AssignmentField *_START5 = nil;
static AssignmentField *_FINISH1 = nil;
static AssignmentField *_FINISH2 = nil;
static AssignmentField *_FINISH3 = nil;
static AssignmentField *_FINISH4 = nil;
static AssignmentField *_FINISH5 = nil;
static AssignmentField *_NUMBER1 = nil;
static AssignmentField *_NUMBER2 = nil;
static AssignmentField *_NUMBER3 = nil;
static AssignmentField *_NUMBER4 = nil;
static AssignmentField *_NUMBER5 = nil;
static AssignmentField *_DURATION1 = nil;
static AssignmentField *_DURATION2 = nil;
static AssignmentField *_DURATION3 = nil;
static AssignmentField *_COST1 = nil;
static AssignmentField *_COST2 = nil;
static AssignmentField *_COST3 = nil;
static AssignmentField *_FLAG10 = nil;
static AssignmentField *_FLAG1 = nil;
static AssignmentField *_FLAG2 = nil;
static AssignmentField *_FLAG3 = nil;
static AssignmentField *_FLAG4 = nil;
static AssignmentField *_FLAG5 = nil;
static AssignmentField *_FLAG6 = nil;
static AssignmentField *_FLAG7 = nil;
static AssignmentField *_FLAG8 = nil;
static AssignmentField *_FLAG9 = nil;
static AssignmentField *_LINKED_FIELDS = nil;
static AssignmentField *_OVERALLOCATED = nil;
static AssignmentField *_TASK_SUMMARY_NAME = nil;
static AssignmentField *_HYPERLINK = nil;
static AssignmentField *_HYPERLINK_ADDRESS = nil;
static AssignmentField *_HYPERLINK_SUBADDRESS = nil;
static AssignmentField *_HYPERLINK_HREF = nil;
static AssignmentField *_COST4 = nil;
static AssignmentField *_COST5 = nil;
static AssignmentField *_COST6 = nil;
static AssignmentField *_COST7 = nil;
static AssignmentField *_COST8 = nil;
static AssignmentField *_COST9 = nil;
static AssignmentField *_COST10 = nil;
static AssignmentField *_DATE1 = nil;
static AssignmentField *_DATE2 = nil;
static AssignmentField *_DATE3 = nil;
static AssignmentField *_DATE4 = nil;
static AssignmentField *_DATE5 = nil;
static AssignmentField *_DATE6 = nil;
static AssignmentField *_DATE7 = nil;
static AssignmentField *_DATE8 = nil;
static AssignmentField *_DATE9 = nil;
static AssignmentField *_DATE10 = nil;
static AssignmentField *_DURATION4 = nil;
static AssignmentField *_DURATION5 = nil;
static AssignmentField *_DURATION6 = nil;
static AssignmentField *_DURATION7 = nil;
static AssignmentField *_DURATION8 = nil;
static AssignmentField *_DURATION9 = nil;
static AssignmentField *_DURATION10 = nil;
static AssignmentField *_FINISH6 = nil;
static AssignmentField *_FINISH7 = nil;
static AssignmentField *_FINISH8 = nil;
static AssignmentField *_FINISH9 = nil;
static AssignmentField *_FINISH10 = nil;
static AssignmentField *_FLAG11 = nil;
static AssignmentField *_FLAG12 = nil;
static AssignmentField *_FLAG13 = nil;
static AssignmentField *_FLAG14 = nil;
static AssignmentField *_FLAG15 = nil;
static AssignmentField *_FLAG16 = nil;
static AssignmentField *_FLAG17 = nil;
static AssignmentField *_FLAG18 = nil;
static AssignmentField *_FLAG19 = nil;
static AssignmentField *_FLAG20 = nil;
static AssignmentField *_NUMBER6 = nil;
static AssignmentField *_NUMBER7 = nil;
static AssignmentField *_NUMBER8 = nil;
static AssignmentField *_NUMBER9 = nil;
static AssignmentField *_NUMBER10 = nil;
static AssignmentField *_NUMBER11 = nil;
static AssignmentField *_NUMBER12 = nil;
static AssignmentField *_NUMBER13 = nil;
static AssignmentField *_NUMBER14 = nil;
static AssignmentField *_NUMBER15 = nil;
static AssignmentField *_NUMBER16 = nil;
static AssignmentField *_NUMBER17 = nil;
static AssignmentField *_NUMBER18 = nil;
static AssignmentField *_NUMBER19 = nil;
static AssignmentField *_NUMBER20 = nil;
static AssignmentField *_START6 = nil;
static AssignmentField *_START7 = nil;
static AssignmentField *_START8 = nil;
static AssignmentField *_START9 = nil;
static AssignmentField *_START10 = nil;
static AssignmentField *_TEXT11 = nil;
static AssignmentField *_TEXT12 = nil;
static AssignmentField *_TEXT13 = nil;
static AssignmentField *_TEXT14 = nil;
static AssignmentField *_TEXT15 = nil;
static AssignmentField *_TEXT16 = nil;
static AssignmentField *_TEXT17 = nil;
static AssignmentField *_TEXT18 = nil;
static AssignmentField *_TEXT19 = nil;
static AssignmentField *_TEXT20 = nil;
static AssignmentField *_TEXT21 = nil;
static AssignmentField *_TEXT22 = nil;
static AssignmentField *_TEXT23 = nil;
static AssignmentField *_TEXT24 = nil;
static AssignmentField *_TEXT25 = nil;
static AssignmentField *_TEXT26 = nil;
static AssignmentField *_TEXT27 = nil;
static AssignmentField *_TEXT28 = nil;
static AssignmentField *_TEXT29 = nil;
static AssignmentField *_TEXT30 = nil;
static AssignmentField *_INDEX = nil;
static AssignmentField *_CV = nil;
static AssignmentField *_WORK_VARIANCE = nil;
static AssignmentField *_START_VARIANCE = nil;
static AssignmentField *_FINISH_VARIANCE = nil;
static AssignmentField *_VAC = nil;
static AssignmentField *_FIXED_MATERIAL_ASSIGNMENT = nil;
static AssignmentField *_RESOURCE_TYPE = nil;
static AssignmentField *_HYPERLINK_SCREEN_TIP = nil;
static AssignmentField *_WBS = nil;
static AssignmentField *_BASELINE1_WORK = nil;
static AssignmentField *_BASELINE1_COST = nil;
static AssignmentField *_BASELINE1_START = nil;
static AssignmentField *_BASELINE1_FINISH = nil;
static AssignmentField *_BASELINE2_WORK = nil;
static AssignmentField *_BASELINE2_COST = nil;
static AssignmentField *_BASELINE2_START = nil;
static AssignmentField *_BASELINE2_FINISH = nil;
static AssignmentField *_BASELINE3_WORK = nil;
static AssignmentField *_BASELINE3_COST = nil;
static AssignmentField *_BASELINE3_START = nil;
static AssignmentField *_BASELINE3_FINISH = nil;
static AssignmentField *_BASELINE4_WORK = nil;
static AssignmentField *_BASELINE4_COST = nil;
static AssignmentField *_BASELINE4_START = nil;
static AssignmentField *_BASELINE4_FINISH = nil;
static AssignmentField *_BASELINE5_WORK = nil;
static AssignmentField *_BASELINE5_COST = nil;
static AssignmentField *_BASELINE5_START = nil;
static AssignmentField *_BASELINE5_FINISH = nil;
static AssignmentField *_BASELINE6_WORK = nil;
static AssignmentField *_BASELINE6_COST = nil;
static AssignmentField *_BASELINE6_START = nil;
static AssignmentField *_BASELINE6_FINISH = nil;
static AssignmentField *_BASELINE7_WORK = nil;
static AssignmentField *_BASELINE7_COST = nil;
static AssignmentField *_BASELINE7_START = nil;
static AssignmentField *_BASELINE7_FINISH = nil;
static AssignmentField *_BASELINE8_WORK = nil;
static AssignmentField *_BASELINE8_COST = nil;
static AssignmentField *_BASELINE8_START = nil;
static AssignmentField *_BASELINE8_FINISH = nil;
static AssignmentField *_BASELINE9_WORK = nil;
static AssignmentField *_BASELINE9_COST = nil;
static AssignmentField *_BASELINE9_START = nil;
static AssignmentField *_BASELINE9_FINISH = nil;
static AssignmentField *_BASELINE10_WORK = nil;
static AssignmentField *_BASELINE10_COST = nil;
static AssignmentField *_BASELINE10_START = nil;
static AssignmentField *_BASELINE10_FINISH = nil;
static AssignmentField *_TASK_OUTLINE_NUMBER = nil;
static AssignmentField *_ENTERPRISE_COST1 = nil;
static AssignmentField *_ENTERPRISE_COST2 = nil;
static AssignmentField *_ENTERPRISE_COST3 = nil;
static AssignmentField *_ENTERPRISE_COST4 = nil;
static AssignmentField *_ENTERPRISE_COST5 = nil;
static AssignmentField *_ENTERPRISE_COST6 = nil;
static AssignmentField *_ENTERPRISE_COST7 = nil;
static AssignmentField *_ENTERPRISE_COST8 = nil;
static AssignmentField *_ENTERPRISE_COST9 = nil;
static AssignmentField *_ENTERPRISE_COST10 = nil;
static AssignmentField *_ENTERPRISE_DATE1 = nil;
static AssignmentField *_ENTERPRISE_DATE2 = nil;
static AssignmentField *_ENTERPRISE_DATE3 = nil;
static AssignmentField *_ENTERPRISE_DATE4 = nil;
static AssignmentField *_ENTERPRISE_DATE5 = nil;
static AssignmentField *_ENTERPRISE_DATE6 = nil;
static AssignmentField *_ENTERPRISE_DATE7 = nil;
static AssignmentField *_ENTERPRISE_DATE8 = nil;
static AssignmentField *_ENTERPRISE_DATE9 = nil;
static AssignmentField *_ENTERPRISE_DATE10 = nil;
static AssignmentField *_ENTERPRISE_DATE11 = nil;
static AssignmentField *_ENTERPRISE_DATE12 = nil;
static AssignmentField *_ENTERPRISE_DATE13 = nil;
static AssignmentField *_ENTERPRISE_DATE14 = nil;
static AssignmentField *_ENTERPRISE_DATE15 = nil;
static AssignmentField *_ENTERPRISE_DATE16 = nil;
static AssignmentField *_ENTERPRISE_DATE17 = nil;
static AssignmentField *_ENTERPRISE_DATE18 = nil;
static AssignmentField *_ENTERPRISE_DATE19 = nil;
static AssignmentField *_ENTERPRISE_DATE20 = nil;
static AssignmentField *_ENTERPRISE_DATE21 = nil;
static AssignmentField *_ENTERPRISE_DATE22 = nil;
static AssignmentField *_ENTERPRISE_DATE23 = nil;
static AssignmentField *_ENTERPRISE_DATE24 = nil;
static AssignmentField *_ENTERPRISE_DATE25 = nil;
static AssignmentField *_ENTERPRISE_DATE26 = nil;
static AssignmentField *_ENTERPRISE_DATE27 = nil;
static AssignmentField *_ENTERPRISE_DATE28 = nil;
static AssignmentField *_ENTERPRISE_DATE29 = nil;
static AssignmentField *_ENTERPRISE_DATE30 = nil;
static AssignmentField *_ENTERPRISE_DURATION1 = nil;
static AssignmentField *_ENTERPRISE_DURATION2 = nil;
static AssignmentField *_ENTERPRISE_DURATION3 = nil;
static AssignmentField *_ENTERPRISE_DURATION4 = nil;
static AssignmentField *_ENTERPRISE_DURATION5 = nil;
static AssignmentField *_ENTERPRISE_DURATION6 = nil;
static AssignmentField *_ENTERPRISE_DURATION7 = nil;
static AssignmentField *_ENTERPRISE_DURATION8 = nil;
static AssignmentField *_ENTERPRISE_DURATION9 = nil;
static AssignmentField *_ENTERPRISE_DURATION10 = nil;
static AssignmentField *_ENTERPRISE_FLAG1 = nil;
static AssignmentField *_ENTERPRISE_FLAG2 = nil;
static AssignmentField *_ENTERPRISE_FLAG3 = nil;
static AssignmentField *_ENTERPRISE_FLAG4 = nil;
static AssignmentField *_ENTERPRISE_FLAG5 = nil;
static AssignmentField *_ENTERPRISE_FLAG6 = nil;
static AssignmentField *_ENTERPRISE_FLAG7 = nil;
static AssignmentField *_ENTERPRISE_FLAG8 = nil;
static AssignmentField *_ENTERPRISE_FLAG9 = nil;
static AssignmentField *_ENTERPRISE_FLAG10 = nil;
static AssignmentField *_ENTERPRISE_FLAG11 = nil;
static AssignmentField *_ENTERPRISE_FLAG12 = nil;
static AssignmentField *_ENTERPRISE_FLAG13 = nil;
static AssignmentField *_ENTERPRISE_FLAG14 = nil;
static AssignmentField *_ENTERPRISE_FLAG15 = nil;
static AssignmentField *_ENTERPRISE_FLAG16 = nil;
static AssignmentField *_ENTERPRISE_FLAG17 = nil;
static AssignmentField *_ENTERPRISE_FLAG18 = nil;
static AssignmentField *_ENTERPRISE_FLAG19 = nil;
static AssignmentField *_ENTERPRISE_FLAG20 = nil;
static AssignmentField *_ENTERPRISE_NUMBER1 = nil;
static AssignmentField *_ENTERPRISE_NUMBER2 = nil;
static AssignmentField *_ENTERPRISE_NUMBER3 = nil;
static AssignmentField *_ENTERPRISE_NUMBER4 = nil;
static AssignmentField *_ENTERPRISE_NUMBER5 = nil;
static AssignmentField *_ENTERPRISE_NUMBER6 = nil;
static AssignmentField *_ENTERPRISE_NUMBER7 = nil;
static AssignmentField *_ENTERPRISE_NUMBER8 = nil;
static AssignmentField *_ENTERPRISE_NUMBER9 = nil;
static AssignmentField *_ENTERPRISE_NUMBER10 = nil;
static AssignmentField *_ENTERPRISE_NUMBER11 = nil;
static AssignmentField *_ENTERPRISE_NUMBER12 = nil;
static AssignmentField *_ENTERPRISE_NUMBER13 = nil;
static AssignmentField *_ENTERPRISE_NUMBER14 = nil;
static AssignmentField *_ENTERPRISE_NUMBER15 = nil;
static AssignmentField *_ENTERPRISE_NUMBER16 = nil;
static AssignmentField *_ENTERPRISE_NUMBER17 = nil;
static AssignmentField *_ENTERPRISE_NUMBER18 = nil;
static AssignmentField *_ENTERPRISE_NUMBER19 = nil;
static AssignmentField *_ENTERPRISE_NUMBER20 = nil;
static AssignmentField *_ENTERPRISE_NUMBER21 = nil;
static AssignmentField *_ENTERPRISE_NUMBER22 = nil;
static AssignmentField *_ENTERPRISE_NUMBER23 = nil;
static AssignmentField *_ENTERPRISE_NUMBER24 = nil;
static AssignmentField *_ENTERPRISE_NUMBER25 = nil;
static AssignmentField *_ENTERPRISE_NUMBER26 = nil;
static AssignmentField *_ENTERPRISE_NUMBER27 = nil;
static AssignmentField *_ENTERPRISE_NUMBER28 = nil;
static AssignmentField *_ENTERPRISE_NUMBER29 = nil;
static AssignmentField *_ENTERPRISE_NUMBER30 = nil;
static AssignmentField *_ENTERPRISE_NUMBER31 = nil;
static AssignmentField *_ENTERPRISE_NUMBER32 = nil;
static AssignmentField *_ENTERPRISE_NUMBER33 = nil;
static AssignmentField *_ENTERPRISE_NUMBER34 = nil;
static AssignmentField *_ENTERPRISE_NUMBER35 = nil;
static AssignmentField *_ENTERPRISE_NUMBER36 = nil;
static AssignmentField *_ENTERPRISE_NUMBER37 = nil;
static AssignmentField *_ENTERPRISE_NUMBER38 = nil;
static AssignmentField *_ENTERPRISE_NUMBER39 = nil;
static AssignmentField *_ENTERPRISE_NUMBER40 = nil;
static AssignmentField *_ENTERPRISE_TEXT1 = nil;
static AssignmentField *_ENTERPRISE_TEXT2 = nil;
static AssignmentField *_ENTERPRISE_TEXT3 = nil;
static AssignmentField *_ENTERPRISE_TEXT4 = nil;
static AssignmentField *_ENTERPRISE_TEXT5 = nil;
static AssignmentField *_ENTERPRISE_TEXT6 = nil;
static AssignmentField *_ENTERPRISE_TEXT7 = nil;
static AssignmentField *_ENTERPRISE_TEXT8 = nil;
static AssignmentField *_ENTERPRISE_TEXT9 = nil;
static AssignmentField *_ENTERPRISE_TEXT10 = nil;
static AssignmentField *_ENTERPRISE_TEXT11 = nil;
static AssignmentField *_ENTERPRISE_TEXT12 = nil;
static AssignmentField *_ENTERPRISE_TEXT13 = nil;
static AssignmentField *_ENTERPRISE_TEXT14 = nil;
static AssignmentField *_ENTERPRISE_TEXT15 = nil;
static AssignmentField *_ENTERPRISE_TEXT16 = nil;
static AssignmentField *_ENTERPRISE_TEXT17 = nil;
static AssignmentField *_ENTERPRISE_TEXT18 = nil;
static AssignmentField *_ENTERPRISE_TEXT19 = nil;
static AssignmentField *_ENTERPRISE_TEXT20 = nil;
static AssignmentField *_ENTERPRISE_TEXT21 = nil;
static AssignmentField *_ENTERPRISE_TEXT22 = nil;
static AssignmentField *_ENTERPRISE_TEXT23 = nil;
static AssignmentField *_ENTERPRISE_TEXT24 = nil;
static AssignmentField *_ENTERPRISE_TEXT25 = nil;
static AssignmentField *_ENTERPRISE_TEXT26 = nil;
static AssignmentField *_ENTERPRISE_TEXT27 = nil;
static AssignmentField *_ENTERPRISE_TEXT28 = nil;
static AssignmentField *_ENTERPRISE_TEXT29 = nil;
static AssignmentField *_ENTERPRISE_TEXT30 = nil;
static AssignmentField *_ENTERPRISE_TEXT31 = nil;
static AssignmentField *_ENTERPRISE_TEXT32 = nil;
static AssignmentField *_ENTERPRISE_TEXT33 = nil;
static AssignmentField *_ENTERPRISE_TEXT34 = nil;
static AssignmentField *_ENTERPRISE_TEXT35 = nil;
static AssignmentField *_ENTERPRISE_TEXT36 = nil;
static AssignmentField *_ENTERPRISE_TEXT37 = nil;
static AssignmentField *_ENTERPRISE_TEXT38 = nil;
static AssignmentField *_ENTERPRISE_TEXT39 = nil;
static AssignmentField *_ENTERPRISE_TEXT40 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE1 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE2 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE3 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE4 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE5 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE6 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE7 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE8 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE9 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE10 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE11 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE12 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE13 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE14 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE15 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE16 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE17 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE18 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE19 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE20 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE21 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE22 = nil; 
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE23 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE24 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE25 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE26 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE27 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE28 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_OUTLINE_CODE29 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_RBS = nil;
static AssignmentField *_RESOURCE_REQUEST_TYPE = nil;
static AssignmentField *_ENTERPRISE_TEAM_MEMBER = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE20 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE21 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE22 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE23 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE24 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE25 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE26 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE27 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE28 = nil;
static AssignmentField *_ENTERPRISE_RESOURCE_MULTI_VALUE29 = nil;
static AssignmentField *_ACTUAL_WORK_PROTECTED = nil;
static AssignmentField *_ACTUAL_OVERTIME_WORK_PROTECTED = nil;
static AssignmentField *_CREATED = nil;
static AssignmentField *_GUID = nil;
static AssignmentField *_ASSIGNMENT_TASK_GUID = nil;
static AssignmentField *_ASSIGNMENT_RESOURCE_GUID = nil;
static AssignmentField *_SUMMARY = nil;
static AssignmentField *_OWNER = nil;
static AssignmentField *_BUDGET_WORK = nil;
static AssignmentField *_BUDGET_COST = nil;
static AssignmentField *_BASELINE_BUDGET_WORK = nil;
static AssignmentField *_BASELINE_BUDGET_COST = nil;
static AssignmentField *_BASELINE1_BUDGET_WORK = nil;
static AssignmentField *_BASELINE1_BUDGET_COST = nil;
static AssignmentField *_BASELINE2_BUDGET_WORK = nil;
static AssignmentField *_BASELINE2_BUDGET_COST = nil;
static AssignmentField *_BASELINE3_BUDGET_WORK = nil;
static AssignmentField *_BASELINE3_BUDGET_COST = nil;
static AssignmentField *_BASELINE4_BUDGET_WORK = nil;
static AssignmentField *_BASELINE4_BUDGET_COST = nil;
static AssignmentField *_BASELINE5_BUDGET_WORK = nil;
static AssignmentField *_BASELINE5_BUDGET_COST = nil;
static AssignmentField *_BASELINE6_BUDGET_WORK = nil;
static AssignmentField *_BASELINE6_BUDGET_COST = nil;
static AssignmentField *_BASELINE7_BUDGET_WORK = nil;
static AssignmentField *_BASELINE7_BUDGET_COST = nil;
static AssignmentField *_BASELINE8_BUDGET_WORK = nil;
static AssignmentField *_BASELINE8_BUDGET_COST = nil;
static AssignmentField *_BASELINE9_BUDGET_WORK = nil;
static AssignmentField *_BASELINE9_BUDGET_COST = nil;
static AssignmentField *_BASELINE10_BUDGET_WORK = nil;
static AssignmentField *_BASELINE10_BUDGET_COST = nil;
static AssignmentField *_UNAVAILABLE = nil;
static AssignmentField *_HYPERLINK_DATA = nil;
static AssignmentField *_FINISH = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Constructor.
 * 
 * @param dataType field data type
 * @param unitsType units type
 */

-(id)init:(DataType *)dataType withUnitsType:(FieldType *) unitsType
{
    self = [super init];
    if (self)
    {
        _dataType = dataType;
        _unitsType = nil;
    }
    
    return self;
}

/**
 * Constructor.
 * 
 * @param dataType field data type
 */

-(id)init:(DataType *)dataType
{
    self = [super init];
    if (self)
    {
        _dataType = dataType;
        _unitsType = nil;
    }
    
    return self;
}

/**
 * {@inheritDoc}
 */

-(NSString *)getName
{
    #warning incomplete, Locale
    return nil;
}

/**
 * {@inheritDoc}
 */


-(int)getValue
{
    return _value;
}

/**
 * {@inheritDoc}
 */

-(DataType *)getDataType
{
    return _dataType;
}

/**
 * {@inheritDoc}
 */

-(FieldType *)getUnitsType
{
    return _unitsType;
}

/**
 * Retrieves the string representation of this instance.
 *
 * @return string representation
 */

-(NSString *)toString
{
    return [self getName];
}

/**
 * This method takes the integer enumeration of a resource field
 * and returns an appropriate class instance.
 *
 * @param type integer resource field enumeration
 * @return ResourceField instance
 */

+(AssignmentField *)getInstance:(int)type
{
    AssignmentField *result = nil;
    
    if (type >= 0 && type < [[AssignmentField TYPE_VALUES]   count])
    {
        result = [[AssignmentField TYPE_VALUES] objectAtIndex:type];
    }
    
    return result;
}

+(AssignmentField *)START
{
    if (_START == nil)
    {
        _START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START;
}

+(AssignmentField *)DURATION1_UNITS
{
    if (_DURATION1_UNITS == nil)
    {
        _DURATION1_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION1_UNITS;
}

+(AssignmentField *)DURATION2_UNITS
{
    if (_DURATION2_UNITS == nil)
    {
        _DURATION2_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION2_UNITS;
}

+(AssignmentField *)DURATION3_UNITS
{
    if (_DURATION3_UNITS == nil)
    {
        _DURATION3_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION3_UNITS;
}

+(AssignmentField *)DURATION4_UNITS
{
    if (_DURATION4_UNITS == nil)
    {
        _DURATION4_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION4_UNITS;
}

+(AssignmentField *)DURATION5_UNITS
{
    if (_DURATION5_UNITS == nil)
    {
        _DURATION5_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION5_UNITS;
}

+(AssignmentField *)DURATION6_UNITS
{
    if (_DURATION6_UNITS == nil)
    {
        _DURATION6_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION6_UNITS;
}

+(AssignmentField *)DURATION7_UNITS
{
    if (_DURATION7_UNITS == nil)
    {
        _DURATION7_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION7_UNITS;
}

+(AssignmentField *)DURATION8_UNITS
{
    if (_DURATION8_UNITS == nil)
    {
        _DURATION8_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION8_UNITS;
}

+(AssignmentField *)DURATION9_UNITS
{
    if (_DURATION9_UNITS == nil)
    {
        _DURATION9_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION9_UNITS;
}

+(AssignmentField *)DURATION10_UNITS
{
    if (_DURATION10_UNITS == nil)
    {
        _DURATION10_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION10_UNITS;
}

+(AssignmentField *)ACTUAL_COST
{
    if (_ACTUAL_COST == nil)
    {
        _ACTUAL_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ACTUAL_COST;
}

+(AssignmentField *)ACTUAL_WORK
{
    if (_ACTUAL_WORK == nil)
    {
        _ACTUAL_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_WORK;
}

+(AssignmentField *)COST
{
    if (_COST == nil)
    {
        _COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST;
}

+(AssignmentField *)ASSIGNMENT_DELAY
{
    if (_ASSIGNMENT_DELAY == nil)
    {
        _ASSIGNMENT_DELAY = [[AssignmentField alloc]init:[DataType DELAY]];
    }
    return _ASSIGNMENT_DELAY;
}

+(AssignmentField *)VARIABLE_RATE_UNITS
{
    if (_VARIABLE_RATE_UNITS == nil)
    {
        _VARIABLE_RATE_UNITS = [[AssignmentField alloc]init:[DataType WORK_UNITS]];
    }
    return _VARIABLE_RATE_UNITS;
}

+(AssignmentField *)ASSIGNMENT_UNITS
{
    if (_ASSIGNMENT_UNITS == nil)
    {
        _ASSIGNMENT_UNITS = [[AssignmentField alloc]init:[DataType UNITS]];
    }
    return _ASSIGNMENT_UNITS;
}

+(AssignmentField *)WORK
{
    if (_WORK == nil)
    {
        _WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _WORK;
}

+(AssignmentField *)BASELINE_START
{
    if (_BASELINE_START == nil)
    {
        _BASELINE_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE_START;
}

+(AssignmentField *)ACTUAL_START
{
    if (_ACTUAL_START == nil)
    {
        _ACTUAL_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ACTUAL_START;
}

+(AssignmentField *)BASELINE_FINISH
{
    if (_BASELINE_FINISH == nil)
    {
        _BASELINE_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE_FINISH;
}

+(AssignmentField *)ACTUAL_FINISH
{
    if (_ACTUAL_FINISH == nil)
    {
        _ACTUAL_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ACTUAL_FINISH;
}

+(AssignmentField *)BASELINE_WORK
{
    if (_BASELINE_WORK == nil)
    {
        _BASELINE_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE_WORK;
}

+(AssignmentField *)OVERTIME_WORK
{
    if (_OVERTIME_WORK == nil)
    {
        _OVERTIME_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _OVERTIME_WORK;
}

+(AssignmentField *)BASELINE_COST
{
    if (_BASELINE_COST == nil)
    {
        _BASELINE_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE_COST;
}

+(AssignmentField *)WORK_CONTOUR
{
    if (_WORK_CONTOUR == nil)
    {
        _WORK_CONTOUR = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _WORK_CONTOUR;
}

+(AssignmentField *)REMAINING_WORK
{
    if (_REMAINING_WORK == nil)
    {
        _REMAINING_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _REMAINING_WORK;
}

+(AssignmentField *)LEVELING_DELAY_UNITS
{
    if (_LEVELING_DELAY_UNITS == nil)
    {
        _LEVELING_DELAY_UNITS = [[AssignmentField alloc]init:[DataType TIME_UNITS]];
    }
    return _LEVELING_DELAY_UNITS;
}

+(AssignmentField *)LEVELING_DELAY
{
    if (_LEVELING_DELAY == nil)
    {
        _LEVELING_DELAY = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField LEVELING_DELAY_UNITS]];
    }
    return _LEVELING_DELAY;
}

+(AssignmentField *)DELAY
{
    if (_DELAY == nil)
    {
        _DELAY = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _DELAY;
}

+(AssignmentField *)UNIQUE_ID
{
    if (_UNIQUE_ID == nil)
    {
        _UNIQUE_ID = [[AssignmentField alloc]init:[DataType INTEGER]];
    }
    return _UNIQUE_ID;
}

+(AssignmentField *)TASK_UNIQUE_ID
{
    if (_TASK_UNIQUE_ID == nil)
    {
        _TASK_UNIQUE_ID = [[AssignmentField alloc]init:[DataType INTEGER]];
    }
    return _TASK_UNIQUE_ID;
}

+(AssignmentField *)RESOURCE_UNIQUE_ID
{
    if (_RESOURCE_UNIQUE_ID == nil)
    {
        _RESOURCE_UNIQUE_ID = [[AssignmentField alloc]init:[DataType INTEGER]];
    }
    return _RESOURCE_UNIQUE_ID;
}

+(AssignmentField *)TIMEPHASED_WORK
{
    if (_TIMEPHASED_WORK == nil)
    {
        _TIMEPHASED_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_WORK;
}

+(AssignmentField *)TIMEPHASED_ACTUAL_WORK
{
    if (_TIMEPHASED_ACTUAL_WORK == nil)
    {
        _TIMEPHASED_ACTUAL_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_ACTUAL_WORK;
}

+(AssignmentField *)TIMEPHASED_ACTUAL_OVERTIME_WORK
{
    if (_TIMEPHASED_ACTUAL_OVERTIME_WORK == nil)
    {
        _TIMEPHASED_ACTUAL_OVERTIME_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_ACTUAL_OVERTIME_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE_WORK
{
    if (_TIMEPHASED_BASELINE_WORK == nil)
    {
        _TIMEPHASED_BASELINE_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE1_WORK
{
    if (_TIMEPHASED_BASELINE1_WORK == nil)
    {
        _TIMEPHASED_BASELINE1_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE1_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE2_WORK
{
    if (_TIMEPHASED_BASELINE2_WORK == nil)
    {
        _TIMEPHASED_BASELINE2_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE2_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE3_WORK
{
    if (_TIMEPHASED_BASELINE3_WORK == nil)
    {
        _TIMEPHASED_BASELINE3_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE3_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE4_WORK
{
    if (_TIMEPHASED_BASELINE4_WORK == nil)
    {
        _TIMEPHASED_BASELINE4_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE4_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE5_WORK
{
    if (_TIMEPHASED_BASELINE5_WORK == nil)
    {
        _TIMEPHASED_BASELINE5_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE5_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE6_WORK
{
    if (_TIMEPHASED_BASELINE6_WORK == nil)
    {
        _TIMEPHASED_BASELINE6_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE6_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE7_WORK
{
    if (_TIMEPHASED_BASELINE7_WORK == nil)
    {
        _TIMEPHASED_BASELINE7_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE7_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE8_WORK
{
    if (_TIMEPHASED_BASELINE8_WORK == nil)
    {
        _TIMEPHASED_BASELINE8_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE8_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE9_WORK
{
    if (_TIMEPHASED_BASELINE9_WORK == nil)
    {
        _TIMEPHASED_BASELINE9_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE9_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE10_WORK
{
    if (_TIMEPHASED_BASELINE10_WORK == nil)
    {
        _TIMEPHASED_BASELINE10_WORK = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE10_WORK;
}

+(AssignmentField *)TIMEPHASED_BASELINE_COST
{
    if (_TIMEPHASED_BASELINE_COST == nil)
    {
        _TIMEPHASED_BASELINE_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE1_COST
{
    if (_TIMEPHASED_BASELINE1_COST == nil)
    {
        _TIMEPHASED_BASELINE1_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE1_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE2_COST
{
    if (_TIMEPHASED_BASELINE2_COST == nil)
    {
        _TIMEPHASED_BASELINE2_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE2_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE3_COST
{
    if (_TIMEPHASED_BASELINE3_COST == nil)
    {
        _TIMEPHASED_BASELINE3_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE3_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE4_COST
{
    if (_TIMEPHASED_BASELINE4_COST == nil)
    {
        _TIMEPHASED_BASELINE4_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE4_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE5_COST
{
    if (_TIMEPHASED_BASELINE5_COST == nil)
    {
        _TIMEPHASED_BASELINE5_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE5_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE6_COST
{
    if (_TIMEPHASED_BASELINE6_COST == nil)
    {
        _TIMEPHASED_BASELINE6_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE6_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE7_COST
{
    if (_TIMEPHASED_BASELINE7_COST == nil)
    {
        _TIMEPHASED_BASELINE7_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE7_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE8_COST
{
    if (_TIMEPHASED_BASELINE8_COST == nil)
    {
        _TIMEPHASED_BASELINE8_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE8_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE9_COST
{
    if (_TIMEPHASED_BASELINE9_COST == nil)
    {
        _TIMEPHASED_BASELINE9_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE9_COST;
}

+(AssignmentField *)TIMEPHASED_BASELINE10_COST
{
    if (_TIMEPHASED_BASELINE10_COST == nil)
    {
        _TIMEPHASED_BASELINE10_COST = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _TIMEPHASED_BASELINE10_COST;
}

+(AssignmentField *)TASK_ID
{
    if (_TASK_ID == nil)
    {
        _TASK_ID = [[AssignmentField alloc]init:[DataType INTEGER]];
    }
    return _TASK_ID;
}

+(AssignmentField *)RESOURCE_ID
{
    if (_RESOURCE_ID == nil)
    {
        _RESOURCE_ID = [[AssignmentField alloc]init:[DataType INTEGER]];
    }
    return _RESOURCE_ID;
}

+(AssignmentField *)TASK_NAME
{
    if (_TASK_NAME == nil)
    {
        _TASK_NAME = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TASK_NAME;
}

+(AssignmentField *)RESOURCE_NAME
{
    if (_RESOURCE_NAME == nil)
    {
        _RESOURCE_NAME = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_NAME;
}

+(AssignmentField *)REGULAR_WORK
{
    if (_REGULAR_WORK == nil)
    {
        _REGULAR_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _REGULAR_WORK;
}

+(AssignmentField *)ACTUAL_OVERTIME_WORK
{
    if (_ACTUAL_OVERTIME_WORK == nil)
    {
        _ACTUAL_OVERTIME_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_OVERTIME_WORK;
}

+(AssignmentField *)REMAINING_OVERTIME_WORK
{
    if (_REMAINING_OVERTIME_WORK == nil)
    {
        _REMAINING_OVERTIME_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _REMAINING_OVERTIME_WORK;
}

+(AssignmentField *)PEAK
{
    if (_PEAK == nil)
    {
        _PEAK = [[AssignmentField alloc]init:[DataType UNITS]];
    }
    return _PEAK;
}

+(AssignmentField *)OVERTIME_COST
{
    if (_OVERTIME_COST == nil)
    {
        _OVERTIME_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _OVERTIME_COST;
}

+(AssignmentField *)REMAINING_COST
{
    if (_REMAINING_COST == nil)
    {
        _REMAINING_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _REMAINING_COST;
}

+(AssignmentField *)ACTUAL_OVERTIME_COST
{
    if (_ACTUAL_OVERTIME_COST == nil)
    {
        _ACTUAL_OVERTIME_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ACTUAL_OVERTIME_COST;
}

+(AssignmentField *)REMAINING_OVERTIME_COST
{
    if (_REMAINING_OVERTIME_COST == nil)
    {
        _REMAINING_OVERTIME_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _REMAINING_OVERTIME_COST;
}

+(AssignmentField *)BCWS
{
    if (_BCWS == nil)
    {
        _BCWS = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BCWS;
}

+(AssignmentField *)BCWP
{
    if (_BCWP == nil)
    {
        _BCWP = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BCWP;
}

+(AssignmentField *)ACWP
{
    if (_ACWP == nil)
    {
        _ACWP = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ACWP;
}

+(AssignmentField *)SV
{
    if (_SV == nil)
    {
        _SV = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _SV;
}

+(AssignmentField *)COST_VARIANCE
{
    if (_COST_VARIANCE == nil)
    {
        _COST_VARIANCE = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST_VARIANCE;
}

+(AssignmentField *)PERCENT_WORK_COMPLETE
{
    if (_PERCENT_WORK_COMPLETE == nil)
    {
        _PERCENT_WORK_COMPLETE = [[AssignmentField alloc]init:[DataType PERCENTAGE]];
    }
    return _PERCENT_WORK_COMPLETE;
}

+(AssignmentField *)PROJECT
{
    if (_PROJECT == nil)
    {
        _PROJECT = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _PROJECT;
}

+(AssignmentField *)NOTES
{
    if (_NOTES == nil)
    {
        _NOTES = [[AssignmentField alloc]init:[DataType ASCII_STRING]];
    }
    return _NOTES;
}

+(AssignmentField *)CONFIRMED
{
    if (_CONFIRMED == nil)
    {
        _CONFIRMED = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _CONFIRMED;
}

+(AssignmentField *)RESPONSE_PENDING
{
    if (_RESPONSE_PENDING == nil)
    {
        _RESPONSE_PENDING = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _RESPONSE_PENDING;
}

+(AssignmentField *)UPDATE_NEEDED
{
    if (_UPDATE_NEEDED == nil)
    {
        _UPDATE_NEEDED = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _UPDATE_NEEDED;
}

+(AssignmentField *)TEAM_STATUS_PENDING
{
    if (_TEAM_STATUS_PENDING == nil)
    {
        _TEAM_STATUS_PENDING = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _TEAM_STATUS_PENDING;
}

+(AssignmentField *)COST_RATE_TABLE
{
    if (_COST_RATE_TABLE == nil)
    {
        _COST_RATE_TABLE = [[AssignmentField alloc]init:[DataType SHORT]];
    }
    return _COST_RATE_TABLE;
}

+(AssignmentField *)TEXT1
{
    if (_TEXT1 == nil)
    {
        _TEXT1 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT1;
}

+(AssignmentField *)TEXT2
{
    if (_TEXT2 == nil)
    {
        _TEXT2 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT2;
}

+(AssignmentField *)TEXT3
{
    if (_TEXT3 == nil)
    {
        _TEXT3 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT3;
}

+(AssignmentField *)TEXT4
{
    if (_TEXT4 == nil)
    {
        _TEXT4 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT4;
}

+(AssignmentField *)TEXT5
{
    if (_TEXT5 == nil)
    {
        _TEXT5 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT5;
}

+(AssignmentField *)TEXT6
{
    if (_TEXT6 == nil)
    {
        _TEXT6 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT6;
}

+(AssignmentField *)TEXT7
{
    if (_TEXT7 == nil)
    {
        _TEXT7 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT7;
}

+(AssignmentField *)TEXT8
{
    if (_TEXT8 == nil)
    {
        _TEXT8 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT8;
}

+(AssignmentField *)TEXT9
{
    if (_TEXT9 == nil)
    {
        _TEXT9 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT9;
}

+(AssignmentField *)TEXT10
{
    if (_TEXT10 == nil)
    {
        _TEXT10 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT10;
}

+(AssignmentField *)START1
{
    if (_START1 == nil)
    {
        _START1 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START1;
}

+(AssignmentField *)START2
{
    if (_START2 == nil)
    {
        _START2 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START2;
}

+(AssignmentField *)START3
{
    if (_START3 == nil)
    {
        _START3 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START3;
}

+(AssignmentField *)START4
{
    if (_START4 == nil)
    {
        _START4 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START4;
}

+(AssignmentField *)START5
{
    if (_START5 == nil)
    {
        _START5 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START5;
}

+(AssignmentField *)FINISH1
{
    if (_FINISH1 == nil)
    {
        _FINISH1 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH1;
}

+(AssignmentField *)FINISH2
{
    if (_FINISH2 == nil)
    {
        _FINISH2 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH2;
}

+(AssignmentField *)FINISH3
{
    if (_FINISH3 == nil)
    {
        _FINISH3 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH3;
}

+(AssignmentField *)FINISH4
{
    if (_FINISH4 == nil)
    {
        _FINISH4 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH4;
}

+(AssignmentField *)FINISH5
{
    if (_FINISH5 == nil)
    {
        _FINISH5 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH5;
}

+(AssignmentField *)NUMBER1
{
    if (_NUMBER1 == nil)
    {
        _NUMBER1 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER1;
}

+(AssignmentField *)NUMBER2
{
    if (_NUMBER2 == nil)
    {
        _NUMBER2 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER2;
}

+(AssignmentField *)NUMBER3
{
    if (_NUMBER3 == nil)
    {
        _NUMBER3 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER3;
}

+(AssignmentField *)NUMBER4
{
    if (_NUMBER4 == nil)
    {
        _NUMBER4 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER4;
}

+(AssignmentField *)NUMBER5
{
    if (_NUMBER5 == nil)
    {
        _NUMBER5 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER5;
}

+(AssignmentField *)DURATION1
{
    if (_DURATION1 == nil)
    {
        _DURATION1 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION1_UNITS]];
    }
    return _DURATION1;
}

+(AssignmentField *)DURATION2
{
    if (_DURATION2 == nil)
    {
        _DURATION2 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION2_UNITS]];
    }
    return _DURATION2;
}

+(AssignmentField *)DURATION3
{
    if (_DURATION3 == nil)
    {
        _DURATION3 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION3_UNITS]];    }
    return _DURATION3;
}

+(AssignmentField *)COST1
{
    if (_COST1 == nil)
    {
        _COST1 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST1;
}

+(AssignmentField *)COST2
{
    if (_COST2 == nil)
    {
        _COST2 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST2;
}

+(AssignmentField *)COST3
{
    if (_COST3 == nil)
    {
        _COST3 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST3;
}

+(AssignmentField *)FLAG10
{
    if (_FLAG10 == nil)
    {
        _FLAG10 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG10;
}

+(AssignmentField *)FLAG1
{
    if (_FLAG1 == nil)
    {
        _FLAG1 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG1;
}

+(AssignmentField *)FLAG2
{
    if (_FLAG2 == nil)
    {
        _FLAG2 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG2;
}

+(AssignmentField *)FLAG3
{
    if (_FLAG3 == nil)
    {
        _FLAG3 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG3;
}

+(AssignmentField *)FLAG4
{
    if (_FLAG4 == nil)
    {
        _FLAG4 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG4;
}

+(AssignmentField *)FLAG5
{
    if (_FLAG5 == nil)
    {
        _FLAG5 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG5;
}

+(AssignmentField *)FLAG6
{
    if (_FLAG6 == nil)
    {
        _FLAG6 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG6;
}

+(AssignmentField *)FLAG7
{
    if (_FLAG7 == nil)
    {
        _FLAG7 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG7;
}

+(AssignmentField *)FLAG8
{
    if (_FLAG8 == nil)
    {
        _FLAG8 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG8;
}

+(AssignmentField *)FLAG9
{
    if (_FLAG9 == nil)
    {
        _FLAG9 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG9;
}

+(AssignmentField *)LINKED_FIELDS
{
    if (_LINKED_FIELDS == nil)
    {
        _LINKED_FIELDS = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _LINKED_FIELDS;
}

+(AssignmentField *)OVERALLOCATED
{
    if (_OVERALLOCATED == nil)
    {
        _OVERALLOCATED = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _OVERALLOCATED;
}

+(AssignmentField *)TASK_SUMMARY_NAME
{
    if (_TASK_SUMMARY_NAME == nil)
    {
        _TASK_SUMMARY_NAME = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TASK_SUMMARY_NAME;
}

+(AssignmentField *)HYPERLINK
{
    if (_HYPERLINK == nil)
    {
        _HYPERLINK = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK;
}

+(AssignmentField *)HYPERLINK_ADDRESS
{
    if (_HYPERLINK_ADDRESS == nil)
    {
        _HYPERLINK_ADDRESS = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_ADDRESS;
}

+(AssignmentField *)HYPERLINK_SUBADDRESS
{
    if (_HYPERLINK_SUBADDRESS == nil)
    {
        _HYPERLINK_SUBADDRESS = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_SUBADDRESS;
}

+(AssignmentField *)HYPERLINK_HREF
{
    if (_HYPERLINK_HREF == nil)
    {
        _HYPERLINK_HREF = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_HREF;
}

+(AssignmentField *)COST4
{
    if (_COST4 == nil)
    {
        _COST4 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST4;
}

+(AssignmentField *)COST5
{
    if (_COST5 == nil)
    {
        _COST5 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST5;
}

+(AssignmentField *)COST6
{
    if (_COST6 == nil)
    {
        _COST6 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST6;
}

+(AssignmentField *)COST7
{
    if (_COST7 == nil)
    {
        _COST7 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST7;
}

+(AssignmentField *)COST8
{
    if (_COST8 == nil)
    {
        _COST8 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST8;
}

+(AssignmentField *)COST9
{
    if (_COST9 == nil)
    {
        _COST9 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST9;
}

+(AssignmentField *)COST10
{
    if (_COST10 == nil)
    {
        _COST10 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _COST10;
}

+(AssignmentField *)DATE1
{
    if (_DATE1 == nil)
    {
        _DATE1 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE1;
}

+(AssignmentField *)DATE2
{
    if (_DATE2 == nil)
    {
        _DATE2 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE2;
}

+(AssignmentField *)DATE3
{
    if (_DATE3 == nil)
    {
        _DATE3 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE3;
}

+(AssignmentField *)DATE4
{
    if (_DATE4 == nil)
    {
        _DATE4 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE4;
}

+(AssignmentField *)DATE5
{
    if (_DATE5 == nil)
    {
        _DATE5 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE5;
}

+(AssignmentField *)DATE6
{
    if (_DATE6 == nil)
    {
        _DATE6 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE6;
}

+(AssignmentField *)DATE7
{
    if (_DATE7 == nil)
    {
        _DATE7 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE7;
}

+(AssignmentField *)DATE8
{
    if (_DATE8 == nil)
    {
        _DATE8 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE8;
}

+(AssignmentField *)DATE9
{
    if (_DATE9 == nil)
    {
        _DATE9 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE9;
}

+(AssignmentField *)DATE10
{
    if (_DATE10 == nil)
    {
        _DATE10 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _DATE10;
}

+(AssignmentField *)DURATION4
{
    if (_DURATION4 == nil)
    {
        _DURATION4 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION4_UNITS]];
    }
    return _DURATION4;
}

+(AssignmentField *)DURATION5
{
    if (_DURATION5 == nil)
    {
        _DURATION5 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION5_UNITS]];
    }
    return _DURATION5;
}

+(AssignmentField *)DURATION6
{
    if (_DURATION6 == nil)
    {
        _DURATION6 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION6_UNITS]];
    }
    return _DURATION6;
}

+(AssignmentField *)DURATION7
{
    if (_DURATION7 == nil)
    {
        _DURATION7 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION7_UNITS]];
    }
    return _DURATION7;
}

+(AssignmentField *)DURATION8
{
    if (_DURATION8 == nil)
    {
        _DURATION8 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION8_UNITS]];
    }
    return _DURATION8;
}

+(AssignmentField *)DURATION9
{
    if (_DURATION9 == nil)
    {
        _DURATION9 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION9_UNITS]];
    }
    return _DURATION9;
}

+(AssignmentField *)DURATION10
{
    if (_DURATION10 == nil)
    {
        _DURATION10 = [[AssignmentField alloc]init:[DataType DURATION] withUnitsType:[AssignmentField DURATION10_UNITS]];
    }
    return _DURATION10;
}

+(AssignmentField *)FINISH6
{
    if (_FINISH6 == nil)
    {
        _FINISH6 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH6;
}

+(AssignmentField *)FINISH7
{
    if (_FINISH7 == nil)
    {
        _FINISH7 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH7;
}

+(AssignmentField *)FINISH8
{
    if (_FINISH8 == nil)
    {
        _FINISH8 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH8;
}

+(AssignmentField *)FINISH9
{
    if (_FINISH9 == nil)
    {
        _FINISH9 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH9;
}

+(AssignmentField *)FINISH10
{
    if (_FINISH10 == nil)
    {
        _FINISH10 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH10;
}

+(AssignmentField *)FLAG11
{
    if (_FLAG11 == nil)
    {
        _FLAG11 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG11;
}

+(AssignmentField *)FLAG12
{
    if (_FLAG12 == nil)
    {
        _FLAG12 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG12;
}

+(AssignmentField *)FLAG13
{
    if (_FLAG13 == nil)
    {
        _FLAG13 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG13;
}

+(AssignmentField *)FLAG14
{
    if (_FLAG14 == nil)
    {
        _FLAG14 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG14;
}

+(AssignmentField *)FLAG15
{
    if (_FLAG15 == nil)
    {
        _FLAG15 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG15;
}

+(AssignmentField *)FLAG16
{
    if (_FLAG16 == nil)
    {
        _FLAG16 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG16;
}

+(AssignmentField *)FLAG17
{
    if (_FLAG17 == nil)
    {
        _FLAG17 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG17;
}

+(AssignmentField *)FLAG18
{
    if (_FLAG18 == nil)
    {
        _FLAG18 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG18;
}

+(AssignmentField *)FLAG19
{
    if (_FLAG19 == nil)
    {
        _FLAG19 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG19;
}

+(AssignmentField *)FLAG20
{
    if (_FLAG20 == nil)
    {
        _FLAG20 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG20;
}

+(AssignmentField *)NUMBER6
{
    if (_NUMBER6 == nil)
    {
        _NUMBER6 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER6;
}

+(AssignmentField *)NUMBER7
{
    if (_NUMBER7 == nil)
    {
        _NUMBER7 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER7;
}

+(AssignmentField *)NUMBER8
{
    if (_NUMBER8 == nil)
    {
        _NUMBER8 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER8;
}

+(AssignmentField *)NUMBER9
{
    if (_NUMBER9 == nil)
    {
        _NUMBER9 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER9;
}

+(AssignmentField *)NUMBER10
{
    if (_NUMBER10 == nil)
    {
        _NUMBER10 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER10;
}

+(AssignmentField *)NUMBER11
{
    if (_NUMBER11 == nil)
    {
        _NUMBER11 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER11;
}

+(AssignmentField *)NUMBER12
{
    if (_NUMBER12 == nil)
    {
        _NUMBER12 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER12;
}

+(AssignmentField *)NUMBER13
{
    if (_NUMBER13 == nil)
    {
        _NUMBER13 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER13;
}

+(AssignmentField *)NUMBER14
{
    if (_NUMBER14 == nil)
    {
        _NUMBER14 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER14;
}

+(AssignmentField *)NUMBER15
{
    if (_NUMBER15 == nil)
    {
        _NUMBER15 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER15;
}

+(AssignmentField *)NUMBER16
{
    if (_NUMBER16 == nil)
    {
        _NUMBER16 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER16;
}

+(AssignmentField *)NUMBER17
{
    if (_NUMBER17 == nil)
    {
        _NUMBER17 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER17;
}

+(AssignmentField *)NUMBER18
{
    if (_NUMBER18 == nil)
    {
        _NUMBER18 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER18;
}

+(AssignmentField *)NUMBER19
{
    if (_NUMBER19 == nil)
    {
        _NUMBER19 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER19;
}

+(AssignmentField *)NUMBER20
{
    if (_NUMBER20 == nil)
    {
        _NUMBER20 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER20;
}

+(AssignmentField *)START6
{
    if (_START6 == nil)
    {
        _START6 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START6;
}

+(AssignmentField *)START7
{
    if (_START7 == nil)
    {
        _START7 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START7;
}

+(AssignmentField *)START8
{
    if (_START8 == nil)
    {
        _START8 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START8;
}

+(AssignmentField *)START9
{
    if (_START9 == nil)
    {
        _START9 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START9;
}

+(AssignmentField *)START10
{
    if (_START10 == nil)
    {
        _START10 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _START10;
}

+(AssignmentField *)TEXT11
{
    if (_TEXT11 == nil)
    {
        _TEXT11 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT11;
}

+(AssignmentField *)TEXT12
{
    if (_TEXT12 == nil)
    {
        _TEXT12 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT12;
}

+(AssignmentField *)TEXT13
{
    if (_TEXT13 == nil)
    {
        _TEXT13 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT13;
}

+(AssignmentField *)TEXT14
{
    if (_TEXT14 == nil)
    {
        _TEXT14 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT14;
}

+(AssignmentField *)TEXT15
{
    if (_TEXT15 == nil)
    {
        _TEXT15 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT15;
}

+(AssignmentField *)TEXT16
{
    if (_TEXT16 == nil)
    {
        _TEXT16 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT16;
}

+(AssignmentField *)TEXT17
{
    if (_TEXT17 == nil)
    {
        _TEXT17 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT17;
}

+(AssignmentField *)TEXT18
{
    if (_TEXT18 == nil)
    {
        _TEXT18 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT18;
}

+(AssignmentField *)TEXT19
{
    if (_TEXT19 == nil)
    {
        _TEXT19 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT19;
}

+(AssignmentField *)TEXT20
{
    if (_TEXT20 == nil)
    {
        _TEXT20 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT20;
}

+(AssignmentField *)TEXT21
{
    if (_TEXT21 == nil)
    {
        _TEXT21 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT21;
}

+(AssignmentField *)TEXT22
{
    if (_TEXT22 == nil)
    {
        _TEXT22 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT22;
}

+(AssignmentField *)TEXT23
{
    if (_TEXT23 == nil)
    {
        _TEXT23 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT23;
}

+(AssignmentField *)TEXT24
{
    if (_TEXT24 == nil)
    {
        _TEXT24 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT24;
}

+(AssignmentField *)TEXT25
{
    if (_TEXT25 == nil)
    {
        _TEXT25 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT25;
}

+(AssignmentField *)TEXT26
{
    if (_TEXT26 == nil)
    {
        _TEXT26 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT26;
}

+(AssignmentField *)TEXT27
{
    if (_TEXT27 == nil)
    {
        _TEXT27 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT27;
}

+(AssignmentField *)TEXT28
{
    if (_TEXT28 == nil)
    {
        _TEXT28 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT28;
}

+(AssignmentField *)TEXT29
{
    if (_TEXT29 == nil)
    {
        _TEXT29 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT29;
}

+(AssignmentField *)TEXT30
{
    if (_TEXT30 == nil)
    {
        _TEXT30 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TEXT30;
}

+(AssignmentField *)INDEX
{
    if (_INDEX == nil)
    {
        _INDEX = [[AssignmentField alloc]init:[DataType INTEGER]];
    }
    return _INDEX;
}

+(AssignmentField *)CV
{
    if (_CV == nil)
    {
        _CV = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _CV;
}

+(AssignmentField *)WORK_VARIANCE
{
    if (_WORK_VARIANCE == nil)
    {
        _WORK_VARIANCE = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _WORK_VARIANCE;
}

+(AssignmentField *)START_VARIANCE
{
    if (_START_VARIANCE == nil)
    {
        _START_VARIANCE = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _START_VARIANCE;
}

+(AssignmentField *)FINISH_VARIANCE
{
    if (_FINISH_VARIANCE == nil)
    {
        _FINISH_VARIANCE = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _FINISH_VARIANCE;
}

+(AssignmentField *)VAC
{
    if (_VAC == nil)
    {
        _VAC = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _VAC;
}

+(AssignmentField *)FIXED_MATERIAL_ASSIGNMENT
{
    if (_FIXED_MATERIAL_ASSIGNMENT == nil)
    {
        _FIXED_MATERIAL_ASSIGNMENT = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _FIXED_MATERIAL_ASSIGNMENT;
}

+(AssignmentField *)RESOURCE_TYPE
{
    if (_RESOURCE_TYPE == nil)
    {
        _RESOURCE_TYPE = [[AssignmentField alloc]init:[DataType RESOURCE_TYPE]];
    }
    return _RESOURCE_TYPE;
}

+(AssignmentField *)HYPERLINK_SCREEN_TIP
{
    if (_HYPERLINK_SCREEN_TIP == nil)
    {
        _HYPERLINK_SCREEN_TIP = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_SCREEN_TIP;
}

+(AssignmentField *)WBS
{
    if (_WBS == nil)
    {
        _WBS = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _WBS;
}

+(AssignmentField *)BASELINE1_WORK
{
    if (_BASELINE1_WORK == nil)
    {
        _BASELINE1_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE1_WORK;
}

+(AssignmentField *)BASELINE1_COST
{
    if (_BASELINE1_COST == nil)
    {
        _BASELINE1_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE1_COST;
}

+(AssignmentField *)BASELINE1_START
{
    if (_BASELINE1_START == nil)
    {
        _BASELINE1_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_START;
}

+(AssignmentField *)BASELINE1_FINISH
{
    if (_BASELINE1_FINISH == nil)
    {
        _BASELINE1_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_FINISH;
}

+(AssignmentField *)BASELINE2_WORK
{
    if (_BASELINE2_WORK == nil)
    {
        _BASELINE2_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE2_WORK;
}

+(AssignmentField *)BASELINE2_COST
{
    if (_BASELINE2_COST == nil)
    {
        _BASELINE2_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE2_COST;
}

+(AssignmentField *)BASELINE2_START
{
    if (_BASELINE2_START == nil)
    {
        _BASELINE2_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_START;
}

+(AssignmentField *)BASELINE2_FINISH
{
    if (_BASELINE2_FINISH == nil)
    {
        _BASELINE2_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_FINISH;
}

+(AssignmentField *)BASELINE3_WORK
{
    if (_BASELINE3_WORK == nil)
    {
        _BASELINE3_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE3_WORK;
}

+(AssignmentField *)BASELINE3_COST
{
    if (_BASELINE3_COST == nil)
    {
        _BASELINE3_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE3_COST;
}

+(AssignmentField *)BASELINE3_START
{
    if (_BASELINE3_START == nil)
    {
        _BASELINE3_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_START;
}

+(AssignmentField *)BASELINE3_FINISH
{
    if (_BASELINE3_FINISH == nil)
    {
        _BASELINE3_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_FINISH;
}

+(AssignmentField *)BASELINE4_WORK
{
    if (_BASELINE4_WORK == nil)
    {
        _BASELINE4_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE4_WORK;
}

+(AssignmentField *)BASELINE4_COST
{
    if (_BASELINE4_COST == nil)
    {
        _BASELINE4_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE4_COST;
}

+(AssignmentField *)BASELINE4_START
{
    if (_BASELINE4_START == nil)
    {
        _BASELINE4_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_START;
}

+(AssignmentField *)BASELINE4_FINISH
{
    if (_BASELINE4_FINISH == nil)
    {
        _BASELINE4_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_FINISH;
}

+(AssignmentField *)BASELINE5_WORK
{
    if (_BASELINE5_WORK == nil)
    {
        _BASELINE5_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE5_WORK;
}

+(AssignmentField *)BASELINE5_COST
{
    if (_BASELINE5_COST == nil)
    {
        _BASELINE5_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE5_COST;
}

+(AssignmentField *)BASELINE5_START
{
    if (_BASELINE5_START == nil)
    {
        _BASELINE5_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_START;
}

+(AssignmentField *)BASELINE5_FINISH
{
    if (_BASELINE5_FINISH == nil)
    {
        _BASELINE5_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_FINISH;
}

+(AssignmentField *)BASELINE6_WORK
{
    if (_BASELINE6_WORK == nil)
    {
        _BASELINE6_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE6_WORK;
}

+(AssignmentField *)BASELINE6_COST
{
    if (_BASELINE6_COST == nil)
    {
        _BASELINE6_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE6_COST;
}

+(AssignmentField *)BASELINE6_START
{
    if (_BASELINE6_START == nil)
    {
        _BASELINE6_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_START;
}

+(AssignmentField *)BASELINE6_FINISH
{
    if (_BASELINE6_FINISH == nil)
    {
        _BASELINE6_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_FINISH;
}

+(AssignmentField *)BASELINE7_WORK
{
    if (_BASELINE7_WORK == nil)
    {
        _BASELINE7_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE7_WORK;
}

+(AssignmentField *)BASELINE7_COST
{
    if (_BASELINE7_COST == nil)
    {
        _BASELINE7_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE7_COST;
}

+(AssignmentField *)BASELINE7_START
{
    if (_BASELINE7_START == nil)
    {
        _BASELINE7_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_START;
}

+(AssignmentField *)BASELINE7_FINISH
{
    if (_BASELINE7_FINISH == nil)
    {
        _BASELINE7_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_FINISH;
}

+(AssignmentField *)BASELINE8_WORK
{
    if (_BASELINE8_WORK == nil)
    {
        _BASELINE8_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE8_WORK;
}

+(AssignmentField *)BASELINE8_COST
{
    if (_BASELINE8_COST == nil)
    {
        _BASELINE8_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE8_COST;
}

+(AssignmentField *)BASELINE8_START
{
    if (_BASELINE8_START == nil)
    {
        _BASELINE8_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE8_START;
}

+(AssignmentField *)BASELINE8_FINISH
{
    if (_BASELINE8_FINISH == nil)
    {
        _BASELINE8_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE8_FINISH;
}

+(AssignmentField *)BASELINE9_WORK
{
    if (_BASELINE9_WORK == nil)
    {
        _BASELINE9_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE9_WORK;
}

+(AssignmentField *)BASELINE9_COST
{
    if (_BASELINE9_COST == nil)
    {
        _BASELINE9_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE9_COST;
}

+(AssignmentField *)BASELINE9_START
{
    if (_BASELINE9_START == nil)
    {
        _BASELINE9_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_START;
}

+(AssignmentField *)BASELINE9_FINISH
{
    if (_BASELINE9_FINISH == nil)
    {
        _BASELINE9_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_FINISH;
}

+(AssignmentField *)BASELINE10_WORK
{
    if (_BASELINE10_WORK == nil)
    {
        _BASELINE10_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE10_WORK;
}

+(AssignmentField *)BASELINE10_COST
{
    if (_BASELINE10_COST == nil)
    {
        _BASELINE10_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE10_COST;
}

+(AssignmentField *)BASELINE10_START
{
    if (_BASELINE10_START == nil)
    {
        _BASELINE10_START = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE10_START;
}

+(AssignmentField *)BASELINE10_FINISH
{
    if (_BASELINE10_FINISH == nil)
    {
        _BASELINE10_FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _BASELINE10_FINISH;
}

+(AssignmentField *)TASK_OUTLINE_NUMBER
{
    if (_TASK_OUTLINE_NUMBER == nil)
    {
        _TASK_OUTLINE_NUMBER = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _TASK_OUTLINE_NUMBER;
}

+(AssignmentField *)ENTERPRISE_COST1
{
    if (_ENTERPRISE_COST1 == nil)
    {
        _ENTERPRISE_COST1 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST1;
}

+(AssignmentField *)ENTERPRISE_COST2
{
    if (_ENTERPRISE_COST2 == nil)
    {
        _ENTERPRISE_COST2 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST2;
}

+(AssignmentField *)ENTERPRISE_COST3
{
    if (_ENTERPRISE_COST3 == nil)
    {
        _ENTERPRISE_COST3 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST3;
}

+(AssignmentField *)ENTERPRISE_COST4
{
    if (_ENTERPRISE_COST4 == nil)
    {
        _ENTERPRISE_COST4 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST4;
}

+(AssignmentField *)ENTERPRISE_COST5
{
    if (_ENTERPRISE_COST5 == nil)
    {
        _ENTERPRISE_COST5 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST5;
}

+(AssignmentField *)ENTERPRISE_COST6
{
    if (_ENTERPRISE_COST6 == nil)
    {
        _ENTERPRISE_COST6 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST6;
}

+(AssignmentField *)ENTERPRISE_COST7
{
    if (_ENTERPRISE_COST7 == nil)
    {
        _ENTERPRISE_COST7 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST7;
}

+(AssignmentField *)ENTERPRISE_COST8
{
    if (_ENTERPRISE_COST8 == nil)
    {
        _ENTERPRISE_COST8 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST8;
}

+(AssignmentField *)ENTERPRISE_COST9
{
    if (_ENTERPRISE_COST9 == nil)
    {
        _ENTERPRISE_COST9 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST9;
}

+(AssignmentField *)ENTERPRISE_COST10
{
    if (_ENTERPRISE_COST10 == nil)
    {
        _ENTERPRISE_COST10 = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST10;
}

+(AssignmentField *)ENTERPRISE_DATE1
{
    if (_ENTERPRISE_DATE1 == nil)
    {
        _ENTERPRISE_DATE1 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE1;
}

+(AssignmentField *)ENTERPRISE_DATE2
{
    if (_ENTERPRISE_DATE2 == nil)
    {
        _ENTERPRISE_DATE2 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE2;
}

+(AssignmentField *)ENTERPRISE_DATE3
{
    if (_ENTERPRISE_DATE3 == nil)
    {
        _ENTERPRISE_DATE3 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE3;
}

+(AssignmentField *)ENTERPRISE_DATE4
{
    if (_ENTERPRISE_DATE4 == nil)
    {
        _ENTERPRISE_DATE4 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE4;
}

+(AssignmentField *)ENTERPRISE_DATE5
{
    if (_ENTERPRISE_DATE5 == nil)
    {
        _ENTERPRISE_DATE5 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE5;
}

+(AssignmentField *)ENTERPRISE_DATE6
{
    if (_ENTERPRISE_DATE6 == nil)
    {
        _ENTERPRISE_DATE6 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE6;
}

+(AssignmentField *)ENTERPRISE_DATE7
{
    if (_ENTERPRISE_DATE7 == nil)
    {
        _ENTERPRISE_DATE7 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE7;
}

+(AssignmentField *)ENTERPRISE_DATE8
{
    if (_ENTERPRISE_DATE8 == nil)
    {
        _ENTERPRISE_DATE8 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE8;
}

+(AssignmentField *)ENTERPRISE_DATE9
{
    if (_ENTERPRISE_DATE9 == nil)
    {
        _ENTERPRISE_DATE9 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE9;
}

+(AssignmentField *)ENTERPRISE_DATE10
{
    if (_ENTERPRISE_DATE10 == nil)
    {
        _ENTERPRISE_DATE10 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE10;
}

+(AssignmentField *)ENTERPRISE_DATE11
{
    if (_ENTERPRISE_DATE11 == nil)
    {
        _ENTERPRISE_DATE11 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE11;
}

+(AssignmentField *)ENTERPRISE_DATE12
{
    if (_ENTERPRISE_DATE12 == nil)
    {
        _ENTERPRISE_DATE12 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE12;
}

+(AssignmentField *)ENTERPRISE_DATE13
{
    if (_ENTERPRISE_DATE13 == nil)
    {
        _ENTERPRISE_DATE13 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE13;
}

+(AssignmentField *)ENTERPRISE_DATE14
{
    if (_ENTERPRISE_DATE14 == nil)
    {
        _ENTERPRISE_DATE14 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE14;
}

+(AssignmentField *)ENTERPRISE_DATE15
{
    if (_ENTERPRISE_DATE15 == nil)
    {
        _ENTERPRISE_DATE15 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE15;
}

+(AssignmentField *)ENTERPRISE_DATE16
{
    if (_ENTERPRISE_DATE16 == nil)
    {
        _ENTERPRISE_DATE16 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE16;
}

+(AssignmentField *)ENTERPRISE_DATE17
{
    if (_ENTERPRISE_DATE17 == nil)
    {
        _ENTERPRISE_DATE17 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE17;
}

+(AssignmentField *)ENTERPRISE_DATE18
{
    if (_ENTERPRISE_DATE18 == nil)
    {
        _ENTERPRISE_DATE18 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE18;
}

+(AssignmentField *)ENTERPRISE_DATE19
{
    if (_ENTERPRISE_DATE19 == nil)
    {
        _ENTERPRISE_DATE19 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE19;
}

+(AssignmentField *)ENTERPRISE_DATE20
{
    if (_ENTERPRISE_DATE20 == nil)
    {
        _ENTERPRISE_DATE20 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE20;
}

+(AssignmentField *)ENTERPRISE_DATE21
{
    if (_ENTERPRISE_DATE21 == nil)
    {
        _ENTERPRISE_DATE21 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE21;
}

+(AssignmentField *)ENTERPRISE_DATE22
{
    if (_ENTERPRISE_DATE22 == nil)
    {
        _ENTERPRISE_DATE22 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE22;
}

+(AssignmentField *)ENTERPRISE_DATE23
{
    if (_ENTERPRISE_DATE23 == nil)
    {
        _ENTERPRISE_DATE23 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE23;
}

+(AssignmentField *)ENTERPRISE_DATE24
{
    if (_ENTERPRISE_DATE24 == nil)
    {
        _ENTERPRISE_DATE24 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE24;
}

+(AssignmentField *)ENTERPRISE_DATE25
{
    if (_ENTERPRISE_DATE25 == nil)
    {
        _ENTERPRISE_DATE25 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE25;
}

+(AssignmentField *)ENTERPRISE_DATE26
{
    if (_ENTERPRISE_DATE26 == nil)
    {
        _ENTERPRISE_DATE26 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE26;
}

+(AssignmentField *)ENTERPRISE_DATE27
{
    if (_ENTERPRISE_DATE27 == nil)
    {
        _ENTERPRISE_DATE27 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE27;
}

+(AssignmentField *)ENTERPRISE_DATE28
{
    if (_ENTERPRISE_DATE28 == nil)
    {
        _ENTERPRISE_DATE28 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE28;
}

+(AssignmentField *)ENTERPRISE_DATE29
{
    if (_ENTERPRISE_DATE29 == nil)
    {
        _ENTERPRISE_DATE29 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE29;
}

+(AssignmentField *)ENTERPRISE_DATE30
{
    if (_ENTERPRISE_DATE30 == nil)
    {
        _ENTERPRISE_DATE30 = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE30;
}

+(AssignmentField *)ENTERPRISE_DURATION1
{
    if (_ENTERPRISE_DURATION1 == nil)
    {
        _ENTERPRISE_DURATION1 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION1;
}

+(AssignmentField *)ENTERPRISE_DURATION2
{
    if (_ENTERPRISE_DURATION2 == nil)
    {
        _ENTERPRISE_DURATION2 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION2;
}

+(AssignmentField *)ENTERPRISE_DURATION3
{
    if (_ENTERPRISE_DURATION3 == nil)
    {
        _ENTERPRISE_DURATION3 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION3;
}

+(AssignmentField *)ENTERPRISE_DURATION4
{
    if (_ENTERPRISE_DURATION4 == nil)
    {
        _ENTERPRISE_DURATION4 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION4;
}

+(AssignmentField *)ENTERPRISE_DURATION5
{
    if (_ENTERPRISE_DURATION5 == nil)
    {
        _ENTERPRISE_DURATION5 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION5;
}

+(AssignmentField *)ENTERPRISE_DURATION6
{
    if (_ENTERPRISE_DURATION6 == nil)
    {
        _ENTERPRISE_DURATION6 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION6;
}

+(AssignmentField *)ENTERPRISE_DURATION7
{
    if (_ENTERPRISE_DURATION7 == nil)
    {
        _ENTERPRISE_DURATION7 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION7;
}

+(AssignmentField *)ENTERPRISE_DURATION8
{
    if (_ENTERPRISE_DURATION8 == nil)
    {
        _ENTERPRISE_DURATION8 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION8;
}

+(AssignmentField *)ENTERPRISE_DURATION9
{
    if (_ENTERPRISE_DURATION9 == nil)
    {
        _ENTERPRISE_DURATION9 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION9;
}

+(AssignmentField *)ENTERPRISE_DURATION10
{
    if (_ENTERPRISE_DURATION10 == nil)
    {
        _ENTERPRISE_DURATION10 = [[AssignmentField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_DURATION10;
}

+(AssignmentField *)ENTERPRISE_FLAG1
{
    if (_ENTERPRISE_FLAG1 == nil)
    {
        _ENTERPRISE_FLAG1 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG1;
}

+(AssignmentField *)ENTERPRISE_FLAG2
{
    if (_ENTERPRISE_FLAG2 == nil)
    {
        _ENTERPRISE_FLAG2 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG2;
}

+(AssignmentField *)ENTERPRISE_FLAG3
{
    if (_ENTERPRISE_FLAG3 == nil)
    {
        _ENTERPRISE_FLAG3 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG3;
}

+(AssignmentField *)ENTERPRISE_FLAG4
{
    if (_ENTERPRISE_FLAG4 == nil)
    {
        _ENTERPRISE_FLAG4 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG4;
}

+(AssignmentField *)ENTERPRISE_FLAG5
{
    if (_ENTERPRISE_FLAG5 == nil)
    {
        _ENTERPRISE_FLAG5 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG5;
}

+(AssignmentField *)ENTERPRISE_FLAG6
{
    if (_ENTERPRISE_FLAG6 == nil)
    {
        _ENTERPRISE_FLAG6 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG6;
}

+(AssignmentField *)ENTERPRISE_FLAG7
{
    if (_ENTERPRISE_FLAG7 == nil)
    {
        _ENTERPRISE_FLAG7 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG7;
}

+(AssignmentField *)ENTERPRISE_FLAG8
{
    if (_ENTERPRISE_FLAG8 == nil)
    {
        _ENTERPRISE_FLAG8 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG8;
}

+(AssignmentField *)ENTERPRISE_FLAG9
{
    if (_ENTERPRISE_FLAG9 == nil)
    {
        _ENTERPRISE_FLAG9 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG9;
}

+(AssignmentField *)ENTERPRISE_FLAG10
{
    if (_ENTERPRISE_FLAG10 == nil)
    {
        _ENTERPRISE_FLAG10 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG10;
}

+(AssignmentField *)ENTERPRISE_FLAG11
{
    if (_ENTERPRISE_FLAG11 == nil)
    {
        _ENTERPRISE_FLAG11 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG11;
}

+(AssignmentField *)ENTERPRISE_FLAG12
{
    if (_ENTERPRISE_FLAG12 == nil)
    {
        _ENTERPRISE_FLAG12 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG12;
}

+(AssignmentField *)ENTERPRISE_FLAG13
{
    if (_ENTERPRISE_FLAG13 == nil)
    {
        _ENTERPRISE_FLAG13 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG13;
}

+(AssignmentField *)ENTERPRISE_FLAG14
{
    if (_ENTERPRISE_FLAG14 == nil)
    {
        _ENTERPRISE_FLAG14 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG14;
}

+(AssignmentField *)ENTERPRISE_FLAG15
{
    if (_ENTERPRISE_FLAG15 == nil)
    {
        _ENTERPRISE_FLAG15 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG15;
}

+(AssignmentField *)ENTERPRISE_FLAG16
{
    if (_ENTERPRISE_FLAG16 == nil)
    {
        _ENTERPRISE_FLAG16 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG16;
}

+(AssignmentField *)ENTERPRISE_FLAG17
{
    if (_ENTERPRISE_FLAG17 == nil)
    {
        _ENTERPRISE_FLAG17 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG17;
}

+(AssignmentField *)ENTERPRISE_FLAG18
{
    if (_ENTERPRISE_FLAG18 == nil)
    {
        _ENTERPRISE_FLAG18 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG18;
}

+(AssignmentField *)ENTERPRISE_FLAG19
{
    if (_ENTERPRISE_FLAG19 == nil)
    {
        _ENTERPRISE_FLAG19 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG19;
}

+(AssignmentField *)ENTERPRISE_FLAG20
{
    if (_ENTERPRISE_FLAG20 == nil)
    {
        _ENTERPRISE_FLAG20 = [[AssignmentField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG20;
}

+(AssignmentField *)ENTERPRISE_NUMBER1
{
    if (_ENTERPRISE_NUMBER1 == nil)
    {
        _ENTERPRISE_NUMBER1 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER1;
}

+(AssignmentField *)ENTERPRISE_NUMBER2
{
    if (_ENTERPRISE_NUMBER2 == nil)
    {
        _ENTERPRISE_NUMBER2 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER2;
}

+(AssignmentField *)ENTERPRISE_NUMBER3
{
    if (_ENTERPRISE_NUMBER3 == nil)
    {
        _ENTERPRISE_NUMBER3 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER3;
}

+(AssignmentField *)ENTERPRISE_NUMBER4
{
    if (_ENTERPRISE_NUMBER4 == nil)
    {
        _ENTERPRISE_NUMBER4 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER4;
}

+(AssignmentField *)ENTERPRISE_NUMBER5
{
    if (_ENTERPRISE_NUMBER5 == nil)
    {
        _ENTERPRISE_NUMBER5 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER5;
}

+(AssignmentField *)ENTERPRISE_NUMBER6
{
    if (_ENTERPRISE_NUMBER6 == nil)
    {
        _ENTERPRISE_NUMBER6 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER6;
}

+(AssignmentField *)ENTERPRISE_NUMBER7
{
    if (_ENTERPRISE_NUMBER7 == nil)
    {
        _ENTERPRISE_NUMBER7 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER7;
}

+(AssignmentField *)ENTERPRISE_NUMBER8
{
    if (_ENTERPRISE_NUMBER8 == nil)
    {
        _ENTERPRISE_NUMBER8 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER8;
}

+(AssignmentField *)ENTERPRISE_NUMBER9
{
    if (_ENTERPRISE_NUMBER9 == nil)
    {
        _ENTERPRISE_NUMBER9 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER9;
}

+(AssignmentField *)ENTERPRISE_NUMBER10
{
    if (_ENTERPRISE_NUMBER10 == nil)
    {
        _ENTERPRISE_NUMBER10 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER10;
}

+(AssignmentField *)ENTERPRISE_NUMBER11
{
    if (_ENTERPRISE_NUMBER11 == nil)
    {
        _ENTERPRISE_NUMBER11 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER11;
}

+(AssignmentField *)ENTERPRISE_NUMBER12
{
    if (_ENTERPRISE_NUMBER12 == nil)
    {
        _ENTERPRISE_NUMBER12 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER12;
}

+(AssignmentField *)ENTERPRISE_NUMBER13
{
    if (_ENTERPRISE_NUMBER13 == nil)
    {
        _ENTERPRISE_NUMBER13 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER13;
}

+(AssignmentField *)ENTERPRISE_NUMBER14
{
    if (_ENTERPRISE_NUMBER14 == nil)
    {
        _ENTERPRISE_NUMBER14 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER14;
}

+(AssignmentField *)ENTERPRISE_NUMBER15
{
    if (_ENTERPRISE_NUMBER15 == nil)
    {
        _ENTERPRISE_NUMBER15 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER15;
}

+(AssignmentField *)ENTERPRISE_NUMBER16
{
    if (_ENTERPRISE_NUMBER16 == nil)
    {
        _ENTERPRISE_NUMBER16 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER16;
}

+(AssignmentField *)ENTERPRISE_NUMBER17
{
    if (_ENTERPRISE_NUMBER17 == nil)
    {
        _ENTERPRISE_NUMBER17 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER17;
}

+(AssignmentField *)ENTERPRISE_NUMBER18
{
    if (_ENTERPRISE_NUMBER18 == nil)
    {
        _ENTERPRISE_NUMBER18 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER18;
}

+(AssignmentField *)ENTERPRISE_NUMBER19
{
    if (_ENTERPRISE_NUMBER19 == nil)
    {
        _ENTERPRISE_NUMBER19 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER19;
}

+(AssignmentField *)ENTERPRISE_NUMBER20
{
    if (_ENTERPRISE_NUMBER20 == nil)
    {
        _ENTERPRISE_NUMBER20 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER20;
}

+(AssignmentField *)ENTERPRISE_NUMBER21
{
    if (_ENTERPRISE_NUMBER21 == nil)
    {
        _ENTERPRISE_NUMBER21 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER21;
}

+(AssignmentField *)ENTERPRISE_NUMBER22
{
    if (_ENTERPRISE_NUMBER22 == nil)
    {
        _ENTERPRISE_NUMBER22 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER22;
}

+(AssignmentField *)ENTERPRISE_NUMBER23
{
    if (_ENTERPRISE_NUMBER23 == nil)
    {
        _ENTERPRISE_NUMBER23 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER23;
}

+(AssignmentField *)ENTERPRISE_NUMBER24
{
    if (_ENTERPRISE_NUMBER24 == nil)
    {
        _ENTERPRISE_NUMBER24 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER24;
}

+(AssignmentField *)ENTERPRISE_NUMBER25
{
    if (_ENTERPRISE_NUMBER25 == nil)
    {
        _ENTERPRISE_NUMBER25 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER25;
}

+(AssignmentField *)ENTERPRISE_NUMBER26
{
    if (_ENTERPRISE_NUMBER26 == nil)
    {
        _ENTERPRISE_NUMBER26 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER26;
}

+(AssignmentField *)ENTERPRISE_NUMBER27
{
    if (_ENTERPRISE_NUMBER27 == nil)
    {
        _ENTERPRISE_NUMBER27 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_NUMBER27;
}

+(AssignmentField *)ENTERPRISE_NUMBER28
{
    if (_ENTERPRISE_NUMBER28 == nil)
    {
        _ENTERPRISE_NUMBER28 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER28;
}

+(AssignmentField *)ENTERPRISE_NUMBER29
{
    if (_ENTERPRISE_NUMBER29 == nil)
    {
        _ENTERPRISE_NUMBER29 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER29;
}

+(AssignmentField *)ENTERPRISE_NUMBER30
{
    if (_ENTERPRISE_NUMBER30 == nil)
    {
        _ENTERPRISE_NUMBER30 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER30;
}

+(AssignmentField *)ENTERPRISE_NUMBER31
{
    if (_ENTERPRISE_NUMBER31 == nil)
    {
        _ENTERPRISE_NUMBER31 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER31;
}

+(AssignmentField *)ENTERPRISE_NUMBER32
{
    if (_ENTERPRISE_NUMBER32 == nil)
    {
        _ENTERPRISE_NUMBER32 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER32;
}

+(AssignmentField *)ENTERPRISE_NUMBER33
{
    if (_ENTERPRISE_NUMBER33 == nil)
    {
        _ENTERPRISE_NUMBER33 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER33;
}

+(AssignmentField *)ENTERPRISE_NUMBER34
{
    if (_ENTERPRISE_NUMBER34 == nil)
    {
        _ENTERPRISE_NUMBER34 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER34;
}

+(AssignmentField *)ENTERPRISE_NUMBER35
{
    if (_ENTERPRISE_NUMBER35 == nil)
    {
        _ENTERPRISE_NUMBER35 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER35;
}

+(AssignmentField *)ENTERPRISE_NUMBER36
{
    if (_ENTERPRISE_NUMBER36 == nil)
    {
        _ENTERPRISE_NUMBER36 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER36;
}

+(AssignmentField *)ENTERPRISE_NUMBER37
{
    if (_ENTERPRISE_NUMBER37 == nil)
    {
        _ENTERPRISE_NUMBER37 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER37;
}

+(AssignmentField *)ENTERPRISE_NUMBER38
{
    if (_ENTERPRISE_NUMBER38 == nil)
    {
        _ENTERPRISE_NUMBER38 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER38;
}

+(AssignmentField *)ENTERPRISE_NUMBER39
{
    if (_ENTERPRISE_NUMBER39 == nil)
    {
        _ENTERPRISE_NUMBER39 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER39;
}

+(AssignmentField *)ENTERPRISE_NUMBER40
{
    if (_ENTERPRISE_NUMBER40 == nil)
    {
        _ENTERPRISE_NUMBER40 = [[AssignmentField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER40;
}

+(AssignmentField *)ENTERPRISE_TEXT1
{
    if (_ENTERPRISE_TEXT1 == nil)
    {
        _ENTERPRISE_TEXT1 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT1;
}

+(AssignmentField *)ENTERPRISE_TEXT2
{
    if (_ENTERPRISE_TEXT2 == nil)
    {
        _ENTERPRISE_TEXT2 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT2;
}

+(AssignmentField *)ENTERPRISE_TEXT3
{
    if (_ENTERPRISE_TEXT3 == nil)
    {
        _ENTERPRISE_TEXT3 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT3;
}

+(AssignmentField *)ENTERPRISE_TEXT4
{
    if (_ENTERPRISE_TEXT4 == nil)
    {
        _ENTERPRISE_TEXT4 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT4;
}

+(AssignmentField *)ENTERPRISE_TEXT5
{
    if (_ENTERPRISE_TEXT5 == nil)
    {
        _ENTERPRISE_TEXT5 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT5;
}

+(AssignmentField *)ENTERPRISE_TEXT6
{
    if (_ENTERPRISE_TEXT6 == nil)
    {
        _ENTERPRISE_TEXT6 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT6;
}

+(AssignmentField *)ENTERPRISE_TEXT7
{
    if (_ENTERPRISE_TEXT7 == nil)
    {
        _ENTERPRISE_TEXT7 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT7;
}

+(AssignmentField *)ENTERPRISE_TEXT8
{
    if (_ENTERPRISE_TEXT8 == nil)
    {
        _ENTERPRISE_TEXT8 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT8;
}

+(AssignmentField *)ENTERPRISE_TEXT9
{
    if (_ENTERPRISE_TEXT9 == nil)
    {
        _ENTERPRISE_TEXT9 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT9;
}

+(AssignmentField *)ENTERPRISE_TEXT10
{
    if (_ENTERPRISE_TEXT10 == nil)
    {
        _ENTERPRISE_TEXT10 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT10;
}

+(AssignmentField *)ENTERPRISE_TEXT11
{
    if (_ENTERPRISE_TEXT11 == nil)
    {
        _ENTERPRISE_TEXT11 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT11;
}

+(AssignmentField *)ENTERPRISE_TEXT12
{
    if (_ENTERPRISE_TEXT12 == nil)
    {
        _ENTERPRISE_TEXT12 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT12;
}

+(AssignmentField *)ENTERPRISE_TEXT13
{
    if (_ENTERPRISE_TEXT13 == nil)
    {
        _ENTERPRISE_TEXT13 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT13;
}

+(AssignmentField *)ENTERPRISE_TEXT14
{
    if (_ENTERPRISE_TEXT14 == nil)
    {
        _ENTERPRISE_TEXT14 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT14;
}

+(AssignmentField *)ENTERPRISE_TEXT15
{
    if (_ENTERPRISE_TEXT15 == nil)
    {
        _ENTERPRISE_TEXT15 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT15;
}

+(AssignmentField *)ENTERPRISE_TEXT16
{
    if (_ENTERPRISE_TEXT16 == nil)
    {
        _ENTERPRISE_TEXT16 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT16;
}

+(AssignmentField *)ENTERPRISE_TEXT17
{
    if (_ENTERPRISE_TEXT17 == nil)
    {
        _ENTERPRISE_TEXT17 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT17;
}

+(AssignmentField *)ENTERPRISE_TEXT18
{
    if (_ENTERPRISE_TEXT18 == nil)
    {
        _ENTERPRISE_TEXT18 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT18;
}

+(AssignmentField *)ENTERPRISE_TEXT19
{
    if (_ENTERPRISE_TEXT19 == nil)
    {
        _ENTERPRISE_TEXT19 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT19;
}

+(AssignmentField *)ENTERPRISE_TEXT20
{
    if (_ENTERPRISE_TEXT20 == nil)
    {
        _ENTERPRISE_TEXT20 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT20;
}

+(AssignmentField *)ENTERPRISE_TEXT21
{
    if (_ENTERPRISE_TEXT21 == nil)
    {
        _ENTERPRISE_TEXT21 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT21;
}

+(AssignmentField *)ENTERPRISE_TEXT22
{
    if (_ENTERPRISE_TEXT22 == nil)
    {
        _ENTERPRISE_TEXT22 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT22;
}

+(AssignmentField *)ENTERPRISE_TEXT23
{
    if (_ENTERPRISE_TEXT23 == nil)
    {
        _ENTERPRISE_TEXT23 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT23;
}

+(AssignmentField *)ENTERPRISE_TEXT24
{
    if (_ENTERPRISE_TEXT24 == nil)
    {
        _ENTERPRISE_TEXT24 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT24;
}

+(AssignmentField *)ENTERPRISE_TEXT25
{
    if (_ENTERPRISE_TEXT25 == nil)
    {
        _ENTERPRISE_TEXT25 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT25;
}

+(AssignmentField *)ENTERPRISE_TEXT26
{
    if (_ENTERPRISE_TEXT26 == nil)
    {
        _ENTERPRISE_TEXT26 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT26;
}

+(AssignmentField *)ENTERPRISE_TEXT27
{
    if (_ENTERPRISE_TEXT27 == nil)
    {
        _ENTERPRISE_TEXT27 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT27;
}

+(AssignmentField *)ENTERPRISE_TEXT28
{
    if (_ENTERPRISE_TEXT28 == nil)
    {
        _ENTERPRISE_TEXT28 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT28;
}

+(AssignmentField *)ENTERPRISE_TEXT29
{
    if (_ENTERPRISE_TEXT29 == nil)
    {
        _ENTERPRISE_TEXT29 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT29;
}

+(AssignmentField *)ENTERPRISE_TEXT30
{
    if (_ENTERPRISE_TEXT30 == nil)
    {
        _ENTERPRISE_TEXT30 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT30;
}

+(AssignmentField *)ENTERPRISE_TEXT31
{
    if (_ENTERPRISE_TEXT31 == nil)
    {
        _ENTERPRISE_TEXT31 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT31;
}

+(AssignmentField *)ENTERPRISE_TEXT32
{
    if (_ENTERPRISE_TEXT32 == nil)
    {
        _ENTERPRISE_TEXT32 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT32;
}

+(AssignmentField *)ENTERPRISE_TEXT33
{
    if (_ENTERPRISE_TEXT33 == nil)
    {
        _ENTERPRISE_TEXT33 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT33;
}

+(AssignmentField *)ENTERPRISE_TEXT34
{
    if (_ENTERPRISE_TEXT34 == nil)
    {
        _ENTERPRISE_TEXT34 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT34;
}

+(AssignmentField *)ENTERPRISE_TEXT35
{
    if (_ENTERPRISE_TEXT35 == nil)
    {
        _ENTERPRISE_TEXT35 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT35;
}

+(AssignmentField *)ENTERPRISE_TEXT36
{
    if (_ENTERPRISE_TEXT36 == nil)
    {
        _ENTERPRISE_TEXT36 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT36;
}

+(AssignmentField *)ENTERPRISE_TEXT37
{
    if (_ENTERPRISE_TEXT37 == nil)
    {
        _ENTERPRISE_TEXT37 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT37;
}

+(AssignmentField *)ENTERPRISE_TEXT38
{
    if (_ENTERPRISE_TEXT38 == nil)
    {
        _ENTERPRISE_TEXT38 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT38;
}

+(AssignmentField *)ENTERPRISE_TEXT39
{
    if (_ENTERPRISE_TEXT39 == nil)
    {
        _ENTERPRISE_TEXT39 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT39;
}

+(AssignmentField *)ENTERPRISE_TEXT40
{
    if (_ENTERPRISE_TEXT40 == nil)
    {
        _ENTERPRISE_TEXT40 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT40;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE1
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE1 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE1 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE1;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE2
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE2 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE2 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE2;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE3
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE3 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE3 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE3;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE4
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE4 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE4 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE4;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE5
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE5 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE5 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE5;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE6
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE6 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE6 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE6;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE7
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE7 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE7 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE7;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE8
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE8 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE8 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE8;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE9
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE9 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE9 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE9;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE10
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE10 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE10 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE10;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE11
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE11 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE11 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE11;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE12
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE12 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE12 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE12;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE13
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE13 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE13 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE13;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE14
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE14 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE14 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE14;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE15
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE15 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE15 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE15;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE16
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE16 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE16 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE16;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE17
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE17 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE17 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE17;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE18
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE18 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE18 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE18;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE19
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE19 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE19 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE19;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE20
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE20 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE20 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE20;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE21
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE21 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE21 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE21;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE22
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE22 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE22 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE22;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE23
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE23 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE23 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE23;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE24
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE24 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE24 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE24;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE25
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE25 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE25 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE25;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE26
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE26 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE26 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE26;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE27
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE27 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE27 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE27;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE28
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE28 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE28 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE28;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_OUTLINE_CODE29
{
    if (_ENTERPRISE_RESOURCE_OUTLINE_CODE29 == nil)
    {
        _ENTERPRISE_RESOURCE_OUTLINE_CODE29 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_OUTLINE_CODE29;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_RBS
{
    if (_ENTERPRISE_RESOURCE_RBS == nil)
    {
        _ENTERPRISE_RESOURCE_RBS = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_RBS;
}

+(AssignmentField *)RESOURCE_REQUEST_TYPE
{
    if (_RESOURCE_REQUEST_TYPE == nil)
    {
        _RESOURCE_REQUEST_TYPE = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_REQUEST_TYPE;
}

+(AssignmentField *)ENTERPRISE_TEAM_MEMBER
{
    if (_ENTERPRISE_TEAM_MEMBER == nil)
    {
        _ENTERPRISE_TEAM_MEMBER = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEAM_MEMBER;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE20
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE20 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE20 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE20;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE21
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE21 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE21 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE21;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE22
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE22 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE22 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE22;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE23
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE23 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE23 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE23;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE24
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE24 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE24 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE24;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE25
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE25 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE25 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE25;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE26
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE26 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE26 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE26;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE27
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE27 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE27 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE27;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE28
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE28 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE28 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE28;
}

+(AssignmentField *)ENTERPRISE_RESOURCE_MULTI_VALUE29
{
    if (_ENTERPRISE_RESOURCE_MULTI_VALUE29 == nil)
    {
        _ENTERPRISE_RESOURCE_MULTI_VALUE29 = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_RESOURCE_MULTI_VALUE29;
}

+(AssignmentField *)ACTUAL_WORK_PROTECTED
{
    if (_ACTUAL_WORK_PROTECTED == nil)
    {
        _ACTUAL_WORK_PROTECTED = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_WORK_PROTECTED;
}

+(AssignmentField *)ACTUAL_OVERTIME_WORK_PROTECTED
{
    if (_ACTUAL_OVERTIME_WORK_PROTECTED == nil)
    {
        _ACTUAL_OVERTIME_WORK_PROTECTED = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_OVERTIME_WORK_PROTECTED;
}

+(AssignmentField *)CREATED
{
    if (_CREATED == nil)
    {
        _CREATED = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _CREATED;
}

+(AssignmentField *)GUID
{
    if (_GUID == nil)
    {
        _GUID = [[AssignmentField alloc]init:[DataType GUID]];
    }
    return _GUID;
}

+(AssignmentField *)ASSIGNMENT_TASK_GUID
{
    if (_ASSIGNMENT_TASK_GUID == nil)
    {
        _ASSIGNMENT_TASK_GUID = [[AssignmentField alloc]init:[DataType GUID]];
    }
    return _ASSIGNMENT_TASK_GUID;
}

+(AssignmentField *)ASSIGNMENT_RESOURCE_GUID
{
    if (_ASSIGNMENT_RESOURCE_GUID == nil)
    {
        _ASSIGNMENT_RESOURCE_GUID = [[AssignmentField alloc]init:[DataType GUID]];
    }
    return _ASSIGNMENT_RESOURCE_GUID;
}

+(AssignmentField *)SUMMARY
{
    if (_SUMMARY == nil)
    {
        _SUMMARY = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _SUMMARY;
}

+(AssignmentField *)OWNER
{
    if (_OWNER == nil)
    {
        _OWNER = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _OWNER;
}

+(AssignmentField *)BUDGET_WORK
{
    if (_BUDGET_WORK == nil)
    {
        _BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BUDGET_WORK;
}

+(AssignmentField *)BUDGET_COST
{
    if (_BUDGET_COST == nil)
    {
        _BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BUDGET_COST;
}

+(AssignmentField *)BASELINE_BUDGET_WORK
{
    if (_BASELINE_BUDGET_WORK == nil)
    {
        _BASELINE_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE_BUDGET_WORK;
}

+(AssignmentField *)BASELINE_BUDGET_COST
{
    if (_BASELINE_BUDGET_COST == nil)
    {
        _BASELINE_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE_BUDGET_COST;
}

+(AssignmentField *)BASELINE1_BUDGET_WORK
{
    if (_BASELINE1_BUDGET_WORK == nil)
    {
        _BASELINE1_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE1_BUDGET_WORK;
}

+(AssignmentField *)BASELINE1_BUDGET_COST
{
    if (_BASELINE1_BUDGET_COST == nil)
    {
        _BASELINE1_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE1_BUDGET_COST;
}

+(AssignmentField *)BASELINE2_BUDGET_WORK
{
    if (_BASELINE2_BUDGET_WORK == nil)
    {
        _BASELINE2_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE2_BUDGET_WORK;
}

+(AssignmentField *)BASELINE2_BUDGET_COST
{
    if (_BASELINE2_BUDGET_COST == nil)
    {
        _BASELINE2_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE2_BUDGET_COST;
}

+(AssignmentField *)BASELINE3_BUDGET_WORK
{
    if (_BASELINE3_BUDGET_WORK == nil)
    {
        _BASELINE3_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE3_BUDGET_WORK;
}

+(AssignmentField *)BASELINE3_BUDGET_COST
{
    if (_BASELINE3_BUDGET_COST == nil)
    {
        _BASELINE3_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE3_BUDGET_COST;
}

+(AssignmentField *)BASELINE4_BUDGET_WORK
{
    if (_BASELINE4_BUDGET_WORK == nil)
    {
        _BASELINE4_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE4_BUDGET_WORK;
}

+(AssignmentField *)BASELINE4_BUDGET_COST
{
    if (_BASELINE4_BUDGET_COST == nil)
    {
        _BASELINE4_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE4_BUDGET_COST;
}

+(AssignmentField *)BASELINE5_BUDGET_WORK
{
    if (_BASELINE5_BUDGET_WORK == nil)
    {
        _BASELINE5_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE5_BUDGET_WORK;
}

+(AssignmentField *)BASELINE5_BUDGET_COST
{
    if (_BASELINE5_BUDGET_COST == nil)
    {
        _BASELINE5_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE5_BUDGET_COST;
}

+(AssignmentField *)BASELINE6_BUDGET_WORK
{
    if (_BASELINE6_BUDGET_WORK == nil)
    {
        _BASELINE6_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE6_BUDGET_WORK;
}

+(AssignmentField *)BASELINE6_BUDGET_COST
{
    if (_BASELINE6_BUDGET_COST == nil)
    {
        _BASELINE6_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE6_BUDGET_COST;
}

+(AssignmentField *)BASELINE7_BUDGET_WORK
{
    if (_BASELINE7_BUDGET_WORK == nil)
    {
        _BASELINE7_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE7_BUDGET_WORK;
}

+(AssignmentField *)BASELINE7_BUDGET_COST
{
    if (_BASELINE7_BUDGET_COST == nil)
    {
        _BASELINE7_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE7_BUDGET_COST;
}

+(AssignmentField *)BASELINE8_BUDGET_WORK
{
    if (_BASELINE8_BUDGET_WORK == nil)
    {
        _BASELINE8_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE8_BUDGET_WORK;
}

+(AssignmentField *)BASELINE8_BUDGET_COST
{
    if (_BASELINE8_BUDGET_COST == nil)
    {
        _BASELINE8_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE8_BUDGET_COST;
}

+(AssignmentField *)BASELINE9_BUDGET_WORK
{
    if (_BASELINE9_BUDGET_WORK == nil)
    {
        _BASELINE9_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE9_BUDGET_WORK;
}

+(AssignmentField *)BASELINE9_BUDGET_COST
{
    if (_BASELINE9_BUDGET_COST == nil)
    {
        _BASELINE9_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE9_BUDGET_COST;
}

+(AssignmentField *)BASELINE10_BUDGET_WORK
{
    if (_BASELINE10_BUDGET_WORK == nil)
    {
        _BASELINE10_BUDGET_WORK = [[AssignmentField alloc]init:[DataType WORK]];
    }
    return _BASELINE10_BUDGET_WORK;
}

+(AssignmentField *)BASELINE10_BUDGET_COST
{
    if (_BASELINE10_BUDGET_COST == nil)
    {
        _BASELINE10_BUDGET_COST = [[AssignmentField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE10_BUDGET_COST;
}

+(AssignmentField *)UNAVAILABLE
{
    if (_UNAVAILABLE == nil)
    {
        _UNAVAILABLE = [[AssignmentField alloc]init:[DataType STRING]];
    }
    return _UNAVAILABLE;
}

+(AssignmentField *)HYPERLINK_DATA
{
    if (_HYPERLINK_DATA == nil)
    {
        _HYPERLINK_DATA = [[AssignmentField alloc]init:[DataType BINARY]];
    }
    return _HYPERLINK_DATA;
}

+(AssignmentField *)FINISH
{
    if (_FINISH == nil)
    {
        _FINISH = [[AssignmentField alloc]init:[DataType DATE]];
    }
    return _FINISH;
}

+(NSMutableArray *)TYPE_VALUES
{
    if (_TYPE_VALUES == nil) 
    {
        _TYPE_VALUES = [[NSMutableArray alloc]initWithObjects:[AssignmentField START], [AssignmentField DURATION1_UNITS], [AssignmentField DURATION2_UNITS],                         [AssignmentField DURATION3_UNITS],                         [AssignmentField DURATION4_UNITS],                         [AssignmentField DURATION5_UNITS],                         [AssignmentField DURATION6_UNITS],                         [AssignmentField DURATION7_UNITS],                         [AssignmentField DURATION8_UNITS],                         [AssignmentField DURATION9_UNITS],                         [AssignmentField DURATION10_UNITS],                        [AssignmentField ACTUAL_COST],                         [AssignmentField ACTUAL_WORK],                         [AssignmentField COST],[AssignmentField ASSIGNMENT_DELAY], 
                        [AssignmentField VARIABLE_RATE_UNITS], 
                        [AssignmentField ASSIGNMENT_UNITS], 
                        [AssignmentField WORK], 
                        [AssignmentField BASELINE_START], 
                        [AssignmentField ACTUAL_START], 
                        [AssignmentField BASELINE_FINISH], 
                        [AssignmentField ACTUAL_FINISH], 
                        [AssignmentField BASELINE_WORK], 
                        [AssignmentField OVERTIME_WORK], 
                        [AssignmentField BASELINE_COST], 
                        [AssignmentField WORK_CONTOUR], 
                        [AssignmentField REMAINING_WORK], 
                        [AssignmentField LEVELING_DELAY_UNITS], 
                        [AssignmentField LEVELING_DELAY], 
                        [AssignmentField DELAY], 
                        [AssignmentField UNIQUE_ID], 
                        [AssignmentField TASK_UNIQUE_ID], 
                        [AssignmentField RESOURCE_UNIQUE_ID], 
                        [AssignmentField TIMEPHASED_WORK], 
                        [AssignmentField TIMEPHASED_ACTUAL_WORK], 
                        [AssignmentField TIMEPHASED_ACTUAL_OVERTIME_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE1_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE2_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE3_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE4_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE5_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE6_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE7_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE8_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE9_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE10_WORK], 
                        [AssignmentField TIMEPHASED_BASELINE_COST], 
                        [AssignmentField TIMEPHASED_BASELINE1_COST], 
                        [AssignmentField TIMEPHASED_BASELINE2_COST], 
                        [AssignmentField TIMEPHASED_BASELINE3_COST], 
                        [AssignmentField TIMEPHASED_BASELINE4_COST], 
                        [AssignmentField TIMEPHASED_BASELINE5_COST], 
                        [AssignmentField TIMEPHASED_BASELINE6_COST], 
                        [AssignmentField TIMEPHASED_BASELINE7_COST], 
                        [AssignmentField TIMEPHASED_BASELINE8_COST], 
                        [AssignmentField TIMEPHASED_BASELINE9_COST], 
                        [AssignmentField TIMEPHASED_BASELINE10_COST], 
                        [AssignmentField TASK_ID], 
                        [AssignmentField RESOURCE_ID], 
                        [AssignmentField TASK_NAME], 
                        [AssignmentField RESOURCE_NAME], 
                        [AssignmentField REGULAR_WORK], 
                        [AssignmentField ACTUAL_OVERTIME_WORK], 
                        [AssignmentField REMAINING_OVERTIME_WORK], 
                        [AssignmentField PEAK], 
                        [AssignmentField OVERTIME_COST], 
                        [AssignmentField REMAINING_COST], 
                        [AssignmentField ACTUAL_OVERTIME_COST], 
                        [AssignmentField REMAINING_OVERTIME_COST], 
                        [AssignmentField BCWS], 
                        [AssignmentField BCWP], 
                        [AssignmentField ACWP], 
                        [AssignmentField SV], 
                        [AssignmentField COST_VARIANCE], 
                        [AssignmentField PERCENT_WORK_COMPLETE], 
                        [AssignmentField PROJECT], 
                        [AssignmentField NOTES], 
                        [AssignmentField CONFIRMED], 
                        [AssignmentField RESPONSE_PENDING], 
                        [AssignmentField UPDATE_NEEDED], 
                        [AssignmentField TEAM_STATUS_PENDING], 
                        [AssignmentField COST_RATE_TABLE], 
                        [AssignmentField TEXT1], 
                        [AssignmentField TEXT2], 
                        [AssignmentField TEXT3], 
                        [AssignmentField TEXT4], 
                        [AssignmentField TEXT5], 
                        [AssignmentField TEXT6], 
                        [AssignmentField TEXT7], 
                        [AssignmentField TEXT8], 
                        [AssignmentField TEXT9], 
                        [AssignmentField TEXT10], 
                        [AssignmentField START1], 
                        [AssignmentField START2], 
                        [AssignmentField START3], 
                        [AssignmentField START4], 
                        [AssignmentField START5], 
                        [AssignmentField FINISH1], 
                        [AssignmentField FINISH2], 
                        [AssignmentField FINISH3], 
                        [AssignmentField FINISH4], 
                        [AssignmentField FINISH5], 
                        [AssignmentField NUMBER1], 
                        [AssignmentField NUMBER2], 
                        [AssignmentField NUMBER3], 
                        [AssignmentField NUMBER4], 
                        [AssignmentField NUMBER5], 
                        [AssignmentField DURATION1], 
                        [AssignmentField DURATION2], 
                        [AssignmentField DURATION3], 
                        [AssignmentField COST1], 
                        [AssignmentField COST2], 
                        [AssignmentField COST3], 
                        [AssignmentField FLAG10], 
                        [AssignmentField FLAG1], 
                        [AssignmentField FLAG2], 
                        [AssignmentField FLAG3], 
                        [AssignmentField FLAG4], 
                        [AssignmentField FLAG5], 
                        [AssignmentField FLAG6], 
                        [AssignmentField FLAG7], 
                        [AssignmentField FLAG8], 
                        [AssignmentField FLAG9], 
                        [AssignmentField LINKED_FIELDS], 
                        [AssignmentField OVERALLOCATED], 
                        [AssignmentField TASK_SUMMARY_NAME], 
                        [AssignmentField HYPERLINK], 
                        [AssignmentField HYPERLINK_ADDRESS], 
                        [AssignmentField HYPERLINK_SUBADDRESS], 
                        [AssignmentField HYPERLINK_HREF], 
                        [AssignmentField COST4], 
                        [AssignmentField COST5], 
                        [AssignmentField COST6], 
                        [AssignmentField COST7], 
                        [AssignmentField COST8], 
                        [AssignmentField COST9], 
                        [AssignmentField COST10], 
                        [AssignmentField DATE1], 
                        [AssignmentField DATE2], 
                        [AssignmentField DATE3], 
                        [AssignmentField DATE4], 
                        [AssignmentField DATE5], 
                        [AssignmentField DATE6], 
                        [AssignmentField DATE7], 
                        [AssignmentField DATE8], 
                        [AssignmentField DATE9], 
                        [AssignmentField DATE10], 
                        [AssignmentField DURATION4], 
                        [AssignmentField DURATION5], 
                        [AssignmentField DURATION6], 
                        [AssignmentField DURATION7], 
                        [AssignmentField DURATION8], 
                        [AssignmentField DURATION9], 
                        [AssignmentField DURATION10], 
                        [AssignmentField FINISH6], 
                        [AssignmentField FINISH7], 
                        [AssignmentField FINISH8], 
                        [AssignmentField FINISH9], 
                        [AssignmentField FINISH10], 
                        [AssignmentField FLAG11], 
                        [AssignmentField FLAG12], 
                        [AssignmentField FLAG13], 
                        [AssignmentField FLAG14], 
                        [AssignmentField FLAG15], 
                        [AssignmentField FLAG16], 
                        [AssignmentField FLAG17], 
                        [AssignmentField FLAG18], 
                        [AssignmentField FLAG19], 
                        [AssignmentField FLAG20], 
                        [AssignmentField NUMBER6], 
                        [AssignmentField NUMBER7], 
                        [AssignmentField NUMBER8], 
                        [AssignmentField NUMBER9], 
                        [AssignmentField NUMBER10], 
                        [AssignmentField NUMBER11], 
                        [AssignmentField NUMBER12], 
                        [AssignmentField NUMBER13], 
                        [AssignmentField NUMBER14], 
                        [AssignmentField NUMBER15], 
                        [AssignmentField NUMBER16], 
                        [AssignmentField NUMBER17], 
                        [AssignmentField NUMBER18], 
                        [AssignmentField NUMBER19], 
                        [AssignmentField NUMBER20], 
                        [AssignmentField START6], 
                        [AssignmentField START7], 
                        [AssignmentField START8], 
                        [AssignmentField START9], 
                        [AssignmentField START10], 
                        [AssignmentField TEXT11], 
                        [AssignmentField TEXT12], 
                        [AssignmentField TEXT13], 
                        [AssignmentField TEXT14], 
                        [AssignmentField TEXT15], 
                        [AssignmentField TEXT16], 
                        [AssignmentField TEXT17], 
                        [AssignmentField TEXT18], 
                        [AssignmentField TEXT19], 
                        [AssignmentField TEXT20], 
                        [AssignmentField TEXT21], 
                        [AssignmentField TEXT22], 
                        [AssignmentField TEXT23], 
                        [AssignmentField TEXT24], 
                        [AssignmentField TEXT25], 
                        [AssignmentField TEXT26], 
                        [AssignmentField TEXT27], 
                        [AssignmentField TEXT28], 
                        [AssignmentField TEXT29], 
                        [AssignmentField TEXT30], 
                        [AssignmentField INDEX], 
                        [AssignmentField CV], 
                        [AssignmentField WORK_VARIANCE], 
                        [AssignmentField START_VARIANCE], 
                        [AssignmentField FINISH_VARIANCE], 
                        [AssignmentField VAC], 
                        [AssignmentField FIXED_MATERIAL_ASSIGNMENT], 
                        [AssignmentField RESOURCE_TYPE], 
                        [AssignmentField HYPERLINK_SCREEN_TIP], 
                        [AssignmentField WBS], 
                        [AssignmentField BASELINE1_WORK], 
                        [AssignmentField BASELINE1_COST], 
                        [AssignmentField BASELINE1_START], 
                        [AssignmentField BASELINE1_FINISH], 
                        [AssignmentField BASELINE2_WORK], 
                        [AssignmentField BASELINE2_COST], 
                        [AssignmentField BASELINE2_START], 
                        [AssignmentField BASELINE2_FINISH], 
                        [AssignmentField BASELINE3_WORK], 
                        [AssignmentField BASELINE3_COST], 
                        [AssignmentField BASELINE3_START], 
                        [AssignmentField BASELINE3_FINISH], 
                        [AssignmentField BASELINE4_WORK], 
                        [AssignmentField BASELINE4_COST], 
                        [AssignmentField BASELINE4_START], 
                        [AssignmentField BASELINE4_FINISH], 
                        [AssignmentField BASELINE5_WORK], 
                        [AssignmentField BASELINE5_COST], 
                        [AssignmentField BASELINE5_START], 
                        [AssignmentField BASELINE5_FINISH], 
                        [AssignmentField BASELINE6_WORK], 
                        [AssignmentField BASELINE6_COST], 
                        [AssignmentField BASELINE6_START], 
                        [AssignmentField BASELINE6_FINISH], 
                        [AssignmentField BASELINE7_WORK], 
                        [AssignmentField BASELINE7_COST], 
                        [AssignmentField BASELINE7_START], 
                        [AssignmentField BASELINE7_FINISH], 
                        [AssignmentField BASELINE8_WORK], 
                        [AssignmentField BASELINE8_COST], 
                        [AssignmentField BASELINE8_START], 
                        [AssignmentField BASELINE8_FINISH], 
                        [AssignmentField BASELINE9_WORK], 
                        [AssignmentField BASELINE9_COST], 
                        [AssignmentField BASELINE9_START], 
                        [AssignmentField BASELINE9_FINISH], 
                        [AssignmentField BASELINE10_WORK], 
                        [AssignmentField BASELINE10_COST], 
                        [AssignmentField BASELINE10_START], 
                        [AssignmentField BASELINE10_FINISH], 
                        [AssignmentField TASK_OUTLINE_NUMBER], 
                        [AssignmentField ENTERPRISE_COST1], 
                        [AssignmentField ENTERPRISE_COST2], 
                        [AssignmentField ENTERPRISE_COST3], 
                        [AssignmentField ENTERPRISE_COST4], 
                        [AssignmentField ENTERPRISE_COST5], 
                        [AssignmentField ENTERPRISE_COST6], 
                        [AssignmentField ENTERPRISE_COST7], 
                        [AssignmentField ENTERPRISE_COST8], 
                        [AssignmentField ENTERPRISE_COST9], 
                        [AssignmentField ENTERPRISE_COST10], 
                        [AssignmentField ENTERPRISE_DATE1], 
                        [AssignmentField ENTERPRISE_DATE2], 
                        [AssignmentField ENTERPRISE_DATE3], 
                        [AssignmentField ENTERPRISE_DATE4], 
                        [AssignmentField ENTERPRISE_DATE5], 
                        [AssignmentField ENTERPRISE_DATE6], 
                        [AssignmentField ENTERPRISE_DATE7], 
                        [AssignmentField ENTERPRISE_DATE8], 
                        [AssignmentField ENTERPRISE_DATE9], 
                        [AssignmentField ENTERPRISE_DATE10], 
                        [AssignmentField ENTERPRISE_DATE11], 
                        [AssignmentField ENTERPRISE_DATE12], 
                        [AssignmentField ENTERPRISE_DATE13], 
                        [AssignmentField ENTERPRISE_DATE14], 
                        [AssignmentField ENTERPRISE_DATE15], 
                        [AssignmentField ENTERPRISE_DATE16], 
                        [AssignmentField ENTERPRISE_DATE17], 
                        [AssignmentField ENTERPRISE_DATE18], 
                        [AssignmentField ENTERPRISE_DATE19], 
                        [AssignmentField ENTERPRISE_DATE20], 
                        [AssignmentField ENTERPRISE_DATE21], 
                        [AssignmentField ENTERPRISE_DATE22], 
                        [AssignmentField ENTERPRISE_DATE23], 
                        [AssignmentField ENTERPRISE_DATE24], 
                        [AssignmentField ENTERPRISE_DATE25], 
                        [AssignmentField ENTERPRISE_DATE26], 
                        [AssignmentField ENTERPRISE_DATE27], 
                        [AssignmentField ENTERPRISE_DATE28], 
                        [AssignmentField ENTERPRISE_DATE29], 
                        [AssignmentField ENTERPRISE_DATE30], 
                        [AssignmentField ENTERPRISE_DURATION1], 
                        [AssignmentField ENTERPRISE_DURATION2], 
                        [AssignmentField ENTERPRISE_DURATION3], 
                        [AssignmentField ENTERPRISE_DURATION4], 
                        [AssignmentField ENTERPRISE_DURATION5], 
                        [AssignmentField ENTERPRISE_DURATION6], 
                        [AssignmentField ENTERPRISE_DURATION7], 
                        [AssignmentField ENTERPRISE_DURATION8], 
                        [AssignmentField ENTERPRISE_DURATION9], 
                        [AssignmentField ENTERPRISE_DURATION10], 
                        [AssignmentField ENTERPRISE_FLAG1], 
                        [AssignmentField ENTERPRISE_FLAG2], 
                        [AssignmentField ENTERPRISE_FLAG3], 
                        [AssignmentField ENTERPRISE_FLAG4], 
                        [AssignmentField ENTERPRISE_FLAG5], 
                        [AssignmentField ENTERPRISE_FLAG6], 
                        [AssignmentField ENTERPRISE_FLAG7], 
                        [AssignmentField ENTERPRISE_FLAG8], 
                        [AssignmentField ENTERPRISE_FLAG9], 
                        [AssignmentField ENTERPRISE_FLAG10], 
                        [AssignmentField ENTERPRISE_FLAG11], 
                        [AssignmentField ENTERPRISE_FLAG12], 
                        [AssignmentField ENTERPRISE_FLAG13], 
                        [AssignmentField ENTERPRISE_FLAG14], 
                        [AssignmentField ENTERPRISE_FLAG15], 
                        [AssignmentField ENTERPRISE_FLAG16], 
                        [AssignmentField ENTERPRISE_FLAG17], 
                        [AssignmentField ENTERPRISE_FLAG18], 
                        [AssignmentField ENTERPRISE_FLAG19], 
                        [AssignmentField ENTERPRISE_FLAG20], 
                        [AssignmentField ENTERPRISE_NUMBER1], 
                        [AssignmentField ENTERPRISE_NUMBER2], 
                        [AssignmentField ENTERPRISE_NUMBER3], 
                        [AssignmentField ENTERPRISE_NUMBER4], 
                        [AssignmentField ENTERPRISE_NUMBER5], 
                        [AssignmentField ENTERPRISE_NUMBER6], 
                        [AssignmentField ENTERPRISE_NUMBER7], 
                        [AssignmentField ENTERPRISE_NUMBER8], 
                        [AssignmentField ENTERPRISE_NUMBER9], 
                        [AssignmentField ENTERPRISE_NUMBER10], 
                        [AssignmentField ENTERPRISE_NUMBER11], 
                        [AssignmentField ENTERPRISE_NUMBER12], 
                        [AssignmentField ENTERPRISE_NUMBER13], 
                        [AssignmentField ENTERPRISE_NUMBER14], 
                        [AssignmentField ENTERPRISE_NUMBER15], 
                        [AssignmentField ENTERPRISE_NUMBER16], 
                        [AssignmentField ENTERPRISE_NUMBER17], 
                        [AssignmentField ENTERPRISE_NUMBER18], 
                        [AssignmentField ENTERPRISE_NUMBER19], 
                        [AssignmentField ENTERPRISE_NUMBER20], 
                        [AssignmentField ENTERPRISE_NUMBER21], 
                        [AssignmentField ENTERPRISE_NUMBER22], 
                        [AssignmentField ENTERPRISE_NUMBER23], 
                        [AssignmentField ENTERPRISE_NUMBER24], 
                        [AssignmentField ENTERPRISE_NUMBER25], 
                        [AssignmentField ENTERPRISE_NUMBER26], 
                        [AssignmentField ENTERPRISE_NUMBER27], 
                        [AssignmentField ENTERPRISE_NUMBER28], 
                        [AssignmentField ENTERPRISE_NUMBER29], 
                        [AssignmentField ENTERPRISE_NUMBER30], 
                        [AssignmentField ENTERPRISE_NUMBER31], 
                        [AssignmentField ENTERPRISE_NUMBER32], 
                        [AssignmentField ENTERPRISE_NUMBER33], 
                        [AssignmentField ENTERPRISE_NUMBER34], 
                        [AssignmentField ENTERPRISE_NUMBER35], 
                        [AssignmentField ENTERPRISE_NUMBER36], 
                        [AssignmentField ENTERPRISE_NUMBER37], 
                        [AssignmentField ENTERPRISE_NUMBER38], 
                        [AssignmentField ENTERPRISE_NUMBER39], 
                        [AssignmentField ENTERPRISE_NUMBER40], 
                        [AssignmentField ENTERPRISE_TEXT1], 
                        [AssignmentField ENTERPRISE_TEXT2], 
                        [AssignmentField ENTERPRISE_TEXT3], 
                        [AssignmentField ENTERPRISE_TEXT4], 
                        [AssignmentField ENTERPRISE_TEXT5], 
                        [AssignmentField ENTERPRISE_TEXT6], 
                        [AssignmentField ENTERPRISE_TEXT7], 
                        [AssignmentField ENTERPRISE_TEXT8], 
                        [AssignmentField ENTERPRISE_TEXT9], 
                        [AssignmentField ENTERPRISE_TEXT10], 
                        [AssignmentField ENTERPRISE_TEXT11], 
                        [AssignmentField ENTERPRISE_TEXT12], 
                        [AssignmentField ENTERPRISE_TEXT13], 
                        [AssignmentField ENTERPRISE_TEXT14], 
                        [AssignmentField ENTERPRISE_TEXT15], 
                        [AssignmentField ENTERPRISE_TEXT16], 
                        [AssignmentField ENTERPRISE_TEXT17], 
                        [AssignmentField ENTERPRISE_TEXT18], 
                        [AssignmentField ENTERPRISE_TEXT19], 
                        [AssignmentField ENTERPRISE_TEXT20], 
                        [AssignmentField ENTERPRISE_TEXT21], 
                        [AssignmentField ENTERPRISE_TEXT22], 
                        [AssignmentField ENTERPRISE_TEXT23], 
                        [AssignmentField ENTERPRISE_TEXT24], 
                        [AssignmentField ENTERPRISE_TEXT25], 
                        [AssignmentField ENTERPRISE_TEXT26], 
                        [AssignmentField ENTERPRISE_TEXT27], 
                        [AssignmentField ENTERPRISE_TEXT28], 
                        [AssignmentField ENTERPRISE_TEXT29], 
                        [AssignmentField ENTERPRISE_TEXT30], 
                        [AssignmentField ENTERPRISE_TEXT31], 
                        [AssignmentField ENTERPRISE_TEXT32], 
                        [AssignmentField ENTERPRISE_TEXT33], 
                        [AssignmentField ENTERPRISE_TEXT34], 
                        [AssignmentField ENTERPRISE_TEXT35], 
                        [AssignmentField ENTERPRISE_TEXT36], 
                        [AssignmentField ENTERPRISE_TEXT37], 
                        [AssignmentField ENTERPRISE_TEXT38], 
                        [AssignmentField ENTERPRISE_TEXT39], 
                        [AssignmentField ENTERPRISE_TEXT40], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE1], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE2], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE3], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE4], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE5], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE6], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE7], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE8], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE9], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE10], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE11], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE12], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE13], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE14], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE15], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE16], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE17], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE18], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE19], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE20], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE21], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE22],  
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE23], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE24], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE25], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE26], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE27], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE28], 
                        [AssignmentField ENTERPRISE_RESOURCE_OUTLINE_CODE29], 
                        [AssignmentField ENTERPRISE_RESOURCE_RBS], 
                        [AssignmentField RESOURCE_REQUEST_TYPE], 
                        [AssignmentField ENTERPRISE_TEAM_MEMBER], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE20], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE21], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE22], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE23], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE24], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE25], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE26], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE27], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE28], 
                        [AssignmentField ENTERPRISE_RESOURCE_MULTI_VALUE29], 
                        [AssignmentField ACTUAL_WORK_PROTECTED], 
                        [AssignmentField ACTUAL_OVERTIME_WORK_PROTECTED], 
                        [AssignmentField CREATED], 
                        [AssignmentField GUID], 
                        [AssignmentField ASSIGNMENT_TASK_GUID], 
                        [AssignmentField ASSIGNMENT_RESOURCE_GUID], 
                        [AssignmentField SUMMARY], 
                        [AssignmentField OWNER], 
                        [AssignmentField BUDGET_WORK], 
                        [AssignmentField BUDGET_COST], 
                        [AssignmentField BASELINE_BUDGET_WORK], 
                        [AssignmentField BASELINE_BUDGET_COST], 
                        [AssignmentField BASELINE1_BUDGET_WORK], 
                        [AssignmentField BASELINE1_BUDGET_COST], 
                        [AssignmentField BASELINE2_BUDGET_WORK], 
                        [AssignmentField BASELINE2_BUDGET_COST], 
                        [AssignmentField BASELINE3_BUDGET_WORK], 
                        [AssignmentField BASELINE3_BUDGET_COST], 
                        [AssignmentField BASELINE4_BUDGET_WORK], 
                        [AssignmentField BASELINE4_BUDGET_COST], 
                        [AssignmentField BASELINE5_BUDGET_WORK], 
                        [AssignmentField BASELINE5_BUDGET_COST], 
                        [AssignmentField BASELINE6_BUDGET_WORK], 
                        [AssignmentField BASELINE6_BUDGET_COST], 
                        [AssignmentField BASELINE7_BUDGET_WORK], 
                        [AssignmentField BASELINE7_BUDGET_COST], 
                        [AssignmentField BASELINE8_BUDGET_WORK], 
                        [AssignmentField BASELINE8_BUDGET_COST], 
                        [AssignmentField BASELINE9_BUDGET_WORK], 
                        [AssignmentField BASELINE9_BUDGET_COST], 
                        [AssignmentField BASELINE10_BUDGET_WORK], 
                        [AssignmentField BASELINE10_BUDGET_COST], 
                        [AssignmentField UNAVAILABLE], 
                        [AssignmentField HYPERLINK_DATA], 
                        [AssignmentField FINISH], nil];
    }
    return _TYPE_VALUES;
}

@end
