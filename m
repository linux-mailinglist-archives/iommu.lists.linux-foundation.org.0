Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E571D4A53
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 12:01:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4814E88C7F;
	Fri, 15 May 2020 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etDaaYojiuTy; Fri, 15 May 2020 10:01:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 56FD088D7E;
	Fri, 15 May 2020 10:01:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F38BC0890;
	Fri, 15 May 2020 10:01:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E372C016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 638B189788
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQHANuniKtGZ for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:01:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8640E8977C
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:01:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 25DCD379; Fri, 15 May 2020 12:01:28 +0200 (CEST)
Date: Fri, 15 May 2020 12:01:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Subject: Re: [PATCH] iommu: Remove functions that support private domain
Message-ID: <20200515100126.GR18353@8bytes.org>
References: <20200513224721.20504-1-sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513224721.20504-1-sai.praneeth.prakhya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org
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

On Wed, May 13, 2020 at 03:47:21PM -0700, Sai Praneeth Prakhya wrote:
> After moving iommu_group setup to iommu core code [1][2] and removing
> private domain support in vt-d [3], there are no users for functions such
> as iommu_request_dm_for_dev(), iommu_request_dma_domain_for_dev() and
> request_default_domain_for_dev(). So, remove these functions.
> 
> [1] commit dce8d6964ebd ("iommu/amd: Convert to probe/release_device()
>     call-backs")
> [2] commit e5d1841f18b2 ("iommu/vt-d: Convert to probe/release_device()
>     call-backs")
> [3] commit 327d5b2fee91 ("iommu/vt-d: Allow 32bit devices to uses DMA
>     domain")
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> ---
>  drivers/iommu/iommu.c | 65 -------------------------------------------
>  include/linux/iommu.h | 12 --------
>  2 files changed, 77 deletions(-)

Applied that patch to the x86/vt-d branch.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
