//
//  TaskField.m
//  MppViewer
//
//  Created by Fernando Araya on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TaskField.h"
#import "DataType.h"

@implementation TaskField

static TaskField *_START = nil;
static TaskField *_DURATION_UNITS = nil;
static TaskField *_BASELINE_DURATION_UNITS = nil;
static TaskField *_ACTUAL_DURATION_UNITS = nil;
static TaskField *_LEVELING_DELAY_UNITS = nil;
static TaskField *_DURATION1_UNITS = nil;
static TaskField *_DURATION2_UNITS = nil;
static TaskField *_DURATION3_UNITS = nil;
static TaskField *_DURATION4_UNITS = nil;
static TaskField *_DURATION5_UNITS = nil;
static TaskField *_DURATION6_UNITS = nil;
static TaskField *_DURATION7_UNITS = nil;
static TaskField *_DURATION8_UNITS = nil;
static TaskField *_DURATION9_UNITS = nil;
static TaskField *_DURATION10_UNITS = nil;
static TaskField *_WORK = nil;
static TaskField *_BASELINE_WORK = nil;
static TaskField *_ACTUAL_WORK = nil;
static TaskField *_WORK_VARIANCE = nil;
static TaskField *_REMAINING_WORK = nil;
static TaskField *_COST = nil;
static TaskField *_BASELINE_COST = nil;
static TaskField *_ACTUAL_COST = nil;
static TaskField *_FIXED_COST = nil;
static TaskField *_COST_VARIANCE = nil;
static TaskField *_REMAINING_COST = nil;
static TaskField *_BCWP = nil;
static TaskField *_BCWS = nil;
static TaskField *_SV = nil;
static TaskField *_NAME = nil;
static TaskField *_WBS = nil;
static TaskField *_CONSTRAINT_TYPE = nil;
static TaskField *_CONSTRAINT_DATE = nil;
static TaskField *_CRITICAL = nil;
static TaskField *_LEVELING_DELAY = nil;
static TaskField *_FREE_SLACK = nil;
static TaskField *_TOTAL_SLACK = nil;
static TaskField *_ID = nil;
static TaskField *_MILESTONE = nil;
static TaskField *_PRIORITY = nil;
static TaskField *_SUBPROJECT_FILE = nil;
static TaskField *_BASELINE_DURATION = nil;
static TaskField *_ACTUAL_DURATION = nil;
static TaskField *_DURATION = nil;
static TaskField *_DURATION_VARIANCE = nil;
static TaskField *_REMAINING_DURATION = nil;
static TaskField *_PERCENT_COMPLETE = nil;
static TaskField *_PERCENT_WORK_COMPLETE = nil;
static TaskField *_EARLY_START = nil;
static TaskField *_EARLY_FINISH = nil;
static TaskField *_LATE_START = nil;
static TaskField *_LATE_FINISH = nil;
static TaskField *_ACTUAL_START = nil;
static TaskField *_ACTUAL_FINISH = nil;
static TaskField *_BASELINE_START = nil;
static TaskField *_BASELINE_FINISH = nil;
static TaskField *_START_VARIANCE = nil;
static TaskField *_FINISH_VARIANCE = nil;
static TaskField *_PREDECESSORS = nil;
static TaskField *_SUCCESSORS = nil;
static TaskField *_RESOURCE_NAMES = nil;
static TaskField *_RESOURCE_INITIALS = nil;
static TaskField *_TEXT1 = nil;
static TaskField *_START1 = nil;
static TaskField *_FINISH1 = nil;
static TaskField *_TEXT2 = nil;
static TaskField *_START2 = nil;
static TaskField *_FINISH2 = nil;
static TaskField *_TEXT3 = nil;
static TaskField *_START3 = nil;
static TaskField *_FINISH3 = nil;
static TaskField *_TEXT4 = nil;
static TaskField *_START4 = nil;
static TaskField *_FINISH4 = nil;
static TaskField *_TEXT5 = nil;
static TaskField *_START5 = nil;
static TaskField *_FINISH5 = nil;
static TaskField *_TEXT6 = nil;
static TaskField *_TEXT7 = nil;
static TaskField *_TEXT8 = nil;
static TaskField *_TEXT9 = nil;
static TaskField *_TEXT10 = nil;
static TaskField *_MARKED = nil;
static TaskField *_FLAG1 = nil;
static TaskField *_FLAG2 = nil;
static TaskField *_FLAG3 = nil;
static TaskField *_FLAG4 = nil;
static TaskField *_FLAG5 = nil;
static TaskField *_FLAG6 = nil;
static TaskField *_FLAG7 = nil;
static TaskField *_FLAG8 = nil;
static TaskField *_FLAG9 = nil;
static TaskField *_FLAG10 = nil;
static TaskField *_ROLLUP = nil;
static TaskField *_CV = nil;
static TaskField *_PROJECT = nil;
static TaskField *_OUTLINE_LEVEL = nil;
static TaskField *_UNIQUE_ID = nil;
static TaskField *_NUMBER1 = nil;
static TaskField *_NUMBER2 = nil;
static TaskField *_NUMBER3 = nil;
static TaskField *_NUMBER4 = nil;
static TaskField *_NUMBER5 = nil;
static TaskField *_SUMMARY = nil;
static TaskField *_CREATED = nil;
static TaskField *_NOTES = nil;
static TaskField *_UNIQUE_ID_PREDECESSORS = nil;
static TaskField *_UNIQUE_ID_SUCCESSORS = nil;
static TaskField *_OBJECTS = nil;
static TaskField *_LINKED_FIELDS = nil;
static TaskField *_RESUME = nil;
static TaskField *_STOP = nil;
static TaskField *_OUTLINE_NUMBER = nil;
static TaskField *_DURATION1 = nil;
static TaskField *_DURATION2 = nil;
static TaskField *_DURATION3 = nil;
static TaskField *_COST1 = nil;
static TaskField *_COST2 = nil;
static TaskField *_COST3 = nil;
static TaskField *_HIDEBAR = nil;
static TaskField *_CONFIRMED = nil;
static TaskField *_UPDATE_NEEDED = nil;
static TaskField *_CONTACT = nil;
static TaskField *_RESOURCE_GROUP = nil;
static TaskField *_ACWP = nil;
static TaskField *_TYPE = nil;
static TaskField *_RECURRING = nil;
static TaskField *_EFFORT_DRIVEN = nil;
static TaskField *_OVERTIME_WORK = nil;
static TaskField *_ACTUAL_OVERTIME_WORK = nil;
static TaskField *_REMAINING_OVERTIME_WORK = nil;
static TaskField *_REGULAR_WORK = nil;
static TaskField *_OVERTIME_COST = nil;
static TaskField *_ACTUAL_OVERTIME_COST = nil;
static TaskField *_REMAINING_OVERTIME_COST = nil;
static TaskField *_FIXED_COST_ACCRUAL = nil;
static TaskField *_INDICATORS = nil;
static TaskField *_HYPERLINK = nil;
static TaskField *_HYPERLINK_ADDRESS = nil;
static TaskField *_HYPERLINK_SUBADDRESS = nil;
static TaskField *_HYPERLINK_HREF = nil;
static TaskField *_ASSIGNMENT = nil;
static TaskField *_OVERALLOCATED = nil;
static TaskField *_EXTERNAL_TASK = nil;
static TaskField *_SUBPROJECT_READ_ONLY = nil;
static TaskField *_RESPONSE_PENDING = nil;
static TaskField *_TEAMSTATUS_PENDING = nil;
static TaskField *_LEVELING_CAN_SPLIT = nil;
static TaskField *_LEVEL_ASSIGNMENTS = nil;
static TaskField *_WORK_CONTOUR = nil;
static TaskField *_COST4 = nil;
static TaskField *_COST5 = nil;
static TaskField *_COST6 = nil;
static TaskField *_COST7 = nil;
static TaskField *_COST8 = nil;
static TaskField *_COST9 = nil;
static TaskField *_COST10 = nil;
static TaskField *_DATE1 = nil;
static TaskField *_DATE2 = nil;
static TaskField *_DATE3 = nil;
static TaskField *_DATE4 = nil;
static TaskField *_DATE5 = nil;
static TaskField *_DATE6 = nil;
static TaskField *_DATE7 = nil;
static TaskField *_DATE8 = nil;
static TaskField *_DATE9 = nil;
static TaskField *_DATE10 = nil;
static TaskField *_DURATION4 = nil;
static TaskField *_DURATION5 = nil;
static TaskField *_DURATION6 = nil;
static TaskField *_DURATION7 = nil;
static TaskField *_DURATION8 = nil;
static TaskField *_DURATION9 = nil;
static TaskField *_DURATION10 = nil;
static TaskField *_START6 = nil;
static TaskField *_FINISH6 = nil;
static TaskField *_START7 = nil;
static TaskField *_FINISH7 = nil;
static TaskField *_START8 = nil;
static TaskField *_FINISH8 = nil;
static TaskField *_START9 = nil;
static TaskField *_FINISH9 = nil;
static TaskField *_START10 = nil;
static TaskField *_FINISH10 = nil;
static TaskField *_FLAG11 = nil;
static TaskField *_FLAG12 = nil;
static TaskField *_FLAG13 = nil;
static TaskField *_FLAG14 = nil;
static TaskField *_FLAG15 = nil;
static TaskField *_FLAG16 = nil;
static TaskField *_FLAG17 = nil;
static TaskField *_FLAG18 = nil;
static TaskField *_FLAG19 = nil;
static TaskField *_FLAG20 = nil;
static TaskField *_NUMBER6 = nil;
static TaskField *_NUMBER7 = nil;
static TaskField *_NUMBER8 = nil;
static TaskField *_NUMBER9 = nil;
static TaskField *_NUMBER10 = nil;
static TaskField *_NUMBER11 = nil;
static TaskField *_NUMBER12 = nil;
static TaskField *_NUMBER13 = nil;
static TaskField *_NUMBER14 = nil;
static TaskField *_NUMBER15 = nil;
static TaskField *_NUMBER16 = nil;
static TaskField *_NUMBER17 = nil;
static TaskField *_NUMBER18 = nil;
static TaskField *_NUMBER19 = nil;
static TaskField *_NUMBER20 = nil;
static TaskField *_TEXT11 = nil;
static TaskField *_TEXT12 = nil;
static TaskField *_TEXT13 = nil;
static TaskField *_TEXT14 = nil;
static TaskField *_TEXT15 = nil;
static TaskField *_TEXT16 = nil;
static TaskField *_TEXT17 = nil;
static TaskField *_TEXT18 = nil;
static TaskField *_TEXT19 = nil;
static TaskField *_TEXT20 = nil;
static TaskField *_TEXT21 = nil;
static TaskField *_TEXT22 = nil;
static TaskField *_TEXT23 = nil;
static TaskField *_TEXT24 = nil;
static TaskField *_TEXT25 = nil;
static TaskField *_TEXT26 = nil;
static TaskField *_TEXT27 = nil;
static TaskField *_TEXT28 = nil;
static TaskField *_TEXT29 = nil;
static TaskField *_TEXT30 = nil;
static TaskField *_RESOURCE_PHONETICS = nil;
static TaskField *_ASSIGNMENT_DELAY = nil;
static TaskField *_ASSIGNMENT_UNITS = nil;
static TaskField *_COST_RATE_TABLE = nil;
static TaskField *_PRELEVELED_START = nil;
static TaskField *_PRELEVELED_FINISH = nil;
static TaskField *_ESTIMATED = nil;
static TaskField *_IGNORE_RESOURCE_CALENDAR = nil;
static TaskField *_CALENDAR = nil;
static TaskField *_OUTLINE_CODE1 = nil;
static TaskField *_OUTLINE_CODE2 = nil;
static TaskField *_OUTLINE_CODE3 = nil;
static TaskField *_OUTLINE_CODE4 = nil;
static TaskField *_OUTLINE_CODE5 = nil;
static TaskField *_OUTLINE_CODE6 = nil;
static TaskField *_OUTLINE_CODE7 = nil;
static TaskField *_OUTLINE_CODE8 = nil;
static TaskField *_OUTLINE_CODE9 = nil;
static TaskField *_OUTLINE_CODE10 = nil;
static TaskField *_DEADLINE = nil;
static TaskField *_START_SLACK = nil;
static TaskField *_FINISH_SLACK = nil;
static TaskField *_VAC = nil;
static TaskField *_GROUP_BY_SUMMARY = nil;
static TaskField *_WBS_PREDECESSORS = nil;
static TaskField *_WBS_SUCCESSORS = nil;
static TaskField *_RESOURCE_TYPE = nil;
static TaskField *_BASELINE1_DURATION_UNITS = nil;
static TaskField *_BASELINE2_DURATION_UNITS = nil;
static TaskField *_BASELINE3_DURATION_UNITS = nil;
static TaskField *_BASELINE4_DURATION_UNITS = nil;
static TaskField *_BASELINE5_DURATION_UNITS = nil;
static TaskField *_BASELINE6_DURATION_UNITS = nil;
static TaskField *_BASELINE7_DURATION_UNITS = nil;
static TaskField *_BASELINE8_DURATION_UNITS = nil;
static TaskField *_BASELINE9_DURATION_UNITS = nil;
static TaskField *_BASELINE10_DURATION_UNITS = nil;
static TaskField *_BASELINE1_START = nil;
static TaskField *_BASELINE1_FINISH = nil;
static TaskField *_BASELINE1_COST = nil;
static TaskField *_BASELINE1_WORK = nil;
static TaskField *_BASELINE1_DURATION = nil;
static TaskField *_BASELINE2_START = nil;
static TaskField *_BASELINE2_FINISH = nil;
static TaskField *_BASELINE2_COST = nil;
static TaskField *_BASELINE2_WORK = nil;
static TaskField *_BASELINE2_DURATION = nil;
static TaskField *_BASELINE3_START = nil;
static TaskField *_BASELINE3_FINISH = nil;
static TaskField *_BASELINE3_COST = nil;
static TaskField *_BASELINE3_WORK = nil;
static TaskField *_BASELINE3_DURATION = nil;
static TaskField *_BASELINE4_START = nil;
static TaskField *_BASELINE4_FINISH = nil;
static TaskField *_BASELINE4_COST = nil;
static TaskField *_BASELINE4_WORK = nil;
static TaskField *_BASELINE4_DURATION = nil;
static TaskField *_BASELINE5_START = nil;
static TaskField *_BASELINE5_FINISH = nil;
static TaskField *_BASELINE5_COST = nil;
static TaskField *_BASELINE5_WORK = nil;
static TaskField *_BASELINE5_DURATION = nil;
static TaskField *_BASELINE6_START = nil;
static TaskField *_BASELINE6_FINISH = nil;
static TaskField *_BASELINE6_COST = nil;
static TaskField *_BASELINE6_WORK = nil;
static TaskField *_BASELINE6_DURATION = nil;
static TaskField *_BASELINE7_START = nil;
static TaskField *_BASELINE7_FINISH = nil;
static TaskField *_BASELINE7_COST = nil;
static TaskField *_BASELINE7_WORK = nil;
static TaskField *_BASELINE7_DURATION = nil;
static TaskField *_BASELINE8_START = nil;
static TaskField *_BASELINE8_FINISH = nil;
static TaskField *_BASELINE8_COST = nil;
static TaskField *_BASELINE8_WORK = nil;
static TaskField *_BASELINE8_DURATION = nil;
static TaskField *_BASELINE9_START = nil;
static TaskField *_BASELINE9_FINISH = nil;
static TaskField *_BASELINE9_COST = nil;
static TaskField *_BASELINE9_WORK = nil;
static TaskField *_BASELINE9_DURATION = nil;
static TaskField *_BASELINE10_START = nil;
static TaskField *_BASELINE10_FINISH = nil;
static TaskField *_BASELINE10_COST = nil;
static TaskField *_BASELINE10_WORK = nil;
static TaskField *_BASELINE10_DURATION = nil;
static TaskField *_ENTERPRISE_COST1 = nil;
static TaskField *_ENTERPRISE_COST2 = nil;
static TaskField *_ENTERPRISE_COST3 = nil;
static TaskField *_ENTERPRISE_COST4 = nil;
static TaskField *_ENTERPRISE_COST5 = nil;
static TaskField *_ENTERPRISE_COST6 = nil;
static TaskField *_ENTERPRISE_COST7 = nil;
static TaskField *_ENTERPRISE_COST8 = nil;
static TaskField *_ENTERPRISE_COST9 = nil;
static TaskField *_ENTERPRISE_COST10 = nil;
static TaskField *_ENTERPRISE_DATE1 = nil;
static TaskField *_ENTERPRISE_DATE2 = nil;
static TaskField *_ENTERPRISE_DATE3 = nil;
static TaskField *_ENTERPRISE_DATE4 = nil;
static TaskField *_ENTERPRISE_DATE5 = nil;
static TaskField *_ENTERPRISE_DATE6 = nil;
static TaskField *_ENTERPRISE_DATE7 = nil;
static TaskField *_ENTERPRISE_DATE8 = nil;
static TaskField *_ENTERPRISE_DATE9 = nil;
static TaskField *_ENTERPRISE_DATE10 = nil;
static TaskField *_ENTERPRISE_DATE11 = nil;
static TaskField *_ENTERPRISE_DATE12 = nil;
static TaskField *_ENTERPRISE_DATE13 = nil;
static TaskField *_ENTERPRISE_DATE14 = nil;
static TaskField *_ENTERPRISE_DATE15 = nil;
static TaskField *_ENTERPRISE_DATE16 = nil;
static TaskField *_ENTERPRISE_DATE17 = nil;
static TaskField *_ENTERPRISE_DATE18 = nil;
static TaskField *_ENTERPRISE_DATE19 = nil;
static TaskField *_ENTERPRISE_DATE20 = nil;
static TaskField *_ENTERPRISE_DATE21 = nil;
static TaskField *_ENTERPRISE_DATE22 = nil;
static TaskField *_ENTERPRISE_DATE23 = nil;
static TaskField *_ENTERPRISE_DATE24 = nil;
static TaskField *_ENTERPRISE_DATE25 = nil;
static TaskField *_ENTERPRISE_DATE26 = nil;
static TaskField *_ENTERPRISE_DATE27 = nil;
static TaskField *_ENTERPRISE_DATE28 = nil;
static TaskField *_ENTERPRISE_DATE29 = nil;
static TaskField *_ENTERPRISE_DATE30 = nil;
static TaskField *_ENTERPRISE_DURATION1_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION2_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION3_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION4_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION5_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION6_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION7_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION8_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION9_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION10_UNITS = nil;
static TaskField *_ENTERPRISE_DURATION1 = nil;
static TaskField *_ENTERPRISE_DURATION2 = nil;
static TaskField *_ENTERPRISE_DURATION3 = nil;
static TaskField *_ENTERPRISE_DURATION4 = nil;
static TaskField *_ENTERPRISE_DURATION5 = nil;
static TaskField *_ENTERPRISE_DURATION6 = nil;
static TaskField *_ENTERPRISE_DURATION7 = nil;
static TaskField *_ENTERPRISE_DURATION8 = nil;
static TaskField *_ENTERPRISE_DURATION9 = nil;
static TaskField *_ENTERPRISE_DURATION10 = nil;
static TaskField *_ENTERPRISE_FLAG1 = nil;
static TaskField *_ENTERPRISE_FLAG2 = nil;
static TaskField *_ENTERPRISE_FLAG3 = nil;
static TaskField *_ENTERPRISE_FLAG4 = nil;
static TaskField *_ENTERPRISE_FLAG5 = nil;
static TaskField *_ENTERPRISE_FLAG6 = nil;
static TaskField *_ENTERPRISE_FLAG7 = nil;
static TaskField *_ENTERPRISE_FLAG8 = nil;
static TaskField *_ENTERPRISE_FLAG9 = nil;
static TaskField *_ENTERPRISE_FLAG10 = nil;
static TaskField *_ENTERPRISE_FLAG11 = nil;
static TaskField *_ENTERPRISE_FLAG12 = nil;
static TaskField *_ENTERPRISE_FLAG13 = nil;
static TaskField *_ENTERPRISE_FLAG14 = nil;
static TaskField *_ENTERPRISE_FLAG15 = nil;
static TaskField *_ENTERPRISE_FLAG16 = nil;
static TaskField *_ENTERPRISE_FLAG17 = nil;
static TaskField *_ENTERPRISE_FLAG18 = nil;
static TaskField *_ENTERPRISE_FLAG19 = nil;
static TaskField *_ENTERPRISE_FLAG20 = nil;
static TaskField *_ENTERPRISE_NUMBER1 = nil;
static TaskField *_ENTERPRISE_NUMBER2 = nil;
static TaskField *_ENTERPRISE_NUMBER3 = nil;
static TaskField *_ENTERPRISE_NUMBER4 = nil;
static TaskField *_ENTERPRISE_NUMBER5 = nil;
static TaskField *_ENTERPRISE_NUMBER6 = nil;
static TaskField *_ENTERPRISE_NUMBER7 = nil;
static TaskField *_ENTERPRISE_NUMBER8 = nil;
static TaskField *_ENTERPRISE_NUMBER9 = nil;
static TaskField *_ENTERPRISE_NUMBER10 = nil;
static TaskField *_ENTERPRISE_NUMBER11 = nil;
static TaskField *_ENTERPRISE_NUMBER12 = nil;
static TaskField *_ENTERPRISE_NUMBER13 = nil;
static TaskField *_ENTERPRISE_NUMBER14 = nil;
static TaskField *_ENTERPRISE_NUMBER15 = nil;
static TaskField *_ENTERPRISE_NUMBER16 = nil;
static TaskField *_ENTERPRISE_NUMBER17 = nil;
static TaskField *_ENTERPRISE_NUMBER18 = nil;
static TaskField *_ENTERPRISE_NUMBER19 = nil;
static TaskField *_ENTERPRISE_NUMBER20 = nil;
static TaskField *_ENTERPRISE_NUMBER21 = nil;
static TaskField *_ENTERPRISE_NUMBER22 = nil;
static TaskField *_ENTERPRISE_NUMBER23 = nil;
static TaskField *_ENTERPRISE_NUMBER24 = nil;
static TaskField *_ENTERPRISE_NUMBER25 = nil;
static TaskField *_ENTERPRISE_NUMBER26 = nil;
static TaskField *_ENTERPRISE_NUMBER27 = nil;
static TaskField *_ENTERPRISE_NUMBER28 = nil;
static TaskField *_ENTERPRISE_NUMBER29 = nil;
static TaskField *_ENTERPRISE_NUMBER30 = nil;
static TaskField *_ENTERPRISE_NUMBER31 = nil;
static TaskField *_ENTERPRISE_NUMBER32 = nil;
static TaskField *_ENTERPRISE_NUMBER33 = nil;
static TaskField *_ENTERPRISE_NUMBER34 = nil;
static TaskField *_ENTERPRISE_NUMBER35 = nil;
static TaskField *_ENTERPRISE_NUMBER36 = nil;
static TaskField *_ENTERPRISE_NUMBER37 = nil;
static TaskField *_ENTERPRISE_NUMBER38 = nil;
static TaskField *_ENTERPRISE_NUMBER39 = nil;
static TaskField *_ENTERPRISE_NUMBER40 = nil;
static TaskField *_ENTERPRISE_TEXT1 = nil;
static TaskField *_ENTERPRISE_TEXT2 = nil;
static TaskField *_ENTERPRISE_TEXT3 = nil;
static TaskField *_ENTERPRISE_TEXT4 = nil;
static TaskField *_ENTERPRISE_TEXT5 = nil;
static TaskField *_ENTERPRISE_TEXT6 = nil;
static TaskField *_ENTERPRISE_TEXT7 = nil;
static TaskField *_ENTERPRISE_TEXT8 = nil;
static TaskField *_ENTERPRISE_TEXT9 = nil;
static TaskField *_ENTERPRISE_TEXT10 = nil;
static TaskField *_ENTERPRISE_TEXT11 = nil;
static TaskField *_ENTERPRISE_TEXT12 = nil;
static TaskField *_ENTERPRISE_TEXT13 = nil;
static TaskField *_ENTERPRISE_TEXT14 = nil;
static TaskField *_ENTERPRISE_TEXT15 = nil;
static TaskField *_ENTERPRISE_TEXT16 = nil;
static TaskField *_ENTERPRISE_TEXT17 = nil;
static TaskField *_ENTERPRISE_TEXT18 = nil;
static TaskField *_ENTERPRISE_TEXT19 = nil;
static TaskField *_ENTERPRISE_TEXT20 = nil;
static TaskField *_ENTERPRISE_TEXT21 = nil;
static TaskField *_ENTERPRISE_TEXT22 = nil;
static TaskField *_ENTERPRISE_TEXT23 = nil;
static TaskField *_ENTERPRISE_TEXT24 = nil;
static TaskField *_ENTERPRISE_TEXT25 = nil;
static TaskField *_ENTERPRISE_TEXT26 = nil;
static TaskField *_ENTERPRISE_TEXT27 = nil;
static TaskField *_ENTERPRISE_TEXT28 = nil;
static TaskField *_ENTERPRISE_TEXT29 = nil;
static TaskField *_ENTERPRISE_TEXT30 = nil;
static TaskField *_ENTERPRISE_TEXT31 = nil;
static TaskField *_ENTERPRISE_TEXT32 = nil;
static TaskField *_ENTERPRISE_TEXT33 = nil;
static TaskField *_ENTERPRISE_TEXT34 = nil;
static TaskField *_ENTERPRISE_TEXT35 = nil;
static TaskField *_ENTERPRISE_TEXT36 = nil;
static TaskField *_ENTERPRISE_TEXT37 = nil;
static TaskField *_ENTERPRISE_TEXT38 = nil;
static TaskField *_ENTERPRISE_TEXT39 = nil;
static TaskField *_ENTERPRISE_TEXT40 = nil;
static TaskField *_COMPLETE_THROUGH = nil;
static TaskField *_SUMMARY_PROGRESS = nil;
static TaskField *_GUID = nil;
static TaskField *_ACTIVE = nil; 
static TaskField *_TASK_MODE = nil;
static TaskField *_ASSIGNMENT_OWNER = nil;
static TaskField *_BASELINE_BUDGET_COST = nil;
static TaskField *_BASELINE_BUDGET_WORK = nil;
static TaskField *_BASELINE_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE_DELIVERABLE_START = nil;
static TaskField *_BASELINE_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE_ESTIMATED_START = nil;
static TaskField *_BASELINE_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE_FIXED_COST = nil;
static TaskField *_BASELINE_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE1_ESTIMATED_START = nil;
static TaskField *_BASELINE1_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE1_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE1_FIXED_COST = nil;
static TaskField *_BASELINE1_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE1_BUDGET_COST = nil;
static TaskField *_BASELINE1_BUDGET_WORK = nil;
static TaskField *_BASELINE1_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE1_DELIVERABLE_START = nil;
static TaskField *_BASELINE2_ESTIMATED_START = nil;
static TaskField *_BASELINE2_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE2_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE2_FIXED_COST = nil;
static TaskField *_BASELINE2_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE2_BUDGET_COST = nil;
static TaskField *_BASELINE2_BUDGET_WORK = nil;
static TaskField *_BASELINE2_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE2_DELIVERABLE_START = nil;
static TaskField *_BASELINE3_ESTIMATED_START = nil;
static TaskField *_BASELINE3_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE3_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE3_FIXED_COST = nil;
static TaskField *_BASELINE3_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE3_BUDGET_COST = nil;
static TaskField *_BASELINE3_BUDGET_WORK = nil;
static TaskField *_BASELINE3_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE3_DELIVERABLE_START = nil;
static TaskField *_BASELINE4_ESTIMATED_START = nil;
static TaskField *_BASELINE4_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE4_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE4_FIXED_COST = nil;
static TaskField *_BASELINE4_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE4_BUDGET_COST = nil;
static TaskField *_BASELINE4_BUDGET_WORK = nil;
static TaskField *_BASELINE4_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE4_DELIVERABLE_START = nil;
static TaskField *_BASELINE5_ESTIMATED_START = nil;
static TaskField *_BASELINE5_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE5_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE5_FIXED_COST = nil;
static TaskField *_BASELINE5_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE5_BUDGET_COST = nil;
static TaskField *_BASELINE5_BUDGET_WORK = nil;
static TaskField *_BASELINE5_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE5_DELIVERABLE_START = nil;
static TaskField *_BASELINE6_ESTIMATED_START = nil;
static TaskField *_BASELINE6_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE6_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE6_FIXED_COST = nil;
static TaskField *_BASELINE6_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE6_BUDGET_COST = nil;
static TaskField *_BASELINE6_BUDGET_WORK = nil;
static TaskField *_BASELINE6_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE6_DELIVERABLE_START = nil;
static TaskField *_BASELINE7_ESTIMATED_START = nil;
static TaskField *_BASELINE7_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE7_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE7_FIXED_COST = nil;
static TaskField *_BASELINE7_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE7_BUDGET_COST = nil;
static TaskField *_BASELINE7_BUDGET_WORK = nil;
static TaskField *_BASELINE7_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE7_DELIVERABLE_START = nil;
static TaskField *_BASELINE8_ESTIMATED_START = nil;
static TaskField *_BASELINE8_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE8_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE8_FIXED_COST = nil;
static TaskField *_BASELINE8_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE8_BUDGET_COST = nil;
static TaskField *_BASELINE8_BUDGET_WORK = nil;
static TaskField *_BASELINE8_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE8_DELIVERABLE_START = nil;
static TaskField *_BASELINE9_ESTIMATED_START = nil;
static TaskField *_BASELINE9_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE9_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE9_FIXED_COST = nil;
static TaskField *_BASELINE9_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE9_BUDGET_COST = nil;
static TaskField *_BASELINE9_BUDGET_WORK = nil;
static TaskField *_BASELINE9_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE9_DELIVERABLE_START = nil;
static TaskField *_BASELINE10_ESTIMATED_START = nil;
static TaskField *_BASELINE10_ESTIMATED_FINISH = nil;
static TaskField *_BASELINE10_ESTIMATED_DURATION = nil;
static TaskField *_BASELINE10_FIXED_COST = nil;
static TaskField *_BASELINE10_FIXED_COST_ACCRUAL = nil;
static TaskField *_BASELINE10_BUDGET_COST = nil;
static TaskField *_BASELINE10_BUDGET_WORK = nil;
static TaskField *_BASELINE10_DELIVERABLE_FINISH = nil;
static TaskField *_BASELINE10_DELIVERABLE_START = nil;
static TaskField *_CPI = nil;
static TaskField *_CVPERCENT = nil;
static TaskField *_DELIVERABLE_FINISH = nil;
static TaskField *_DELIVERABLE_GUID = nil;
static TaskField *_DELIVERABLE_NAME = nil;
static TaskField *_DELIVERABLE_START = nil;
static TaskField *_DELIVERABLE_TYPE = nil;
static TaskField *_EAC = nil;
static TaskField *_EARNED_VALUE_METHOD = nil;
static TaskField *_ERROR_MESSAGE = nil;
static TaskField *_HIDE_BAR = nil;
static TaskField *_IGNORE_WARNINGS = nil;
static TaskField *_PEAK = nil;
static TaskField *_PHYSICAL_PERCENT_COMPLETE = nil;
static TaskField *_PLACEHOLDER = nil;
static TaskField *_PUBLISH = nil;
static TaskField *_REQUEST_DEMAND = nil;
static TaskField *_SCHEDULED_DURATION = nil;
static TaskField *_SCHEDULED_FINISH = nil;
static TaskField *_SCHEDULED_START = nil;
static TaskField *_SPI = nil;
static TaskField *_STATUS = nil;
static TaskField *_STATUS_INDICATOR = nil;
static TaskField *_STATUS_MANAGER = nil;
static TaskField *_SVPERCENT = nil;
static TaskField *_TASK_CALENDAR = nil;
static TaskField *_TASK_CALENDAR_GUID = nil;
static TaskField *_TCPI = nil;
static TaskField *_WARNING = nil;
static TaskField *_UNAVAILABLE = nil;
static TaskField *_START_TEXT = nil;
static TaskField *_FINISH_TEXT = nil;
static TaskField *_DURATION_TEXT = nil;
static TaskField *_MANUAL_DURATION_UNITS = nil;
static TaskField *_MANUAL_DURATION = nil;
static TaskField *_SUBPROJECT_TASKS_UNIQUEID_OFFSET = nil;
static TaskField *_SUBPROJECT_UNIQUE_TASK_ID = nil;
static TaskField *_SUBPROJECT_TASK_ID = nil;
static TaskField *_HYPERLINK_DATA = nil;
static TaskField *_RECURRING_DATA = nil;
static TaskField *_OUTLINE_CODE1_INDEX = nil;
static TaskField *_OUTLINE_CODE2_INDEX = nil;
static TaskField *_OUTLINE_CODE3_INDEX = nil;
static TaskField *_OUTLINE_CODE4_INDEX = nil;
static TaskField *_OUTLINE_CODE5_INDEX = nil;
static TaskField *_OUTLINE_CODE6_INDEX = nil;
static TaskField *_OUTLINE_CODE7_INDEX = nil;
static TaskField *_OUTLINE_CODE8_INDEX = nil;
static TaskField *_OUTLINE_CODE9_INDEX = nil;
static TaskField *_OUTLINE_CODE10_INDEX = nil;
static TaskField *_ENTERPRISE_DATA = nil;
static TaskField *_PARENT_TASK_UNIQUE_ID = nil;
static TaskField *_CALENDAR_UNIQUE_ID = nil;
static TaskField *_FIXED_DURATION = nil;
static TaskField *_RESUME_NO_EARLIER_THAN = nil;
static TaskField *_PARENT_TASK = nil;
static TaskField *_INDEX = nil;
static TaskField *_DURATION1_ESTIMATED = nil;
static TaskField *_DURATION2_ESTIMATED = nil;
static TaskField *_DURATION3_ESTIMATED = nil;
static TaskField *_DURATION4_ESTIMATED = nil;
static TaskField *_DURATION5_ESTIMATED = nil;
static TaskField *_DURATION6_ESTIMATED = nil;
static TaskField *_DURATION7_ESTIMATED = nil;
static TaskField *_DURATION8_ESTIMATED = nil;
static TaskField *_DURATION9_ESTIMATED = nil;
static TaskField *_DURATION10_ESTIMATED = nil;
static TaskField *_BASELINE_DURATION_ESTIMATED = nil;
static TaskField *_HYPERLINK_SCREEN_TIP = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE1 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE2 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE3 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE4 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE5 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE6 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE7 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE8 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE9 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE10 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE11 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE12 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE13 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE14 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE15 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE16 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE17 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE18 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE19 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE20 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE21 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE22 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE23 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE24 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE25 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE26 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE27 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE28 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE29 = nil;
static TaskField *_ENTERPRISE_OUTLINE_CODE30 = nil;
static TaskField *_BASELINE1_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE2_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE3_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE4_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE5_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE6_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE7_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE8_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE9_DURATION_ESTIMATED = nil;
static TaskField *_BASELINE10_DURATION_ESTIMATED = nil;
static TaskField *_ENTERPRISE_PROJECT_COST1 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST2 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST3 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST4 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST5 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST6 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST7 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST8 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST9 = nil;
static TaskField *_ENTERPRISE_PROJECT_COST10 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE1 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE2 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE3 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE4 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE5 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE6 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE7 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE8 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE9 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE10 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE11 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE12 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE13 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE14 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE15 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE16 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE17 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE18 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE19 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE20 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE21 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE22 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE23 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE24 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE25 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE26 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE27 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE28 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE29 = nil;
static TaskField *_ENTERPRISE_PROJECT_DATE30 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION1 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION2 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION3 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION4 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION5 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION6 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION7 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION8 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION9 = nil;
static TaskField *_ENTERPRISE_PROJECT_DURATION10 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE1 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE2 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE3 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE4 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE5 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE6 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE7 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE8 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE9 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE10 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE11 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE12 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE13 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE14 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE15 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE16 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE17 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE18 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE19 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE20 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE21 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE22 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE23 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE24 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE25 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE26 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE27 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE28 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE29 = nil;
static TaskField *_ENTERPRISE_PROJECT_OUTLINE_CODE30 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG1 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG2 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG3 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG4 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG5 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG6 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG7 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG8 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG9 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG10 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG11 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG12 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG13 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG14 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG15 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG16 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG17 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG18 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG19 = nil;
static TaskField *_ENTERPRISE_PROJECT_FLAG20 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER1 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER2 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER3 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER4 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER5 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER6 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER7 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER8 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER9 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER10 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER11 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER12 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER13 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER14 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER15 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER16 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER17 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER18 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER19 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER20 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER21 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER22 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER23 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER24 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER25 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER26 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER27 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER28 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER29 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER30 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER31 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER32 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER33 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER34 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER35 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER36 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER37 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER38 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER39 = nil;
static TaskField *_ENTERPRISE_PROJECT_NUMBER40 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT1 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT2 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT3 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT4 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT5 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT6 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT7 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT8 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT9 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT10 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT11 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT12 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT13 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT14 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT15 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT16 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT17 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT18 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT19 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT20 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT21 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT22 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT23 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT24 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT25 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT26 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT27 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT28 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT29 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT30 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT31 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT32 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT33 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT34 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT35 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT36 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT37 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT38 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT39 = nil;
static TaskField *_ENTERPRISE_PROJECT_TEXT40 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE1 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE2 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE3 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE4 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE5 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE6 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE7 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE8 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE9 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE10 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE11 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE12 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE13 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE14 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE15 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE16 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE17 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE18 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE19 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE20 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE21 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE22 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE23 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE24 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE25 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE26 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE27 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE28 = nil;
static TaskField *_RESOURCE_ENTERPRISE_OUTLINE_CODE29 = nil;
static TaskField *_RESOURCE_ENTERPRISE_RBS = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE20 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE21 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE22 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE23 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE24 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE25 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE26 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE27 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE28 = nil;
static TaskField *_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE29 = nil;
static TaskField *_ACTUAL_WORK_PROTECTED = nil;
static TaskField *_ACTUAL_OVERTIME_WORK_PROTECTED = nil;
static TaskField *_BUDGET_WORK = nil;
static TaskField *_BUDGET_COST = nil;
static TaskField *_RECALC_OUTLINE_CODES = nil;
static TaskField *_IS_START_VALID = nil;
static TaskField *_IS_FINISH_VALID = nil;
static TaskField *_IS_DURATION_VALID = nil;
static TaskField *_FINISH = nil;
static NSMutableArray *_TYPE_VALUES = nil;

