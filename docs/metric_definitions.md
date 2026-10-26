# Metric Definitions

## Entities
- **Event:** one row in events.csv: view, addtocart or transaction.
- **Visitor:** a unique `visitorid`. Note: not a verified person; one person may have several IDs.
- **Session:** a group of one visitor's events with no gap longer than 30 minutes (assumption, tested on Day 3).

## Funnel stages
1. **Viewer:** visitor with at least one `view` event.
2. **Carter:** visitor with at least one `addtocart` event.
3. **Buyer:** visitor with at least one `transaction` event.

## Metrics
| Metric | Definition | Grain |
|---|---|---|
| View-to-cart rate | carters / viewers | visitor |
| Cart-to-purchase rate | buyers (who carted) / carters | visitor |
| **Visitor conversion rate (North Star)** | buyers / viewers | visitor |
| Session conversion rate | sessions with a transaction / all sessions | session |
| Cart abandonment rate | carters with no transaction after their cart event / carters | visitor (decide: also session?) |
| Time to purchase | timestamp of first transaction minus first view (per buyer) | visitor |
| Repeat buyer | visitor with transactions on 2 or more distinct dates (decide: or 2+ distinct transactionids?) | visitor |
| Return-visit rate | visitors with sessions on 2+ distinct dates / all visitors | visitor |

## Why conversion rate is the North Star
conversion rate shows how many people who visit the website actually end up buying something. It helps us understand where customers drop off and how we can improve the shopping experience to turn more visitors into buyers.

## Known limitations
- No user attributes (device, channel, geography).
- Observation window is ~4.5 months, so long-term retention can't be measured.
- Items and categories are anonymized.