Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE561397A2E
	for <lists.iommu@lfdr.de>; Tue,  1 Jun 2021 20:46:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2064383A41;
	Tue,  1 Jun 2021 18:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OS1Huww--uB; Tue,  1 Jun 2021 18:46:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5172E835D3;
	Tue,  1 Jun 2021 18:46:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33497C0001;
	Tue,  1 Jun 2021 18:46:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99537C0001
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 18:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82CCA4040F
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 18:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9ODr7ipTMT7 for <iommu@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 18:46:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31BA7402EE
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 18:46:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DC56D;
 Tue,  1 Jun 2021 11:46:51 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B59C3F774;
 Tue,  1 Jun 2021 11:46:50 -0700 (PDT)
Subject: Re: [PATCH 1/1] dma-contiguous: return early for dt case in
 dma_contiguous_reserve
To: Dong Aisheng <dongas86@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>
References: <20210518112857.1198415-1-aisheng.dong@nxp.com>
 <CAA+hA=SSeRrnBRGeqVxJ71Cv0uxydidWoKmG6b0bYzoEdcgqOQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4a7922c0-7696-b4f7-f212-6710f4b2720d@arm.com>
Date: Tue, 1 Jun 2021 19:46:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAA+hA=SSeRrnBRGeqVxJ71Cv0uxydidWoKmG6b0bYzoEdcgqOQ@mail.gmail.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, open list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
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

On 2021-05-31 10:21, Dong Aisheng wrote:
> On Tue, May 18, 2021 at 7:29 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>>
>> dma_contiguous_reserve() aims to support cmdline case for CMA memory
>> reserve. But if users define reserved memory in DT,
>> 'dma_contiguous_default_area' will not be 0, then it's meaningless
>> to continue to run dma_contiguous_reserve(). So we return early
>> if detect 'dma_contiguous_default_area' is unzero.
>>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Gently ping

The commit message is still wrong, and I still think the change doesn't 
achieve anything meaningful. This code is hard to make sense of either 
way because the crucial interplay between size_cmdline and 
dma_contiguous_default_area is hidden somewhere else entirely, and it 
would take a much more significant refactoring to clear that up.

Robin.

> 
> Regards
> Aisheng
> 
>> ---
>>   kernel/dma/contiguous.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
>> index 3d63d91cba5c..ebade9f43eff 100644
>> --- a/kernel/dma/contiguous.c
>> +++ b/kernel/dma/contiguous.c
>> @@ -171,6 +171,9 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>>          phys_addr_t selected_limit = limit;
>>          bool fixed = false;
>>
>> +       if (dma_contiguous_default_area)
>> +               return;
>> +
>>          pr_debug("%s(limit %08lx)\n", __func__, (unsigned long)limit);
>>
>>          if (size_cmdline != -1) {
>> @@ -191,7 +194,7 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>>   #endif
>>          }
>>
>> -       if (selected_size && !dma_contiguous_default_area) {
>> +       if (selected_size) {
>>                  pr_debug("%s: reserving %ld MiB for global area\n", __func__,
>>                           (unsigned long)selected_size / SZ_1M);
>>
>> --
>> 2.25.1
>>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
