update NaklR 
set DateOpl = DateNakl + (select DAY_DELAY
                          from NaklR n left join
                              (select distinct
                                      l.POSTNO,
                                      l.DAY_DELAY,
                                      l.DAY_DELAY_EXT,
                                      l.DAY_DELAY + l.DAY_DELAY_EXT as ExtDelay,
                                      d.ID,
                                      d.NAME,
                                      p.Name as NamePost,
                                      l.SET_ARTICLE_GROUP_ID
                                from L_POST_SET_ARTGROUP_DELAY l left join
                                     D_SET_ARTICLE_GROUP d on l.SET_ARTICLE_GROUP_ID = d.ID left join
                                     Post p on l.POSTNO = p.PostNo) d on n.PostNo = d.POSTNO and n.SET_ARTICLE_GROUP_ID = d.SET_ARTICLE_GROUP_ID
                                 where n.DateNakl > '17.06.2012'
                                   and NaklNo not in (508598)
                                   and NaklR.NaklNo = n.NaklNo)  
where DateNakl > '17.06.2012' 

---------- поиск задвоек

select NaklNo, count(NaklNo) as con
                          from NaklR n left join
                              (select distinct
                                      l.POSTNO,
                                      l.DAY_DELAY,
                                      l.DAY_DELAY_EXT,
                                      l.DAY_DELAY + l.DAY_DELAY_EXT as ExtDelay,
                                      d.ID,
                                      d.NAME,
                                      p.Name as NamePost,
                                      l.SET_ARTICLE_GROUP_ID
                                from L_POST_SET_ARTGROUP_DELAY l left join
                                     D_SET_ARTICLE_GROUP d on l.SET_ARTICLE_GROUP_ID = d.ID left join
                                     Post p on l.POSTNO = p.PostNo) d on n.PostNo = d.POSTNO and n.SET_ARTICLE_GROUP_ID = d.SET_ARTICLE_GROUP_ID
                                 where n.DateNakl > '17.06.2012'
                                   and NaklNo <> 508598
group by naklno having(count(NaklNo)) >1