/**
 * Constructor.
 * 
 * @param dataType field data type
 * @param unitsType field units type
 */

-(id)init:(DataType *) dataType withUnitsType:(FieldType *) unitsType
{
    self = [super init];
    if (self)
    {
        _dataType = dataType;
        _unitsType = unitsType;
    }
    
    return self;
}

/**
 * Constructor.
 * 
 * @param dataType field data type
 */

-(id)init:(DataType *) dataType 
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
    #warning Incomplete
    NSString * test = nil;
    return test;
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

-(DataType *) getDataType
{
    return _dataType;
}

/**
 * {@inheritDoc}
 */

-(FieldType *) getUnitsType
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
    return ([self getName]);
}

/**
 * This method takes the integer enumeration of a task field
 * and returns an appropriate class instance.
 *
 * @param type integer task field enumeration
 * @return TaskField instance
 */

+(TaskField *)getInstance:(int) type
{
#warning Incomplete
    TaskField * test = nil;
    return test;
}


+(TaskField *)START 
{
    if (_START == nil)
    {
        _START = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }    
    return _START;
}

+(TaskField *)DURATION_UNITS
{
    if (_DURATION_UNITS == nil)
    {
        _DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }    
    return _DURATION_UNITS;
}

+(TaskField *)BASELINE_DURATION_UNITS
{
    if (_BASELINE_DURATION_UNITS == nil)
    {
        _BASELINE_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }    
    return _BASELINE_DURATION_UNITS;
}

