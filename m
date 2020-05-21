Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4641DCF56
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 16:17:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4858587B65;
	Thu, 21 May 2020 14:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9RNAQmbOLTH; Thu, 21 May 2020 14:17:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC7BF87DB2;
	Thu, 21 May 2020 14:17:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6BD3C0176;
	Thu, 21 May 2020 14:17:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84717C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EA1325C66
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gmussjb0YNOW for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 14:16:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id F2F002041F
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 14:16:58 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC33920721;
 Thu, 21 May 2020 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590070618;
 bh=YEpYYTkp5Epc3I02PSQwVAAWySjqR5HmPWamm+n+yqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=emfD5+Td4JkWFa9nx6iu3NhZWqXHy0Cul4uBIz9eMW1m5pPlTHa3MQ1L5tweReNSI
 +nzqkI81I9u0yvHl2QuuuCSWQWBHWnNeJWjSyn9PN2T9MFAPEf2DHjH906FGfDBG7N
 BL2C2n3EL7yfzDXZBJ3cF8uo2pvDC11Gd/AuJzgo=
Date: Thu, 21 May 2020 15:16:52 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v7 12/24] iommu/arm-smmu-v3: Add support for VHE
Message-ID: <20200521141652.GG6608@willie-the-truck>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
 <20200519175502.2504091-13-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519175502.2504091-13-jean-philippe@linaro.org>
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

On Tue, May 19, 2020 at 07:54:50PM +0200, Jean-Philippe Brucker wrote:
> ARMv8.1 extensions added Virtualization Host Extensions (VHE), which allow
> to run a host kernel at EL2. When using normal DMA, Device and CPU address
> spaces are dissociated, and do not need to implement the same
> capabilities, so VHE hasn't been used in the SMMU until now.
> 
> With shared address spaces however, ASIDs are shared between MMU and SMMU,
> and broadcast TLB invalidations issued by a CPU are taken into account by
> the SMMU. TLB entries on both sides need to have identical exception level
> in order to be cleared with a single invalidation.
> 
> When the CPU is using VHE, enable VHE in the SMMU for all STEs. Normal DMA
> mappings will need to use TLBI_EL2 commands instead of TLBI_NH, but
> shouldn't be otherwise affected by this change.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/arm-smmu-v3.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
