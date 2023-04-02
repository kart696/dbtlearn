with
l as (
	select * from {{ ref ('dim_listings') }}
),
h as (
	select * from {{ ref ('dim_hosts') }}
)

select
	l.listing_id as l_id,
	l.listing_name as name,
	l.room_type,
	l.minimum_nights,
	l.price,
	l.host_id as h_id,
	h.host_name,
	h.is_superhost as h_superhost,
	l.created_at,
	GREATEST(l.updated_at, h.updated_at) as updated_at
from l
left join h on (h.host_id=l.host_id)