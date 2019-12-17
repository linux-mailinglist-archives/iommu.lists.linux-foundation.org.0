Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9B12292B
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 11:48:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E74784FB2;
	Tue, 17 Dec 2019 10:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-lvHTFme19O; Tue, 17 Dec 2019 10:48:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F2C3984F90;
	Tue, 17 Dec 2019 10:48:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA087C1D84;
	Tue, 17 Dec 2019 10:48:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C100C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4FBEB2043A
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIHX-CV5AtBk for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 10:48:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id EE94E203F1
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 10:48:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEEF4ADA1;
 Tue, 17 Dec 2019 10:48:39 +0000 (UTC)
Date: Tue, 17 Dec 2019 11:48:38 +0100
From: Joerg Roedel <jroedel@suse.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/vt-d: Allocate reserved region for ISA with
 correct permission
Message-ID: <20191217104838.GC28651@suse.de>
References: <20191213053642.5696-1-jsnitsel@redhat.com>
 <3a9bcdc5-9e78-945d-f6e4-5af6829bf4f0@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a9bcdc5-9e78-945d-f6e4-5af6829bf4f0@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Sun, Dec 15, 2019 at 01:39:31PM +0800, Lu Baolu wrote:
> Hi,
> 
> On 12/13/19 1:36 PM, Jerry Snitselaar wrote:
> > Currently the reserved region for ISA is allocated with no
> > permissions. If a dma domain is being used, mapping this region will
> > fail. Set the permissions to DMA_PTE_READ|DMA_PTE_WRITE.
> > 
> > Cc: Joerg Roedel <jroedel@suse.de>
> > Cc: Lu Baolu <baolu.lu@linux.intel.com>
> > Cc: iommu@lists.linux-foundation.org
> > Cc: stable@vger.kernel.org # v5.3+
> > Fixes: d850c2ee5fe2 ("iommu/vt-d: Expose ISA direct mapping region via iommu_get_resv_regions")
> > Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
> 
> This fix looks reasonable to me.
> 
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Applied for v5.5, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
