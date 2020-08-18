Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CB4248095
	for <lists.iommu@lfdr.de>; Tue, 18 Aug 2020 10:29:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ACFC820370;
	Tue, 18 Aug 2020 08:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xt+KqwH5YVEA; Tue, 18 Aug 2020 08:29:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8C9CC2012D;
	Tue, 18 Aug 2020 08:29:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78E7FC0051;
	Tue, 18 Aug 2020 08:29:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9FADC0051
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 08:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD88C853D9
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 08:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFYZTvHljs3p for <iommu@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 08:28:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D80968516A
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 08:28:59 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06C49206B5;
 Tue, 18 Aug 2020 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597739339;
 bh=gPFyLTIegbMbhCl/SHxbZho1NDgw4y9nB98xI43nArc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EXk37qGMQptQYYGyQs1hk7neeMhgMHNghUpk6hUZihonCozzdkwOKG/6057M2UhZO
 YMAVfOdBg7mFDBkFTd7Xa6ugS61m006dGMSQb6JbFBJj5oL4C+XIOVHwxPo7EKFFDA
 Vg8I8t7hE6jCa1Bu62ua4ap0lhEvXhFZ2im2dcc8=
Date: Tue, 18 Aug 2020 09:28:53 +0100
From: Will Deacon <will@kernel.org>
To: Cho KyongHo <pullip.cho@samsung.com>
Subject: Re: [PATCH 1/2] dma-mapping: introduce relaxed version of dma sync
Message-ID: <20200818082852.GA15145@willie-the-truck>
References: <CGME20200818075050epcas2p15c780650f5f6b4a54ce731c273d24c98@epcas2p1.samsung.com>
 <1597736591-20457-1-git-send-email-pullip.cho@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597736591-20457-1-git-send-email-pullip.cho@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: janghyuck.kim@samsung.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, hyesoo.yu@samsung.com,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Aug 18, 2020 at 04:43:10PM +0900, Cho KyongHo wrote:
> Cache maintenance operations in the most of CPU architectures needs
> memory barrier after the cache maintenance for the DMAs to view the
> region of the memory correctly. The problem is that memory barrier is
> very expensive and dma_[un]map_sg() and dma_sync_sg_for_{device|cpu}()
> involves the memory barrier per every single cache sg entry. In some
> CPU micro-architecture, a single memory barrier consumes more time than
> cache clean on 4KiB. It becomes more serious if the number of CPU cores
> are larger.

Have you got higher-level performance data for this change? It's more likely
that the DSB is what actually forces the prior cache maintenance to
complete, so it's important to look at the bigger picture, not just the
apparent relative cost of these instructions.

Also, it's a miracle that non-coherent DMA even works, so I'm not sure
that we should be complicating the implementation like this to try to
make it "fast".

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
