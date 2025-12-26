
/**** Script Start ****/ 
WITH C1 AS (
    SELECT
        interaction_date_yy
        , interaction_date_mm
        , CASE 
            WHEN DATE_TRUNC('month', DATE_FROM_PARTS(interaction_date_yy, interaction_date_mm, 1)) = DATE_TRUNC('month', CURRENT_DATE()) THEN '1. current_month'
            WHEN DATE_TRUNC('month', DATE_FROM_PARTS(interaction_date_yy, interaction_date_mm, 1)) = DATE_TRUNC('month', DATEADD(month, -1, CURRENT_DATE())) THEN '2. last_month'
            WHEN DATE_TRUNC('month', DATE_FROM_PARTS(interaction_date_yy, interaction_date_mm, 1)) = DATE_TRUNC('month', DATEADD(year, -1, CURRENT_DATE())) THEN '3. last_year'
            END AS record_of_interest
        , CASE
                WHEN top_funnels ='API_Brightway' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_Brightway' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_Brightway' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_CK' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_CK' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_CK' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_EF' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_EF' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_EF' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_Exp' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_Exp' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_Exp' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_LT' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_LT' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_LT' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_NW' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_NW' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_NW' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_Other' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_Other' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_Other' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_QS' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_QS' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='API_QS' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_SROI' AND funnel = 'Affiliat_API' then 'PQ'
                WHEN top_funnels ='API_SROI' AND funnel = 'Affiliate_Remarketing_Multiple' then 'PQ'
                WHEN top_funnels ='API_SROI' AND funnel = 'Affiliate_Remarketing_Single' then 'PQ'
                WHEN top_funnels ='DM' AND funnel = 'Direct_Mail' then 'PQ'
                WHEN top_funnels ='Email_FA' AND funnel = 'FA_Email' then 'PQ'
                WHEN top_funnels ='Email_PQ' AND funnel = 'PQ_Email' then 'ITA'
                WHEN top_funnels ='Exp_Act' AND funnel = 'FA_Aff_Link' then 'ITA'
                WHEN top_funnels ='FA_Other' AND funnel = 'FA_OMF' then 'ITA'
                WHEN top_funnels ='LightBox_CK' AND funnel = 'CK_EA' then 'PQ'
                WHEN top_funnels ='LightBox_CK' AND funnel = 'CK_LB' then 'PQ'
                WHEN top_funnels ='Link_CK' AND funnel = 'FA_Aff_Link' then 'ITA'
                WHEN top_funnels ='Link_FA_Other' AND funnel = 'FA_Aff_Link' then 'ITA'
                WHEN top_funnels ='Logged_NativeApp' AND funnel = 'Mobile App' then 'Others'
                WHEN top_funnels ='Logged_OAM_FA' AND funnel = 'FA_OAM' then 'PQ'
                WHEN top_funnels ='Logged_OAM_PQ' AND funnel = 'PQ_OAM' then 'ITA'
                WHEN top_funnels ='Other' AND funnel = 'NCPQ_Email' then 'ITA'
                WHEN top_funnels ='Other' AND funnel = 'EA_Remarketing' then 'PQ'
                WHEN top_funnels ='Other' AND funnel = 'Others' then 'Other'
                WHEN top_funnels ='Search_B_FA' AND funnel = 'FA_OMF' then 'ITA'
                WHEN top_funnels ='Search_B_PQ' AND funnel = 'PQ_OMF' then 'ITA'
                WHEN top_funnels ='Search_Direct_FA' AND funnel = 'FA_OMF' then 'ITA'
                WHEN top_funnels ='Search_Direct_PQ' AND funnel = 'PQ_OMF' then 'ITA'
                WHEN top_funnels ='Search_NB_FA' AND funnel = 'FA_OMF' then 'ITA'
                WHEN top_funnels ='Search_NB_PQ' AND funnel = 'PQ_OMF' then 'ITA'
                WHEN top_funnels ='Search_Other_PQ' AND funnel = 'PQ_OMF' then 'ITA'
                ELSE 'Others'
                END AS funnel_type 
        , CASE 
                WHEN top_funnels ='API_Brightway' AND funnel = 'Affiliate_Remarketing_Single' then '6. BrightWay_CrossBuy'
                WHEN top_funnels ='API_Brightway' AND funnel = 'Affiliat_API' then '6. BrightWay_CrossBuy'
                WHEN top_funnels ='API_Brightway' AND funnel = 'Affiliate_Remarketing_Multiple' then '6. BrightWay_CrossBuy'
                WHEN top_funnels ='API_CK' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_CK' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='API_CK' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_EF' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_EF' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_EF' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='API_Exp' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_Exp' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='API_Exp' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_LT' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_LT' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_LT' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='API_NW' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_NW' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='API_NW' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_Other' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='API_Other' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_Other' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_QS' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_QS' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='API_QS' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_SROI' AND funnel = 'Affiliat_API' then '2. Affiliate_API'
                WHEN top_funnels ='API_SROI' AND funnel = 'Affiliate_Remarketing_Multiple' then '3. Remarketing'
                WHEN top_funnels ='API_SROI' AND funnel = 'Affiliate_Remarketing_Single' then '3. Remarketing'
                WHEN top_funnels ='DM' AND funnel = 'Direct_Mail' then '4. Direct_Mail'
                WHEN top_funnels ='Email_FA' AND funnel = 'FA_Email' then '5. Email_Prospecting'
                WHEN top_funnels ='Email_PQ' AND funnel = 'PQ_Email' then '4. Email_ITA'
                WHEN top_funnels ='Exp_Act' AND funnel = 'FA_Aff_Link' then '5. Affiliate_Link'
                WHEN top_funnels ='FA_Other' AND funnel = 'FA_OMF' then '7. Others'
                WHEN top_funnels ='LightBox_CK' AND funnel = 'CK_EA' then '1. CK EA_Lightbox'
                WHEN top_funnels ='LightBox_CK' AND funnel = 'CK_LB' then '1. CK EA_Lightbox'
                WHEN top_funnels ='Link_CK' AND funnel = 'FA_Aff_Link' then '5. Affiliate_Link'
                WHEN top_funnels ='Link_FA_Other' AND funnel = 'FA_Aff_Link' then '5. Affiliate_Link'
                WHEN top_funnels ='Logged_NativeApp' AND funnel = 'Mobile App' then '7. Others'
                WHEN top_funnels ='Logged_OAM_FA' AND funnel = 'FA_OAM' then '7. Logged_OAM_PQ'
                WHEN top_funnels ='Logged_OAM_PQ' AND funnel = 'PQ_OAM' then '6. Logged_OAM_ITA'
                WHEN top_funnels ='Other' AND funnel = 'NCPQ_Email' then '7. Others'
                WHEN top_funnels ='Other' AND funnel = 'EA_Remarketing' then '3. Remarketing'
                WHEN top_funnels ='Other' AND funnel = 'Others' then '7. Others'
                WHEN top_funnels ='Search_B_FA' AND funnel = 'FA_OMF' then '7. Others'
                WHEN top_funnels ='Search_B_PQ' AND funnel = 'PQ_OMF' then '1. SEM'
                WHEN top_funnels ='Search_Direct_FA' AND funnel = 'FA_OMF' then '7. Others'
                WHEN top_funnels ='Search_Direct_PQ' AND funnel = 'PQ_OMF' then '3. Search_Direct'
                WHEN top_funnels ='Search_NB_FA' AND funnel = 'FA_OMF' then '7. Others'
                WHEN top_funnels ='Search_NB_PQ' AND funnel = 'PQ_OMF' then '1. SEM'
                WHEN top_funnels ='Search_Other_PQ' AND funnel = 'PQ_OMF' then '2. SEO'
                ELSE 'Others' END AS final_category 
            , SUM(visitors_cookie) AS visitors
            , SUM(hard_submit_ssn) AS hard_submits
            , SUM(hard_approve_ssn) AS hard_approvals 
    FROM EDS.SB_ANALYTICS_PII.DACR_FUNNEL_COOKIE_SUMM_FULL
    GROUP BY 1,2,3,4,5
    ORDER BY 1,2
), c2 as (
    SELECT
        funnel_type
        , final_category
        , record_of_interest
        , visitors
        , hard_submits
        , hard_approvals
        , row_number() OVER(PARTITION BY funnel_type, final_category ORDER BY record_of_interest ASC) AS metric_rank
    FROM C1 
    WHERE  record_of_interest is not null 
    ORDER BY 1,2,3 
), c3 AS (
    SELECT
        funnel_type 
        , final_category
        , MAX(CASE WHEN metric_rank = 1 then visitors END) AS current_visitors 
        , MAX(CASE WHEN metric_rank = 2 then visitors END) AS last_month_visitors
        , MAX(CASE WHEN metric_rank = 3 then visitors END) AS last_year_visitors
        , MAX(CASE WHEN metric_rank = 1 then hard_submits END) AS current_hard_submits
        , MAX(CASE WHEN metric_rank = 2 then hard_submits END) AS current_hard_submits
        , MAX(CASE WHEN metric_rank = 3 then hard_submits END) AS last_year_hard_submits
        , MAX(CASE WHEN metric_rank = 1 then hard_approvals END) AS current_hard_approvals
        , MAX(CASE WHEN metric_rank = 2 then hard_approvals END) AS last_month_hard_approvals 
        , MAX(CASE WHEN metric_rank = 3 then hard_approvals END) AS last_year_hard_approvals
    FROM c2 
    GROUP BY 1,2
    ORDER BY 1 DESC,2
)

SELECT * FROM c3
