Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF801DCBEC
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 13:12:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD4CA883C3;
	Thu, 21 May 2020 11:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UN2cKlZQm7I4; Thu, 21 May 2020 11:12:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 391A7883C0;
	Thu, 21 May 2020 11:12:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F2E1C0176;
	Thu, 21 May 2020 11:12:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51493C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 11:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E69E24F92
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 11:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mD2UuncFfwO for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 11:12:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 65A8E204A9
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 11:12:38 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 155D420721;
 Thu, 21 May 2020 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590059558;
 bh=iYAjQM9yDvPql0mmE1wLbplsG3C1/FtvidpyoFZTNcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbQZQM+GNTzrdOvhJbIb17KBDxPUiI5biwavwK0ds9PBU1FY7uibn+697skdDAIVQ
 yFXwMF5VvH/1rukebrLHWPGWqFtQ3+3TV0Kj0D1fp7w/HPbsd6cZlPIsSXZgvG/azC
 D0cHphBjPJAlwYQJ5TJAw32lHV/7I7vDY2pYw23U=
Date: Thu, 21 May 2020 12:12:31 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v7 18/24] iommu/arm-smmu-v3: Add support for Hardware
 Translation Table Update
Message-ID: <20200521111231.GA5949@willie-the-truck>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
 <20200519175502.2504091-19-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519175502.2504091-19-jean-philippe@linaro.org>
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

On Tue, May 19, 2020 at 07:54:56PM +0200, Jean-Philippe Brucker wrote:
> If the SMMU supports it and the kernel was built with HTTU support,
> enable hardware update of access and dirty flags. This is essential for
> shared page tables, to reduce the number of access faults on the fault
> queue. Normal DMA with io-pgtables doesn't currently use the access or
> dirty flags.
> 
> We can enable HTTU even if CPUs don't support it, because the kernel
> always checks for HW dirty bit and updates the PTE flags atomically.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/arm-smmu-v3.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)

How does this work if the SMMU isn't cache coherent? I'm guessing we don't
want to enable any SVA stuff in that case, but I couldn't spot where that
was being enforced. Did I just miss it?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
