Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id B41A13AE2DC
	for <lists.iommu@lfdr.de>; Mon, 21 Jun 2021 07:47:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36EAA402BA;
	Mon, 21 Jun 2021 05:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Cn28uCQGVtK; Mon, 21 Jun 2021 05:47:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 01E2A4034C;
	Mon, 21 Jun 2021 05:47:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D257FC0021;
	Mon, 21 Jun 2021 05:47:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71EE6C000C
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 05:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with UTF8SMTP id 4A91060621
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 05:47:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id jEkmEVzJH4qq for <iommu@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 05:47:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp3.osuosl.org (Postfix) with UTF8SMTPS id DB37060593
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 05:47:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624254474; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dd/c0WzWEfKMbrpV11k4uuAZn72RvTRCSkxT5YGla6U=;
 b=Gc1nyEN8+HYw/uDqFaI40oFM0MrWuN3bLQD9e1dybnZP/fgzinvAKwiUeWTERlSuTm9qRC/z
 CdBnrC52I0kI/6lsSP3xVwLJ5xLejE7hSlvx2QcfBwHTvQ7LSo7xmdAaQM3PoPuqNYye3Nbh
 rsry12DMWs5RfErLvNWzPgShedM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60d027fbe27c0cc77f425a7d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 05:47:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D1D77C433D3; Mon, 21 Jun 2021 05:47:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 84534C433F1;
 Mon, 21 Jun 2021 05:47:36 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 21 Jun 2021 11:17:36 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCHv2 2/3] iommu/io-pgtable: Optimize partial walk flush for
 large scatter-gather list
In-Reply-To: <CAD=FV=WA_mBnxv-D3YOYUkDAAcYgktFgnw2zeTkMneqFxBg=yg@mail.gmail.com>
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <150fc7ab1c7f9b70a95dae1f4bc3b9018c0f9e04.1623981933.git.saiprakash.ranjan@codeaurora.org>
 <CAD=FV=WA_mBnxv-D3YOYUkDAAcYgktFgnw2zeTkMneqFxBg=yg@mail.gmail.com>
Message-ID: <716fbc51ec73434e325d84752a471e89@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS , Joerg Roedel
 <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi,

On 2021-06-19 03:39, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jun 17, 2021 at 7:51 PM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Currently for iommu_unmap() of large scatter-gather list with page 
>> size
>> elements, the majority of time is spent in flushing of partial walks 
>> in
>> __arm_lpae_unmap() which is a VA based TLB invalidation invalidating
>> page-by-page on iommus like arm-smmu-v2 (TLBIVA) which do not support
>> range based invalidations like on arm-smmu-v3.2.
>> 
>> For example: to unmap a 32MB scatter-gather list with page size 
>> elements
>> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize 
>> (2MB
>> for 4K granule) and each of 2MB will further result in 512 TLBIVAs 
>> (2MB/4K)
>> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a 
>> huge
>> overhead.
>> 
>> So instead use tlb_flush_all() callback (TLBIALL/TLBIASID) to 
>> invalidate
>> the entire context for partial walk flush on select few platforms 
>> where
>> cost of over-invalidation is less than unmap latency
> 
> It would probably be worth punching this description up a little bit.
> Elsewhere you said in more detail why this over-invalidation is less
> of a big deal for the Qualcomm SMMU. It's probably worth saying
> something like that here, too. Like this bit paraphrased from your
> other email:
> 
> On qcom impl, we have several performance improvements for TLB cache
> invalidations in HW like wait-for-safe (for realtime clients such as
> camera and display) and few others to allow for cache lookups/updates
> when TLBI is in progress for the same context bank.
> 

Sure will add this info as well in the next version.

> 
>> using the newly
>> introduced quirk IO_PGTABLE_QUIRK_TLB_INV_ALL. We also do this for
>> non-strict mode given its all about over-invalidation saving time on
>> individual unmaps and non-deterministic generally.
> 
> As per usual I'm mostly clueless, but I don't quite understand why you
> want this new behavior for non-strict mode. To me it almost seems like
> the opposite? Specifically, non-strict mode is already outside the
> critical path today and so there's no need to optimize it. I'm
> probably not explaining myself clearly, but I guess i'm thinking:
> 
> a) today for strict, unmap is in the critical path and it's important
> to get it out of there. Getting it out of the critical path is so
> important that we're willing to over-invalidate to speed up the
> critical path.
> 
> b) today for non-strict, unmap is not in the critical path.
> 
> So I would almost expect your patch to _disable_ your new feature for
> non-strict mappings, not auto-enable your new feature for non-strict
> mappings.
> 
> If I'm babbling, feel free to ignore. ;-) Looking back, I guess Robin
> was the one that suggested the behavior you're implementing, so it's
> more likely he's right than I am. ;-)
> 

Thanks for taking a look. Non-strict mode is only for leaf entries and
dma domains and this optimization is for non-leaf entries and is 
applicable
for both, see __arm_lpae_unmap(). In other words, if you have 
iommu.strict=0
(non-strict mode) and try unmapping a large sg buffer as the problem 
described
in the commit text, you would still go via this path in unmap and see 
the
delay without this patch. So what Robin suggested is that, let's do this
unconditionally for all users with non-strict mode as opposed to only
restricting it to implementation specific in case of strict mode.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
