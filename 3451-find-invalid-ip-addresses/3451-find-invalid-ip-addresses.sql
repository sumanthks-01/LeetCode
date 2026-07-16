# Write your MySQL query statement below
with invalid_flags as (
  select ip, log_id, (length(ip) - length(replace(ip, ".", ""))) != 3 as wrong_octets, ip regexp "(^|\\.)0[0-9]" as has_leading_zero, ip regexp "(^|\\.)[0-9]{4,}(\\.|$)|(^|\\.)[3-9][0-9]{2}(\\.|$)|(^|\\.)2[6-9][0-9](\\.|$)|(^|\\.)25[6-9](\\.|$)" as has_large_octet
  from logs
)

select ip, count(*) as invalid_count
from invalid_flags
where wrong_octets or has_leading_zero or has_large_octet
group by ip
order by invalid_count desc, ip desc