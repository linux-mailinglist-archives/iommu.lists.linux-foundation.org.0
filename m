Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 431AE3874EE
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 11:19:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC522405EE;
	Tue, 18 May 2021 09:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhUxBQl3eF9k; Tue, 18 May 2021 09:19:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DCD405F9;
	Tue, 18 May 2021 09:19:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76F8FC001C;
	Tue, 18 May 2021 09:19:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94342C0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76CCA83DC5
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRGjQUVAplHQ for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 09:19:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA565832AA
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 09:19:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2B71D2FA; Tue, 18 May 2021 11:19:15 +0200 (CEST)
Date: Tue, 18 May 2021 11:19:13 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH] iommu/amd: Clear DMA ops when switching domain
Message-ID: <YKOGkY7BpXJeU+Xc@8bytes.org>
References: <20210422094216.2282097-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422094216.2282097-1-jean-philippe@linaro.org>
Cc: robin.murphy@arm.com, iommu@lists.linux-foundation.org, will@kernel.org
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

On Thu, Apr 22, 2021 at 11:42:19AM +0200, Jean-Philippe Brucker wrote:
> Since commit 08a27c1c3ecf ("iommu: Add support to change default domain
> of an iommu group") a user can switch a device between IOMMU and direct
> DMA through sysfs. This doesn't work for AMD IOMMU at the moment because
> dev->dma_ops is not cleared when switching from a DMA to an identity
> IOMMU domain. The DMA layer thus attempts to use the dma-iommu ops on an
> identity domain, causing an oops:
> 
>   # echo 0000:00:05.0 > /sys/sys/bus/pci/drivers/e1000e/unbind
>   # echo identity > /sys/bus/pci/devices/0000:00:05.0/iommu_group/type
>   # echo 0000:00:05.0 > /sys/sys/bus/pci/drivers/e1000e/bind
>    ...
>   BUG: kernel NULL pointer dereference, address: 0000000000000028
>    ...
>    Call Trace:
>     iommu_dma_alloc
>     e1000e_setup_tx_resources
>     e1000e_open
> 
> Since iommu_change_dev_def_domain() calls probe_finalize() again, clear
> the dma_ops there like Vt-d does.
> 
> Fixes: 08a27c1c3ecf ("iommu: Add support to change default domain of an iommu group")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Applied for v5.13, thanks Jean-Philippe.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
