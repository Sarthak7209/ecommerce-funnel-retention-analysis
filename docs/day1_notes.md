1. What share of visitors have a single event?

The median events per visitor is 1, so more than half of all visitors did exactly one thing on the site and left. The exact share is 71.2%. Most of these are people who landed on one product page and never came back. This matters for the project because a large group of visitors never enters the funnel at all. Counting them all as “viewers” will make conversion look worse than it is for people who actually browsed. It also means long-term retention will be thin, since most visitors have no second visit to measure. Later I’ll look at the funnel both for all visitors and for visitors with at least two events or sessions.

2. Is the add-to-cart to transaction ratio plausible for e-commerce?

Yes, it’s plausible. In my data there are [A] add-to-cart events and [T] transaction rows, so about [T/A]% of cart events line up with a purchase row. Real stores usually see 60-80% of carts abandoned, so a figure in the broad range of 20-40% purchases per cart is believable. One caution: this is a ratio of event counts, not of people, so it isn’t a true conversion rate. One buyer can fire several cart events, and one order can contain several items. I’ll compute a proper visitor-level rate on Day 4.

If the ratio were very low, it would suggest a problem in the checkout step, such as a clunky payment page, surprise shipping costs, or a forced signup, or that many people use the cart as a wishlist. If it were very high, I’d suspect a tracking problem, like cart events not being logged properly, or transactions that happen without a cart event, for example through a “buy now” button. That would mean the funnel is incomplete.

3. Why might distinct_orders be smaller than transaction_rows?

Because the table records one transaction row per item purchased, not one per order. If someone buys three items in one checkout, the transactionid is the same on all three rows, so there are 3 rows but only 1 distinct order. This means counting rows would overstate the number of purchases. For conversion rates I need to count distinct orders (or distinct buyers) and not rows. That’s why my metric definitions say “buyers” and “distinct transactions”, and why I’ll avoid COUNT(*) on transaction events later.