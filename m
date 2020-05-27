Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DD11E4CF2
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 20:18:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 81A0488A16;
	Wed, 27 May 2020 18:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uacGSI0KQte1; Wed, 27 May 2020 18:18:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 065A188A13;
	Wed, 27 May 2020 18:18:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0139C016F;
	Wed, 27 May 2020 18:18:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04572C016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 18:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F2FFF88A13
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 18:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UwucI3nOyry for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 18:18:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DF28C889EC
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 18:18:44 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CF692075A;
 Wed, 27 May 2020 18:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590603524;
 bh=IlJRE+s/Xn0kFANnhdpCDcIhPKRLpygy8ad6xlPlHjQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=nIx2hX8lM30uXBDTL7TuhND9kQ3G+qZ++mUq5WECUp59CfqdUpYK43QoUK7AXlVPf
 KxTUevqFBycL9TlKq7SmWveEDn1K/rg1pDaaEGJos75PWipKFqulr3bGwuDJBHuVi1
 7/+Jn7myhnHFa+KsZWLZ+HqvliJJB2ISAncHJDyU=
Date: Wed, 27 May 2020 13:18:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: Re: [PATCH 0/2] Introduce PCI_FIXUP_IOMMU
Message-ID: <20200527181842.GA256680@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590493749-13823-1-git-send-email-zhangfei.gao@linaro.org>
Cc: jean-philippe <jean-philippe@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 linux-pci@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hanjun Guo <guohanjun@huawei.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 kenneth-lee-2012@foxmail.com, linux-arm-kernel@lists.infradead.org,
 Len Brown <lenb@kernel.org>
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

On Tue, May 26, 2020 at 07:49:07PM +0800, Zhangfei Gao wrote:
> Some platform devices appear as PCI but are actually on the AMBA bus,
> and they need fixup in drivers/pci/quirks.c handling iommu_fwnode.
> Here introducing PCI_FIXUP_IOMMU, which is called after iommu_fwnode
> is allocated, instead of reusing PCI_FIXUP_FINAL since it will slow
> down iommu probing as all devices in fixup final list will be
> reprocessed, suggested by Joerg, [1]

Is this slowdown significant?  We already iterate over every device
when applying PCI_FIXUP_FINAL quirks, so if we used the existing
PCI_FIXUP_FINAL, we wouldn't be adding a new loop.  We would only be
adding two more iterations to the loop in pci_do_fixups() that tries
to match quirks against the current device.  I doubt that would be a
measurable slowdown.

> For example:
> Hisilicon platform device need fixup in
> drivers/pci/quirks.c handling fwspec->can_stall, which is introduced in [2]
> 
> +static void quirk_huawei_pcie_sva(struct pci_dev *pdev)
> +{
> +    struct iommu_fwspec *fwspec;
> +
> +    pdev->eetlp_prefix_path = 1;
> +    fwspec = dev_iommu_fwspec_get(&pdev->dev);
> +    if (fwspec)
> +        fwspec->can_stall = 1;
> +}
> +
> +DECLARE_PCI_FIXUP_IOMMU(PCI_VENDOR_ID_HUAWEI, 0xa250, quirk_huawei_pcie_sva);
> +DECLARE_PCI_iFIXUP_IOMMU(PCI_VENDOR_ID_HUAWEI, 0xa251, quirk_huawei_pcie_sva); 
> 
> [1] https://www.spinics.net/lists/iommu/msg44591.html
> [2] https://www.spinics.net/lists/linux-pci/msg94559.html

If you reference these in the commit logs, please use lore.kernel.org
links instead of spinics.

> Zhangfei Gao (2):
>   PCI: Introduce PCI_FIXUP_IOMMU
>   iommu: calling pci_fixup_iommu in iommu_fwspec_init
> 
>  drivers/iommu/iommu.c             | 4 ++++
>  drivers/pci/quirks.c              | 7 +++++++
>  include/asm-generic/vmlinux.lds.h | 3 +++
>  include/linux/pci.h               | 8 ++++++++
>  4 files changed, 22 insertions(+)
> 
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
