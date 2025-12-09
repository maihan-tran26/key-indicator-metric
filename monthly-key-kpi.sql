/**** Pull for PQ population ***/
SELECT 
 Interaction_date_YY
 , interaction_date_mm
    , COUNT(DISTINCT CASE WHEN visitor_flag = 1 then person END) AS visitor 
    , COUNT(DISTINCT CASE WHEN hard_submit_flag = 1 then person END) AS hps 
    , COUNT(DISTINCT CASE WHEN credit_approved_flag = 1 then person END) AS hpa 
    , hps/visitor AS hard_Submit_Rate 
    , hpa/hps AS hard_approval_rate 
FROM bdm_marketing.DACR_ACQ_FUNNEL_COMBINED_PBI_V2 
WHERE 
    FUNNEL IN ('Affiliat_API', 'Affiliate_Remarketing_Multiple', 'Affiliate_Remarketing_Single', 'CK_EA', 'CK_LB', 'Direct_Mail', 'FA_Email', 'NCPQ_Email','FA_Aff_Link', 'FA_OMF','FA_OAM')
    and interaction_date_yy IN (2024,2025)
GROUP BY 1,2
ORDER BY 1,2 