+(TaskField *)ACTUAL_DURATION_UNITS
{
    if (_ACTUAL_DURATION_UNITS == nil)
    {
        _ACTUAL_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ACTUAL_DURATION_UNITS;
}

+(TaskField *)LEVELING_DELAY_UNITS
{
    if (_LEVELING_DELAY_UNITS == nil)
    {
        _LEVELING_DELAY_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _LEVELING_DELAY_UNITS;
}

+(TaskField *)DURATION1_UNITS
{
    if (_DURATION1_UNITS == nil)
    {
        _DURATION1_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }    
    return _DURATION1_UNITS;
}

+(TaskField *)DURATION2_UNITS
{
    if (_DURATION2_UNITS == nil)
    {
        _DURATION2_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION2_UNITS;
}

+(TaskField *)DURATION3_UNITS
{
    if (_DURATION3_UNITS == nil)
    {
        _DURATION3_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION3_UNITS;
}

+(TaskField *)DURATION4_UNITS
{
    if (_DURATION4_UNITS == nil)
    {
        _DURATION4_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION4_UNITS;
}

+(TaskField *)DURATION5_UNITS
{
    if (_DURATION5_UNITS == nil)
    {
        _DURATION5_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }    
    return _DURATION5_UNITS;
}

+(TaskField *)DURATION6_UNITS
{
    if (_DURATION6_UNITS == nil)
    {
        _DURATION6_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION6_UNITS;
}

+(TaskField *)DURATION7_UNITS
{
    if (_DURATION7_UNITS == nil)
    {
        _DURATION7_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION7_UNITS;
}

+(TaskField *)DURATION8_UNITS
{
    if (_DURATION8_UNITS == nil)
    {
        _DURATION8_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION8_UNITS;
}

+(TaskField *)DURATION9_UNITS
{
    if (_DURATION9_UNITS == nil)
    {
        _DURATION9_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION9_UNITS;
}

+(TaskField *)DURATION10_UNITS
{
    if (_DURATION10_UNITS == nil)
    {
        _DURATION10_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _DURATION10_UNITS;
}

+(TaskField *)WORK
{
    if (_WORK == nil)
    {
        _WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _WORK;
}

+(TaskField *)BASELINE_WORK
{
    if (_BASELINE_WORK == nil)
    {
        _BASELINE_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE_WORK;
}

+(TaskField *)ACTUAL_WORK
{
    if (_ACTUAL_WORK == nil)
    {
        _ACTUAL_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_WORK;
}

+(TaskField *)WORK_VARIANCE
{
    if (_WORK_VARIANCE == nil)
    {
        _WORK_VARIANCE = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _WORK_VARIANCE;
}

+(TaskField *)REMAINING_WORK
{
    if (_REMAINING_WORK == nil)
    {
        _REMAINING_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _REMAINING_WORK;
}

+(TaskField *)COST
{
    if (_COST == nil)
    {
        _COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _COST;
}

+(TaskField *)BASELINE_COST
{
    if (_BASELINE_COST == nil)
    {
        _BASELINE_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE_COST;
}

+(TaskField *)ACTUAL_COST
{
    if (_ACTUAL_COST == nil)
    {
        _ACTUAL_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ACTUAL_COST;
}

+(TaskField *)FIXED_COST
{
    if (_FIXED_COST == nil)
    {
        _FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _FIXED_COST;
}

+(TaskField *)COST_VARIANCE
{
    if (_COST_VARIANCE == nil)
    {
        _COST_VARIANCE = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _COST_VARIANCE;
}

+(TaskField *)REMAINING_COST
{
    if (_REMAINING_COST == nil)
    {
        _REMAINING_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _REMAINING_COST;
}

+(TaskField *)BCWP
{
    if (_BCWP == nil)
    {
        _BCWP = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BCWP;
}

+(TaskField *)BCWS
{
    if (_BCWS == nil)
    {
        _BCWS = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BCWS;
}

+(TaskField *)SV
{
    if (_SV == nil)
    {
        _SV = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _SV;
}

+(TaskField *)NAME
{
    if (_NAME == nil)
    {
        _NAME = [[TaskField alloc]init:[DataType STRING]];
    }    
    return _NAME;
}

+(TaskField *)WBS
{
    if (_WBS == nil)
    {
        _WBS = [[TaskField alloc]init:[DataType STRING]];
    }    
    return _WBS;
}

+(TaskField *)CONSTRAINT_TYPE
{
    if (_CONSTRAINT_TYPE == nil)
    {
        _CONSTRAINT_TYPE = [[TaskField alloc]init:[DataType CONSTRAINT]];
    }    
    return _CONSTRAINT_TYPE;
}

+(TaskField *)CONSTRAINT_DATE
{
    if (_CONSTRAINT_DATE == nil)
    {
        _CONSTRAINT_DATE = [[TaskField alloc]init:[DataType CONSTRAINT]];
    }
    return _CONSTRAINT_DATE;
}

+(TaskField *)CRITICAL
{
    if (_CRITICAL == nil)
    {
        _CRITICAL = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _CRITICAL;
}

+(TaskField *)LEVELING_DELAY
{
    if (_LEVELING_DELAY == nil)
    {
        _LEVELING_DELAY = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField LEVELING_DELAY_UNITS]];
    }
    return _LEVELING_DELAY;
}

+(TaskField *)FREE_SLACK
{
    if (_FREE_SLACK == nil)
    {
        _FREE_SLACK = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ACTUAL_DURATION_UNITS]];
    }
    return _FREE_SLACK;
}

+(TaskField *)TOTAL_SLACK
{
    if (_TOTAL_SLACK == nil)
    {
        _TOTAL_SLACK = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _TOTAL_SLACK;
}

+(TaskField *)ID
{
    if (_ID == nil)
    {
        _ID = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _ID;
}

+(TaskField *)MILESTONE
{
    if (_MILESTONE == nil)
    {
        _MILESTONE = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _MILESTONE;
}

+(TaskField *)PRIORITY
{
    if (_PRIORITY == nil)
    {
        _PRIORITY = [[TaskField alloc]init:[DataType PRIORITY]];
    }
    return _PRIORITY;
}

+(TaskField *)SUBPROJECT_FILE
{
    if (_SUBPROJECT_FILE == nil)
    {
        _SUBPROJECT_FILE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _SUBPROJECT_FILE;
}

+(TaskField *)BASELINE_DURATION
{
    if (_BASELINE_DURATION == nil)
    {
        _BASELINE_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE_DURATION_UNITS]];
    }
    return _BASELINE_DURATION;
}

+(TaskField *)ACTUAL_DURATION
{
    if (_ACTUAL_DURATION == nil)
    {
        _ACTUAL_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ACTUAL_DURATION_UNITS]];
    }
    return _ACTUAL_DURATION;
}

+(TaskField *)DURATION
{
    if (_DURATION == nil)
    {
        _DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ACTUAL_DURATION_UNITS]];
    }
    return _DURATION;
}

+(TaskField *)DURATION_VARIANCE
{
    if (_DURATION_VARIANCE == nil)
    {
        _DURATION_VARIANCE = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _DURATION_VARIANCE;
}

+(TaskField *)REMAINING_DURATION
{
    if (_REMAINING_DURATION == nil)
    {
        _REMAINING_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ACTUAL_DURATION_UNITS]];
    }
    return _REMAINING_DURATION;
}

+(TaskField *)PERCENT_COMPLETE
{
    if (_PERCENT_COMPLETE == nil)
    {
        _PERCENT_COMPLETE = [[TaskField alloc]init:[DataType PERCENTAGE]];
    }
    return _PERCENT_COMPLETE;
}

+(TaskField *)PERCENT_WORK_COMPLETE
{
    if (_PERCENT_WORK_COMPLETE == nil)
    {
        _PERCENT_WORK_COMPLETE = [[TaskField alloc]init:[DataType PERCENTAGE]];
    }
    return _PERCENT_WORK_COMPLETE;
}

+(TaskField *)EARLY_START
{
    if (_EARLY_START == nil)
    {
        _EARLY_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _EARLY_START;
}

+(TaskField *)EARLY_FINISH
{
    if (_EARLY_FINISH == nil)
    {
        _EARLY_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _EARLY_FINISH;
}

+(TaskField *)LATE_START
{
    if (_LATE_START == nil)
    {
        _LATE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _LATE_START;
}

+(TaskField *)LATE_FINISH
{
    if (_LATE_FINISH == nil)
    {
        _LATE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _LATE_FINISH;
}

+(TaskField *)ACTUAL_START
{
    if (_ACTUAL_START == nil)
    {
        _ACTUAL_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ACTUAL_START;
}

+(TaskField *)ACTUAL_FINISH
{
    if (_ACTUAL_FINISH == nil)
    {
        _ACTUAL_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ACTUAL_FINISH;
}

+(TaskField *)BASELINE_START
{
    if (_BASELINE_START == nil)
    {
        _BASELINE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE_START;
}

+(TaskField *)BASELINE_FINISH
{
    if (_BASELINE_FINISH == nil)
    {
        _BASELINE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE_FINISH;
}

+(TaskField *)START_VARIANCE
{
    if (_START_VARIANCE == nil)
    {
        _START_VARIANCE = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _START_VARIANCE;
}

+(TaskField *)FINISH_VARIANCE
{
    if (_FINISH_VARIANCE == nil)
    {
        _FINISH_VARIANCE = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _FINISH_VARIANCE;
}

+(TaskField *)PREDECESSORS
{
    if (_PREDECESSORS == nil)
    {
        _PREDECESSORS = [[TaskField alloc]init:[DataType RELATION_LIST]];
    }
    return _PREDECESSORS;
}

+(TaskField *)SUCCESSORS
{
    if (_SUCCESSORS == nil)
    {
        _SUCCESSORS = [[TaskField alloc]init:[DataType RELATION_LIST]];
    }
    return _SUCCESSORS;
}

+(TaskField *)RESOURCE_NAMES
{
    if (_RESOURCE_NAMES == nil)
    {
        _RESOURCE_NAMES = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_NAMES;
}

+(TaskField *)RESOURCE_INITIALS
{
    if (_RESOURCE_INITIALS == nil)
    {
        _RESOURCE_INITIALS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_INITIALS;
}

+(TaskField *)TEXT1
{
    if (_TEXT1 == nil)
    {
        _TEXT1 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT1;
}

+(TaskField *)START1
{
    if (_START1 == nil)
    {
        _START1 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START1;
}

+(TaskField *)FINISH1
{
    if (_FINISH1 == nil)
    {
        _FINISH1 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH1;
}

+(TaskField *)TEXT2
{
    if (_TEXT2 == nil)
    {
        _TEXT2 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT2;
}

+(TaskField *)START2
{
    if (_START2 == nil)
    {
        _START2 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START2;
}

+(TaskField *)FINISH2
{
    if (_FINISH2 == nil)
    {
        _FINISH2 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH2;
}

+(TaskField *)TEXT3
{
    if (_TEXT3 == nil)
    {
        _TEXT3 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT3;
}

+(TaskField *)START3
{
    if (_START3 == nil)
    {
        _START3 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START3;
}

+(TaskField *)FINISH3
{
    if (_FINISH3 == nil)
    {
        _FINISH3 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH3;
}

+(TaskField *)TEXT4
{
    if (_TEXT4 == nil)
    {
        _TEXT4 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT4;
}

+(TaskField *)START4
{
    if (_START4 == nil)
    {
        _START4 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START4;
}

+(TaskField *)FINISH4
{
    if (_FINISH4 == nil)
    {
        _FINISH4 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH4;
}

+(TaskField *)TEXT5
{
    if (_TEXT5 == nil)
    {
        _TEXT5 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT5;
}

+(TaskField *)START5
{
    if (_START5 == nil)
    {
        _START5 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START5;
}

+(TaskField *)FINISH5
{
    if (_FINISH5 == nil)
    {
        _FINISH5 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH5;
}

+(TaskField *)TEXT6
{
    if (_TEXT6 == nil)
    {
        _TEXT6 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT6;
}

+(TaskField *)TEXT7
{
    if (_TEXT7 == nil)
    {
        _TEXT7 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT7;
}

+(TaskField *)TEXT8
{
    if (_TEXT8 == nil)
    {
        _TEXT8 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT8;
}

+(TaskField *)TEXT9
{
    if (_TEXT9 == nil)
    {
        _TEXT9 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT9;
}

+(TaskField *)TEXT10
{
    if (_TEXT10 == nil)
    {
        _TEXT10 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT10;
}

+(TaskField *)MARKED
{
    if (_MARKED == nil)
    {
        _MARKED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _MARKED;
}

+(TaskField *)FLAG1
{
    if (_FLAG1 == nil)
    {
        _FLAG1 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG1;
}

+(TaskField *)FLAG2
{
    if (_FLAG2 == nil)
    {
        _FLAG2 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG2;
}

+(TaskField *)FLAG3
{
    if (_FLAG3 == nil)
    {
        _FLAG3 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG3;
}

+(TaskField *)FLAG4
{
    if (_FLAG4 == nil)
    {
        _FLAG4 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG4;
}

+(TaskField *)FLAG5
{
    if (_FLAG5 == nil)
    {
        _FLAG5 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG5;
}

+(TaskField *)FLAG6
{
    if (_FLAG6 == nil)
    {
        _FLAG6 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG6;
}

+(TaskField *)FLAG7
{
    if (_FLAG7 == nil)
    {
        _FLAG7 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG7;
}

+(TaskField *)FLAG8
{
    if (_FLAG8 == nil)
    {
        _FLAG8 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG8;
}

+(TaskField *)FLAG9
{
    if (_FLAG9 == nil)
    {
        _FLAG9 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG9;
}

+(TaskField *)FLAG10
{
    if (_FLAG10 == nil)
    {
        _FLAG10 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG10;
}

+(TaskField *)ROLLUP
{
    if (_ROLLUP == nil)
    {
        _ROLLUP = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ROLLUP;
}

+(TaskField *)CV
{
    if (_CV == nil)
    {
        _CV = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _CV;
}

+(TaskField *)PROJECT
{
    if (_PROJECT == nil)
    {
        _PROJECT = [[TaskField alloc]init:[DataType STRING]];
    }
    return _PROJECT;
}

+(TaskField *)OUTLINE_LEVEL
{
    if (_OUTLINE_LEVEL == nil)
    {
        _OUTLINE_LEVEL = [[TaskField alloc]init:[DataType SHORT]];
    }
    return _OUTLINE_LEVEL;
}

+(TaskField *)UNIQUE_ID
{
    if (_UNIQUE_ID == nil)
    {
        _UNIQUE_ID = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _UNIQUE_ID;
}

+(TaskField *)NUMBER1
{
    if (_NUMBER1 == nil)
    {
        _NUMBER1 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER1;
}

+(TaskField *)NUMBER2
{
    if (_NUMBER2 == nil)
    {
        _NUMBER2 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER2;
}

+(TaskField *)NUMBER3
{
    if (_NUMBER3 == nil)
    {
        _NUMBER3 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER3;
}

+(TaskField *)NUMBER4
{
    if (_NUMBER4 == nil)
    {
        _NUMBER4 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER4;
}

+(TaskField *)NUMBER5
{
    if (_NUMBER5 == nil)
    {
        _NUMBER5 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER5;
}

+(TaskField *)SUMMARY
{
    if (_SUMMARY == nil)
    {
        _SUMMARY = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _SUMMARY;
}

+(TaskField *)CREATED
{
    if (_CREATED == nil)
    {
        _CREATED = [[TaskField alloc]init:[DataType DATE]];
    }
    return _CREATED;
}

+(TaskField *)NOTES
{
    if (_NOTES == nil)
    {
        _NOTES = [[TaskField alloc]init:[DataType ASCII_STRING]];
    }
    return _NOTES;
}

+(TaskField *)UNIQUE_ID_PREDECESSORS
{
    if (_UNIQUE_ID_PREDECESSORS == nil)
    {
        _UNIQUE_ID_PREDECESSORS = [[TaskField alloc]init:[DataType RELATION_LIST]];
    }
    return _UNIQUE_ID_PREDECESSORS;
}

+(TaskField *)UNIQUE_ID_SUCCESSORS
{
    if (_UNIQUE_ID_SUCCESSORS == nil)
    {
        _UNIQUE_ID_SUCCESSORS = [[TaskField alloc]init:[DataType RELATION_LIST]];
    }
    return _UNIQUE_ID_SUCCESSORS;
}

+(TaskField *)OBJECTS
{
    if (_OBJECTS == nil)
    {
        _OBJECTS = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _OBJECTS;
}

+(TaskField *)LINKED_FIELDS
{
    if (_LINKED_FIELDS == nil)
    {
        _LINKED_FIELDS = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _LINKED_FIELDS;
}

+(TaskField *)RESUME
{
    if (_RESUME == nil)
    {
        _RESUME = [[TaskField alloc]init:[DataType DATE]];
    }
    return _RESUME;
}

+(TaskField *)STOP
{
    if (_STOP == nil)
    {
        _STOP = [[TaskField alloc]init:[DataType DATE]];
    }
    return _STOP;
}

+(TaskField *)OUTLINE_NUMBER
{
    if (_OUTLINE_NUMBER == nil)
    {
        _OUTLINE_NUMBER = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_NUMBER;
}
    
+(TaskField *)DURATION1
{
    if (_DURATION1 == nil)
    {
        _DURATION1 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION1_UNITS]];
    }
    return _DURATION1;
}

+(TaskField *)DURATION2
{
    if (_DURATION2 == nil)
    {
        _DURATION2 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION2_UNITS]];
    }
    return _DURATION2;
}

+(TaskField *)DURATION3
{
    if (_DURATION3 == nil)
    {
        _DURATION3 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION3_UNITS]];
    }
    return _DURATION3;
}

+(TaskField *)COST1
{
    if (_COST1 == nil)
    {
        _COST1 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _COST1;
}

+(TaskField *)COST2
{
    if (_COST2 == nil)
    {
        _COST2 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _COST2;
}

+(TaskField *)COST3
{
    if (_COST3 == nil)
    {
        _COST3 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _COST3;
}

+(TaskField *)HIDEBAR
{
    if (_HIDEBAR == nil)
    {
        _HIDEBAR = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _HIDEBAR;
}

+(TaskField *)CONFIRMED
{
    if (_CONFIRMED == nil)
    {
        _CONFIRMED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _CONFIRMED;
}

+(TaskField *)UPDATE_NEEDED
{
    if (_UPDATE_NEEDED == nil)
    {
        _UPDATE_NEEDED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _UPDATE_NEEDED;
}

+(TaskField *)CONTACT
{
    if (_CONTACT == nil)
    {
        _CONTACT = [[TaskField alloc]init:[DataType STRING]];
    }
    return _CONTACT;
}

+(TaskField *)RESOURCE_GROUP
{
    if (_RESOURCE_GROUP == nil)
    {
        _RESOURCE_GROUP = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_GROUP;
}

+(TaskField *)ACWP
{
    if (_ACWP == nil)
    {
        _ACWP = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ACWP;
}

+(TaskField *)TYPE
{
    if (_TYPE == nil)
    {
        _TYPE = [[TaskField alloc]init:[DataType TASK_TYPE]];
    }
    return _TYPE;
}

+(TaskField *)RECURRING
{
    if (_RECURRING == nil)
    {
        _RECURRING = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _RECURRING;
}

+(TaskField *)EFFORT_DRIVEN
{
    if (_EFFORT_DRIVEN == nil)
    {
        _EFFORT_DRIVEN = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _EFFORT_DRIVEN;
}

+(TaskField *)OVERTIME_WORK
{
    if (_OVERTIME_WORK == nil)
    {
        _OVERTIME_WORK = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _OVERTIME_WORK;
}

+(TaskField *)ACTUAL_OVERTIME_WORK
{
    if (_ACTUAL_OVERTIME_WORK == nil)
    {
        _ACTUAL_OVERTIME_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_OVERTIME_WORK;
}

+(TaskField *)REMAINING_OVERTIME_WORK
{
    if (_REMAINING_OVERTIME_WORK == nil)
    {
        _REMAINING_OVERTIME_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _REMAINING_OVERTIME_WORK;
}

+(TaskField *)REGULAR_WORK
{
    if (_REGULAR_WORK == nil)
    {
        _REGULAR_WORK = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _REGULAR_WORK;
}

+(TaskField *)OVERTIME_COST
{
    if (_OVERTIME_COST == nil)
    {
        _OVERTIME_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _OVERTIME_COST;
}

+(TaskField *)ACTUAL_OVERTIME_COST
{
    if (_ACTUAL_OVERTIME_COST == nil)
    {
        _ACTUAL_OVERTIME_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ACTUAL_OVERTIME_COST;
}

+(TaskField *)REMAINING_OVERTIME_COST
{
    if (_REMAINING_OVERTIME_COST == nil)
    {
        _REMAINING_OVERTIME_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _REMAINING_OVERTIME_COST;
}

+(TaskField *)FIXED_COST_ACCRUAL
{
    if (_FIXED_COST_ACCRUAL == nil)
    {
        _FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _FIXED_COST_ACCRUAL;
}

+(TaskField *)INDICATORS
{
    if (_INDICATORS == nil)
    {
        _INDICATORS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _INDICATORS;
}

+(TaskField *)HYPERLINK
{
    if (_HYPERLINK == nil)
    {
        _HYPERLINK = [[TaskField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK;
}

+(TaskField *)HYPERLINK_ADDRESS
{
    if (_HYPERLINK_ADDRESS == nil)
    {
        _HYPERLINK_ADDRESS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_ADDRESS;
}

+(TaskField *)HYPERLINK_SUBADDRESS
{
    if (_HYPERLINK_SUBADDRESS == nil)
    {
        _HYPERLINK_SUBADDRESS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_SUBADDRESS;
}

+(TaskField *)HYPERLINK_HREF
{
    if (_HYPERLINK_HREF == nil)
    {
        _HYPERLINK_HREF = [[TaskField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_HREF;
}

+(TaskField *)ASSIGNMENT
{
    if (_ASSIGNMENT == nil)
    {
        _ASSIGNMENT = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ASSIGNMENT;
}

+(TaskField *)OVERALLOCATED
{
    if (_OVERALLOCATED == nil)
    {
        _OVERALLOCATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _OVERALLOCATED;
}

+(TaskField *)EXTERNAL_TASK
{
    if (_EXTERNAL_TASK == nil)
    {
        _EXTERNAL_TASK = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _EXTERNAL_TASK;
}

+(TaskField *)SUBPROJECT_READ_ONLY
{
    if (_SUBPROJECT_READ_ONLY == nil)
    {
        _SUBPROJECT_READ_ONLY = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _SUBPROJECT_READ_ONLY;
}

+(TaskField *)RESPONSE_PENDING
{
    if (_RESPONSE_PENDING == nil)
    {
        _RESPONSE_PENDING = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _RESPONSE_PENDING;
}

+(TaskField *)TEAMSTATUS_PENDING
{
    if (_TEAMSTATUS_PENDING == nil)
    {
        _TEAMSTATUS_PENDING = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _TEAMSTATUS_PENDING;
}

+(TaskField *)LEVELING_CAN_SPLIT
{
    if (_LEVELING_CAN_SPLIT == nil)
    {
        _LEVELING_CAN_SPLIT = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _LEVELING_CAN_SPLIT;
}

+(TaskField *)LEVEL_ASSIGNMENTS
{
    if (_LEVEL_ASSIGNMENTS == nil)
    {
        _LEVEL_ASSIGNMENTS = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _LEVEL_ASSIGNMENTS;
}

+(TaskField *)WORK_CONTOUR
{
    if (_WORK_CONTOUR == nil)
    {
        _WORK_CONTOUR = [[TaskField alloc]init:[DataType STRING]];
    }
    return _WORK_CONTOUR;
}

+(TaskField *)COST4
{
    if (_COST4 == nil)
    {
        _COST4 = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _COST4;
}

+(TaskField *)COST5
{
    if (_COST5 == nil)
    {
        _COST5 = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _COST5;
}

+(TaskField *)COST6
{
    if (_COST6 == nil)
    {
        _COST6 = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _COST6;
}

+(TaskField *)COST7
{
    if (_COST7 == nil)
    {
        _COST7 = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _COST7;
}

+(TaskField *)COST8
{
    if (_COST8 == nil)
    {
        _COST8 = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _COST8;
}

+(TaskField *)COST9
{
    if (_COST9 == nil)
    {
        _COST9 = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _COST9;
}

+(TaskField *)COST10
{
    if (_COST10 == nil)
    {
        _COST10 = [[TaskField alloc]init:[DataType CURRENCY]];
    }    
    return _COST10;
}

+(TaskField *)DATE1
{
    if (_DATE1 == nil)
    {
        _DATE1 = [[TaskField alloc]init:[DataType DATE]];
    }    
    return _DATE1;
}

+(TaskField *)DATE2
{
    if (_DATE2 == nil)
    {
        _DATE2 = [[TaskField alloc]init:[DataType DATE]];
    }    
    return _DATE2;
}

+(TaskField *)DATE3
{
    if (_DATE3 == nil)
    {
        _DATE3 = [[TaskField alloc]init:[DataType DATE]];
    }    
    return _DATE3;
}

+(TaskField *)DATE4
{
    if (_DATE4 == nil)
    {
        _DATE4 = [[TaskField alloc]init:[DataType DATE]];
    }    
    return _DATE4;
}

+(TaskField *)DATE5
{
    if (_DATE5 == nil)
    {
        _DATE5 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DATE5;
}

+(TaskField *)DATE6
{
    if (_DATE6 == nil)
    {
        _DATE6 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DATE6;
}

+(TaskField *)DATE7
{
    if (_DATE7 == nil)
    {
        _DATE7 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DATE7;
}

+(TaskField *)DATE8
{
    if (_DATE8 == nil)
    {
        _DATE8 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DATE8;
}

+(TaskField *)DATE9
{
    if (_DATE9 == nil)
    {
        _DATE9 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DATE9;
}

+(TaskField *)DATE10
{
    if (_DATE10 == nil)
    {
        _DATE10 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DATE10;
}

+(TaskField *)DURATION4
{
    if (_DURATION4 == nil)
    {
        _DURATION4 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION4_UNITS]];
    }
    return _DURATION4;
}

+(TaskField *)DURATION5
{
    if (_DURATION5 == nil)
    {
        _DURATION5 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION5_UNITS]];
    }
    return _DURATION5;
}

+(TaskField *)DURATION6
{
    if (_DURATION6 == nil)
    {
        _DURATION6 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION6_UNITS]];
    }
    return _DURATION6;
}

+(TaskField *)DURATION7
{
    if (_DURATION7 == nil)
    {
        _DURATION7 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION7_UNITS]];
    }
    return _DURATION7;
}

+(TaskField *)DURATION8
{
    if (_DURATION8 == nil)
    {
        _DURATION8 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION8_UNITS]];
    }
    return _DURATION8;
}

+(TaskField *)DURATION9
{
    if (_DURATION9 == nil)
    {
        _DURATION9 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION9_UNITS]];
    }
    return _DURATION9;
}

+(TaskField *)DURATION10
{
    if (_DURATION10 == nil)
    {
        _DURATION10 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField DURATION10_UNITS]];
    }
    return _DURATION10;
}

+(TaskField *)START6
{
    if (_START6 == nil)
    {
        _START6 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START6;
}

+(TaskField *)FINISH6
{
    if (_FINISH6 == nil)
    {
        _FINISH6 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH6;
}

+(TaskField *)START7
{
    if (_START7 == nil)
    {
        _START7 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START7;
}

+(TaskField *)FINISH7
{
    if (_FINISH7 == nil)
    {
        _FINISH7 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH7;
}

+(TaskField *)START8
{
    if (_START8 == nil)
    {
        _START8 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START8;
}

+(TaskField *)FINISH8
{
    if (_FINISH8 == nil)
    {
        _FINISH8 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH8;
}

+(TaskField *)START9
{
    if (_START9 == nil)
    {
        _START9 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START9;
}

+(TaskField *)FINISH9
{
    if (_FINISH9 == nil)
    {
        _FINISH9 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH9;
}

+(TaskField *)START10
{
    if (_START10 == nil)
    {
        _START10 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _START10;
}

+(TaskField *)FINISH10
{
    if (_FINISH10 == nil)
    {
        _FINISH10 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH10;
}

+(TaskField *)FLAG11
{
    if (_FLAG11 == nil)
    {
        _FLAG11 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG11;
}

+(TaskField *)FLAG12
{
    if (_FLAG12 == nil)
    {
        _FLAG12 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG12;
}

+(TaskField *)FLAG13
{
    if (_FLAG13 == nil)
    {
        _FLAG13 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG13;
}

+(TaskField *)FLAG14
{
    if (_FLAG14 == nil)
    {
        _FLAG14 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG14;
}

+(TaskField *)FLAG15
{
    if (_FLAG15 == nil)
    {
        _FLAG15 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG15;
}

+(TaskField *)FLAG16
{
    if (_FLAG16 == nil)
    {
        _FLAG16 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG16;
}

+(TaskField *)FLAG17
{
    if (_FLAG17 == nil)
    {
        _FLAG17 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG17;
}

+(TaskField *)FLAG18
{
    if (_FLAG18 == nil)
    {
        _FLAG18 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG18;
}

+(TaskField *)FLAG19
{
    if (_FLAG19 == nil)
    {
        _FLAG19 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG19;
}

+(TaskField *)FLAG20
{
    if (_FLAG20 == nil)
    {
        _FLAG20 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FLAG20;
}

+(TaskField *)NUMBER6
{
    if (_NUMBER6 == nil)
    {
        _NUMBER6 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER6;
}

+(TaskField *)NUMBER7
{
    if (_NUMBER7 == nil)
    {
        _NUMBER7 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER7;
}

+(TaskField *)NUMBER8
{
    if (_NUMBER8 == nil)
    {
        _NUMBER8 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER8;
}

+(TaskField *)NUMBER9
{
    if (_NUMBER9 == nil)
    {
        _NUMBER9 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER9;
}

+(TaskField *)NUMBER10
{
    if (_NUMBER10 == nil)
    {
        _NUMBER10 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER10;
}

+(TaskField *)NUMBER11
{
    if (_NUMBER11 == nil)
    {
        _NUMBER11 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER11;
}

+(TaskField *)NUMBER12
{
    if (_NUMBER12 == nil)
    {
        _NUMBER12 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER12;
}

+(TaskField *)NUMBER13
{
    if (_NUMBER13 == nil)
    {
        _NUMBER13 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER13;
}

+(TaskField *)NUMBER14
{
    if (_NUMBER14 == nil)
    {
        _NUMBER14 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER14;
}

+(TaskField *)NUMBER15
{
    if (_NUMBER15 == nil)
    {
        _NUMBER15 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER15;
}

+(TaskField *)NUMBER16
{
    if (_NUMBER16 == nil)
    {
        _NUMBER16 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER16;
}

+(TaskField *)NUMBER17
{
    if (_NUMBER17 == nil)
    {
        _NUMBER17 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER17;
}

+(TaskField *)NUMBER18
{
    if (_NUMBER18 == nil)
    {
        _NUMBER18 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER18;
}

+(TaskField *)NUMBER19
{
    if (_NUMBER19 == nil)
    {
        _NUMBER19 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER19;
}

+(TaskField *)NUMBER20
{
    if (_NUMBER20 == nil)
    {
        _NUMBER20 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _NUMBER20;
}

+(TaskField *)TEXT11
{
    if (_TEXT11 == nil)
    {
        _TEXT11 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT11;
}

+(TaskField *)TEXT12
{
    if (_TEXT12 == nil)
    {
        _TEXT12 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT12;
}

+(TaskField *)TEXT13
{
    if (_TEXT13 == nil)
    {
        _TEXT13 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT13;
}

+(TaskField *)TEXT14
{
    if (_TEXT14 == nil)
    {
        _TEXT14 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT14;
}

+(TaskField *)TEXT15
{
    if (_TEXT15 == nil)
    {
        _TEXT15 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT15;
}

+(TaskField *)TEXT16
{
    if (_TEXT16 == nil)
    {
        _TEXT16 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT16;
}

+(TaskField *)TEXT17
{
    if (_TEXT17 == nil)
    {
        _TEXT17 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT17;
}

+(TaskField *)TEXT18
{
    if (_TEXT18 == nil)
    {
        _TEXT18 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT18;
}

+(TaskField *)TEXT19
{
    if (_TEXT19 == nil)
    {
        _TEXT19 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT19;
}

+(TaskField *)TEXT20
{
    if (_TEXT20 == nil)
    {
        _TEXT20 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT20;
}

+(TaskField *)TEXT21
{
    if (_TEXT21 == nil)
    {
        _TEXT21 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT21;
}

+(TaskField *)TEXT22
{
    if (_TEXT22 == nil)
    {
        _TEXT22 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT22;
}

+(TaskField *)TEXT23
{
    if (_TEXT23 == nil)
    {
        _TEXT23 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT23;
}

+(TaskField *)TEXT24
{
    if (_TEXT24 == nil)
    {
        _TEXT24 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT24;
}

+(TaskField *)TEXT25
{
    if (_TEXT25 == nil)
    {
        _TEXT25 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT25;
}

+(TaskField *)TEXT26
{
    if (_TEXT26 == nil)
    {
        _TEXT26 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT26;
}

+(TaskField *)TEXT27
{
    if (_TEXT27 == nil)
    {
        _TEXT27 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT27;
}

+(TaskField *)TEXT28
{
    if (_TEXT28 == nil)
    {
        _TEXT28 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT28;
}

+(TaskField *)TEXT29
{
    if (_TEXT29 == nil)
    {
        _TEXT29 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT29;
}

+(TaskField *)TEXT30
{
    if (_TEXT30 == nil)
    {
        _TEXT30 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TEXT30;
}

+(TaskField *)RESOURCE_PHONETICS
{
    if (_RESOURCE_PHONETICS == nil)
    {
        _RESOURCE_PHONETICS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_PHONETICS;
}

+(TaskField *)ASSIGNMENT_DELAY
{
    if (_ASSIGNMENT_DELAY == nil)
    {
        _ASSIGNMENT_DELAY = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ASSIGNMENT_DELAY;
}

+(TaskField *)ASSIGNMENT_UNITS
{
    if (_ASSIGNMENT_UNITS == nil)
    {
        _ASSIGNMENT_UNITS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ASSIGNMENT_UNITS;
}

+(TaskField *)COST_RATE_TABLE
{
    if (_COST_RATE_TABLE == nil)
    {
        _COST_RATE_TABLE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _COST_RATE_TABLE;
}

+(TaskField *)PRELEVELED_START
{
    if (_PRELEVELED_START == nil)
    {
        _PRELEVELED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _PRELEVELED_START;
}

+(TaskField *)PRELEVELED_FINISH
{
    if (_PRELEVELED_FINISH == nil)
    {
        _PRELEVELED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _PRELEVELED_FINISH;
}

+(TaskField *)ESTIMATED
{
    if (_ESTIMATED == nil)
    {
        _ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ESTIMATED;
}

+(TaskField *)IGNORE_RESOURCE_CALENDAR
{
    if (_IGNORE_RESOURCE_CALENDAR == nil)
    {
        _IGNORE_RESOURCE_CALENDAR = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _IGNORE_RESOURCE_CALENDAR;
}

+(TaskField *)CALENDAR
{
    if (_CALENDAR == nil)
    {
        _CALENDAR = [[TaskField alloc]init:[DataType STRING]];
    }
    return _CALENDAR;
}

+(TaskField *)OUTLINE_CODE1
{
    if (_OUTLINE_CODE1 == nil)
    {
        _OUTLINE_CODE1 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE1;
}

+(TaskField *)OUTLINE_CODE2
{
    if (_OUTLINE_CODE2 == nil)
    {
        _OUTLINE_CODE2 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE2;
}

+(TaskField *)OUTLINE_CODE3
{
    if (_OUTLINE_CODE3 == nil)
    {
        _OUTLINE_CODE3 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE3;
}

+(TaskField *)OUTLINE_CODE4
{
    if (_OUTLINE_CODE4 == nil)
    {
        _OUTLINE_CODE4 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE4;
}

+(TaskField *)OUTLINE_CODE5
{
    if (_OUTLINE_CODE5 == nil)
    {
        _OUTLINE_CODE5 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE5;
}

+(TaskField *)OUTLINE_CODE6
{
    if (_OUTLINE_CODE6 == nil)
    {
        _OUTLINE_CODE6 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE6;
}

+(TaskField *)OUTLINE_CODE7
{
    if (_OUTLINE_CODE7 == nil)
    {
        _OUTLINE_CODE7 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE7;
}

+(TaskField *)OUTLINE_CODE8
{
    if (_OUTLINE_CODE8 == nil)
    {
        _OUTLINE_CODE8 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE8;
}

+(TaskField *)OUTLINE_CODE9
{
    if (_OUTLINE_CODE9 == nil)
    {
        _OUTLINE_CODE9 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE9;
}

+(TaskField *)OUTLINE_CODE10
{
    if (_OUTLINE_CODE10 == nil)
    {
        _OUTLINE_CODE10 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _OUTLINE_CODE10;
}

+(TaskField *)DEADLINE
{
    if (_DEADLINE == nil)
    {
        _DEADLINE = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DEADLINE;
}

+(TaskField *)START_SLACK
{
    if (_START_SLACK == nil)
    {
        _START_SLACK = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ACTUAL_DURATION_UNITS]];
    }
    return _START_SLACK;
}

+(TaskField *)FINISH_SLACK
{
    if (_FINISH_SLACK == nil)
    {
        _FINISH_SLACK = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ACTUAL_DURATION_UNITS]];
    }
    return _FINISH_SLACK;
}

+(TaskField *)VAC
{
    if (_VAC == nil)
    {
        _VAC = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _VAC;
}

+(TaskField *)GROUP_BY_SUMMARY
{
    if (_GROUP_BY_SUMMARY == nil)
    {
        _GROUP_BY_SUMMARY = [[TaskField alloc]init:[DataType STRING]];
    }
    return _GROUP_BY_SUMMARY;
}

+(TaskField *)WBS_PREDECESSORS
{
    if (_WBS_PREDECESSORS == nil)
    {
        _WBS_PREDECESSORS = [[TaskField alloc]init:[DataType RELATION_LIST]];
    }
    return _WBS_PREDECESSORS;
}

+(TaskField *)WBS_SUCCESSORS
{
    if (_WBS_SUCCESSORS == nil)
    {
        _WBS_SUCCESSORS = [[TaskField alloc]init:[DataType RELATION_LIST]];
    }
    return _WBS_SUCCESSORS;
}

+(TaskField *)RESOURCE_TYPE
{
    if (_RESOURCE_TYPE == nil)
    {
        _RESOURCE_TYPE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_TYPE;
}

+(TaskField *)BASELINE1_DURATION_UNITS
{
    if (_BASELINE1_DURATION_UNITS == nil)
    {
        _BASELINE1_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE1_DURATION_UNITS;
}

+(TaskField *)BASELINE2_DURATION_UNITS
{
    if (_BASELINE2_DURATION_UNITS == nil)
    {
        _BASELINE2_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE2_DURATION_UNITS;
}

+(TaskField *)BASELINE3_DURATION_UNITS
{
    if (_BASELINE3_DURATION_UNITS == nil)
    {
        _BASELINE3_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE3_DURATION_UNITS;
}

+(TaskField *)BASELINE4_DURATION_UNITS
{
    if (_BASELINE4_DURATION_UNITS == nil)
    {
        _BASELINE4_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE4_DURATION_UNITS;
}

+(TaskField *)BASELINE5_DURATION_UNITS
{
    if (_BASELINE5_DURATION_UNITS == nil)
    {
        _BASELINE5_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE5_DURATION_UNITS;
}

+(TaskField *)BASELINE6_DURATION_UNITS
{
    if (_BASELINE6_DURATION_UNITS == nil)
    {
        _BASELINE6_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE6_DURATION_UNITS;
}

+(TaskField *)BASELINE7_DURATION_UNITS
{
    if (_BASELINE7_DURATION_UNITS == nil)
    {
        _BASELINE7_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE7_DURATION_UNITS;
}

+(TaskField *)BASELINE8_DURATION_UNITS
{
    if (_BASELINE8_DURATION_UNITS == nil)
    {
        _BASELINE8_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE8_DURATION_UNITS;
}

+(TaskField *)BASELINE9_DURATION_UNITS
{
    if (_BASELINE9_DURATION_UNITS == nil)
    {
        _BASELINE9_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE9_DURATION_UNITS;
}

+(TaskField *)BASELINE10_DURATION_UNITS
{
    if (_BASELINE10_DURATION_UNITS == nil)
    {
        _BASELINE10_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _BASELINE10_DURATION_UNITS;
}

+(TaskField *)BASELINE1_START
{
    if (_BASELINE1_START == nil)
    {
        _BASELINE1_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_START;
}

+(TaskField *)BASELINE1_FINISH
{
    if (_BASELINE1_FINISH == nil)
    {
        _BASELINE1_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_FINISH;
}

+(TaskField *)BASELINE1_COST
{
    if (_BASELINE1_COST == nil)
    {
        _BASELINE1_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE1_COST;
}

+(TaskField *)BASELINE1_WORK
{
    if (_BASELINE1_WORK == nil)
    {
        _BASELINE1_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE1_WORK;
}

+(TaskField *)BASELINE1_DURATION
{
    if (_BASELINE1_DURATION == nil)
    {
        _BASELINE1_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE1_DURATION_UNITS]];
    }
    return _BASELINE1_DURATION;
}

+(TaskField *)BASELINE2_START
{
    if (_BASELINE2_START == nil)
    {
        _BASELINE2_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_START;
}

+(TaskField *)BASELINE2_FINISH
{
    if (_BASELINE2_FINISH == nil)
    {
        _BASELINE2_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_FINISH;
}

+(TaskField *)BASELINE2_COST
{
    if (_BASELINE2_COST == nil)
    {
        _BASELINE2_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE2_COST;
}

+(TaskField *)BASELINE2_WORK
{
    if (_BASELINE2_WORK == nil)
    {
        _BASELINE2_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE2_WORK;
}

+(TaskField *)BASELINE2_DURATION
{
    if (_BASELINE2_DURATION == nil)
    {
        _BASELINE2_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE2_DURATION_UNITS]];
    }
    return _BASELINE2_DURATION;
}

+(TaskField *)BASELINE3_START
{
    if (_BASELINE3_START == nil)
    {
        _BASELINE3_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_START;
}

+(TaskField *)BASELINE3_FINISH
{
    if (_BASELINE3_FINISH == nil)
    {
        _BASELINE3_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_FINISH;
}

+(TaskField *)BASELINE3_COST
{
    if (_BASELINE3_COST == nil)
    {
        _BASELINE3_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE3_COST;
}

+(TaskField *)BASELINE3_WORK
{
    if (_BASELINE3_WORK == nil)
    {
        _BASELINE3_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE3_WORK;
}

+(TaskField *)BASELINE3_DURATION
{
    if (_BASELINE3_DURATION == nil)
    {
        _BASELINE3_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE3_DURATION_UNITS]];
    }
    return _BASELINE3_DURATION;
}

+(TaskField *)BASELINE4_START
{
    if (_BASELINE4_START == nil)
    {
        _BASELINE4_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_START;
}

+(TaskField *)BASELINE4_FINISH
{
    if (_BASELINE4_FINISH == nil)
    {
        _BASELINE4_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_FINISH;
}

+(TaskField *)BASELINE4_COST
{
    if (_BASELINE4_COST == nil)
    {
        _BASELINE4_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE4_COST;
}

+(TaskField *)BASELINE4_WORK
{
    if (_BASELINE4_WORK == nil)
    {
        _BASELINE4_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE4_WORK;
}

+(TaskField *)BASELINE4_DURATION
{
    if (_BASELINE4_DURATION == nil)
    {
        _BASELINE4_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE4_DURATION_UNITS]];
    }
    return _BASELINE4_DURATION;
}

+(TaskField *)BASELINE5_START
{
    if (_BASELINE5_START == nil)
    {
        _BASELINE5_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_START;
}

+(TaskField *)BASELINE5_FINISH
{
    if (_BASELINE5_FINISH == nil)
    {
        _BASELINE5_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_FINISH;
}

+(TaskField *)BASELINE5_COST
{
    if (_BASELINE5_COST == nil)
    {
        _BASELINE5_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE5_COST;
}

+(TaskField *)BASELINE5_WORK
{
    if (_BASELINE5_WORK == nil)
    {
        _BASELINE5_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE5_WORK;
}

+(TaskField *)BASELINE5_DURATION
{
    if (_BASELINE5_DURATION == nil)
    {
        _BASELINE5_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE5_DURATION_UNITS]];
    }
    return _BASELINE5_DURATION;
}

+(TaskField *)BASELINE6_START
{
    if (_BASELINE6_START == nil)
    {
        _BASELINE6_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_START;
}

+(TaskField *)BASELINE6_FINISH
{
    if (_BASELINE6_FINISH == nil)
    {
        _BASELINE6_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_FINISH;
}

+(TaskField *)BASELINE6_COST
{
    if (_BASELINE6_COST == nil)
    {
        _BASELINE6_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE6_COST;
}

+(TaskField *)BASELINE6_WORK
{
    if (_BASELINE6_WORK == nil)
    {
        _BASELINE6_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE6_WORK;
}

+(TaskField *)BASELINE6_DURATION
{
    if (_BASELINE6_DURATION == nil)
    {
        _BASELINE6_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE6_DURATION_UNITS]];
    }
    return _BASELINE6_DURATION;
}

+(TaskField *)BASELINE7_START
{
    if (_BASELINE7_START == nil)
    {
        _BASELINE7_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_START;
}

+(TaskField *)BASELINE7_FINISH
{
    if (_BASELINE7_FINISH == nil)
    {
        _BASELINE7_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_FINISH;
}

+(TaskField *)BASELINE7_COST
{
    if (_BASELINE7_COST == nil)
    {
        _BASELINE7_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE7_COST;
}

+(TaskField *)BASELINE7_WORK
{
    if (_BASELINE7_WORK == nil)
    {
        _BASELINE7_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE7_WORK;
}

+(TaskField *)BASELINE7_DURATION
{
    if (_BASELINE7_DURATION == nil)
    {
        _BASELINE7_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE7_DURATION_UNITS]];
    }
    return _BASELINE7_DURATION;
}

+(TaskField *)BASELINE8_START
{
    if (_BASELINE8_START == nil)
    {
        _BASELINE8_START = [[TaskField alloc]init:[DataType DATE]];
    }    
    return _BASELINE8_START;
}

+(TaskField *)BASELINE8_FINISH
{
    if (_BASELINE8_FINISH == nil)
    {
        _BASELINE8_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE8_FINISH;
}

+(TaskField *)BASELINE8_COST
{
    if (_BASELINE8_COST == nil)
    {
        _BASELINE8_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE8_COST;
}

+(TaskField *)BASELINE8_WORK
{
    if (_BASELINE8_WORK == nil)
    {
        _BASELINE8_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE8_WORK;
}

+(TaskField *)BASELINE8_DURATION
{
    if (_BASELINE8_DURATION == nil)
    {
        _BASELINE8_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE8_DURATION_UNITS]];
    }
    return _BASELINE8_DURATION;
}

+(TaskField *)BASELINE9_START
{
    if (_BASELINE9_START == nil)
    {
        _BASELINE9_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_START;
}

+(TaskField *)BASELINE9_FINISH
{
    if (_BASELINE9_FINISH == nil)
    {
        _BASELINE9_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_FINISH;
}

+(TaskField *)BASELINE9_COST
{
    if (_BASELINE9_COST == nil)
    {
        _BASELINE9_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE9_COST;
}

+(TaskField *)BASELINE9_WORK
{
    if (_BASELINE9_WORK == nil)
    {
        _BASELINE9_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE9_WORK;
}

+(TaskField *)BASELINE9_DURATION
{
    if (_BASELINE9_DURATION == nil)
    {
        _BASELINE9_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE9_DURATION_UNITS]];
    }
    return _BASELINE9_DURATION;
}

+(TaskField *)BASELINE10_START
{
    if (_BASELINE10_START == nil)
    {
        _BASELINE10_START = [[TaskField alloc]init:[DataType DATE]];
    }    
    return _BASELINE10_START;
}

+(TaskField *)BASELINE10_FINISH
{
    if (_BASELINE10_FINISH == nil)
    {
        _BASELINE10_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE10_FINISH;
}

+(TaskField *)BASELINE10_COST
{
    if (_BASELINE10_COST == nil)
    {
        _BASELINE10_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE10_COST;
}

+(TaskField *)BASELINE10_WORK
{
    if (_BASELINE10_WORK == nil)
    {
        _BASELINE10_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BASELINE10_WORK;
}

+(TaskField *)BASELINE10_DURATION
{
    if (_BASELINE10_DURATION == nil)
    {
        _BASELINE10_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE10_DURATION_UNITS]];
    }
    return _BASELINE10_DURATION;
}

+(TaskField *)ENTERPRISE_COST1
{
    if (_ENTERPRISE_COST1 == nil)
    {
        _ENTERPRISE_COST1 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST1;
}

+(TaskField *)ENTERPRISE_COST2
{
    if (_ENTERPRISE_COST2 == nil)
    {
        _ENTERPRISE_COST2 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST2;
}

+(TaskField *)ENTERPRISE_COST3
{
    if (_ENTERPRISE_COST3 == nil)
    {
        _ENTERPRISE_COST3 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST3;
}

+(TaskField *)ENTERPRISE_COST4
{
    if (_ENTERPRISE_COST4 == nil)
    {
        _ENTERPRISE_COST4 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST4;
}

+(TaskField *)ENTERPRISE_COST5
{
    if (_ENTERPRISE_COST5 == nil)
    {
        _ENTERPRISE_COST5 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST5;
}

+(TaskField *)ENTERPRISE_COST6
{
    if (_ENTERPRISE_COST6 == nil)
    {
        _ENTERPRISE_COST6 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST6;
}

+(TaskField *)ENTERPRISE_COST7
{
    if (_ENTERPRISE_COST7 == nil)
    {
        _ENTERPRISE_COST7 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST7;
}

+(TaskField *)ENTERPRISE_COST8
{
    if (_ENTERPRISE_COST8 == nil)
    {
        _ENTERPRISE_COST8 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST8;
}

+(TaskField *)ENTERPRISE_COST9
{
    if (_ENTERPRISE_COST9 == nil)
    {
        _ENTERPRISE_COST9 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST9;
}

+(TaskField *)ENTERPRISE_COST10
{
    if (_ENTERPRISE_COST10 == nil)
    {
        _ENTERPRISE_COST10 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_COST10;
}

+(TaskField *)ENTERPRISE_DATE1
{
    if (_ENTERPRISE_DATE1 == nil)
    {
        _ENTERPRISE_DATE1 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE1;
}

+(TaskField *)ENTERPRISE_DATE2
{
    if (_ENTERPRISE_DATE2 == nil)
    {
        _ENTERPRISE_DATE2 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE2;
}

+(TaskField *)ENTERPRISE_DATE3
{
    if (_ENTERPRISE_DATE3 == nil)
    {
        _ENTERPRISE_DATE3 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE3;
}

+(TaskField *)ENTERPRISE_DATE4
{
    if (_ENTERPRISE_DATE4 == nil)
    {
        _ENTERPRISE_DATE4 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE4;
}

+(TaskField *)ENTERPRISE_DATE5
{
    if (_ENTERPRISE_DATE5 == nil)
    {
        _ENTERPRISE_DATE5 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE5;
}

+(TaskField *)ENTERPRISE_DATE6
{
    if (_ENTERPRISE_DATE6 == nil)
    {
        _ENTERPRISE_DATE6 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE6;
}

+(TaskField *)ENTERPRISE_DATE7
{
    if (_ENTERPRISE_DATE7 == nil)
    {
        _ENTERPRISE_DATE7 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE7;
}

+(TaskField *)ENTERPRISE_DATE8
{
    if (_ENTERPRISE_DATE8 == nil)
    {
        _ENTERPRISE_DATE8 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE8;
}

+(TaskField *)ENTERPRISE_DATE9
{
    if (_ENTERPRISE_DATE9 == nil)
    {
        _ENTERPRISE_DATE9 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE9;
}

+(TaskField *)ENTERPRISE_DATE10
{
    if (_ENTERPRISE_DATE10 == nil)
    {
        _ENTERPRISE_DATE10 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE10;
}

+(TaskField *)ENTERPRISE_DATE11
{
    if (_ENTERPRISE_DATE11 == nil)
    {
        _ENTERPRISE_DATE11 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE11;
}

+(TaskField *)ENTERPRISE_DATE12
{
    if (_ENTERPRISE_DATE12 == nil)
    {
        _ENTERPRISE_DATE12 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE12;
}

+(TaskField *)ENTERPRISE_DATE13
{
    if (_ENTERPRISE_DATE13 == nil)
    {
        _ENTERPRISE_DATE13 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE13;
}

+(TaskField *)ENTERPRISE_DATE14
{
    if (_ENTERPRISE_DATE14 == nil)
    {
        _ENTERPRISE_DATE14 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE14;
}

+(TaskField *)ENTERPRISE_DATE15
{
    if (_ENTERPRISE_DATE15 == nil)
    {
        _ENTERPRISE_DATE15 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE15;
}

+(TaskField *)ENTERPRISE_DATE16
{
    if (_ENTERPRISE_DATE16 == nil)
    {
        _ENTERPRISE_DATE16 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE16;
}

+(TaskField *)ENTERPRISE_DATE17
{
    if (_ENTERPRISE_DATE17 == nil)
    {
        _ENTERPRISE_DATE17 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE17;
}

+(TaskField *)ENTERPRISE_DATE18
{
    if (_ENTERPRISE_DATE18 == nil)
    {
        _ENTERPRISE_DATE18 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE18;
}

+(TaskField *)ENTERPRISE_DATE19
{
    if (_ENTERPRISE_DATE19 == nil)
    {
        _ENTERPRISE_DATE19 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE19;
}

+(TaskField *)ENTERPRISE_DATE20
{
    if (_ENTERPRISE_DATE20 == nil)
    {
        _ENTERPRISE_DATE20 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE20;
}

+(TaskField *)ENTERPRISE_DATE21
{
    if (_ENTERPRISE_DATE21 == nil)
    {
        _ENTERPRISE_DATE21 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE21;
}

+(TaskField *)ENTERPRISE_DATE22
{
    if (_ENTERPRISE_DATE22 == nil)
    {
        _ENTERPRISE_DATE22 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE22;
}

+(TaskField *)ENTERPRISE_DATE23
{
    if (_ENTERPRISE_DATE23 == nil)
    {
        _ENTERPRISE_DATE23 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE23;
}

+(TaskField *)ENTERPRISE_DATE24
{
    if (_ENTERPRISE_DATE24 == nil)
    {
        _ENTERPRISE_DATE24 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE24;
}

+(TaskField *)ENTERPRISE_DATE25
{
    if (_ENTERPRISE_DATE25 == nil)
    {
        _ENTERPRISE_DATE25 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE25;
}

+(TaskField *)ENTERPRISE_DATE26
{
    if (_ENTERPRISE_DATE26 == nil)
    {
        _ENTERPRISE_DATE26 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE26;
}

+(TaskField *)ENTERPRISE_DATE27
{
    if (_ENTERPRISE_DATE27 == nil)
    {
        _ENTERPRISE_DATE27 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE27;
}

+(TaskField *)ENTERPRISE_DATE28
{
    if (_ENTERPRISE_DATE28 == nil)
    {
        _ENTERPRISE_DATE28 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE28;
}

+(TaskField *)ENTERPRISE_DATE29
{
    if (_ENTERPRISE_DATE29 == nil)
    {
        _ENTERPRISE_DATE29 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE29;
}

+(TaskField *)ENTERPRISE_DATE30
{
    if (_ENTERPRISE_DATE30 == nil)
    {
        _ENTERPRISE_DATE30 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_DATE30;
}

+(TaskField *)ENTERPRISE_DURATION1_UNITS
{
    if (_ENTERPRISE_DURATION1_UNITS == nil)
    {
        _ENTERPRISE_DURATION1_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION1_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION2_UNITS
{
    if (_ENTERPRISE_DURATION2_UNITS == nil)
    {
        _ENTERPRISE_DURATION2_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION2_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION3_UNITS
{
    if (_ENTERPRISE_DURATION3_UNITS == nil)
    {
        _ENTERPRISE_DURATION3_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION3_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION4_UNITS
{
    if (_ENTERPRISE_DURATION4_UNITS == nil)
    {
        _ENTERPRISE_DURATION4_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION4_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION5_UNITS
{
    if (_ENTERPRISE_DURATION5_UNITS == nil)
    {
        _ENTERPRISE_DURATION5_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION5_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION6_UNITS
{
    if (_ENTERPRISE_DURATION6_UNITS == nil)
    {
        _ENTERPRISE_DURATION6_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION6_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION7_UNITS
{
    if (_ENTERPRISE_DURATION7_UNITS == nil)
    {
        _ENTERPRISE_DURATION7_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION7_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION8_UNITS
{
    if (_ENTERPRISE_DURATION8_UNITS == nil)
    {
        _ENTERPRISE_DURATION8_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION8_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION9_UNITS
{
    if (_ENTERPRISE_DURATION9_UNITS == nil)
    {
        _ENTERPRISE_DURATION9_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION9_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION10_UNITS
{
    if (_ENTERPRISE_DURATION10_UNITS == nil)
    {
        _ENTERPRISE_DURATION10_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _ENTERPRISE_DURATION10_UNITS;
}

+(TaskField *)ENTERPRISE_DURATION1
{
    if (_ENTERPRISE_DURATION1 == nil)
    {
        _ENTERPRISE_DURATION1 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION1_UNITS]];
    }
    return _ENTERPRISE_DURATION1;
}

+(TaskField *)ENTERPRISE_DURATION2
{
    if (_ENTERPRISE_DURATION2 == nil)
    {
        _ENTERPRISE_DURATION2 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION2_UNITS]];
    }
    return _ENTERPRISE_DURATION2;
}

+(TaskField *)ENTERPRISE_DURATION3
{
    if (_ENTERPRISE_DURATION3 == nil)
    {
        _ENTERPRISE_DURATION3 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION3_UNITS]];
    }
    return _ENTERPRISE_DURATION3;;
}

+(TaskField *)ENTERPRISE_DURATION4
{
    if (_ENTERPRISE_DURATION4 == nil)
    {
        _ENTERPRISE_DURATION4 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION4_UNITS]];
    }
    return _ENTERPRISE_DURATION4;
}

+(TaskField *)ENTERPRISE_DURATION5
{
    if (_ENTERPRISE_DURATION5 == nil)
    {
        _ENTERPRISE_DURATION5 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION5_UNITS]];
    }
    return _ENTERPRISE_DURATION5;
}

+(TaskField *)ENTERPRISE_DURATION6
{
    if (_ENTERPRISE_DURATION6 == nil)
    {
        _ENTERPRISE_DURATION6 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION6_UNITS]];
    }
    return _ENTERPRISE_DURATION6;
}

+(TaskField *)ENTERPRISE_DURATION7
{
    if (_ENTERPRISE_DURATION7 == nil)
    {
        _ENTERPRISE_DURATION7 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION7_UNITS]];
    }
    return _ENTERPRISE_DURATION7;
}

+(TaskField *)ENTERPRISE_DURATION8
{
    if (_ENTERPRISE_DURATION8 == nil)
    {
        _ENTERPRISE_DURATION8 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION8_UNITS]];
    }
    return _ENTERPRISE_DURATION8;
}

+(TaskField *)ENTERPRISE_DURATION9
{
    if (_ENTERPRISE_DURATION9 == nil)
    {
        _ENTERPRISE_DURATION9 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION9_UNITS]];
    }
    return _ENTERPRISE_DURATION9;
}

+(TaskField *)ENTERPRISE_DURATION10
{
    if (_ENTERPRISE_DURATION10 == nil)
    {
        _ENTERPRISE_DURATION10 = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ENTERPRISE_DURATION10_UNITS]];
    }
    return _ENTERPRISE_DURATION10;
}

+(TaskField *)ENTERPRISE_FLAG1
{
    if (_ENTERPRISE_FLAG1 == nil)
    {
        _ENTERPRISE_FLAG1 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG1;
}

+(TaskField *)ENTERPRISE_FLAG2
{
    if (_ENTERPRISE_FLAG2 == nil)
    {
        _ENTERPRISE_FLAG2 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG2;
}

+(TaskField *)ENTERPRISE_FLAG3
{
    if (_ENTERPRISE_FLAG3 == nil)
    {
        _ENTERPRISE_FLAG3 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG3;
}

+(TaskField *)ENTERPRISE_FLAG4
{
    if (_ENTERPRISE_FLAG4 == nil)
    {
        _ENTERPRISE_FLAG4 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG4;
}

+(TaskField *)ENTERPRISE_FLAG5
{
    if (_ENTERPRISE_FLAG5 == nil)
    {
        _ENTERPRISE_FLAG5 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG5;
}

+(TaskField *)ENTERPRISE_FLAG6
{
    if (_ENTERPRISE_FLAG6 == nil)
    {
        _ENTERPRISE_FLAG6 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG6;
}

+(TaskField *)ENTERPRISE_FLAG7
{
    if (_ENTERPRISE_FLAG7 == nil)
    {
        _ENTERPRISE_FLAG7 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG7;
}

+(TaskField *)ENTERPRISE_FLAG8
{
    if (_ENTERPRISE_FLAG8 == nil)
    {
        _ENTERPRISE_FLAG8 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG8;
}

+(TaskField *)ENTERPRISE_FLAG9
{
    if (_ENTERPRISE_FLAG9 == nil)
    {
        _ENTERPRISE_FLAG9 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG9;
}

+(TaskField *)ENTERPRISE_FLAG10
{
    if (_ENTERPRISE_FLAG10 == nil)
    {
        _ENTERPRISE_FLAG10 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG10;
}

+(TaskField *)ENTERPRISE_FLAG11
{
    if (_ENTERPRISE_FLAG11 == nil)
    {
        _ENTERPRISE_FLAG11 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG11;
}

+(TaskField *)ENTERPRISE_FLAG12
{
    if (_ENTERPRISE_FLAG12 == nil)
    {
        _ENTERPRISE_FLAG12 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG12;
}

+(TaskField *)ENTERPRISE_FLAG13
{
    if (_ENTERPRISE_FLAG13 == nil)
    {
        _ENTERPRISE_FLAG13 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG13;
}

+(TaskField *)ENTERPRISE_FLAG14
{
    if (_ENTERPRISE_FLAG14 == nil)
    {
        _ENTERPRISE_FLAG14 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG14;
}

+(TaskField *)ENTERPRISE_FLAG15
{
    if (_ENTERPRISE_FLAG15 == nil)
    {
        _ENTERPRISE_FLAG15 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG15;
}

+(TaskField *)ENTERPRISE_FLAG16
{
    if (_ENTERPRISE_FLAG16 == nil)
    {
        _ENTERPRISE_FLAG16 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG16;
}

+(TaskField *)ENTERPRISE_FLAG17
{
    if (_ENTERPRISE_FLAG17 == nil)
    {
        _ENTERPRISE_FLAG17 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG17;
}

+(TaskField *)ENTERPRISE_FLAG18
{
    if (_ENTERPRISE_FLAG18 == nil)
    {
        _ENTERPRISE_FLAG18 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG18;
}

+(TaskField *)ENTERPRISE_FLAG19
{
    if (_ENTERPRISE_FLAG19 == nil)
    {
        _ENTERPRISE_FLAG19 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG19;
}

+(TaskField *)ENTERPRISE_FLAG20
{
    if (_ENTERPRISE_FLAG20 == nil)
    {
        _ENTERPRISE_FLAG20 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_FLAG20;
}

+(TaskField *)ENTERPRISE_NUMBER1
{
    if (_ENTERPRISE_NUMBER1 == nil)
    {
        _ENTERPRISE_NUMBER1 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER1;
}
+(TaskField *)ENTERPRISE_NUMBER2
{
    if (_ENTERPRISE_NUMBER2 == nil)
    {
        _ENTERPRISE_NUMBER2 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER2;
}

+(TaskField *)ENTERPRISE_NUMBER3
{
    if (_ENTERPRISE_NUMBER3 == nil)
    {
        _ENTERPRISE_NUMBER3 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER3;
}

+(TaskField *)ENTERPRISE_NUMBER4
{
    if (_ENTERPRISE_NUMBER4 == nil)
    {
        _ENTERPRISE_NUMBER4 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER4;
}

+(TaskField *)ENTERPRISE_NUMBER5
{
    if (_ENTERPRISE_NUMBER5 == nil)
    {
        _ENTERPRISE_NUMBER5 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER5;
}

+(TaskField *)ENTERPRISE_NUMBER6
{
    if (_ENTERPRISE_NUMBER6 == nil)
    {
        _ENTERPRISE_NUMBER6 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER6;
}

+(TaskField *)ENTERPRISE_NUMBER7
{
    if (_ENTERPRISE_NUMBER7 == nil)
    {
        _ENTERPRISE_NUMBER7 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER7;
}

+(TaskField *)ENTERPRISE_NUMBER8
{
    if (_ENTERPRISE_NUMBER8 == nil)
    {
        _ENTERPRISE_NUMBER8 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER8;
}

+(TaskField *)ENTERPRISE_NUMBER9
{
    if (_ENTERPRISE_NUMBER9 == nil)
    {
        _ENTERPRISE_NUMBER9 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER9;
}

+(TaskField *)ENTERPRISE_NUMBER10
{
    if (_ENTERPRISE_NUMBER10 == nil)
    {
        _ENTERPRISE_NUMBER10 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER10;
}

+(TaskField *)ENTERPRISE_NUMBER11
{
    if (_ENTERPRISE_NUMBER11 == nil)
    {
        _ENTERPRISE_NUMBER11 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER11;
}

+(TaskField *)ENTERPRISE_NUMBER12
{
    if (_ENTERPRISE_NUMBER12 == nil)
    {
        _ENTERPRISE_NUMBER12 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER12;
}

+(TaskField *)ENTERPRISE_NUMBER13
{
    if (_ENTERPRISE_NUMBER13 == nil)
    {
        _ENTERPRISE_NUMBER13 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER13;
}

+(TaskField *)ENTERPRISE_NUMBER14
{
    if (_ENTERPRISE_NUMBER14 == nil)
    {
        _ENTERPRISE_NUMBER14 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER14;
}

+(TaskField *)ENTERPRISE_NUMBER15
{
    if (_ENTERPRISE_NUMBER15 == nil)
    {
        _ENTERPRISE_NUMBER15 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER15;
}

+(TaskField *)ENTERPRISE_NUMBER16
{
    if (_ENTERPRISE_NUMBER16 == nil)
    {
        _ENTERPRISE_NUMBER16 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER16;
}

+(TaskField *)ENTERPRISE_NUMBER17
{
    if (_ENTERPRISE_NUMBER17 == nil)
    {
        _ENTERPRISE_NUMBER17 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER17;
}

+(TaskField *)ENTERPRISE_NUMBER18
{
    if (_ENTERPRISE_NUMBER18 == nil)
    {
        _ENTERPRISE_NUMBER18 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER18;
}

+(TaskField *)ENTERPRISE_NUMBER19
{
    if (_ENTERPRISE_NUMBER19 == nil)
    {
        _ENTERPRISE_NUMBER19 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER19;
}

+(TaskField *)ENTERPRISE_NUMBER20
{
    if (_ENTERPRISE_NUMBER20 == nil)
    {
        _ENTERPRISE_NUMBER20 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER20;
}

+(TaskField *)ENTERPRISE_NUMBER21
{
    if (_ENTERPRISE_NUMBER21 == nil)
    {
        _ENTERPRISE_NUMBER21 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER21;
}

+(TaskField *)ENTERPRISE_NUMBER22
{
    if (_ENTERPRISE_NUMBER22 == nil)
    {
        _ENTERPRISE_NUMBER22 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER22;
}

+(TaskField *)ENTERPRISE_NUMBER23
{
    if (_ENTERPRISE_NUMBER23 == nil)
    {
        _ENTERPRISE_NUMBER23 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER23;
}

+(TaskField *)ENTERPRISE_NUMBER24
{
    if (_ENTERPRISE_NUMBER24 == nil)
    {
        _ENTERPRISE_NUMBER24 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER24;
}

+(TaskField *)ENTERPRISE_NUMBER25
{
    if (_ENTERPRISE_NUMBER25 == nil)
    {
        _ENTERPRISE_NUMBER25 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER25;
}

+(TaskField *)ENTERPRISE_NUMBER26
{
    if (_ENTERPRISE_NUMBER26 == nil)
    {
        _ENTERPRISE_NUMBER26 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER26;
}

+(TaskField *)ENTERPRISE_NUMBER27
{
    if (_ENTERPRISE_NUMBER27 == nil)
    {
        _ENTERPRISE_NUMBER27 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER27;
}

+(TaskField *)ENTERPRISE_NUMBER28
{
    if (_ENTERPRISE_NUMBER28 == nil)
    {
        _ENTERPRISE_NUMBER28 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER28;
}

+(TaskField *)ENTERPRISE_NUMBER29
{
    if (_ENTERPRISE_NUMBER29 == nil)
    {
        _ENTERPRISE_NUMBER29 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER29;
}

+(TaskField *)ENTERPRISE_NUMBER30
{
    if (_ENTERPRISE_NUMBER30 == nil)
    {
        _ENTERPRISE_NUMBER30 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER30;
}

+(TaskField *)ENTERPRISE_NUMBER31
{
    if (_ENTERPRISE_NUMBER31 == nil)
    {
        _ENTERPRISE_NUMBER31 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER31;
}

+(TaskField *)ENTERPRISE_NUMBER32
{
    if (_ENTERPRISE_NUMBER32 == nil)
    {
        _ENTERPRISE_NUMBER32 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER32;
}

+(TaskField *)ENTERPRISE_NUMBER33
{
    if (_ENTERPRISE_NUMBER33 == nil)
    {
        _ENTERPRISE_NUMBER33 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER33;
}

+(TaskField *)ENTERPRISE_NUMBER34
{
    if (_ENTERPRISE_NUMBER34 == nil)
    {
        _ENTERPRISE_NUMBER34 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER34;
}

+(TaskField *)ENTERPRISE_NUMBER35
{
    if (_ENTERPRISE_NUMBER35 == nil)
    {
        _ENTERPRISE_NUMBER35 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER35;
}

+(TaskField *)ENTERPRISE_NUMBER36
{
    if (_ENTERPRISE_NUMBER36 == nil)
    {
        _ENTERPRISE_NUMBER36 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER36;
}

+(TaskField *)ENTERPRISE_NUMBER37
{
    if (_ENTERPRISE_NUMBER37 == nil)
    {
        _ENTERPRISE_NUMBER37 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER37;
}

+(TaskField *)ENTERPRISE_NUMBER38
{
    if (_ENTERPRISE_NUMBER38 == nil)
    {
        _ENTERPRISE_NUMBER38 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER38;
}

+(TaskField *)ENTERPRISE_NUMBER39
{
    if (_ENTERPRISE_NUMBER39 == nil)
    {
        _ENTERPRISE_NUMBER39 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER39;
}

+(TaskField *)ENTERPRISE_NUMBER40
{
    if (_ENTERPRISE_NUMBER40 == nil)
    {
        _ENTERPRISE_NUMBER40 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_NUMBER40;
}

+(TaskField *)ENTERPRISE_TEXT1
{
    if (_ENTERPRISE_TEXT1 == nil)
    {
        _ENTERPRISE_TEXT1 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT1;
}

+(TaskField *)ENTERPRISE_TEXT2
{
    if (_ENTERPRISE_TEXT2 == nil)
    {
        _ENTERPRISE_TEXT2 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT2;
}

+(TaskField *)ENTERPRISE_TEXT3
{
    if (_ENTERPRISE_TEXT3 == nil)
    {
        _ENTERPRISE_TEXT3 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT3;
}

+(TaskField *)ENTERPRISE_TEXT4
{
    if (_ENTERPRISE_TEXT4 == nil)
    {
        _ENTERPRISE_TEXT4 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT4;
}

+(TaskField *)ENTERPRISE_TEXT5
{
    if (_ENTERPRISE_TEXT5 == nil)
    {
        _ENTERPRISE_TEXT5 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT5;
}

+(TaskField *)ENTERPRISE_TEXT6
{
    if (_ENTERPRISE_TEXT6 == nil)
    {
        _ENTERPRISE_TEXT6 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT6;
}

+(TaskField *)ENTERPRISE_TEXT7
{
    if (_ENTERPRISE_TEXT7 == nil)
    {
        _ENTERPRISE_TEXT7 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT7;
}

+(TaskField *)ENTERPRISE_TEXT8
{
    if (_ENTERPRISE_TEXT8 == nil)
    {
        _ENTERPRISE_TEXT8 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT8;
}

+(TaskField *)ENTERPRISE_TEXT9
{
    if (_ENTERPRISE_TEXT9 == nil)
    {
        _ENTERPRISE_TEXT9 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT9;
}

+(TaskField *)ENTERPRISE_TEXT10
{
    if (_ENTERPRISE_TEXT10 == nil)
    {
        _ENTERPRISE_TEXT10 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT10;
}

+(TaskField *)ENTERPRISE_TEXT11
{
    if (_ENTERPRISE_TEXT11 == nil)
    {
        _ENTERPRISE_TEXT11 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT11;
}

+(TaskField *)ENTERPRISE_TEXT12
{
    if (_ENTERPRISE_TEXT12 == nil)
    {
        _ENTERPRISE_TEXT12 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT12;
}

+(TaskField *)ENTERPRISE_TEXT13
{
    if (_ENTERPRISE_TEXT13 == nil)
    {
        _ENTERPRISE_TEXT13 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT13;
}

+(TaskField *)ENTERPRISE_TEXT14
{
    if (_ENTERPRISE_TEXT14 == nil)
    {
        _ENTERPRISE_TEXT14 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT14;
}

+(TaskField *)ENTERPRISE_TEXT15
{
    if (_ENTERPRISE_TEXT15 == nil)
    {
        _ENTERPRISE_TEXT15 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT15;
}

+(TaskField *)ENTERPRISE_TEXT16
{
    if (_ENTERPRISE_TEXT16 == nil)
    {
        _ENTERPRISE_TEXT16 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT16;
}

+(TaskField *)ENTERPRISE_TEXT17
{
    if (_ENTERPRISE_TEXT17 == nil)
    {
        _ENTERPRISE_TEXT17 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT17;
}

+(TaskField *)ENTERPRISE_TEXT18
{
    if (_ENTERPRISE_TEXT18 == nil)
    {
        _ENTERPRISE_TEXT18 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT18;
}

+(TaskField *)ENTERPRISE_TEXT19
{
    if (_ENTERPRISE_TEXT19 == nil)
    {
        _ENTERPRISE_TEXT19 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT19;
}

+(TaskField *)ENTERPRISE_TEXT20
{
    if (_ENTERPRISE_TEXT20 == nil)
    {
        _ENTERPRISE_TEXT20 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT20;
}

+(TaskField *)ENTERPRISE_TEXT21
{
    if (_ENTERPRISE_TEXT21 == nil)
    {
        _ENTERPRISE_TEXT21 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT21;
}

+(TaskField *)ENTERPRISE_TEXT22
{
    if (_ENTERPRISE_TEXT22 == nil)
    {
        _ENTERPRISE_TEXT22 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT22;
}

+(TaskField *)ENTERPRISE_TEXT23
{
    if (_ENTERPRISE_TEXT23 == nil)
    {
        _ENTERPRISE_TEXT23 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT23;
}

+(TaskField *)ENTERPRISE_TEXT24
{
    if (_ENTERPRISE_TEXT24 == nil)
    {
        _ENTERPRISE_TEXT24 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT24;
}

+(TaskField *)ENTERPRISE_TEXT25
{
    if (_ENTERPRISE_TEXT25 == nil)
    {
        _ENTERPRISE_TEXT25 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT25;
}

+(TaskField *)ENTERPRISE_TEXT26
{
    if (_ENTERPRISE_TEXT26 == nil)
    {
        _ENTERPRISE_TEXT26 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT26;
}

+(TaskField *)ENTERPRISE_TEXT27
{
    if (_ENTERPRISE_TEXT27 == nil)
    {
        _ENTERPRISE_TEXT27 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT27;
}

+(TaskField *)ENTERPRISE_TEXT28
{
    if (_ENTERPRISE_TEXT28 == nil)
    {
        _ENTERPRISE_TEXT28 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT28;
}

+(TaskField *)ENTERPRISE_TEXT29
{
    if (_ENTERPRISE_TEXT29 == nil)
    {
        _ENTERPRISE_TEXT29 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT29;
}

+(TaskField *)ENTERPRISE_TEXT30
{
    if (_ENTERPRISE_TEXT30 == nil)
    {
        _ENTERPRISE_TEXT30 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT30;
}

+(TaskField *)ENTERPRISE_TEXT31
{
    if (_ENTERPRISE_TEXT31 == nil)
    {
        _ENTERPRISE_TEXT31 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT31;
}

+(TaskField *)ENTERPRISE_TEXT32
{
    if (_ENTERPRISE_TEXT32 == nil)
    {
        _ENTERPRISE_TEXT32 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT32;
}

+(TaskField *)ENTERPRISE_TEXT33
{
    if (_ENTERPRISE_TEXT33 == nil)
    {
        _ENTERPRISE_TEXT33 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT33;
}

+(TaskField *)ENTERPRISE_TEXT34
{
    if (_ENTERPRISE_TEXT34 == nil)
    {
        _ENTERPRISE_TEXT34 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT34;
}

+(TaskField *)ENTERPRISE_TEXT35
{
    if (_ENTERPRISE_TEXT35 == nil)
    {
        _ENTERPRISE_TEXT35 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT35;
}

+(TaskField *)ENTERPRISE_TEXT36
{
    if (_ENTERPRISE_TEXT36 == nil)
    {
        _ENTERPRISE_TEXT36 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT36;
}

+(TaskField *)ENTERPRISE_TEXT37
{
    if (_ENTERPRISE_TEXT37 == nil)
    {
        _ENTERPRISE_TEXT37 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT37;
}

+(TaskField *)ENTERPRISE_TEXT38
{
    if (_ENTERPRISE_TEXT38 == nil)
    {
        _ENTERPRISE_TEXT38 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT38;
}

+(TaskField *)ENTERPRISE_TEXT39
{
    if (_ENTERPRISE_TEXT39 == nil)
    {
        _ENTERPRISE_TEXT39 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT39;
}

+(TaskField *)ENTERPRISE_TEXT40
{
    if (_ENTERPRISE_TEXT40 == nil)
    {
        _ENTERPRISE_TEXT40 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_TEXT40;
}

+(TaskField *)COMPLETE_THROUGH
{
    if (_COMPLETE_THROUGH == nil)
    {
        _COMPLETE_THROUGH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _COMPLETE_THROUGH;
}

+(TaskField *)SUMMARY_PROGRESS
{
    if (_SUMMARY_PROGRESS == nil)
    {
        _SUMMARY_PROGRESS = [[TaskField alloc]init:[DataType DATE]];
    }
    return _SUMMARY_PROGRESS;
}

+(TaskField *)GUID
{
    if (_GUID == nil)
    {
        _GUID = [[TaskField alloc]init:[DataType GUID]];
    }
    return _GUID;
}

+(TaskField *)ACTIVE
{
    if (_ACTIVE == nil)
    {
        _ACTIVE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ACTIVE;
} 

+(TaskField *)TASK_MODE
{
    if (_TASK_MODE == nil)
    {
        _TASK_MODE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TASK_MODE;
}

+(TaskField *)ASSIGNMENT_OWNER
{
    if (_ASSIGNMENT_OWNER == nil)
    {
        _ASSIGNMENT_OWNER = [[TaskField alloc]init:[DataType STRING]];
    }    
    return _ASSIGNMENT_OWNER;
}

+(TaskField *)BASELINE_BUDGET_COST
{
    if (_BASELINE_BUDGET_COST == nil)
    {
        _BASELINE_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE_BUDGET_COST;
}

+(TaskField *)BASELINE_BUDGET_WORK
{
    if (_BASELINE_BUDGET_WORK == nil)
    {
        _BASELINE_BUDGET_WORK = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _BASELINE_BUDGET_WORK;
}

+(TaskField *)BASELINE_DELIVERABLE_FINISH
{
    if (_BASELINE_DELIVERABLE_FINISH == nil)
    {
        _BASELINE_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE_DELIVERABLE_START
{
    if (_BASELINE_DELIVERABLE_START == nil)
    {
        _BASELINE_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE_DELIVERABLE_START;
}

+(TaskField *)BASELINE_ESTIMATED_DURATION
{
    if (_BASELINE_ESTIMATED_DURATION == nil)
    {
        _BASELINE_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE_DURATION_UNITS]];
    }
    return _BASELINE_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE_ESTIMATED_START
{
    if (_BASELINE_ESTIMATED_START == nil)
    {
        _BASELINE_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE_ESTIMATED_START;
}

+(TaskField *)BASELINE_ESTIMATED_FINISH
{
    if (_BASELINE_ESTIMATED_FINISH == nil)
    {
        _BASELINE_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE_FIXED_COST
{
    if (_BASELINE_FIXED_COST == nil)
    {
        _BASELINE_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE_FIXED_COST;
}

+(TaskField *)BASELINE_FIXED_COST_ACCRUAL
{
    if (_BASELINE_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE1_ESTIMATED_START
{
    if (_BASELINE1_ESTIMATED_START == nil)
    {
        _BASELINE1_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_ESTIMATED_START;
}

+(TaskField *)BASELINE1_ESTIMATED_FINISH
{
    if (_BASELINE1_ESTIMATED_FINISH == nil)
    {
        _BASELINE1_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE1_ESTIMATED_DURATION
{
    if (_BASELINE1_ESTIMATED_DURATION == nil)
    {
        _BASELINE1_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE1_DURATION_UNITS]];
    }
    return _BASELINE1_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE1_FIXED_COST
{
    if (_BASELINE1_FIXED_COST == nil)
    {
        _BASELINE1_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE1_FIXED_COST;
}

+(TaskField *)BASELINE1_FIXED_COST_ACCRUAL
{
    if (_BASELINE1_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE1_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE1_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE1_BUDGET_COST
{
    if (_BASELINE1_BUDGET_COST == nil)
    {
        _BASELINE1_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE1_BUDGET_COST;
}

+(TaskField *)BASELINE1_BUDGET_WORK
{
    if (_BASELINE1_BUDGET_WORK == nil)
    {
        _BASELINE1_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE1_BUDGET_WORK;
}

+(TaskField *)BASELINE1_DELIVERABLE_FINISH
{
    if (_BASELINE1_DELIVERABLE_FINISH == nil)
    {
        _BASELINE1_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE1_DELIVERABLE_START
{
    if (_BASELINE1_DELIVERABLE_START == nil)
    {
        _BASELINE1_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE1_DELIVERABLE_START;
}

+(TaskField *)BASELINE2_ESTIMATED_START
{
    if (_BASELINE2_ESTIMATED_START == nil)
    {
        _BASELINE2_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_ESTIMATED_START;
}

+(TaskField *)BASELINE2_ESTIMATED_FINISH
{
    if (_BASELINE2_ESTIMATED_FINISH == nil)
    {
        _BASELINE2_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE2_ESTIMATED_DURATION
{
    if (_BASELINE2_ESTIMATED_DURATION == nil)
    {
        _BASELINE2_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE2_DURATION_UNITS]];
    }
    return _BASELINE2_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE2_FIXED_COST
{
    if (_BASELINE2_FIXED_COST == nil)
    {
        _BASELINE2_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE2_FIXED_COST;
}

+(TaskField *)BASELINE2_FIXED_COST_ACCRUAL
{
    if (_BASELINE2_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE2_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE2_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE2_BUDGET_COST
{
    if (_BASELINE2_BUDGET_COST == nil)
    {
        _BASELINE2_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE2_BUDGET_COST;
}

+(TaskField *)BASELINE2_BUDGET_WORK
{
    if (_BASELINE2_BUDGET_WORK == nil)
    {
        _BASELINE2_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE2_BUDGET_WORK;
}

+(TaskField *)BASELINE2_DELIVERABLE_FINISH
{
    if (_BASELINE2_DELIVERABLE_FINISH == nil)
    {
        _BASELINE2_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE2_DELIVERABLE_START
{
    if (_BASELINE2_DELIVERABLE_START == nil)
    {
        _BASELINE2_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE2_DELIVERABLE_START;
}

+(TaskField *)BASELINE3_ESTIMATED_START
{
    if (_BASELINE3_ESTIMATED_START == nil)
    {
        _BASELINE3_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_ESTIMATED_START;
}

+(TaskField *)BASELINE3_ESTIMATED_FINISH
{
    if (_BASELINE3_ESTIMATED_FINISH == nil)
    {
        _BASELINE3_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE3_ESTIMATED_DURATION
{
    if (_BASELINE3_ESTIMATED_DURATION == nil)
    {
        _BASELINE3_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE3_DURATION_UNITS]];
    }
    return _BASELINE3_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE3_FIXED_COST
{
    if (_BASELINE3_FIXED_COST == nil)
    {
        _BASELINE3_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE3_FIXED_COST;
}

+(TaskField *)BASELINE3_FIXED_COST_ACCRUAL
{
    if (_BASELINE3_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE3_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE3_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE3_BUDGET_COST
{
    if (_BASELINE3_BUDGET_COST == nil)
    {
        _BASELINE3_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE3_BUDGET_COST;
}

+(TaskField *)BASELINE3_BUDGET_WORK
{
    if (_BASELINE3_BUDGET_WORK == nil)
    {
        _BASELINE3_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE3_BUDGET_WORK;
}

+(TaskField *)BASELINE3_DELIVERABLE_FINISH
{
    if (_BASELINE3_DELIVERABLE_FINISH == nil)
    {
        _BASELINE3_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE3_DELIVERABLE_START
{
    if (_BASELINE3_DELIVERABLE_START == nil)
    {
        _BASELINE3_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE3_DELIVERABLE_START;
}

+(TaskField *)BASELINE4_ESTIMATED_START
{
    if (_BASELINE4_ESTIMATED_START == nil)
    {
        _BASELINE4_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_ESTIMATED_START;
}

+(TaskField *)BASELINE4_ESTIMATED_FINISH
{
    if (_BASELINE4_ESTIMATED_FINISH == nil)
    {
        _BASELINE4_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE4_ESTIMATED_DURATION
{
    if (_BASELINE4_ESTIMATED_DURATION == nil)
    {
        _BASELINE4_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE4_DURATION_UNITS]];
    }
    return _BASELINE4_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE4_FIXED_COST
{
    if (_BASELINE4_FIXED_COST == nil)
    {
        _BASELINE4_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE4_FIXED_COST;
}

+(TaskField *)BASELINE4_FIXED_COST_ACCRUAL
{
    if (_BASELINE4_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE4_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE4_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE4_BUDGET_COST
{
    if (_BASELINE4_BUDGET_COST == nil)
    {
        _BASELINE4_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE4_BUDGET_COST;
}

+(TaskField *)BASELINE4_BUDGET_WORK
{
    if (_BASELINE4_BUDGET_WORK == nil)
    {
        _BASELINE4_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE4_BUDGET_WORK;
}

+(TaskField *)BASELINE4_DELIVERABLE_FINISH
{
    if (_BASELINE4_DELIVERABLE_FINISH == nil)
    {
        _BASELINE4_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE4_DELIVERABLE_START
{
    if (_BASELINE4_DELIVERABLE_START == nil)
    {
        _BASELINE4_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE4_DELIVERABLE_START;
}

+(TaskField *)BASELINE5_ESTIMATED_START
{
    if (_BASELINE5_ESTIMATED_START == nil)
    {
        _BASELINE5_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_ESTIMATED_START;
}

+(TaskField *)BASELINE5_ESTIMATED_FINISH
{
    if (_BASELINE5_ESTIMATED_FINISH == nil)
    {
        _BASELINE5_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE5_ESTIMATED_DURATION
{
    if (_BASELINE5_ESTIMATED_DURATION == nil)
    {
        _BASELINE5_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE5_DURATION_UNITS]];
    }
    return _BASELINE5_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE5_FIXED_COST
{
    if (_BASELINE5_FIXED_COST == nil)
    {
        _BASELINE5_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE5_FIXED_COST;
}

+(TaskField *)BASELINE5_FIXED_COST_ACCRUAL
{
    if (_BASELINE5_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE5_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE5_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE5_BUDGET_COST
{
    if (_BASELINE5_BUDGET_COST == nil)
    {
        _BASELINE5_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE5_BUDGET_COST;
}

+(TaskField *)BASELINE5_BUDGET_WORK
{
    if (_BASELINE5_BUDGET_WORK == nil)
    {
        _BASELINE5_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE5_BUDGET_WORK;
}

+(TaskField *)BASELINE5_DELIVERABLE_FINISH
{
    if (_BASELINE5_DELIVERABLE_FINISH == nil)
    {
        _BASELINE5_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE5_DELIVERABLE_START
{
    if (_BASELINE5_DELIVERABLE_START == nil)
    {
        _BASELINE5_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE5_DELIVERABLE_START;
}

+(TaskField *)BASELINE6_ESTIMATED_START
{
    if (_BASELINE6_ESTIMATED_START == nil)
    {
        _BASELINE6_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_ESTIMATED_START;
}

+(TaskField *)BASELINE6_ESTIMATED_FINISH
{
    if (_BASELINE6_ESTIMATED_FINISH == nil)
    {
        _BASELINE6_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE6_ESTIMATED_DURATION
{
    if (_BASELINE6_ESTIMATED_DURATION == nil)
    {
        _BASELINE6_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE6_DURATION_UNITS]];
    }
    return _BASELINE6_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE6_FIXED_COST
{
    if (_BASELINE6_FIXED_COST == nil)
    {
        _BASELINE6_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE6_FIXED_COST;
}

+(TaskField *)BASELINE6_FIXED_COST_ACCRUAL
{
    if (_BASELINE6_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE6_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE6_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE6_BUDGET_COST
{
    if (_BASELINE6_BUDGET_COST == nil)
    {
        _BASELINE6_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE6_BUDGET_COST;
}

+(TaskField *)BASELINE6_BUDGET_WORK
{
    if (_BASELINE6_BUDGET_WORK == nil)
    {
        _BASELINE6_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE6_BUDGET_WORK;
}

+(TaskField *)BASELINE6_DELIVERABLE_FINISH
{
    if (_BASELINE6_DELIVERABLE_FINISH == nil)
    {
        _BASELINE6_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE6_DELIVERABLE_START
{
    if (_BASELINE6_DELIVERABLE_START == nil)
    {
        _BASELINE6_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE6_DELIVERABLE_START;
}

+(TaskField *)BASELINE7_ESTIMATED_START
{
    if (_BASELINE7_ESTIMATED_START == nil)
    {
        _BASELINE7_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_ESTIMATED_START;
}

+(TaskField *)BASELINE7_ESTIMATED_FINISH
{
    if (_BASELINE7_ESTIMATED_FINISH == nil)
    {
        _BASELINE7_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE7_ESTIMATED_DURATION
{
    if (_BASELINE7_ESTIMATED_DURATION == nil)
    {
        _BASELINE7_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE7_DURATION_UNITS]];
    }
    return _BASELINE7_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE7_FIXED_COST
{
    if (_BASELINE7_FIXED_COST == nil)
    {
        _BASELINE7_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE7_FIXED_COST;
}

+(TaskField *)BASELINE7_FIXED_COST_ACCRUAL
{
    if (_BASELINE7_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE7_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE7_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE7_BUDGET_COST
{
    if (_BASELINE7_BUDGET_COST == nil)
    {
        _BASELINE7_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE7_BUDGET_COST;
}

+(TaskField *)BASELINE7_BUDGET_WORK
{
    if (_BASELINE7_BUDGET_WORK == nil)
    {
        _BASELINE7_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE7_BUDGET_WORK;
}

+(TaskField *)BASELINE7_DELIVERABLE_FINISH
{
    if (_BASELINE7_DELIVERABLE_FINISH == nil)
    {
        _BASELINE7_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE7_DELIVERABLE_START
{
    if (_BASELINE7_DELIVERABLE_START == nil)
    {
        _BASELINE7_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE7_DELIVERABLE_START;
}

+(TaskField *)BASELINE8_ESTIMATED_START
{
    if (_BASELINE8_ESTIMATED_START == nil)
    {
        _BASELINE8_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE8_ESTIMATED_START;
}

+(TaskField *)BASELINE8_ESTIMATED_FINISH
{
    if (_BASELINE8_ESTIMATED_FINISH == nil)
    {
        _BASELINE8_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE8_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE8_ESTIMATED_DURATION
{
    if (_BASELINE8_ESTIMATED_DURATION == nil)
    {
        _BASELINE8_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE8_DURATION_UNITS]];
    }
    return _BASELINE8_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE8_FIXED_COST
{
    if (_BASELINE8_FIXED_COST == nil)
    {
        _BASELINE8_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE8_FIXED_COST;
}

+(TaskField *)BASELINE8_FIXED_COST_ACCRUAL
{
    if (_BASELINE8_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE8_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE8_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE8_BUDGET_COST
{
    if (_BASELINE8_BUDGET_COST == nil)
    {
        _BASELINE8_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE8_BUDGET_COST;
}

+(TaskField *)BASELINE8_BUDGET_WORK
{
    if (_BASELINE8_BUDGET_WORK == nil)
    {
        _BASELINE8_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE8_BUDGET_WORK;
}

+(TaskField *)BASELINE8_DELIVERABLE_FINISH
{
    if (_BASELINE8_DELIVERABLE_FINISH == nil)
    {
        _BASELINE8_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE8_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE8_DELIVERABLE_START
{
    if (_BASELINE8_DELIVERABLE_START == nil)
    {
        _BASELINE8_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE8_DELIVERABLE_START;
}

+(TaskField *)BASELINE9_ESTIMATED_START
{
    if (_BASELINE9_ESTIMATED_START == nil)
    {
        _BASELINE9_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_ESTIMATED_START;
}

+(TaskField *)BASELINE9_ESTIMATED_FINISH
{
    if (_BASELINE9_ESTIMATED_FINISH == nil)
    {
        _BASELINE9_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE9_ESTIMATED_DURATION
{
    if (_BASELINE9_ESTIMATED_DURATION == nil)
    {
        _BASELINE9_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE9_DURATION_UNITS]];
    }
    return _BASELINE9_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE9_FIXED_COST
{
    if (_BASELINE9_FIXED_COST == nil)
    {
        _BASELINE9_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE9_FIXED_COST;
}

+(TaskField *)BASELINE9_FIXED_COST_ACCRUAL
{
    if (_BASELINE9_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE9_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE9_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE9_BUDGET_COST
{
    if (_BASELINE9_BUDGET_COST == nil)
    {
        _BASELINE9_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE9_BUDGET_COST;
}

+(TaskField *)BASELINE9_BUDGET_WORK
{
    if (_BASELINE9_BUDGET_WORK == nil)
    {
        _BASELINE9_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE9_BUDGET_WORK;
}

+(TaskField *)BASELINE9_DELIVERABLE_FINISH
{
    if (_BASELINE9_DELIVERABLE_FINISH == nil)
    {
        _BASELINE9_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE9_DELIVERABLE_START
{
    if (_BASELINE9_DELIVERABLE_START == nil)
    {
        _BASELINE9_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE9_DELIVERABLE_START;
}

+(TaskField *)BASELINE10_ESTIMATED_START
{
    if (_BASELINE10_ESTIMATED_START == nil)
    {
        _BASELINE10_ESTIMATED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE10_ESTIMATED_START;
}

+(TaskField *)BASELINE10_ESTIMATED_FINISH
{
    if (_BASELINE10_ESTIMATED_FINISH == nil)
    {
        _BASELINE10_ESTIMATED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE10_ESTIMATED_FINISH;
}

+(TaskField *)BASELINE10_ESTIMATED_DURATION
{
    if (_BASELINE10_ESTIMATED_DURATION == nil)
    {
        _BASELINE10_ESTIMATED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField BASELINE10_DURATION_UNITS]];
    }
    return _BASELINE10_ESTIMATED_DURATION;
}

+(TaskField *)BASELINE10_FIXED_COST
{
    if (_BASELINE10_FIXED_COST == nil)
    {
        _BASELINE10_FIXED_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE10_FIXED_COST;
}

+(TaskField *)BASELINE10_FIXED_COST_ACCRUAL
{
    if (_BASELINE10_FIXED_COST_ACCRUAL == nil)
    {
        _BASELINE10_FIXED_COST_ACCRUAL = [[TaskField alloc]init:[DataType ACCRUE]];
    }
    return _BASELINE10_FIXED_COST_ACCRUAL;
}

+(TaskField *)BASELINE10_BUDGET_COST
{
    if (_BASELINE10_BUDGET_COST == nil)
    {
        _BASELINE10_BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE10_BUDGET_COST;
}

+(TaskField *)BASELINE10_BUDGET_WORK
{
    if (_BASELINE10_BUDGET_WORK == nil)
    {
        _BASELINE10_BUDGET_WORK = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BASELINE10_BUDGET_WORK;
}

+(TaskField *)BASELINE10_DELIVERABLE_FINISH
{
    if (_BASELINE10_DELIVERABLE_FINISH == nil)
    {
        _BASELINE10_DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE10_DELIVERABLE_FINISH;
}

+(TaskField *)BASELINE10_DELIVERABLE_START
{
    if (_BASELINE10_DELIVERABLE_START == nil)
    {
        _BASELINE10_DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _BASELINE10_DELIVERABLE_START;
}

+(TaskField *)CPI
{
    if (_CPI == nil)
    {
        _CPI = [[TaskField alloc]init:[DataType STRING]];
    }
    return _CPI;
}

+(TaskField *)CVPERCENT
{
    if (_CVPERCENT == nil)
    {
        _CVPERCENT = [[TaskField alloc]init:[DataType PERCENTAGE]];
    }
    return _CVPERCENT;
}

+(TaskField *)DELIVERABLE_FINISH
{
    if (_DELIVERABLE_FINISH == nil)
    {
        _DELIVERABLE_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DELIVERABLE_FINISH;
}

+(TaskField *)DELIVERABLE_GUID
{
    if (_DELIVERABLE_GUID == nil)
    {
        _DELIVERABLE_GUID = [[TaskField alloc]init:[DataType GUID]];
    }
    return _DELIVERABLE_GUID;
}

+(TaskField *)DELIVERABLE_NAME
{
    if (_DELIVERABLE_NAME == nil)
    {
        _DELIVERABLE_NAME = [[TaskField alloc]init:[DataType STRING]];
    }
    return _DELIVERABLE_NAME;
}

+(TaskField *)DELIVERABLE_START
{
    if (_DELIVERABLE_START == nil)
    {
        _DELIVERABLE_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _DELIVERABLE_START;
}

+(TaskField *)DELIVERABLE_TYPE
{
    if (_DELIVERABLE_TYPE == nil)
    {
        _DELIVERABLE_TYPE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _DELIVERABLE_TYPE;
}

+(TaskField *)EAC
{
    if (_EAC == nil)
    {
        _EAC = [[TaskField alloc]init:[DataType STRING]];
    }
    return _EAC;
}

+(TaskField *)EARNED_VALUE_METHOD
{
    if (_EARNED_VALUE_METHOD == nil)
    {
        _EARNED_VALUE_METHOD = [[TaskField alloc]init:[DataType STRING]];
    }
    return _EARNED_VALUE_METHOD;
}

+(TaskField *)ERROR_MESSAGE
{
    if (_ERROR_MESSAGE == nil)
    {
        _ERROR_MESSAGE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ERROR_MESSAGE;
}

+(TaskField *)HIDE_BAR
{
    if (_HIDE_BAR == nil)
    {
        _HIDE_BAR = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _HIDE_BAR;
}

+(TaskField *)IGNORE_WARNINGS
{
    if (_IGNORE_WARNINGS == nil)
    {
        _IGNORE_WARNINGS = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _IGNORE_WARNINGS;
}

+(TaskField *)PEAK
{
    if (_PEAK == nil)
    {
        _PEAK = [[TaskField alloc]init:[DataType STRING]];
    }
    return _PEAK;
}

+(TaskField *)PHYSICAL_PERCENT_COMPLETE
{
    if (_PHYSICAL_PERCENT_COMPLETE == nil)
    {
        _PHYSICAL_PERCENT_COMPLETE = [[TaskField alloc]init:[DataType SHORT]];
    }
    return _PHYSICAL_PERCENT_COMPLETE;
}

+(TaskField *)PLACEHOLDER
{
    if (_PLACEHOLDER == nil)
    {
        _PLACEHOLDER = [[TaskField alloc]init:[DataType STRING]];
    }
    return _PLACEHOLDER;
}

+(TaskField *)PUBLISH
{
    if (_PUBLISH == nil)
    {
        _PUBLISH = [[TaskField alloc]init:[DataType STRING]];
    }
    return _PUBLISH;
}

+(TaskField *)REQUEST_DEMAND
{
    if (_REQUEST_DEMAND == nil)
    {
        _REQUEST_DEMAND = [[TaskField alloc]init:[DataType STRING]];
    }
    return _REQUEST_DEMAND;
}

+(TaskField *)SCHEDULED_DURATION
{
    if (_SCHEDULED_DURATION == nil)
    {
        _SCHEDULED_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField ACTUAL_DURATION_UNITS]];
    }
    return _SCHEDULED_DURATION;
}

+(TaskField *)SCHEDULED_FINISH
{
    if (_SCHEDULED_FINISH == nil)
    {
        _SCHEDULED_FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _SCHEDULED_FINISH;
}

+(TaskField *)SCHEDULED_START
{
    if (_SCHEDULED_START == nil)
    {
        _SCHEDULED_START = [[TaskField alloc]init:[DataType DATE]];
    }
    return _SCHEDULED_START;
}

+(TaskField *)SPI
{
    if (_SPI == nil)
    {
        _SPI = [[TaskField alloc]init:[DataType STRING]];
    }
    return _SPI;
}

+(TaskField *)STATUS
{
    if (_STATUS == nil)
    {
        _STATUS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _STATUS;
}

+(TaskField *)STATUS_INDICATOR
{
    if (_STATUS_INDICATOR == nil)
    {
        _STATUS_INDICATOR = [[TaskField alloc]init:[DataType STRING]];
    }
    return _STATUS_INDICATOR;
}

+(TaskField *)STATUS_MANAGER
{
    if (_STATUS_MANAGER == nil)
    {
        _STATUS_MANAGER = [[TaskField alloc]init:[DataType STRING]];
    }
    return _STATUS_MANAGER;
}

+(TaskField *)SVPERCENT
{
    if (_SVPERCENT == nil)
    {
        _SVPERCENT = [[TaskField alloc]init:[DataType PERCENTAGE]];
    }
    return _SVPERCENT;
}

+(TaskField *)TASK_CALENDAR
{
    if (_TASK_CALENDAR == nil)
    {
        _TASK_CALENDAR = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TASK_CALENDAR;
}

+(TaskField *)TASK_CALENDAR_GUID
{
    if (_TASK_CALENDAR_GUID == nil)
    {
        _TASK_CALENDAR_GUID = [[TaskField alloc]init:[DataType GUID]];
    }
    return _TASK_CALENDAR_GUID;
}

+(TaskField *)TCPI
{
    if (_TCPI == nil)
    {
        _TCPI = [[TaskField alloc]init:[DataType STRING]];
    }
    return _TCPI;
}

+(TaskField *)WARNING
{
    if (_WARNING == nil)
    {
        _WARNING = [[TaskField alloc]init:[DataType STRING]];
    }
    return _WARNING;
}

+(TaskField *)UNAVAILABLE
{
    if (_UNAVAILABLE == nil)
    {
        _UNAVAILABLE = [[TaskField alloc]init:[DataType STRING]];
    }
    return _UNAVAILABLE;
}

+(TaskField *)START_TEXT
{
    if (_START_TEXT == nil)
    {
        _START_TEXT = [[TaskField alloc]init:[DataType STRING]];
    }
    return _START_TEXT;
}

+(TaskField *)FINISH_TEXT
{
    if (_FINISH_TEXT == nil)
    {
        _FINISH_TEXT = [[TaskField alloc]init:[DataType STRING]];
    }
    return _FINISH_TEXT;
}

+(TaskField *)DURATION_TEXT
{
    if (_DURATION_TEXT == nil)
    {
        _DURATION_TEXT = [[TaskField alloc]init:[DataType STRING]];
    }
    return _DURATION_TEXT;
}

+(TaskField *)MANUAL_DURATION_UNITS
{
    if (_MANUAL_DURATION_UNITS == nil)
    {
        _MANUAL_DURATION_UNITS = [[TaskField alloc]init:[DataType TIME_UNITS]];
    }
    return _MANUAL_DURATION_UNITS;
}

+(TaskField *)MANUAL_DURATION
{
    if (_MANUAL_DURATION == nil)
    {
        _MANUAL_DURATION = [[TaskField alloc]init:[DataType DURATION] withUnitsType:[TaskField MANUAL_DURATION_UNITS]];
    }
    return _MANUAL_DURATION;
}

+(TaskField *)SUBPROJECT_TASKS_UNIQUEID_OFFSET
{
    if (_SUBPROJECT_TASKS_UNIQUEID_OFFSET == nil)
    {
        _SUBPROJECT_TASKS_UNIQUEID_OFFSET = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _SUBPROJECT_TASKS_UNIQUEID_OFFSET;
}

+(TaskField *)SUBPROJECT_UNIQUE_TASK_ID
{
    if (_SUBPROJECT_UNIQUE_TASK_ID == nil)
    {
        _SUBPROJECT_UNIQUE_TASK_ID = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _SUBPROJECT_UNIQUE_TASK_ID;
}

+(TaskField *)SUBPROJECT_TASK_ID
{
    if (_SUBPROJECT_TASK_ID == nil)
    {
        _SUBPROJECT_TASK_ID = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _SUBPROJECT_TASK_ID;
}

+(TaskField *)HYPERLINK_DATA
{
    if (_HYPERLINK_DATA == nil)
    {
        _HYPERLINK_DATA = [[TaskField alloc]init:[DataType BINARY]];
    }
    return _HYPERLINK_DATA;
}

+(TaskField *)RECURRING_DATA
{
    if (_RECURRING_DATA == nil)
    {
        _RECURRING_DATA = [[TaskField alloc]init:[DataType BINARY]];
    }
    return _RECURRING_DATA;
}

+(TaskField *)OUTLINE_CODE1_INDEX
{
    if (_OUTLINE_CODE1_INDEX == nil)
    {
        _OUTLINE_CODE1_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE1_INDEX;
}

+(TaskField *)OUTLINE_CODE2_INDEX
{
    if (_OUTLINE_CODE2_INDEX == nil)
    {
        _OUTLINE_CODE2_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE2_INDEX;
}

+(TaskField *)OUTLINE_CODE3_INDEX
{
    if (_OUTLINE_CODE3_INDEX == nil)
    {
        _OUTLINE_CODE3_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE3_INDEX;
}

+(TaskField *)OUTLINE_CODE4_INDEX
{
    if (_OUTLINE_CODE4_INDEX == nil)
    {
        _OUTLINE_CODE4_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE4_INDEX;
}

+(TaskField *)OUTLINE_CODE5_INDEX
{
    if (_OUTLINE_CODE5_INDEX == nil)
    {
        _OUTLINE_CODE5_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE5_INDEX;
}

+(TaskField *)OUTLINE_CODE6_INDEX
{
    if (_OUTLINE_CODE6_INDEX == nil)
    {
        _OUTLINE_CODE6_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE6_INDEX;
}

+(TaskField *)OUTLINE_CODE7_INDEX
{
    if (_OUTLINE_CODE7_INDEX == nil)
    {
        _OUTLINE_CODE7_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE7_INDEX;
}

+(TaskField *)OUTLINE_CODE8_INDEX
{
    if (_OUTLINE_CODE8_INDEX == nil)
    {
        _OUTLINE_CODE8_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE8_INDEX;
}

+(TaskField *)OUTLINE_CODE9_INDEX
{
    if (_OUTLINE_CODE9_INDEX == nil)
    {
        _OUTLINE_CODE9_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE9_INDEX;
}

+(TaskField *)OUTLINE_CODE10_INDEX
{
    if (_OUTLINE_CODE10_INDEX == nil)
    {
        _OUTLINE_CODE10_INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _OUTLINE_CODE10_INDEX;
}

+(TaskField *)ENTERPRISE_DATA
{
    if (_ENTERPRISE_DATA == nil)
    {
        _ENTERPRISE_DATA = [[TaskField alloc]init:[DataType BINARY]];
    }
    return _ENTERPRISE_DATA;
}

+(TaskField *)PARENT_TASK_UNIQUE_ID
{
    if (_PARENT_TASK_UNIQUE_ID == nil)
    {
        _PARENT_TASK_UNIQUE_ID = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _PARENT_TASK_UNIQUE_ID;
}

+(TaskField *)CALENDAR_UNIQUE_ID
{
    if (_CALENDAR_UNIQUE_ID == nil)
    {
        _CALENDAR_UNIQUE_ID = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _CALENDAR_UNIQUE_ID;
}

+(TaskField *)FIXED_DURATION
{
    if (_FIXED_DURATION == nil)
    {
        _FIXED_DURATION = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _FIXED_DURATION;
}

+(TaskField *)RESUME_NO_EARLIER_THAN
{
    if (_RESUME_NO_EARLIER_THAN == nil)
    {
        _RESUME_NO_EARLIER_THAN = [[TaskField alloc]init:[DataType DATE]];
    }
    return _RESUME_NO_EARLIER_THAN;
}

+(TaskField *)PARENT_TASK
{
    if (_PARENT_TASK == nil)
    {
        _PARENT_TASK = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _PARENT_TASK;
}

+(TaskField *)INDEX
{
    if (_INDEX == nil)
    {
        _INDEX = [[TaskField alloc]init:[DataType INTEGER]];
    }
    return _INDEX;
}

+(TaskField *)DURATION1_ESTIMATED
{
    if (_DURATION1_ESTIMATED == nil)
    {
        _DURATION1_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION1_ESTIMATED;
}

+(TaskField *)DURATION2_ESTIMATED
{
    if (_DURATION2_ESTIMATED == nil)
    {
        _DURATION2_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION2_ESTIMATED;
}

+(TaskField *)DURATION3_ESTIMATED
{
    if (_DURATION3_ESTIMATED == nil)
    {
        _DURATION3_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION3_ESTIMATED;
}

+(TaskField *)DURATION4_ESTIMATED
{
    if (_DURATION4_ESTIMATED == nil)
    {
        _DURATION4_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION4_ESTIMATED;
}

+(TaskField *)DURATION5_ESTIMATED
{
    if (_DURATION5_ESTIMATED == nil)
    {
        _DURATION5_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION5_ESTIMATED;
}

+(TaskField *)DURATION6_ESTIMATED
{
    if (_DURATION6_ESTIMATED == nil)
    {
        _DURATION6_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION6_ESTIMATED;
}

+(TaskField *)DURATION7_ESTIMATED
{
    if (_DURATION7_ESTIMATED == nil)
    {
        _DURATION7_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION7_ESTIMATED;
}

+(TaskField *)DURATION8_ESTIMATED
{
    if (_DURATION8_ESTIMATED == nil)
    {
        _DURATION8_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION8_ESTIMATED;
}

+(TaskField *)DURATION9_ESTIMATED
{
    if (_DURATION9_ESTIMATED == nil)
    {
        _DURATION9_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION9_ESTIMATED;
}

+(TaskField *)DURATION10_ESTIMATED
{
    if (_DURATION10_ESTIMATED == nil)
    {
        _DURATION10_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _DURATION10_ESTIMATED;
}

+(TaskField *)BASELINE_DURATION_ESTIMATED
{
    if (_BASELINE_DURATION_ESTIMATED == nil)
    {
        _BASELINE_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE_DURATION_ESTIMATED;
}

+(TaskField *)HYPERLINK_SCREEN_TIP
{
    if (_HYPERLINK_SCREEN_TIP == nil)
    {
        _HYPERLINK_SCREEN_TIP = [[TaskField alloc]init:[DataType STRING]];
    }
    return _HYPERLINK_SCREEN_TIP;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE1
{
    if (_ENTERPRISE_OUTLINE_CODE1 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE1 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE1;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE2
{
    if (_ENTERPRISE_OUTLINE_CODE2 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE2 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE2;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE3
{
    if (_ENTERPRISE_OUTLINE_CODE3 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE3 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE3;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE4
{
    if (_ENTERPRISE_OUTLINE_CODE4 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE4 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE4;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE5
{
    if (_ENTERPRISE_OUTLINE_CODE5 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE5 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE5;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE6
{
    if (_ENTERPRISE_OUTLINE_CODE6 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE6 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE6;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE7
{
    if (_ENTERPRISE_OUTLINE_CODE7 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE7 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE7;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE8
{
    if (_ENTERPRISE_OUTLINE_CODE8 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE8 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE8;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE9
{
    if (_ENTERPRISE_OUTLINE_CODE9 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE9 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE9;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE10
{
    if (_ENTERPRISE_OUTLINE_CODE10 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE10 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE10;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE11
{
    if (_ENTERPRISE_OUTLINE_CODE11 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE11 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE11;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE12
{
    if (_ENTERPRISE_OUTLINE_CODE12 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE12 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE12;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE13
{
    if (_ENTERPRISE_OUTLINE_CODE13 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE13 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE13;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE14
{
    if (_ENTERPRISE_OUTLINE_CODE14 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE14 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE14;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE15
{
    if (_ENTERPRISE_OUTLINE_CODE15 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE15 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE15;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE16
{
    if (_ENTERPRISE_OUTLINE_CODE16 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE16 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE16;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE17
{
    if (_ENTERPRISE_OUTLINE_CODE17 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE17 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE17;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE18
{
    if (_ENTERPRISE_OUTLINE_CODE18 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE18 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE18;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE19
{
    if (_ENTERPRISE_OUTLINE_CODE19 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE19 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE19;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE20
{
    if (_ENTERPRISE_OUTLINE_CODE20 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE20 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE20;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE21
{
    if (_ENTERPRISE_OUTLINE_CODE21 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE21 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE21;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE22
{
    if (_ENTERPRISE_OUTLINE_CODE22 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE22 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE22;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE23
{
    if (_ENTERPRISE_OUTLINE_CODE23 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE23 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE23;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE24
{
    if (_ENTERPRISE_OUTLINE_CODE24 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE24 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE24;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE25
{
    if (_ENTERPRISE_OUTLINE_CODE25 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE25 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE25;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE26
{
    if (_ENTERPRISE_OUTLINE_CODE26 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE26 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE26;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE27
{
    if (_ENTERPRISE_OUTLINE_CODE27 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE27 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE27;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE28
{
    if (_ENTERPRISE_OUTLINE_CODE28 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE28 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE28;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE29
{
    if (_ENTERPRISE_OUTLINE_CODE29 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE29 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE29;
}

+(TaskField *)ENTERPRISE_OUTLINE_CODE30
{
    if (_ENTERPRISE_OUTLINE_CODE30 == nil)
    {
        _ENTERPRISE_OUTLINE_CODE30 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_OUTLINE_CODE30;
}

+(TaskField *)BASELINE1_DURATION_ESTIMATED
{
    if (_BASELINE1_DURATION_ESTIMATED == nil)
    {
        _BASELINE1_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE1_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE2_DURATION_ESTIMATED
{
    if (_BASELINE2_DURATION_ESTIMATED == nil)
    {
        _BASELINE2_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE2_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE3_DURATION_ESTIMATED
{
    if (_BASELINE3_DURATION_ESTIMATED == nil)
    {
        _BASELINE3_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE3_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE4_DURATION_ESTIMATED
{
    if (_BASELINE4_DURATION_ESTIMATED == nil)
    {
        _BASELINE4_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE4_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE5_DURATION_ESTIMATED
{
    if (_BASELINE5_DURATION_ESTIMATED == nil)
    {
        _BASELINE5_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE5_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE6_DURATION_ESTIMATED
{
    if (_BASELINE6_DURATION_ESTIMATED == nil)
    {
        _BASELINE6_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE6_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE7_DURATION_ESTIMATED
{
    if (_BASELINE7_DURATION_ESTIMATED == nil)
    {
        _BASELINE7_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE7_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE8_DURATION_ESTIMATED
{
    if (_BASELINE8_DURATION_ESTIMATED == nil)
    {
        _BASELINE8_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE8_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE9_DURATION_ESTIMATED
{
    if (_BASELINE9_DURATION_ESTIMATED == nil)
    {
        _BASELINE9_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE9_DURATION_ESTIMATED;
}

+(TaskField *)BASELINE10_DURATION_ESTIMATED
{
    if (_BASELINE10_DURATION_ESTIMATED == nil)
    {
        _BASELINE10_DURATION_ESTIMATED = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _BASELINE10_DURATION_ESTIMATED;
}

+(TaskField *)ENTERPRISE_PROJECT_COST1
{
    if (_ENTERPRISE_PROJECT_COST1 == nil)
    {
        _ENTERPRISE_PROJECT_COST1 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST1;
}

+(TaskField *)ENTERPRISE_PROJECT_COST2
{
    if (_ENTERPRISE_PROJECT_COST2 == nil)
    {
        _ENTERPRISE_PROJECT_COST2 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST2;
}

+(TaskField *)ENTERPRISE_PROJECT_COST3
{
    if (_ENTERPRISE_PROJECT_COST3 == nil)
    {
        _ENTERPRISE_PROJECT_COST3 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST3;
}

+(TaskField *)ENTERPRISE_PROJECT_COST4
{
    if (_ENTERPRISE_PROJECT_COST4 == nil)
    {
        _ENTERPRISE_PROJECT_COST4 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST4;
}

+(TaskField *)ENTERPRISE_PROJECT_COST5
{
    if (_ENTERPRISE_PROJECT_COST5 == nil)
    {
        _ENTERPRISE_PROJECT_COST5 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST5;
}

+(TaskField *)ENTERPRISE_PROJECT_COST6
{
    if (_ENTERPRISE_PROJECT_COST6 == nil)
    {
        _ENTERPRISE_PROJECT_COST6 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST6;
}

+(TaskField *)ENTERPRISE_PROJECT_COST7
{
    if (_ENTERPRISE_PROJECT_COST7 == nil)
    {
        _ENTERPRISE_PROJECT_COST7 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST7;
}

+(TaskField *)ENTERPRISE_PROJECT_COST8
{
    if (_ENTERPRISE_PROJECT_COST8 == nil)
    {
        _ENTERPRISE_PROJECT_COST8 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST8;
}

+(TaskField *)ENTERPRISE_PROJECT_COST9
{
    if (_ENTERPRISE_PROJECT_COST9 == nil)
    {
        _ENTERPRISE_PROJECT_COST9 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST9;
}

+(TaskField *)ENTERPRISE_PROJECT_COST10
{
    if (_ENTERPRISE_PROJECT_COST10 == nil)
    {
        _ENTERPRISE_PROJECT_COST10 = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _ENTERPRISE_PROJECT_COST10;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE1
{
    if (_ENTERPRISE_PROJECT_DATE1 == nil)
    {
        _ENTERPRISE_PROJECT_DATE1 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE1;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE2
{
    if (_ENTERPRISE_PROJECT_DATE2 == nil)
    {
        _ENTERPRISE_PROJECT_DATE2 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE2;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE3
{
    if (_ENTERPRISE_PROJECT_DATE3 == nil)
    {
        _ENTERPRISE_PROJECT_DATE3 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE3;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE4
{
    if (_ENTERPRISE_PROJECT_DATE4 == nil)
    {
        _ENTERPRISE_PROJECT_DATE4 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE4;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE5
{
    if (_ENTERPRISE_PROJECT_DATE5 == nil)
    {
        _ENTERPRISE_PROJECT_DATE5 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE5;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE6
{
    if (_ENTERPRISE_PROJECT_DATE6 == nil)
    {
        _ENTERPRISE_PROJECT_DATE6 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE6;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE7
{
    if (_ENTERPRISE_PROJECT_DATE7 == nil)
    {
        _ENTERPRISE_PROJECT_DATE7 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE7;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE8
{
    if (_ENTERPRISE_PROJECT_DATE8 == nil)
    {
        _ENTERPRISE_PROJECT_DATE8 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE8;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE9
{
    if (_ENTERPRISE_PROJECT_DATE9 == nil)
    {
        _ENTERPRISE_PROJECT_DATE9 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE9;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE10
{
    if (_ENTERPRISE_PROJECT_DATE10 == nil)
    {
        _ENTERPRISE_PROJECT_DATE10 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE10;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE11
{
    if (_ENTERPRISE_PROJECT_DATE11 == nil)
    {
        _ENTERPRISE_PROJECT_DATE11 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE11;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE12
{
    if (_ENTERPRISE_PROJECT_DATE12 == nil)
    {
        _ENTERPRISE_PROJECT_DATE12 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE12;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE13
{
    if (_ENTERPRISE_PROJECT_DATE13 == nil)
    {
        _ENTERPRISE_PROJECT_DATE13 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE13;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE14
{
    if (_ENTERPRISE_PROJECT_DATE14 == nil)
    {
        _ENTERPRISE_PROJECT_DATE14 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE14;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE15
{
    if (_ENTERPRISE_PROJECT_DATE15 == nil)
    {
        _ENTERPRISE_PROJECT_DATE15 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE15;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE16
{
    if (_ENTERPRISE_PROJECT_DATE16 == nil)
    {
        _ENTERPRISE_PROJECT_DATE16 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE16;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE17
{
    if (_ENTERPRISE_PROJECT_DATE17 == nil)
    {
        _ENTERPRISE_PROJECT_DATE17 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE17;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE18
{
    if (_ENTERPRISE_PROJECT_DATE18 == nil)
    {
        _ENTERPRISE_PROJECT_DATE18 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE18;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE19
{
    if (_ENTERPRISE_PROJECT_DATE19 == nil)
    {
        _ENTERPRISE_PROJECT_DATE19 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE19;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE20
{
    if (_ENTERPRISE_PROJECT_DATE20 == nil)
    {
        _ENTERPRISE_PROJECT_DATE20 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE20;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE21
{
    if (_ENTERPRISE_PROJECT_DATE21 == nil)
    {
        _ENTERPRISE_PROJECT_DATE21 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE21;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE22
{
    if (_ENTERPRISE_PROJECT_DATE22 == nil)
    {
        _ENTERPRISE_PROJECT_DATE22 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE22;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE23
{
    if (_ENTERPRISE_PROJECT_DATE23 == nil)
    {
        _ENTERPRISE_PROJECT_DATE23 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE23;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE24
{
    if (_ENTERPRISE_PROJECT_DATE24 == nil)
    {
        _ENTERPRISE_PROJECT_DATE24 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE24;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE25
{
    if (_ENTERPRISE_PROJECT_DATE25 == nil)
    {
        _ENTERPRISE_PROJECT_DATE25 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE25;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE26
{
    if (_ENTERPRISE_PROJECT_DATE26 == nil)
    {
        _ENTERPRISE_PROJECT_DATE26 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE26;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE27
{
    if (_ENTERPRISE_PROJECT_DATE27 == nil)
    {
        _ENTERPRISE_PROJECT_DATE27 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE27;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE28
{
    if (_ENTERPRISE_PROJECT_DATE28 == nil)
    {
        _ENTERPRISE_PROJECT_DATE28 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE28;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE29
{
    if (_ENTERPRISE_PROJECT_DATE29 == nil)
    {
        _ENTERPRISE_PROJECT_DATE29 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE29;
}

+(TaskField *)ENTERPRISE_PROJECT_DATE30
{
    if (_ENTERPRISE_PROJECT_DATE30 == nil)
    {
        _ENTERPRISE_PROJECT_DATE30 = [[TaskField alloc]init:[DataType DATE]];
    }
    return _ENTERPRISE_PROJECT_DATE30;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION1
{
    if (_ENTERPRISE_PROJECT_DURATION1 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION1 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION1;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION2
{
    if (_ENTERPRISE_PROJECT_DURATION2 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION2 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION2;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION3
{
    if (_ENTERPRISE_PROJECT_DURATION3 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION3 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION3;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION4
{
    if (_ENTERPRISE_PROJECT_DURATION4 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION4 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION4;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION5
{
    if (_ENTERPRISE_PROJECT_DURATION5 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION5 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION5;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION6
{
    if (_ENTERPRISE_PROJECT_DURATION6 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION6 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION6;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION7
{
    if (_ENTERPRISE_PROJECT_DURATION7 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION7 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION7;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION8
{
    if (_ENTERPRISE_PROJECT_DURATION8 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION8 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION8;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION9
{
    if (_ENTERPRISE_PROJECT_DURATION9 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION9 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION9;
}

+(TaskField *)ENTERPRISE_PROJECT_DURATION10
{
    if (_ENTERPRISE_PROJECT_DURATION10 == nil)
    {
        _ENTERPRISE_PROJECT_DURATION10 = [[TaskField alloc]init:[DataType DURATION]];
    }
    return _ENTERPRISE_PROJECT_DURATION10;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE1
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE1 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE1 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE1;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE2
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE2 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE2 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE2;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE3
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE3 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE3 = [[TaskField alloc]init:[DataType STRING]];
    }
    
    return _ENTERPRISE_PROJECT_OUTLINE_CODE3;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE4
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE4 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE4 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE4;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE5
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE5 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE5 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE5;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE6
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE6 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE6 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE6;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE7
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE7 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE7 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE7;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE8
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE8 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE8 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE8;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE9
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE9 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE9 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE9;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE10
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE10 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE10 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE10;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE11
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE11 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE11 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE11;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE12
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE12 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE12 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE12;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE13
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE13 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE13 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE13;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE14
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE14 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE14 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE14;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE15
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE15 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE15 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE15;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE16
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE16 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE16 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE16;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE17
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE17 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE17 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE17;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE18
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE18 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE18 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE18;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE19
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE19 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE19 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE19;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE20
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE20 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE20 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE20;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE21
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE21 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE21 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE21;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE22
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE22 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE22 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE22;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE23
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE23 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE23 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE23;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE24
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE24 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE24 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE24;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE25
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE25 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE25 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE25;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE26
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE26 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE26 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE26;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE27
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE27 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE27 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE27;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE28
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE28 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE28 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE28;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE29
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE29 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE29 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE29;
}

+(TaskField *)ENTERPRISE_PROJECT_OUTLINE_CODE30
{
    if (_ENTERPRISE_PROJECT_OUTLINE_CODE30 == nil)
    {
        _ENTERPRISE_PROJECT_OUTLINE_CODE30 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_OUTLINE_CODE30;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG1
{
    if (_ENTERPRISE_PROJECT_FLAG1 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG1 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG1;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG2
{
    if (_ENTERPRISE_PROJECT_FLAG2 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG2 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG2;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG3
{
    if (_ENTERPRISE_PROJECT_FLAG3 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG3 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG3;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG4
{
    if (_ENTERPRISE_PROJECT_FLAG4 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG4 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG4;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG5
{
    if (_ENTERPRISE_PROJECT_FLAG5 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG5 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG5;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG6
{
    if (_ENTERPRISE_PROJECT_FLAG6 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG6 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG6;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG7
{
    if (_ENTERPRISE_PROJECT_FLAG7 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG7 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG7;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG8
{
    if (_ENTERPRISE_PROJECT_FLAG8 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG8 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG8;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG9
{
    if (_ENTERPRISE_PROJECT_FLAG9 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG9 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG9;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG10
{
    if (_ENTERPRISE_PROJECT_FLAG10 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG10 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG10;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG11
{
    if (_ENTERPRISE_PROJECT_FLAG11 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG11 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG11;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG12
{
    if (_ENTERPRISE_PROJECT_FLAG12 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG12 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG12;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG13
{
    if (_ENTERPRISE_PROJECT_FLAG13 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG13 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG13;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG14
{
    if (_ENTERPRISE_PROJECT_FLAG14 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG14 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG14;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG15
{
    if (_ENTERPRISE_PROJECT_FLAG15 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG15 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG15;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG16
{
    if (_ENTERPRISE_PROJECT_FLAG16 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG16 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG16;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG17
{
    if (_ENTERPRISE_PROJECT_FLAG17 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG17 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG17;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG18
{
    if (_ENTERPRISE_PROJECT_FLAG18 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG18 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG18;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG19
{
    if (_ENTERPRISE_PROJECT_FLAG19 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG19 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG19;
}

+(TaskField *)ENTERPRISE_PROJECT_FLAG20
{
    if (_ENTERPRISE_PROJECT_FLAG20 == nil)
    {
        _ENTERPRISE_PROJECT_FLAG20 = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _ENTERPRISE_PROJECT_FLAG20;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER1
{
    if (_ENTERPRISE_PROJECT_NUMBER1 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER1 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER1;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER2
{
    if (_ENTERPRISE_PROJECT_NUMBER2 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER2 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER2;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER3
{
    if (_ENTERPRISE_PROJECT_NUMBER3 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER3 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER3;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER4
{
    if (_ENTERPRISE_PROJECT_NUMBER4 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER4 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER4;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER5
{
    if (_ENTERPRISE_PROJECT_NUMBER5 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER5 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER5;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER6
{
    if (_ENTERPRISE_PROJECT_NUMBER6 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER6 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER6;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER7
{
    if (_ENTERPRISE_PROJECT_NUMBER7 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER7 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER7;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER8
{
    if (_ENTERPRISE_PROJECT_NUMBER8 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER8 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER8;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER9
{
    if (_ENTERPRISE_PROJECT_NUMBER9 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER9 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER9;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER10
{
    if (_ENTERPRISE_PROJECT_NUMBER10 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER10 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER10;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER11
{
    if (_ENTERPRISE_PROJECT_NUMBER11 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER11 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER11;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER12
{
    if (_ENTERPRISE_PROJECT_NUMBER12 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER12 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER12;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER13
{
    if (_ENTERPRISE_PROJECT_NUMBER13 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER13 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER13;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER14
{
    if (_ENTERPRISE_PROJECT_NUMBER14 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER14 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER14;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER15
{
    if (_ENTERPRISE_PROJECT_NUMBER15 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER15 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER15;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER16
{
    if (_ENTERPRISE_PROJECT_NUMBER16 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER16 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER16;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER17
{
    if (_ENTERPRISE_PROJECT_NUMBER17 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER17 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER17;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER18
{
    if (_ENTERPRISE_PROJECT_NUMBER18 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER18 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER18;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER19
{
    if (_ENTERPRISE_PROJECT_NUMBER19 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER19 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER19;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER20
{
    if (_ENTERPRISE_PROJECT_NUMBER20 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER20 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER20;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER21
{
    if (_ENTERPRISE_PROJECT_NUMBER21 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER21 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER21;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER22
{
    if (_ENTERPRISE_PROJECT_NUMBER22 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER22 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER22;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER23
{
    if (_ENTERPRISE_PROJECT_NUMBER23 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER23 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER23;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER24
{
    if (_ENTERPRISE_PROJECT_NUMBER24 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER24 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER24;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER25
{
    if (_ENTERPRISE_PROJECT_NUMBER25 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER25 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER25;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER26
{
    if (_ENTERPRISE_PROJECT_NUMBER26 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER26 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER26;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER27
{
    if (_ENTERPRISE_PROJECT_NUMBER27 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER27 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER27;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER28
{
    if (_ENTERPRISE_PROJECT_NUMBER28 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER28 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER28;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER29
{
    if (_ENTERPRISE_PROJECT_NUMBER29 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER29 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER29;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER30
{
    if (_ENTERPRISE_PROJECT_NUMBER30 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER30 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER30;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER31
{
    if (_ENTERPRISE_PROJECT_NUMBER31 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER31 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER31;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER32
{
    if (_ENTERPRISE_PROJECT_NUMBER32 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER32 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER32;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER33
{
    if (_ENTERPRISE_PROJECT_NUMBER33 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER33 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER33;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER34
{
    if (_ENTERPRISE_PROJECT_NUMBER34 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER34 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER34;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER35
{
    if (_ENTERPRISE_PROJECT_NUMBER35 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER35 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER35;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER36
{
    if (_ENTERPRISE_PROJECT_NUMBER36 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER36 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER36;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER37
{
    if (_ENTERPRISE_PROJECT_NUMBER37 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER37 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER37;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER38
{
    if (_ENTERPRISE_PROJECT_NUMBER38 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER38 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER38;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER39
{
    if (_ENTERPRISE_PROJECT_NUMBER39 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER39 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER39;
}

+(TaskField *)ENTERPRISE_PROJECT_NUMBER40
{
    if (_ENTERPRISE_PROJECT_NUMBER40 == nil)
    {
        _ENTERPRISE_PROJECT_NUMBER40 = [[TaskField alloc]init:[DataType NUMERIC]];
    }
    return _ENTERPRISE_PROJECT_NUMBER40;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT1{
    if (_ENTERPRISE_PROJECT_TEXT1 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT1 = [[TaskField alloc]init:[DataType STRING]];
    }
    
    return _ENTERPRISE_PROJECT_TEXT1;
}
+(TaskField *)ENTERPRISE_PROJECT_TEXT2
{
    if (_ENTERPRISE_PROJECT_TEXT2 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT2 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT2;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT3
{
    if (_ENTERPRISE_PROJECT_TEXT3 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT3 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT3;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT4
{
    if (_ENTERPRISE_PROJECT_TEXT4 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT4 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT4;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT5
{
    if (_ENTERPRISE_PROJECT_TEXT5 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT5 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT5;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT6
{
    if (_ENTERPRISE_PROJECT_TEXT6 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT6 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT6;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT7
{
    if (_ENTERPRISE_PROJECT_TEXT7 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT7 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT7;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT8
{
    if (_ENTERPRISE_PROJECT_TEXT8 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT8 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT8;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT9
{
    if (_ENTERPRISE_PROJECT_TEXT9 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT9 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT9;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT10
{
    if (_ENTERPRISE_PROJECT_TEXT10 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT10 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT10;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT11
{
    if (_ENTERPRISE_PROJECT_TEXT11 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT11 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT11;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT12
{
    if (_ENTERPRISE_PROJECT_TEXT12 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT12 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT12;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT13
{
    if (_ENTERPRISE_PROJECT_TEXT13 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT13 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT13;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT14
{
    if (_ENTERPRISE_PROJECT_TEXT14 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT14 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT14;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT15
{
    if (_ENTERPRISE_PROJECT_TEXT15 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT15 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT15;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT16
{
    if (_ENTERPRISE_PROJECT_TEXT16 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT16 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT16;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT17
{
    if (_ENTERPRISE_PROJECT_TEXT17 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT17 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT17;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT18
{
    if (_ENTERPRISE_PROJECT_TEXT18 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT18 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT18;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT19
{
    if (_ENTERPRISE_PROJECT_TEXT19 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT19 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT19;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT20
{
    if (_ENTERPRISE_PROJECT_TEXT20 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT20 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT20;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT21
{
    if (_ENTERPRISE_PROJECT_TEXT21 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT21 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT21;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT22
{
    if (_ENTERPRISE_PROJECT_TEXT22 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT22 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT22;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT23
{
    if (_ENTERPRISE_PROJECT_TEXT23 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT23 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT23;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT24
{
    if (_ENTERPRISE_PROJECT_TEXT24 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT24 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT24;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT25
{
    if (_ENTERPRISE_PROJECT_TEXT25 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT25 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT25;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT26
{
    if (_ENTERPRISE_PROJECT_TEXT26 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT26 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT26;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT27
{
    if (_ENTERPRISE_PROJECT_TEXT27 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT27 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT27;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT28
{
    if (_ENTERPRISE_PROJECT_TEXT28 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT28 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT28;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT29
{
    if (_ENTERPRISE_PROJECT_TEXT29 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT29 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT29;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT30
{
    if (_ENTERPRISE_PROJECT_TEXT30 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT30 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT30;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT31
{
    if (_ENTERPRISE_PROJECT_TEXT31 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT31 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT31;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT32
{
    if (_ENTERPRISE_PROJECT_TEXT32 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT32 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT32;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT33
{
    if (_ENTERPRISE_PROJECT_TEXT33 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT33 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT33;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT34
{
    if (_ENTERPRISE_PROJECT_TEXT34 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT34 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT34;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT35
{
    if (_ENTERPRISE_PROJECT_TEXT35 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT35 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT35;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT36
{
    if (_ENTERPRISE_PROJECT_TEXT36 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT36 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT36;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT37
{
    if (_ENTERPRISE_PROJECT_TEXT37 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT37 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT37;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT38
{
    if (_ENTERPRISE_PROJECT_TEXT38 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT38 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT38;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT39
{
    if (_ENTERPRISE_PROJECT_TEXT39 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT39 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT39;
}

+(TaskField *)ENTERPRISE_PROJECT_TEXT40
{
    if (_ENTERPRISE_PROJECT_TEXT40 == nil)
    {
        _ENTERPRISE_PROJECT_TEXT40 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _ENTERPRISE_PROJECT_TEXT40;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE1
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE1 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE1 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE1;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE2
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE2 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE2 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE2;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE3
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE3 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE3 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE3;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE4
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE4 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE4 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE4;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE5
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE5 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE5 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE5;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE6
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE6 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE6 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE6;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE7
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE7 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE7 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE7;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE8
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE8 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE8 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE8;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE9
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE9 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE9 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE9;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE10
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE10 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE10 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE10;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE11
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE11 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE11 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE11;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE12
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE12 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE12 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE12;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE13
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE13 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE13 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE13;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE14
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE14 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE14 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE14;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE15
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE15 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE15 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE15;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE16
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE16 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE16 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE16;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE17
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE17 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE17 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE17;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE18
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE18 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE18 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE18;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE19
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE19 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE19 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE19;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE20
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE20 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE20 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE20;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE21
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE21 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE21 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE21;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE22
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE22 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE22 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE22;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE23
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE23 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE23 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE23;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE24
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE24 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE24 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE24;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE25
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE25 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE25 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE25;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE26
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE26 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE26 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE26;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE27
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE27 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE27 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE27;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE28
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE28 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE28 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE28;
}

+(TaskField *)RESOURCE_ENTERPRISE_OUTLINE_CODE29
{
    if (_RESOURCE_ENTERPRISE_OUTLINE_CODE29 == nil)
    {
        _RESOURCE_ENTERPRISE_OUTLINE_CODE29 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_OUTLINE_CODE29;
}

+(TaskField *)RESOURCE_ENTERPRISE_RBS
{
    if (_RESOURCE_ENTERPRISE_RBS == nil)
    {
        _RESOURCE_ENTERPRISE_RBS = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_RBS;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE20
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE20 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE20 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE20;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE21
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE21 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE21 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE21;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE22
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE22 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE22 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE22;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE23
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE23 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE23 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE23;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE24
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE24 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE24 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE24;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE25
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE25 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE25 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE25;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE26
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE26 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE26 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE26;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE27
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE27 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE27 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE27;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE28
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE28 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE28 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE28;
}

+(TaskField *)RESOURCE_ENTERPRISE_MULTI_VALUE_CODE29
{
    if (_RESOURCE_ENTERPRISE_MULTI_VALUE_CODE29 == nil)
    {
        _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE29 = [[TaskField alloc]init:[DataType STRING]];
    }
    return _RESOURCE_ENTERPRISE_MULTI_VALUE_CODE29;
}

+(TaskField *)ACTUAL_WORK_PROTECTED
{
    if (_ACTUAL_WORK_PROTECTED == nil)
    {
        _ACTUAL_WORK_PROTECTED = [[TaskField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_WORK_PROTECTED;
}

+(TaskField *)ACTUAL_OVERTIME_WORK_PROTECTED
{
    if (_ACTUAL_OVERTIME_WORK_PROTECTED == nil)
    {
        _ACTUAL_OVERTIME_WORK_PROTECTED = [[TaskField alloc]init:[DataType WORK]];
    }
    return _ACTUAL_OVERTIME_WORK_PROTECTED;
}

+(TaskField *)BUDGET_WORK
{
    if (_BUDGET_WORK == nil)
    {
        _BUDGET_WORK = [[TaskField alloc]init:[DataType WORK]];
    }
    return _BUDGET_WORK;
}

+(TaskField *)BUDGET_COST
{
    if (_BUDGET_COST == nil)
    {
        _BUDGET_COST = [[TaskField alloc]init:[DataType CURRENCY]];
    }
    return _BUDGET_COST;
}

+(TaskField *)RECALC_OUTLINE_CODES
{
    if (_RECALC_OUTLINE_CODES == nil)
    {
        _RECALC_OUTLINE_CODES = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _RECALC_OUTLINE_CODES;
}

+(TaskField *)IS_START_VALID
{
    if (_IS_START_VALID == nil)
    {
        _IS_START_VALID = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _IS_START_VALID;
}

+(TaskField *)IS_FINISH_VALID
{
    if (_IS_FINISH_VALID == nil)
    {
        _IS_FINISH_VALID = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _IS_FINISH_VALID;
}

+(TaskField *)IS_DURATION_VALID
{
    if (_IS_DURATION_VALID == nil)
    {
        _IS_DURATION_VALID = [[TaskField alloc]init:[DataType BOOLEAN]];
    }
    return _IS_DURATION_VALID;
}

+(TaskField *)FINISH
{
    if (_FINISH == nil)
    {
        _FINISH = [[TaskField alloc]init:[DataType DATE]];
    }
    return _FINISH;
}

@end
