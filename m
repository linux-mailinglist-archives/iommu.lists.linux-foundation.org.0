Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF0AE2092
	for <lists.iommu@lfdr.de>; Wed, 23 Oct 2019 18:27:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0DF3EAD7;
	Wed, 23 Oct 2019 16:27:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 28226AD7
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 16:27:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D34AF831
	for <iommu@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 16:27:23 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B3C882084C;
	Wed, 23 Oct 2019 16:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571848043;
	bh=do5PkS+eCKNocSWak3vYJW2/3BSNU4s/TcZDTpcE/uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1DPwNU5sp8U4oU2roN7ycpMthYFFZWGa9uGNfK5JqrAHZRUmADqgzKgjwm8KmNIV7
	M/hqEg5VoO1HYCLa8snLPXvTJxivHw1rMSuA5n+AJBZSwt6NNLwy1FGgkzEtmOMIxB
	BrT556CQ+lASBf9qVwuralKGxRkHukTJkktgejVQ=
Date: Wed, 23 Oct 2019 17:27:17 +0100
From: Will Deacon <will@kernel.org>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v3 0/7] Nvidia Arm SMMUv2 Implementation
Message-ID: <20191023162716.GA27010@willie-the-truck>
References: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
	<6d9e6425-fa69-9b76-b477-1fe50c459ca5@arm.com>
	<BYAPR12MB2710879535971E290E8B25D3B3680@BYAPR12MB2710.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2710879535971E290E8B25D3B3680@BYAPR12MB2710.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sachin Nikam <Snikam@nvidia.com>, "thomasz@nvidia.com" <thomasz@nvidia.com>,
	Juha Tukkinen <jtukkinen@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pritesh Raithatha <praithatha@nvidia.com>, Timo Alho <talho@nvidia.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	Yu-Huan Hsu <YHsu@nvidia.com>, Thierry Reding <treding@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Van Brunt <avanbrunt@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
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

On Tue, Oct 22, 2019 at 11:48:55PM +0000, Krishna Reddy wrote:
> >>Apologies for crossed wires, but I had a series getting rid of
> >>arm_smmu_flush_ops which was also meant to end up making things a bit
> >>easier for you:
> 
> I was looking to rebase on top of your changes first.  Then I read Will's
> reply that said your work is queued for 5.5.

D'oh, sorry, I completely forgot to push that branch out. Now done:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
