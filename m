Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43995E19
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 14:08:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 746CAE19;
	Tue, 20 Aug 2019 12:08:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D4BECC8E
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 12:08:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4A0618A2
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 12:08:55 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0FAE32082F;
	Tue, 20 Aug 2019 12:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566302935;
	bh=ADbik8CK8iQ7jdhrR0Rax0t1bMR+xklkh8X3NNS9eXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+T4sZhl38XkG0uVXUKABIvfkkblopckcHuZwjY1K13rm3d1n0Ouxe26jVTbPkj7v
	mYLztxQe2zMdn5Ggs4BhJF1IFaIHV/UDnmdGHmC4Xs3wIx7Jg7GvX3t8lfV1ZvD/1E
	yVbNjI5zzdB+0bxIdWot/nWuC696XIdLWpFzCk1Y=
Date: Tue, 20 Aug 2019 13:08:49 +0100
From: Will Deacon <will@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 1/4] iommu/arm-smmu: Introduce wrapper for writeq/readq
Message-ID: <20190820120848.2m6gytilrpil4stu@willie-the-truck>
References: <20190711150242.25290-1-gregory.clement@bootlin.com>
	<20190711150242.25290-2-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711150242.25290-2-gregory.clement@bootlin.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nadav Haklai <nadavh@marvell.com>, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	Robin Murphy <robin.murphy@arm.com>, Hanna Hawa <hannah@marvell.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

Hi Gregory, Hanna,

On Thu, Jul 11, 2019 at 05:02:39PM +0200, Gregory CLEMENT wrote:
> From: Hanna Hawa <hannah@marvell.com>
> 
> This patch introduces the smmu_writeq_relaxed/smmu_readq_relaxed
> helpers, as preparation to add specific Marvell work-around for
> accessing 64 bits width registers of ARM SMMU.
> 
> Signed-off-by: Hanna Hawa <hannah@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  drivers/iommu/arm-smmu.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)

Sorry for the delay in replying to this -- Robin's been reworking the driver
so that implementation quirks can be specified more cleanly. Please can you
take a look at:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/refactoring

and try to respin your patches on top of that?

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
