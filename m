Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4F1DCB1F
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 12:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE40487C9C;
	Thu, 21 May 2020 10:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRof0Hil-+sf; Thu, 21 May 2020 10:35:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 86E058929E;
	Thu, 21 May 2020 10:35:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C19FC0176;
	Thu, 21 May 2020 10:35:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 280A3C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 10:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0FB0020506
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 10:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lgnkFCZSVeaX for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 10:35:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 7FB8420432
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 10:35:20 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3ACFB207D3;
 Thu, 21 May 2020 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590057320;
 bh=a9hJk21ZfjUP7X59u528A9f5ow2mLYdP8uHbmtg8vZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5EcqRcd2YGUS5rhJDclmz3R8zFpPuaz8n559EdvwZ4E29gACziYUBrsQNdJHuSjo
 rSEj0lQ6sAGcQTC7tKESxdfpcyP33agwVDT/h0+km7gZuULSnH/ymBjZgNsF4jYfyM
 RknuG+C678ZPapDa+RAU5OwwowB3K7ZkF9YyfZ9E=
Date: Thu, 21 May 2020 11:35:14 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v7 00/24] iommu: Shared Virtual Addressing for SMMUv3
Message-ID: <20200521103513.GE5360@willie-the-truck>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519175502.2504091-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com, jgg@ziepe.ca,
 linux-pci@vger.kernel.org, fenghua.yu@intel.com, hch@infradead.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 catalin.marinas@arm.com, felix.kuehling@amd.com, robin.murphy@arm.com,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org
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

Hi Jean-Philippe,

On Tue, May 19, 2020 at 07:54:38PM +0200, Jean-Philippe Brucker wrote:
> Shared Virtual Addressing (SVA) allows to share process page tables with
> devices using the IOMMU, PASIDs and I/O page faults. Add SVA support to
> the Arm SMMUv3 driver.
> 
> Since v6 [1]:
> * Rename ioasid_free() to ioasid_put() in patch 02, requiring changes to
>   the Intel drivers.
> * Use mmu_notifier_register() in patch 16 to avoid copying the ops and
>   simplify the invalidate() notifier in patch 17.
> * As a result, replace context spinlock with a mutex. Simplified locking in
>   patch 11 (That patch still looks awful, but I think the series is more
>   readable overall). And I've finally been able to remove the GFP_ATOMIC
>   allocations.
> * Use a single patch (04) for io-pgfault.c, since the code was simplified
>   in v6. Fixed partial list in patch 04.

There's an awful lot here and it stretches across quite a few subsystems,
with different git trees. What's the plan for merging it?

I'm happy to take some of the arm64 and smmu changes for 5.8, then perhaps
we can review what's left and target 5.9? It would also be helpful to split
that up into separate series where there aren't strong dependencies, I
think.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
