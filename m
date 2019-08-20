Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E8A957D1
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 09:04:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C964BD7A;
	Tue, 20 Aug 2019 07:04:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AD18ED13
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 07:04:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 68A2B87
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 07:04:55 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7B2FD20C01;
	Tue, 20 Aug 2019 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566284695;
	bh=k8rmf+NYWBrNwDZWHXITwAsQXxQMUUCm38mRV4YkvEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2nWBnyvNSVa2/Mvwppf+LtBamrCz0V1mPUT5/SIuUh4vd1nOpRDP4XQldLJppe3ba
	CXuDyMRRUqmaWu5nB8Vh+J62GEqhpvPOF+tDHhnpQWT7ILkp4wqxEaVvL/qAjgKedX
	Yo96ZwQfXZBQgfuWWeqDih+xbFmaPEGIEprzWMcg=
Date: Tue, 20 Aug 2019 08:04:50 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 00/17] Arm SMMU refactoring
Message-ID: <20190820070449.mjqmmn4me364lta5@willie-the-truck>
References: <cover.1565892337.git.robin.murphy@arm.com>
	<20190819155634.xflkhxexzks3y7oa@willie-the-truck>
	<d8a47e62-0768-7ae2-f2fc-53b5b2b24685@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8a47e62-0768-7ae2-f2fc-53b5b2b24685@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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

On Mon, Aug 19, 2019 at 07:10:45PM +0100, Robin Murphy wrote:
> On 19/08/2019 16:56, Will Deacon wrote:
> > On Thu, Aug 15, 2019 at 07:37:20PM +0100, Robin Murphy wrote:
> > > v1 for context: https://patchwork.kernel.org/cover/11087347/
> > > 
> > > Here's a quick v2 attempting to address all the minor comments; I've
> > > tweaked a whole bunch of names, added some verbosity in macros and
> > > comments for clarity, and rejigged arm_smmu_impl_init() for a bit more
> > > structure. The (new) patches #1 and #2 are up front as conceptual fixes,
> > > although they're not actually critical - it turns out to be more of an
> > > embarrassment than a real problem in practice.
> > 
> > Thanks, I'll pick this up and send to Joerg later this week.
> 
> Oops, I've just noticed that the io-64-nonatomic-hi-lo.h include also needs
> to move to arm-smmu.h in #14 to avoid breaking 32-bit builds. I've pushed
> out an updated branch (along with the static fixes for good measure) - let
> me know if you'd like a resend of the patches.

Can you just send a patch on top instead, please? I'd prefer not to rebase
things unless we really need to, and I've already pushed this stuff to
for-joerg/arm-smmu/refactoring.

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
