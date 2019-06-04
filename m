Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78934584
	for <lists.iommu@lfdr.de>; Tue,  4 Jun 2019 13:35:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 19505DA4;
	Tue,  4 Jun 2019 11:35:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6EBABB65
	for <iommu@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 11:35:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 95A49711
	for <iommu@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 11:35:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5cf6576e0000>; Tue, 04 Jun 2019 04:35:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 04 Jun 2019 04:35:11 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 04 Jun 2019 04:35:11 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
	(172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 4 Jun 2019 11:35:11 +0000
Received: from [10.26.11.158] (172.20.13.39) by DRHQMAIL107.nvidia.com
	(10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 4 Jun 2019 11:35:08 +0000
Subject: Re: [PATCH 07/26] iommu/dma: move the arm64 wrappers to common code
To: Christoph Hellwig <hch@lst.de>
References: <20190422175942.18788-1-hch@lst.de>
	<20190422175942.18788-8-hch@lst.de>
	<06b331f0-7df7-a6cd-954c-789f89a0836d@arm.com>
	<acb46c7f-0855-de30-485f-a6242968f947@nvidia.com>
	<20190604060554.GA14536@lst.de>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5e119919-bbfd-14a4-0258-93e8249d11c4@nvidia.com>
Date: Tue, 4 Jun 2019 12:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604060554.GA14536@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
	DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1559648110; bh=VdqCX9RhIKbSosQO8ZrtJXPmMRZiVMAZh+LN9yQt9Zk=;
	h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
	User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
	X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=emCZJ7it6lQS53IGu3TzNnekDYJaA//l1h7EaXgGok72LlXH4v9jhBAOGQz59yBV4
	uYLIm9wA8pSFenLXo9wX7QKjEjv1kcJRtovDerKh6hs3he51kpHfqrKB19qfA8gG2N
	Y37awIOpATCkodK1yiiLnWKsYxhHzIPMofESI5qT+J2Pu+7R+6uDdYfIRE3tHij3LC
	wuYTsm1vWBrKeeJ3WgBQkWNLGs1mOxBO/NnkHfhYBVTqVNVhwNh3Eg49AVRVUD9SIR
	Uzr4wK1ElNJox0xa4xVXPelS4UcglZJJ7ebbiM61sRgdQ84RBEMjJqexYIaLMth4JY
	Lh71EqBvSMgrw==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


On 04/06/2019 07:05, Christoph Hellwig wrote:
> On Mon, Jun 03, 2019 at 08:47:57PM +0100, Jon Hunter wrote:
>> Since next-20190529 one of our tests for MMC has started failing, where
>> the symptom is that the data written to the MMC does not match the
>> source. Bisecting this is pointing to this commit. Unfortunately, I am
>> not able to cleanly revert this on top of -next, but wanted to report
>> this if case you have any ideas.
> 
> Does this fix your problem?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/commit/?h=generic-dma-ops&id=1b961423158caaae49d3900b7c9c37477bbfa9b3

Yes I can confirm with this patch on today's -next the issue is no
longer seen, and reverting this patch on top of today's -next causes the
problem to occur again. So yes this fixes my problem.

Thanks!
Jon

-- 
nvpublic
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
