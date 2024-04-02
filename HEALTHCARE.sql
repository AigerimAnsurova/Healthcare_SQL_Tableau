
DECLARE @Start DATE, @End DATE
SET @Start = '2023-01-01'
SET @End = '2023-12-31'

SELECT    DISTINCT 
CD.[Regional Offices]
,cd.[Consumer ID]
,cd.[Consumer Full Name]
,S.[Provider]
,S.[ServiceCodes]
,CASE WHEN S.[Month] = 1 THEN 'Jan'
WHEN S.[Month] = 2 THEN 'Feb' 
WHEN S.[Month] = 3 THEN 'Mar'
WHEN S.[Month] = 4 THEN 'Apr' 
WHEN S.[Month] = 5 THEN 'May'
WHEN S.[Month] = 6 THEN 'June'
WHEN S.[Month] = 7 THEN 'July'
WHEN S.[Month] = 8 THEN 'Aug'
WHEN S.[Month] = 9 THEN 'Sep'
WHEN S.[Month] = 10 THEN 'Oct'
WHEN S.[Month] = 11 THEN 'Nov'
WHEN S.[Month] = 12 THEN 'Dec' END 'Month'
,SUM(S.[Invoiced Amt])


FROM    SampleTable.ConsumerData AS CD

INNER JOIN 
SampleTable.Services S
ON CD.[Consumer ID] = S.[ID]
AND (S.[Service Code] IN ('Code1', 'Code2')  OR S.[Service Code] = 'Code2’ AND S.[Subcode] = 'S1')
AND  S.[From Date] <= @End
AND (S.[To Date] >= @Start  OR  S.[To Date] IS NULL)

WHERE EOC.[Open Admission] = 'Y'
AND EOC.[Division] = 'DD'

GROUP BY 
CD.[Regional Offices]
,cd.[Consumer ID]
,cd.[Consumer Full Name]
,S.[Provider]
,S.[ServiceCodes]
,CASE WHEN S.[Month] = 1 THEN 'Jan'
WHEN S.[Month] = 2 THEN 'Feb' 
WHEN S.[Month] = 3 THEN 'Mar'
WHEN S.[Month] = 4 THEN 'Apr' 
WHEN S.[Month] = 5 THEN 'May'
WHEN S.[Month] = 6 THEN 'June'
WHEN S.[Month] = 7 THEN 'July'
WHEN S.[Month] = 8 THEN 'Aug'
WHEN S.[Month] = 9 THEN 'Sep'
WHEN S.[Month] = 10 THEN 'Oct'
WHEN S.[Month] = 11 THEN 'Nov'
WHEN S.[Month] = 12 THEN 'Dec'END

ORDER BY EOC.[DMH ID]
