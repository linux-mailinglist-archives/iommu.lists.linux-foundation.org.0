Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE165479
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 12:32:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C6DFE4E9F;
	Thu, 11 Jul 2019 10:32:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 81F7D4E9B
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 10:23:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D1B24CF
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 10:23:07 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 89AD321537;
	Thu, 11 Jul 2019 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562840587;
	bh=Qax9TB9v/t+JwqwzSQrrFr6m3BcBICpw8ugber+pTq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zA91KDGOMxMlfYtukBX0p9X9CZ355qgtXSmRA8Cul/dms1QZxtS4Zo/SIqu8rLCUu
	97yildkCyBKTOn/ch5dbrLyVBMNLW25juxlCHHqyglcBuFKIL7/yl9WciNvLtMkwfT
	Cvw5Nr8/ZmQ5Oug2plUOsj1aTADDr1IQRQadiWZE=
Date: Thu, 11 Jul 2019 11:23:03 +0100
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] iommu: io-pgtable: Drop WARN for empty PTEs on unmap
Message-ID: <20190711102303.pnvy4zlitusjjku7@willie-the-truck>
References: <20190710223119.8151-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710223119.8151-1-robh@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 10, 2019 at 04:31:19PM -0600, Rob Herring wrote:
> If a region has been mapped sparsely (such as on page faults), the user
> has to keep track of what was mapped or not in order to avoid warnings
> when unmapping the entire region. Remove the WARN on empty PTEs to allow
> unmapping sparsely mapped regions.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux-foundation.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This is needed for large (up to 1GB AIUI) scratch buffers on panfrost 
> which are mapped on demand on GPU page faults and can be unmapped on 
> memory pressure. Alternatively, I'd need to have a bitmap of mapped 
> pages to track what is mapped or not. Dropping the WARN seems like a 
> much simpler solution.

I suppose an alternative would be to do an iova_to_phys() before you do the
unmap(). Would that be acceptable? The WARN_ON() indicates invalid usage by
the IOMMU API, so it would be a shame to lose it entirely and I'm hesitant
to continue adding quirks at the rate we're currently doing so!

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
