Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBDC225D24
	for <lists.iommu@lfdr.de>; Mon, 20 Jul 2020 13:11:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2AE2B864F3;
	Mon, 20 Jul 2020 11:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LnuXyRVOABBR; Mon, 20 Jul 2020 11:11:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB3C086499;
	Mon, 20 Jul 2020 11:11:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F8D8C016F;
	Mon, 20 Jul 2020 11:11:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9470C016F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 11:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A1498204E9
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 11:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gFry72Vi1LR for <iommu@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 11:11:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id DEAD92049F
 for <iommu@lists.linux-foundation.org>; Mon, 20 Jul 2020 11:11:22 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EF952073A;
 Mon, 20 Jul 2020 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595243482;
 bh=oVyIzYwCQBW5SyCkeejp0Vu+XeorkqSTvfQGJPfw4nU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2rvxzOtDaZhYo7kOCgH4x/FJzQ7OzhcpPNMJ2cUoW4oUTosW/clma/lHEJ3eO95O
 XcCnldggXNdChmdeCES2GQpBxI5kSPfTxZ9HVS/2r/Yl8uyAWt74MGgOls9wq3ps2D
 dko+dlPn3RlY+pL0Tf+44tlOReoCVMra4yD4otbc=
Date: Mon, 20 Jul 2020 12:11:17 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v8 00/12] iommu: Shared Virtual Addressing for SMMUv3 (PT
 sharing part)
Message-ID: <20200720111116.GE11516@willie-the-truck>
References: <20200618155125.1548969-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618155125.1548969-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: fenghua.yu@intel.com, catalin.marinas@arm.com, zhengxiang9@huawei.com,
 hch@infradead.org, linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 zhangfei.gao@linaro.org, robin.murphy@arm.com,
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

On Thu, Jun 18, 2020 at 05:51:13PM +0200, Jean-Philippe Brucker wrote:
> Since v7 [1], I split the series into three parts to ease review. This
> first one adds page table sharing to the SMMUv3 driver. The second one
> adds support for I/O page faults through PRI and Stall, and the last one
> adds additional and optional features (DVM, VHE and HTTU). SVA needs the
> three parts to work. No significant change apart from that, I just
> addressed the previous comments.
> 
> I'd rather everything went through the IOMMU tree but I'm assuming patch
> 1 will also go through the x86 tree as part of [2]. It is definitely
> required by patch 3 which is required by patch 11. I don't know how this
> kind of conflict is usually resolved, but if it's a problem I could
> further shrink the series to only patches 4-10 this cycle.

Modulo my review comments, I think most of this looks alright from the SMMU
side. However, I would really like it if the SVA driver parts could be moved
into a separate file (e.g. arm-smmu-v3-sva.c), with a separate config option
(dependent on the current one, so you can easily build a driver without SVA
support). Does that sound remotely feasible? If so, I think it would really
help in terms of maintainability, since the SVA model is really all about
the mm, whereas the driver model is all about the device. This makes it
really hard to read when you have to keep working out whether the current
'handle' is an mm_struct or an arm_smmu_device.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
