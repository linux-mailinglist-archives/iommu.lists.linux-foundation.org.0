Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F058365637
	for <lists.iommu@lfdr.de>; Tue, 20 Apr 2021 12:33:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FC77402DA;
	Tue, 20 Apr 2021 10:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UP5lGl_cPzG8; Tue, 20 Apr 2021 10:33:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F83B40204;
	Tue, 20 Apr 2021 10:33:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B034C000B;
	Tue, 20 Apr 2021 10:33:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42909C000B
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 10:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24138402F7
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 10:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LFF6eDqnlYg0 for <iommu@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:33:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C536C40310
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 10:33:41 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 20A4840D3BFF;
 Tue, 20 Apr 2021 10:33:35 +0000 (UTC)
Date: Tue, 20 Apr 2021 13:33:35 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 2/2] iommu/amd: Remove performance counter
 pre-initialization test
In-Reply-To: <9d5fa4ff-9666-6475-7f61-2b45cbd83456@amd.com>
Message-ID: <alpine.LNX.2.20.13.2104201310520.19608@monopod.intra.ispras.ru>
References: <20210409085848.3908-1-suravee.suthikulpanit@amd.com>
 <20210409085848.3908-3-suravee.suthikulpanit@amd.com>
 <VI1PR09MB26380EED406F2F08ACB6B5BBC7729@VI1PR09MB2638.eurprd09.prod.outlook.com>
 <9d5fa4ff-9666-6475-7f61-2b45cbd83456@amd.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="168458499-181975079-1618914815=:19608"
Cc: David Coe <david.coe@live.co.uk>, pmenzel@molgen.mpg.de, Jon.Grimm@amd.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Shuah Khan <skhan@linuxfoundation.org>, Tj <ml.linux@elloe.vision>,
 Alex Hung <1917203@bugs.launchpad.net>, will@kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168458499-181975079-1618914815=:19608
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 Apr 2021, Suthikulpanit, Suravee wrote:

> David / Joerg,
> 
> On 4/10/2021 5:03 PM, David Coe wrote:
> > 
> > The immediately obvious difference is the with the enormous count seen on
> > mem_dte_mis on the older Ryzen 2400G. Will do some RTFM but anyone
> > with comments and insight?
> > 
> > 841,689,151,202,939       amd_iommu_0/mem_dte_mis/              (33.44%)
> > 
> > Otherwise, all seems to running smoothly (especially for a distribution
> > still in β). Bravo and many thanks all!
> 
> The initial hypothesis is that the issue happens only when users specify more
> number of events than
> the available counters, which Perf will time-multiplex the events onto the
> counters.
> 
> Looking at the Perf and AMD IOMMU PMU multiplexing logic, it requires:
>  1. Stop the counter (i.e. set CSOURCE to zero to stop counting)
>  2. Save the counter value of the current event
>  3. Reload the counter value of the new event (previously saved)
>  4. Start the counter (i.e. set CSOURCE to count new events)
> 
> The problem here is that when the driver writes zero to CSOURCE register in
> step 1, this would enable power-gating,
> which prevents access to the counter and result in writing/reading value in
> step 2 and 3.
> 
> I have found a system that reproduced this case (w/ unusually large number of
> count), and debug the issue further.
> As a hack, I have tried skipping step 1, and it seems to eliminate this issue.
> However, this is logically incorrect,
> and might result in inaccurate data depending on the events.
> 
> Here are the options:
> 1. Continue to look for workaround for this issue.
> 2. Find a way to disable event time-multiplexing (e.g. only limit the number
> of counters to 8)
>    if power gating is enabled on the platform.
> 3. Back to the original logic where we had the pre-init check of the counter
> vlues, which is still the safest choice
>    at the moment unless

If the "power-gated" counter only ignores writes, but yields correct values on
reads, you don't need to change its value.

0. When initializing the counter, save its value as 'raw_counter_value'.

When switching:

1. Set CSOURCE to zero (pauses the counter).
2. Read current counter value ('new_value').
3. Add '(new_value - raw_counter_value) & mask' to the current event count;
   where 'mask' is '(1ULL << 48) - 1' to account for overflow correctly.
4. Assign 'raw_counter_value = new_value'.
5. Set CSOURCE to new configuration value.

Modifying the hardware counter value is only needed to get overflow interrupts,
but there's no code to handle them on Linux (since the interrupts are
asynchronous, and given the nature of the events, I don't see how it would be
useful).

Alexander
--168458499-181975079-1618914815=:19608
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--168458499-181975079-1618914815=:19608--
