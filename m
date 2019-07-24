Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C47311F
	for <lists.iommu@lfdr.de>; Wed, 24 Jul 2019 16:08:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0BE37E6D;
	Wed, 24 Jul 2019 14:07:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D85E4E2F
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 14:07:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 90CE8FE
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 14:07:57 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3686A21BF6;
	Wed, 24 Jul 2019 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563977277;
	bh=q5JArXbSQPR5xLurBAUTeK3QW8R25A1YF+BwHv3RCv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taPCRfGPAORqO7RV/BtaQZ8r/flUjO9VftImmFiZPtnvhdmKZpsplTPs5fWdZrRlM
	xux6EPmXj+2UrewDPGaOx7I4BPmspz7eqDxMeVgw0MpW+SU5PSq00Zet6Jn4fqzblA
	ToZgIA8OhbmKtM7Qh9DUbpXWTEHiliBAG4pa5vw0=
Date: Wed, 24 Jul 2019 15:07:52 +0100
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [RFC PATCH v2 18/19] iommu/arm-smmu-v3: Reduce contention during
	command-queue insertion
Message-ID: <20190724140751.pewgh4v5bmlmub23@willie-the-truck>
References: <20190711171927.28803-1-will@kernel.org>
	<20190711171927.28803-19-will@kernel.org>
	<8a1be404-f22a-1f96-2f0d-4cf35ca99d2d@huawei.com>
	<20190724121548.j5tekad45kwlobvs@willie-the-truck>
	<fa90f89b-77f4-f983-52be-69bb40d17901@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa90f89b-77f4-f983-52be-69bb40d17901@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vijay Kilary <vkilari@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Jon Masters <jcm@redhat.com>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	iommu@lists.linux-foundation.org,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Robin Murphy <robin.murphy@arm.com>
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

On Wed, Jul 24, 2019 at 03:03:20PM +0100, John Garry wrote:
> On 24/07/2019 13:15, Will Deacon wrote:
> > > Could it be a minor optimisation to advance the HW producer pointer at this
> > > stage for the owner only? We know that its entries are written, and it
> > > should be first in the new batch of commands (right?), so we could advance
> > > the pointer to at least get the HW started.
> > 
> > I think that would be a valid thing to do, but it depends on the relative
> > cost of writing to prod compared to how long we're likely to wait. Given
> > that everybody has irqs disabled when writing out their commands, I wouldn't
> > expect the waiting to be a big issue,
> 
> For sure, but I'm thinking of the possible scenario where the the guy(s)
> we're waiting on have many more commands. Or they just joined the current
> gathering quite late, just prior to clearing the owner flag.

Understood, but a "cacheable" memcpy (assuming the SMMU is coherent) should
be pretty quick, even for maximum batch size I think.

>  although we could probably optimise
> > arm_smmu_cmdq_write_entries() into a memcpy() if we needed to.
> > 
> > In other words, I think we need numbers to justify that change.
> 
> Anyway, this is quite minor, and I will see if the change could be justified
> by numbers.

Thanks! If the numbers show it's useful, we can definitely add it.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
