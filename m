Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED613ADD6
	for <lists.iommu@lfdr.de>; Tue, 14 Jan 2020 16:40:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E6F985EB4;
	Tue, 14 Jan 2020 15:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDmP9oZufiEZ; Tue, 14 Jan 2020 15:40:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9BA685E9F;
	Tue, 14 Jan 2020 15:40:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4864C077D;
	Tue, 14 Jan 2020 15:40:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98E29C077D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 15:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 87177204CF
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 15:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRUGomtSkC3g for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 15:40:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 53BB520454
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jan 2020 15:40:14 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0347B24672;
 Tue, 14 Jan 2020 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579016414;
 bh=Scmn4FCA0QfCQbkxnkpuG+cd4jIF88weR9x4vuOXxyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gFNR/cA6IMsPOxcO2Es5EXCXzP/RoXRHPogu0/vZloph2th4hE/fDSssbR+DDMqFX
 FarFFXlJyEiW6iDxZ/CBxreszI3AyzmBT3DlXxlqs6qtCGkxpyfcRBSswoLsp0yaQq
 TeZJQV80X6NjbqmlAA/eCgQBDxHaMD0xYA+EiYNU=
Date: Tue, 14 Jan 2020 15:40:07 +0000
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 00/13] iommu: Add PASID support to Arm SMMUv3
Message-ID: <20200114154007.GC2579@willie-the-truck>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219163033.2608177-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, guohanjun@huawei.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Thu, Dec 19, 2019 at 05:30:20PM +0100, Jean-Philippe Brucker wrote:
> Add support for Substream ID and PASIDs to the SMMUv3 driver. Since v3
> [1], I added review and tested tags where appropriate and applied the
> suggested changes, shown in the diff below. Thanks all!
> 
> I'm testing using the zip accelerator on the Hisilicon KunPeng920 and
> Zhangfei's uacce module [2]. The full SVA support, which I'll send out
> early next year, is available on my branch sva/zip-devel at
> https://jpbrucker.net/git/linux/
> 
> [1] https://lore.kernel.org/linux-iommu/20191209180514.272727-1-jean-philippe@linaro.org/
> [2] https://lore.kernel.org/linux-iommu/1576465697-27946-1-git-send-email-zhangfei.gao@linaro.org/
> 
> Jean-Philippe Brucker (13):
>   iommu/arm-smmu-v3: Drop __GFP_ZERO flag from DMA allocation
>   dt-bindings: document PASID property for IOMMU masters
>   iommu/arm-smmu-v3: Parse PASID devicetree property of platform devices
>   ACPI/IORT: Parse SSID property of named component node
>   iommu/arm-smmu-v3: Prepare arm_smmu_s1_cfg for SSID support
>   iommu/arm-smmu-v3: Add context descriptor tables allocators
>   iommu/arm-smmu-v3: Add support for Substream IDs
>   iommu/arm-smmu-v3: Propagate ssid_bits
>   iommu/arm-smmu-v3: Prepare for handling arm_smmu_write_ctx_desc()
>     failure
>   iommu/arm-smmu-v3: Add second level of context descriptor table
>   iommu/arm-smmu-v3: Improve add_device() error handling
>   PCI/ATS: Add PASID stubs
>   iommu/arm-smmu-v3: Add support for PCI PASID
> 
>  .../devicetree/bindings/iommu/iommu.txt       |   6 +
>  drivers/acpi/arm64/iort.c                     |  18 +
>  drivers/iommu/arm-smmu-v3.c                   | 467 +++++++++++++++---
>  drivers/iommu/of_iommu.c                      |   6 +-
>  include/linux/iommu.h                         |   2 +
>  include/linux/pci-ats.h                       |   3 +
>  6 files changed, 442 insertions(+), 60 deletions(-)

This is close, and I've replied to all of the patches I have comments on.
To summarise:

  1-5	I could queue these now
  6	I can make the small change we discussed
  7	I can make the changes if you agree (but I'd prefer you to change to
  	batch submission since I can't test this)
  8	Good to go once above is solved
  9	Need your opinion
  10	Some refactoring needed (sorry)
  11	Needs Robin's input
  12	Good to go once above is solved
  13	Need clarification on PCIe behaviour from you

In other words, I could probably take the first 8 or 9 patches for 5.6 if
you can resolve those issues asap.

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
