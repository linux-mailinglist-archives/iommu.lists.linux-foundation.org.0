Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3D6E3038
	for <lists.iommu@lfdr.de>; Thu, 24 Oct 2019 13:21:41 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A000914CF;
	Thu, 24 Oct 2019 11:21:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2728914AD
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 11:21:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DBEE58AC
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 11:21:35 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 85A6B20856;
	Thu, 24 Oct 2019 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571916095;
	bh=NU8mQb2h0/LjJk0PvHij6/R4e6uRraWEpQjrI463EH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8SipnXw70PK36+xT/cT3Fuxn7r9dNKSH1vKR8iOGQX772FqSLYLIG6XqkZNAw6O3
	a/WCPnNSNcnJeq5Jt33NAjktZL20Jsy51ZzLSjByZWszf5VwzdBsW0ohgrU9RvxUtY
	6ZD1UW9nmFkN5O20D2wTPL+Zv4NSnU2UClw7Lz2Q=
Date: Thu, 24 Oct 2019 12:21:31 +0100
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: Users of IOMMU_QCOM_SYS_CACHE?
Message-ID: <20191024112130.GD1242@willie-the-truck>
References: <20191024105150.GC1242@willie-the-truck>
	<d255a4a6835fb982b5852106f970b0e6@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d255a4a6835fb982b5852106f970b0e6@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com, sspatil@android.com
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

On Thu, Oct 24, 2019 at 04:41:04PM +0530, Sai Prakash Ranjan wrote:
> On 2019-10-24 16:21, Will Deacon wrote:
> > In commit 90ec7a76cc4b ("iommu/io-pgtable-arm: Add support to use system
> > cache") we added support for IOMMU_QCOM_SYS_CACHE which was merged into
> > 5.3.
> > This allows non-coherent devices to request an outer cacheable memory
> > type.... except that nobody actually does this in mainline. I remember
> > there
> > being a potential DRM user but I don't know what happened to it.
> > 
> > Given that this isn't actually exposed in the DMA API, I worry that
> > we're
> > just carrying part of an out-of-tree hack here and propose that we drop
> > the flag altogether unless we get an upstream user, preferably by
> > plumbing
> > this into the DMA API via a new attribute.
> > 
> > Thoughts?
> > 
> 
> There is definitely a user of this coming soon atleast for SC7180 SoC once
> we have support for this SoC upstream.

Ok, I'm keen to see how you end up using this. How soon is soon?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
