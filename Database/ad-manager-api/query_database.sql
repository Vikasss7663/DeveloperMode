select * from public.campaign_adset ca where ca.campaign_uid = 6573;

select * from public.campaign c where c.uid = 6573;

select * from public.campaign c where c.ro_uid = 2995;

select * from public.campaign c 
where c.ro_uid in (
	select ro_uid from public.campaign c2 
	where c2.aba_enabled = true and c2.status in ('PUBLISHED_READY', 'FINISHED')
	group by(ro_uid) having count(ro_uid) > 1
) 
and c.ro_uid in (
	select uid from public.ro r
	where r.aba_enabled = true 
	and r.goal_type != 'ROADBLOCK'
		and r.end_timestamp  >= timezone('UTC', now()) 
		and timezone('UTC', now())-r.start_timestamp >= least(interval'3 days', 0.2*(r.end_timestamp-r.start_timestamp))
) 
and c.uid not in (select e.campaign_uid from public.experiment e)
and c.aba_enabled = true and c.status in ('PUBLISHED_READY', 'FINISHED');
-- and c.ro_uid = 4296;

-- experiment and roadblock ( campaigns & ros)

select * from public.ro r
where r.aba_enabled = true 
	and r.end_timestamp  >= timezone('UTC', now())
	and timezone('UTC', now())-r.start_timestamp >= least(interval'3 days', 0.2*(r.end_timestamp-r.start_timestamp))

select aba_enabled from public.campaign c 
where c.uid in (select e.campaign_uid  from public.experiment e);

select aba_enabled from public.campaign c 
where c.goal_type = 'ROADBLOCK';

select distinct(r.goal_type) from public.ro r order by r.goal_type;

select distinct(c.goal_type) from public.campaign c order by c.goal_type; 

select * from public.campaign c 
where c.uid  in (select e.campaign_uid  from public.experiment e)
and c.aba_enabled = true;

select * from public.ro r where r.uid = 2926;

select * from public.financial_information fi1
where fi1.ro_uid in (select ro_uid from public.financial_information fi group by(fi.ro_uid) having count(*) > 1);

select distinct fi.state from public.financial_information fi ;

select * from campaign c where c.uid = 6534;

select * from campaign c where c.billable = false;

select * from campaign_adset ca where ca.campaign_uid = 6534;

select distinct c.goal_type  from campaign c where c.uid in (
select e.campaign_uid  from experiment e );

select aba_enabled from public.ro r 
where r.uid  in (select fi.ro_uid from public.financial_information fi where fi.billing_type = 'ROADBLOCK');

SELECT * FROM campaign c
LIMIT 1;


select distinct r.objective from ro r;

select * from campaign c where c.uid in (6532, 6533, 6534);
select * from campaign_adset ca where ca.campaign_uid in (6532, 6533, 6534);
select sum(c.budget_amount) from campaign c where c.ro_uid = 2432 and c.status != 'FINISHED';

select * from merchant_offer mo ;

select * from merchant_offer mo 
 where mo.end_timestamp::timestamp > timezone('UTC', now())
 
 
 select * from merchant_offer mo
          where mo.end_timestamp::timestamp
          between timezone('UTC', now()) - ('5 days')::interval
          and timezone('UTC', now()) - ('1 days')::interval