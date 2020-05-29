Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 812E61E7DAD
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 14:53:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2AFE08933B;
	Fri, 29 May 2020 12:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QSb-vCX9+yG; Fri, 29 May 2020 12:53:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D8E4892B1;
	Fri, 29 May 2020 12:53:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E5C2C016F;
	Fri, 29 May 2020 12:53:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 145B8C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EE76B8838C
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 12:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luR8Im8kJZAy for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 12:53:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C95A588372
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 12:53:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E4B0A327; Fri, 29 May 2020 14:53:12 +0200 (CEST)
Date: Fri, 29 May 2020 14:53:11 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 0/2] iommu: Remove iommu_sva_ops::mm_exit()
Message-ID: <20200529125310.GA14598@8bytes.org>
References: <20200423125329.782066-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423125329.782066-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, jgg@ziepe.ca,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 linux-accelerators@lists.ozlabs.org
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

On Thu, Apr 23, 2020 at 02:53:27PM +0200, Jean-Philippe Brucker wrote:
> The IOMMU SVA API currently requires device drivers to implement an
> mm_exit() callback, which stops device jobs that do DMA. This function
> is called in the release() MMU notifier, when an address space that is
> shared with a device exits.
> 
> It has been noted several time during discussions about SVA that
> cancelling DMA jobs can be slow and complex, and doing it in the
> release() notifier might cause synchronization issues. Device drivers
> must in any case call unbind() to remove their bond, after stopping DMA
> from a more favorable context (release of a file descriptor).
> 
> Patch 1 removes the mm_exit() callback from the uacce module, and patch
> 2 removes it from the IOMMU API. Since v1 [1] I fixed the uacce unbind
> reported by Zhangfei and added details in the commit message of patch 2.
> 
> Jean-Philippe Brucker (2):
>   uacce: Remove mm_exit() op
>   iommu: Remove iommu_sva_ops::mm_exit()

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
