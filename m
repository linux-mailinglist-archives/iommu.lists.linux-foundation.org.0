Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5B357B9E
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 06:56:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B84E60909;
	Thu,  8 Apr 2021 04:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cJNLK6w4PvVE; Thu,  8 Apr 2021 04:56:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392D060DA4;
	Thu,  8 Apr 2021 04:56:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 193F9C0012;
	Thu,  8 Apr 2021 04:56:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4F0EC000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 04:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id 9BC0384CC3
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 04:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id qdM51pz_9dE4 for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 04:56:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 9B7BF84CB4
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 04:56:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617857800; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0BjOfJX+EMm24GGbg69coeWReUu+Ob4k6iAsD5/HITw=;
 b=j/xg7KJEYyrc3kOjYjS1vkiwOVeScwzcMyTEK53DOG83JHLi0fElIs9ECMYhAQsL1iTr+p95
 uW6Xim+zF1LhdC8er9xWpADa0/B5p0SXzZaN/EfaY2TjWyOFABkgT9Ltdh/8cYuJDls6pgT7
 7abO7YWjvTb8yvZZdqQAPlW5kog=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 606e8d07febcffa80f839568 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 04:56:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A24F3C43461; Thu,  8 Apr 2021 04:56:39 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9389CC433C6;
 Thu,  8 Apr 2021 04:56:38 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 21:56:38 -0700
From: isaacm@codeaurora.org
To: Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH v3 09/12] iommu/io-pgtable-arm: Implement
 arm_lpae_unmap_pages()
In-Reply-To: <20210407095706.GB15057@willie-the-truck>
References: <20210405191112.28192-1-isaacm@codeaurora.org>
 <20210405191112.28192-10-isaacm@codeaurora.org>
 <20210406121552.GF13747@willie-the-truck>
 <8f78f5d051c9d40981fc6868c9245cd3@codeaurora.org>
 <20210407095706.GB15057@willie-the-truck>
Message-ID: <c20b761121e6efb52c14064df215bcaf@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: pratikp@codeaurora.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On 2021-04-07 02:57, Will Deacon wrote:
> On Tue, Apr 06, 2021 at 02:02:26PM -0700, isaacm@codeaurora.org wrote:
>> On 2021-04-06 05:15, Will Deacon wrote:
>> > On Mon, Apr 05, 2021 at 12:11:09PM -0700, Isaac J. Manjarres wrote:
>> > > Implement the unmap_pages() callback for the ARM LPAE io-pgtable
>> > > format.
>> > >
>> > > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> > > Suggested-by: Will Deacon <will@kernel.org>
>> > > ---
>> > >  drivers/iommu/io-pgtable-arm.c | 124
>> > > +++++++++++++++++++++++++++------
>> > >  1 file changed, 104 insertions(+), 20 deletions(-)
>> >
>> > [...]
>> >
>> > > +static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops,
>> > > unsigned long iova,
>> > > +				   size_t pgsize, size_t pgcount,
>> > > +				   struct iommu_iotlb_gather *gather)
>> > > +{
>> > > +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>> > > +	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>> > > +	arm_lpae_iopte *ptep = data->pgd;
>> > > +	long iaext = (s64)iova >> cfg->ias;
>> > > +	size_t unmapped = 0, unmapped_page;
>> > > +	int last_lvl;
>> > > +	size_t table_size, pages, tbl_offset, max_entries;
>> > > +
>> > > +	if (WARN_ON(!pgsize || (pgsize & cfg->pgsize_bitmap) != pgsize ||
>> > > !pgcount))
>> > > +		return 0;
>> > > +
>> > > +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
>> > > +		iaext = ~iaext;
>> > > +	if (WARN_ON(iaext))
>> > > +		return 0;
>> > > +
>> > > +	/*
>> > > +	 * Calculating the page table size here helps avoid situations where
>> > > +	 * a page range that is being unmapped may be mapped at the same
>> > > level
>> > > +	 * but not mapped by the same tables. Allowing such a scenario to
>> > > +	 * occur can complicate the logic in arm_lpae_split_blk_unmap().
>> > > +	 */
>> > > +	last_lvl = ARM_LPAE_BLOCK_SIZE_LVL(pgsize, data);
>> > > +
>> > > +	if (last_lvl == data->start_level)
>> > > +		table_size = ARM_LPAE_PGD_SIZE(data);
>> > > +	else
>> > > +		table_size = ARM_LPAE_GRANULE(data);
>> > > +
>> > > +	max_entries = table_size / sizeof(*ptep);
>> > > +
>> > > +	while (pgcount) {
>> > > +		tbl_offset = ARM_LPAE_LVL_IDX(iova, last_lvl, data);
>> > > +		pages = min_t(size_t, pgcount, max_entries - tbl_offset);
>> > > +		unmapped_page = __arm_lpae_unmap(data, gather, iova, pgsize,
>> > > +						 pages, data->start_level,
>> > > +						 ptep);
>> > > +		if (!unmapped_page)
>> > > +			break;
>> > > +
>> > > +		unmapped += unmapped_page;
>> > > +		iova += unmapped_page;
>> > > +		pgcount -= pages;
>> > > +	}
>> >
>> > Robin has some comments on the first version of this patch, and I
>> > don't think you
>> > addressed them:
>> >
>> > https://lore.kernel.org/r/b93fa0b1-e2a4-1aad-8b88-4d0dfecdfef7@arm.com
>> >
>> > I'm inclined to agree that iterating here doesn't make a lot of sense --
>> > we've already come back out of the page-table walk, so I think we should
>> > just return to the caller (who is well prepared to handle a partial
>> > unmap).
>> > Same for the map side of things.
>> >
>> > If we get numbers showing that this is causing a performance issue, then
>> > we should rework the page-table code to handle this at the lower level
>> > (because I doubt the loop that you have is really worse than returning
>> > to
>> > the caller anyway).
>> >
>> Sorry, I seem to have overlooked those comments.
>> 
>> I will go ahead and address them. I think it might be ideal to try to 
>> do
>> as much work as possible in the io-pgtable level, so as to minimize 
>> the
>> number
>> of indirect calls incurred by jumping back and forth between iommu 
>> fwk,
>> iommu
>> driver, and io-pgtable code.
>> 
>> Perhaps we can try something like how the linear mappings are created 
>> on
>> arm64 i.e.
>> on the previous level, we can determine how many pages can be unmapped 
>> in
>> one page table
>> in one iteration, and on the subsequent iterations, we can tackle 
>> another
>> page table at
>> the lower level. Looking at the code, it doesn't seem too difficult to 
>> add
>> this in. Thoughts?
> 
> I don't object to getting there eventually, but as an initial step I 
> think
> returning back to the caller is perfectly reasonable and will probably 
> make
> the patches easier to review. In other words, implement the simple 
> (correct)
> thing first, and then have subsequent patches to improve it.
> 
> Will
Thanks for the feedback. I've implemented the simpler approach in v4 of 
the patches: 
https://lore.kernel.org/linux-iommu/20210408045241.27316-1-isaacm@codeaurora.org/T/#t.

Thanks,
Isaac
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
